# 🧭 TÓM TẮT LỆNH GIT ĐÃ HỌC (HÔM NAY)

## I. Xem trạng thái & lịch sử (xem – không làm hỏng gì)

### 1️⃣ Kiểm tra trạng thái repo

```
git status
```

→ biết:

- đang ở branch nào
- có file sửa chưa commit
- có **behind / ahead** so với GitHub không

------

### 2️⃣ Xem commit mới nhất

```
git log -1
```

Gọn hơn:

```
git log -1 --oneline --decorate
```

------

### 3️⃣ Xem lịch sử commit (dài → nhấn `q` để thoát)

```
git log
```

------

## II. Kiểm tra đồng bộ với GitHub (RẤT QUAN TRỌNG)

### 4️⃣ Cập nhật thông tin từ GitHub (an toàn)

```
git fetch
```

------

### 5️⃣ Kiểm tra có commit mới trên GitHub chưa

```
git log HEAD..origin/main
```

- Có hiện → **chưa pull**
- Không hiện → **đã mới nhất**

------

### 6️⃣ Kiểm tra nhanh bằng status

```
git status
```

- `up to date` → ok
- `behind by X commit` → cần pull

------

## III. Đồng bộ code (lấy & đẩy)

### 7️⃣ Kéo commit mới về

```
git pull
```

An toàn hơn:

```
git pull --ff-only
```

------

### 8️⃣ Đẩy commit của mình lên GitHub

```
git push
```

------

## IV. Làm việc với file (rất hay dùng)

### 9️⃣ Thêm file vào commit

```
git add <file>
git add .
```

------

### 🔟 Commit thay đổi

```
git commit -m "noi dung"
```

------

### 11️⃣ Bỏ thay đổi file không quan trọng

```
git restore <file>
```

------

### 12️⃣ Tạm cất thay đổi (stash)

```
git stash
git stash pop
```

------

## V. Remote & repo (kiểm tra “đúng GitHub chưa”)

### 13️⃣ Kiểm tra remote

```
git remote -v
```

→ biết máy này đang nói chuyện với GitHub nào

------

## VI. Thoát & hủy (rất hay nhầm)

### 14️⃣ Hủy lệnh đang chạy

```
Ctrl + C
```

------

### 15️⃣ Thoát màn hình `git log`, `less`

```
q
```

------

## VII. Dọn repo sạch (rất nên làm)

### 16️⃣ Bỏ file render không quan trọng

```
git restore hoc_chu_lang_nghiem.html
```

------

### 17️⃣ Chặn file không cần theo dõi

```
echo hoc_chu_lang_nghiem.html >> .gitignore
git rm --cached hoc_chu_lang_nghiem.html
git commit -m "ignore generated html"
git push
```

------

# 🧠 3 LỆNH “SỐNG CÒN” (CHỈ CẦN NHỚ 3 CÁI)

```
git status
git fetch
git pull
```

👉 90% tình huống Git đều xoay quanh 3 lệnh này.

------

# 🧩 CÂU NHỚ NHANH

> **Status trước – Fetch để nhìn – Pull khi cần – Push khi xong**

------

Nếu anh muốn, tôi có thể:

- 📄 Soạn **1 trang A4 “Git cheat-sheet cho riêng anh”**
- ⚙️ Tạo alias: `gst`, `gpl`, `gps`, `gcheck`
- 🧠 Liên hệ Git ↔ “định–tuệ–giới” cho dễ nhớ lâu

Anh muốn tôi làm tiếp phần nào?

Liên hệ Git ↔ “định–tuệ–giới” cho dễ nhớ lâu

Rất hay 👌
 Liên hệ **Git ↔ Giới – Định – Tuệ** là **cách nhớ rất bền**, vì Git **vận hành đúng như một pháp tu**: có kỷ luật (giới), có dừng lại quan sát (định), rồi mới quyết định hành động (tuệ).

Tôi trình bày theo **3 tầng**, từ **tâm → lệnh → thói quen**.

------

# 🌿 GIT ↔ GIỚI – ĐỊNH – TUỆ

## I. **GIỚI (kỷ luật – không làm bừa)**

> *Không biết rõ thì không hành động.*

### Trong Git

