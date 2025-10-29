---
title: "Phân tích chu: chu_lang_nghiem_version_2.pdf"
format: 
  html: 
    toc: true
editor: source
execute:
  echo: true
  warning: false
  error: true
---

## Mục tiêu
Tự động đọc `pdf_books/chu_lang_nghiem_version_2.pdf`, trích xuất văn bản (pdf_text hoặc OCR nếu cần), tiền xử lý tiếng Việt và thực hiện một số phân tích cơ bản: tần suất từ, bigrams, wordcloud, và (tuỳ) POS/lemma bằng udpipe.

```{r}
#| label: setup
# Cài/gọi gói (bỏ phần install khi đã cài)
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")
pacman::p_load(pdftools, magick, tesseract, stringi, tidyverse, tidytext, ggplot2, wordcloud2, udpipe, readr, quanteda)
```

## 1. Đặt đường dẫn file PDF (chỉnh nếu cần)
```{r}
pdf_path <- "pdf_books/chu_lang_nghiem_version_2.pdf"
if (!file.exists(pdf_path)) stop("Không tìm thấy file PDF tại: ", pdf_path)
pdf_path
```

## 2. Trích text từ PDF (pdf_text), fallback OCR nếu trống
```{r}
# 1) Thử trích bằng pdftools
pages_text <- pdftools::pdf_text(pdf_path)
# Kiểm tra xem có nội dung chữ hay chỉ ảnh
text_all <- paste(pages_text, collapse = "\n")
text_trim <- stringi::stri_trim_both(text_all)

if (nchar(text_trim) < 30) {
  message("pdf_text trả về rất ít ký tự — có thể PDF scan (ảnh). Chạy OCR bằng tesseract...")
  # OCR bằng magick + tesseract: cần cài tesseract binary trước
  # Nếu muốn giới hạn số trang, có thể dùng pdftools::pdf_convert hoặc image_read
  img_list <- magick::image_read(pdf_path)
  ocr_pages <- sapply(img_list, function(img) tesseract::ocr(img, engine = tesseract::tesseract("vie")))
  text_all <- paste(ocr_pages, collapse = "\n")
} else {
  message("Đã trích text bằng pdftools.")
}
# Chuẩn hóa Unicode
text_all <- stringi::stri_trans_nfkc(text_all)
# Lưu bản text thô để kiểm tra
readr::write_file(text_all, "data/chu_lang_nghiem_raw.txt")
cat("Đã lưu text thô vào data/chu_lang_nghiem_raw.txt\n")
```

## 3. Tạo dataframe dòng/đoạn
```{r}
df_lines <- tibble(line = unlist(strsplit(text_all, "\\n+"))) %>%
  mutate(line = stringi::stri_trim_both(line)) %>%
  filter(line != "")
glimpse(df_lines, width = 60)
# Nếu PDF có nhiều header/footer lặp, cần bổ sung lọc thủ công
```

## 4. Stopwords tiếng Việt — nạp file nếu có, ngược lại dùng danh sách cơ bản
```{r}
stopfile <- "data/vn_stopwords.txt"
if (file.exists(stopfile)) {
  vn_stop <- readr::read_lines(stopfile) %>% str_trim() %>% tolower() %>% unique()
  message("Đã nạp stopwords từ ", stopfile)
} else {
  message("Không tìm thấy data/vn_stopwords.txt — dùng danh sách stopwords cơ bản (gợi ý cải thiện).")
  vn_stop <- c("và","là","của","có","cho","với","trong","một","như","được","tâm","ta","con","chú","phật","bồ","từ","người") # mở rộng theo nhu cầu
}
length(vn_stop)
```

## 5. Tokenization & lọc stopwords
```{r}
tokens <- df_lines %>%
  mutate(text = line) %>%
  unnest_tokens(word, text, token = "words") %>% # tidytext tokenization cơ bản (space-based) phù hợp tiếng Việt
  mutate(word = str_to_lower(word),
         word = str_replace_all(word, "[0-9\\p{Punct}]+", "")) %>%
  filter(str_detect(word, "[[:alpha:]]")) %>%
  filter(nchar(word) > 1) %>%  # loại ký tự 1 chữ cái
  filter(!word %in% vn_stop)

tokens %>% count(word, sort = TRUE) %>% slice_head(n = 10)
```

## 6. Tần suất từ & biểu đồ top 20
```{r}
freq <- tokens %>% count(word, sort = TRUE)
top20 <- freq %>% slice_max(n, n = 20)
top20 %>%
  ggplot(aes(reorder(word, n), n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(x = "Từ", y = "Tần suất", title = "Top 20 từ (sau lọc stopwords)")
```

## 7. Wordcloud
```{r}
wdata <- freq %>% slice_max(n, n = 200)
# Nếu chạy trong trình duyệt/HTML, wordcloud2 hiển thị tốt
if (nrow(wdata) > 0) {
  wordcloud2::wordcloud2(wdata)
} else {
  message("Không có dữ liệu để vẽ wordcloud.")
}
```

## 8. N-grams (bigram) — lọc stopwords hai bên
```{r}
bigrams <- tibble(text = text_all) %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2) %>%
  separate(bigram, into = c("w1","w2"), sep = " ") %>%
  filter(!w1 %in% vn_stop, !w2 %in% vn_stop) %>%
  unite(bigram, w1, w2, sep = " ")
bigram_freq <- bigrams %>% count(bigram, sort = TRUE)
bigram_freq %>% slice_max(n, n = 20)
```

## 9. (Tuỳ chọn) POS / Lemma với udpipe
```{r}
# Kiểm tra mô hình udpipe (bạn cần tải mô hình tiếng Việt trước và đặt tại data/vn-ud.udpipe)
model_file <- "data/vn-ud.udpipe"
if (file.exists(model_file)) {
  ud <- udpipe_load_model(model_file)
  # Dùng từng đoạn hoặc toàn bộ
  ann <- udpipe_annotate(ud, x = df_lines$line) %>% as_tibble()
  ann %>% count(lemma, sort = TRUE) %>% slice_max(n, n = 20)
} else {
  message("Không tìm thấy mô hình udpipe tiếng Việt tại data/vn-ud.udpipe — bỏ qua POS/lemma.")
}
```

## 10. Lưu kết quả tần suất
```{r}
readr::write_csv(freq, "outputs/word_frequency.csv")
readr::write_csv(bigram_freq, "outputs/bigram_frequency.csv")
cat("Đã lưu outputs/word_frequency.csv và outputs/bigram_frequency.csv\n")
```

## Ghi chú quan trọng
- Nếu PDF là bản scan (ảnh), cần cài tesseract binary và mô hình tiếng Việt:
  - Trên macOS: `brew install tesseract tesseract-lang` (hoặc chỉ `brew install tesseract` và tải gói ngôn ngữ)
  - Trong R: pacman::p_load(tesseract); tesseract::tesseract_download("vie") (tuỳ hệ)
- Cần chuẩn hoá/chuẩn bị danh sách stopwords tiếng Việt tốt hơn để loại các từ như "chú", "phật" tuỳ bạn có muốn giữ hay loại.
- Nếu PDF có bố cục phức tạp (cột, chú thích, chữ Hán xen kẽ), kết quả token hóa cần kiểm tra thủ công.
