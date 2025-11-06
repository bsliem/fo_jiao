-pefind 🧭 **Bảng phím tắt hữu ích trong chế độ `less` (terminal RStudio hoặc macOS)**

| Mục đích                                      | Phím tắt             | Ghi chú                                       |
| --------------------------------------------- | -------------------- | --------------------------------------------- |
| **Thoát khỏi less**                           | `q`                  | Quay lại prompt (rất quan trọng ✅)            |
| **Dừng giữa chừng**                           | `Ctrl + C`           | Ngắt tạm (khi đang tải hoặc grep quá dài)     |
| **Xuống 1 dòng**                              | `↓` hoặc `j`         | Cuộn xuống từng dòng                          |
| **Lên 1 dòng**                                | `↑` hoặc `k`         | Cuộn lên từng dòng                            |
| **Xuống 1 trang (màn hình)**                  | `Space` hoặc `f`     | Giống Page Down                               |
| **Lên 1 trang**                               | `b`                  | Giống Page Up                                 |
| **Xuống ½ trang**                             | `d`                  | (Down half page)                              |
| **Lên ½ trang**                               | `u`                  | (Up half page)                                |
| **Đến đầu file**                              | `g`                  | Jump to top                                   |
| **Đến cuối file**                             | `G`                  | Jump to end                                   |
| **Tìm chuỗi**                                 | `/từ_khóa` rồi Enter | Tìm kiếm xuống dưới                           |
| **Tìm ngược lại (lên trên)**                  | `?từ_khóa`           | Tìm kiếm lên trên                             |
| **Lặp lại tìm tiếp**                          | `n`                  | Tìm lần kế tiếp cùng hướng                    |
| **Lặp lại tìm ngược hướng**                   | `N`                  | Ngược hướng với `n`                           |
| **Hiển thị số dòng / vị trí**                 | `=`                  | Cho biết đang ở dòng nào, % bao nhiêu         |
| **Chuyển về dòng đầu tiên**                   | `1G`                 | Giống `g`                                     |
| **Chuyển về dòng thứ N**                      | `N + G` (vd: `50G`)  | Nhảy tới dòng số 50                           |
| **Chế độ xem dài, không ngắt dòng**           | `-S`                 | Toggle chế độ “no wrap” (hữu ích cho log dài) |
| **Bật/tắt highlight tìm kiếm**                | `ESC + u`            | Nếu highlight gây rối mắt                     |
| **Refresh nội dung (nếu file đang cập nhật)** | `r` hoặc `R`         |                                               |

## ✅ Đúng cú pháp:

```
find . -type f \( -name "*.qmd" -o -name "*.html" \)
```

Dưới đây là bản hoàn chỉnh — chỉ cần **copy toàn bộ** và **dán vào file `hoc_chu_lang_nghiem.rmd`** của bạn (hoặc ghi đè phần nội dung cũ):

------

```
---
title: "Học Chú Lăng Nghiêm – Phần 1"
output:
  word_document:
    toc: false
  html_document:
    toc: false
    df_print: paged
  html_notebook:
    toc: false
    theme: cosmo
lang: vi
editor_options:
  chunk_output_type: inline
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

# 🕯️ HỌC CHÚ LĂNG NGHIÊM – 24 CÂU ĐẦU

1. Nam-mô tát đát tha
    南無薩怛他
    Nán mó sà dá tā
2. Tô già đa da
    蘇伽多耶
    Sū jiā duō yé
3. A ra ha đế
    阿羅訶帝
    Ā luó hē dì
4. Tam-miệu tam bồ đà tỏa
    三藐三菩陀娑
    Sān miǎo sān pú tuó suō
5. Tát đát tha
    薩怛他
    Sà dá tā
6. Phật đà cu tri sắc ni sam
    佛陀拘致瑟尼三
    Fó tuó jū zhì sè ní sān
7. Nam-mô tát bà
    南無薩婆
    Nán mó sà pó
8. Bột đà bột địa
    勃陀勃地
    Bó tuó bó dì
9. Tát đa bệ tệ
    薩多吠帝
    Sà duō wèi dì
10. Nam-mô tát đa nẩm
     南無薩多楠
     Nán mó sà duō nán
11. Tam-miệu tam bồ đà
     三藐三菩陀
     Sān miǎo sān pú tuó
12. Cu tri nẩm
     拘致楠
     Jū zhì nán
13. Ta xá ra bà ca
     多舍羅婆迦
     Duō shě luó pó jiā
14. Tăng già nẩm
     僧伽楠
     Sēng qié nán
15. Nam-mô lô kê A-La-Hán đa nẩm
     南無盧雞阿羅漢多楠
     Nán mó lú jī ā luó hàn duō nán
16. Nam-mô tô lô đa ba na nẩm
     南無蘇盧多波那楠
     Nán mó sū lú duō bō nà nán
17. Nam-mô ta yết rị đà dà di nẩm
     南無多羯利陀耶尼楠
     Nán mó duō jié lì tuó yé ní nán
18. Nam-mô lô kê tam-miệu dà đa nẩm
     南無盧雞三藐陀多楠
     Nán mó lú jī sān miǎo tuó duō nán
19. Tam-miệu dà ba ra
     三藐陀婆羅
     Sān miǎo tuó pó luó
20. Ðể ba đa na nẩm
     底波多那楠
     Dǐ bō duō nà nán
21. Nam-mô đề bà ly sắc nỏa
     南無提婆利索那
     Nán mó tí pó lì suǒ nuó
22. Nam-mô tất đà da
     南無悉怛耶
     Nán mó xī dá yé
23. Tỳ địa da
     毘地耶
     Pí dì yé
24. Ðà ra ly sắc nỏa
     陀羅利索那
     Tuó luó lì suǒ nuó

```
---

✅ **Khi knit sang Word hoặc HTML:**  
- Mỗi khối gồm 3 dòng, cách nhau một dòng trống.  
- Dòng chữ Hán đứng riêng, hiển thị rõ ràng.  
- Pinyin nghiêng (Markdown `*...*` nếu bạn muốn).  

---

Nếu bạn muốn **tự động đánh số thêm 25–50–100 câu tiếp** trong phần sau, tôi có thể viết cho bạn một đoạn R code `for` sinh tự động khối 3 dòng từ một bảng dữ liệu (`data.frame`) để bạn chỉ nhập nội dung gốc thôi — có muốn tôi làm luôn dạng đó không?
```







ChatGPT can make mistakes. Check important info.