**Giới = KHÔNG đụng vào repo khi chưa biết trạng thái**

👉 Lệnh Giới:

```
git status
git remote -v
```

- `git status` → **biết mình đang ở đâu**
- `git remote -v` → **biết mình đang nói chuyện với ai (GitHub nào)**

📌 Người **phạm giới Git** thường:

- pull khi đang dirty
- commit nhầm file render
- push nhầm repo

📌 Người **giữ giới Git**:

> *Luôn `git status` trước khi làm bất cứ điều gì.*

------

## II. **ĐỊNH (dừng – quan sát – không vội)**

> *Chưa thấy rõ thì chỉ nhìn, không sửa.*

### Trong Git

**Định = FETCH + LOG (nhìn mà không động)**

👉 Lệnh Định:

```
git fetch
git log -1
git log HEAD..origin/main
```

- `git fetch` → **nhìn GitHub từ xa**
- `git log HEAD..origin/main` → **biết có gì mới hay không**
- Không đổi file, không merge, không rối

📌 Người **thiếu định**:

- `git pull` ngay khi chưa fetch
- hoảng khi thấy conflict

📌 Người **có định**:

> *Fetch trước – nhìn kỹ – rồi mới quyết.*

------

## III. **TUỆ (quyết định đúng lúc, đúng cách)**

> *Thấy rõ rồi mới hành.*

### Trong Git

**Tuệ = chọn đúng hành động sau khi đã biết**

👉 Lệnh Tuệ (tùy tình huống):

| Thấy gì              | Hành động                |
| -------------------- | ------------------------ |
| GitHub có commit mới | `git pull --ff-only`     |
| Local có rác         | `git restore <file>`     |
| Sửa xong             | `git add` → `git commit` |
| Muốn chia sẻ         | `git push`               |

📌 Tuệ Git không phải là “biết nhiều lệnh”,
 mà là **chọn đúng 1 lệnh, đúng lúc**.

------

# 🧠 SƠ ĐỒ NHỚ NHANH

```
GIỚI   →  git status
ĐỊNH   →  git fetch
TUỆ    →  git pull / git push
```

> **Không status → dễ phạm lỗi**
>  **Không fetch → dễ hoảng**
>  **Không tuệ → hành sai**

------

# 🔁 ÁP DỤNG CHO WORKFLOW NHIỀU MÁY (anh đang dùng)

### Mỗi lần mở Git Bash:

```
GIỚI  → git status
ĐỊNH  → git fetch
TUỆ   → git pull (nếu cần)
```

👉 3 dòng này = **giữ repo an ổn**

------

# ☸️ LIÊN HỆ SÂU HƠN (Lăng Nghiêm)

- **Giới**: không chạy theo vọng động (pull/commit bừa)
- **Định**: dừng lại soi xem (fetch/log)
- **Tuệ**: hành động đúng trục (pull đúng lúc, push đúng chỗ)

👉 Git tốt lên → **tâm cũng gọn hơn**
 👉 Repo sạch → **đầu óc nhẹ**

------

## Một câu chốt để nhớ lâu

> **Git loạn vì thiếu Giới**
>  **Git rối vì thiếu Định**
>  **Git sạch vì có Tuệ**

Nếu anh muốn, tôi có thể:

- 📄 Vẽ **1 sơ đồ A4 “Git như pháp tu”**
- ⚙️ Gắn alias Git theo **Giới–Định–Tuệ**
- 🧠 Liên hệ tiếp với **Lăng Nghiêm: vọng – chân – ma cảnh**

Anh muốn đi tiếp tầng nào?

Liên hệ tiếp với Lăng Nghiêm: vọng – chân – ma cảnh

Rất hay. Chỗ này **chính là tinh thần Lăng Nghiêm**, và Git chỉ là **một ví dụ đời thường** để anh **thấy – nhớ – không quên**.

Tôi đi **từng tầng: VỌNG → CHÂN → MA CẢNH**, rồi **ghép thẳng với Git**, không vòng vo.

------

# 🌕 LĂNG NGHIÊM ↔ GIT

## VỌNG – CHÂN – MA CẢNH

------

## I. **VỌNG** – *cái thấy sai nhưng rất “giống thật”*

### Trong Kinh Lăng Nghiêm

- A-nan **lầm nhận bóng dáng phân biệt làm tâm**

- Thấy:

  > *“Tôi hiểu rồi, tôi đúng rồi”*
  >  nhưng thực ra chỉ là **tướng động của thức**

📌 **Vọng có 3 đặc điểm**:

1. Nhanh
2. Có vẻ hợp lý
3. Khiến mình **muốn hành động ngay**

------

### Trong Git (vọng Git)

| Vọng                      | Biểu hiện                     |
| ------------------------- | ----------------------------- |
| “Repo chắc ổn”            | Chưa `git status`             |
| “GitHub chắc giống local” | Chưa `git fetch`              |
| “Cứ pull đi”              | Chưa nhìn `HEAD..origin/main` |

👉 Giống A-nan:

> *“Con thấy rõ rồi”*
>  nhưng **Phật hỏi tới thì không trụ được**.

📌 **Git loạn = vọng khởi**

------

## II. **CHÂN** – *cái không động, không vội, nhưng thấy rõ*

### Trong Kinh Lăng Nghiêm

- Phật chỉ ra:

  > *“Cái hay biết mà không sinh diệt”*

- Không phải thứ **đang suy nghĩ**,
   mà là **cái đang biết mình suy nghĩ**

📌 **Chân tâm**:

- Không thêm
- Không bớt
- Chỉ **chiếu**

------

### Trong Git (chân Git)

| Chân                 | Lệnh                        |
| -------------------- | --------------------------- |
| Biết mình đang ở đâu | `git status`                |
| Biết GitHub ra sao   | `git fetch`                 |
| So sánh đúng         | `git log HEAD..origin/main` |

👉 Những lệnh này:

- **Không sửa gì**
- **Không phá gì**
- Chỉ cho **thấy đúng**

📌 Đây chính là **“chiếu kiến” trong Lăng Nghiêm**.

> *Không hành động → mà mọi thứ tự hiện.*

------

## III. **MA CẢNH** – *không phải ma ngoài, mà do tâm loạn sinh ra*

### Trong Kinh Lăng Nghiêm

- Ma không đến từ bên ngoài
- Mà từ:
  - Kiêu mạn
  - Hiểu lầm
  - Chấp cảnh

📌 **Phật nói rất rõ**:

> *“Ma cảnh sinh khi tâm không định”*

------

### Trong Git (ma cảnh Git)

| Ma cảnh    | Nguyên nhân                   |
| ---------- | ----------------------------- |
| Conflict   | Pull khi chưa biết trạng thái |
| Mất file   | Restore / reset bừa           |
| Push nhầm  | Không kiểm tra remote         |
| Hoảng loạn | Không biết mình đang ở đâu    |

👉 **Ma Git không phải do Git khó**
 👉 **Do mình thiếu Định – Tuệ**

------

## IV. **CHÚ LĂNG NGHIÊM ↔ FETCH**

Đây là chỗ **liên hệ sâu nhất**.

### Chú Lăng Nghiêm

- Không để hiểu

- Mà để:

  > **nhiếp tâm – trừ ma**

### Git fetch

- Không để sửa

- Mà để:

  > **nhiếp repo – trừ rối**

📌 Cả hai đều là:

> **“Chưa làm gì – nhưng đã ngăn loạn”**

------

## V. SƠ ĐỒ TỔNG HỢP (để nhớ lâu)

```
VỌNG  →  đoán, vội, làm liền
        (pull, commit bừa)

CHÂN  →  dừng, nhìn, chiếu
        (status, fetch, log)

MA    →  rối, conflict, hoảng
        (hậu quả của vọng)
```

------

## VI. Một câu Lăng Nghiêm ứng vào Git

> **“Tri vọng tức ly”**
>  → Biết là vọng thì không theo

Trong Git:

- Thấy mình **muốn pull liền**
   → dừng → `git fetch`

📌 Chỉ cần **biết mình đang vội**, là **ma cảnh tan**.

------

## VII. Kết luận (rất quan trọng)

- **Git không khó**
- **Lăng Nghiêm không xa**
- Cả hai chỉ dạy **một việc**:

> 👉 **Đừng hành động khi chưa thấy rõ**