🎉 **CHUẨN – BẠN ĐÃ VÀO ĐÚNG “NHÀ LINUX”** 🎉

Dòng này là **tín hiệu xanh**:

```
liem20k@Hen-Hos:~$
```

👉 `~` = `/home/liem20k`
 👉 Từ đây trở đi, bạn đang **học Linux/WSL đúng nghĩa**, không còn dính Windows nữa.

------

## ✅ BƯỚC 1 – Xác nhận lần cuối (rất tốt để ghi nhớ)

Gõ:

```
pwd
```

Bạn sẽ thấy:

```
/home/liem20k
```

------

## ✅ BƯỚC 2 – Tạo folder học WSL (làm ngay)

```
mkdir hoc_wsl
ls
```

Bạn sẽ thấy:

```
hoc_wsl
```

------

## ✅ BƯỚC 3 – Đi vào folder học

```
cd hoc_wsl
pwd
```

Kết quả:

```
/home/liem20k/hoc_wsl
```

👉 **Từ đây, mọi thứ bạn học về WSL sẽ nằm gọn trong thư mục này.**

------

## 🧠 Ghi nhớ rất quan trọng (1 câu thôi)

> **Luôn làm việc trong

ôn cho tôi tạo markdown /home/liem20k liem20k@Hen-Hos:~$ mkdir hoc_wsl liem20k@Hen-Hos:~$ ls hoc_wsl liem20k@Hen-Hos:~$ cd hoc_wsl/ liem20k@Hen-Hos:~/hoc_wsl$

Rất tốt 👍
 Mình **ôn lại cho bạn bằng Markdown**, đúng kiểu **ghi chép học tập**, để bạn có thể **lưu thành file `.md` trong WSL** hoặc copy sang Obsidian / GitHub / Quarto.

------

## 🐧 Học WSL – Bài 1

### 📁 Tạo workspace trong `/home/liem20k`

```
# Học WSL – Bài 1: Tạo thư mục làm việc

## 1. Về thư mục HOME của Linux
Lệnh:
```bash
cd ~
```

Ý nghĩa:

- `~` là viết tắt của `/home/liem20k`
- Đây là **nhà của Linux user**
- Mọi project học tập nên đặt ở đây

Kiểm tra:

```
pwd
```

Kết quả mong đợi:

```
/home/liem20k
```

------

## 2. Tạo thư mục học WSL

Lệnh:

```
mkdir hoc_wsl
```

Giải thích:

- `mkdir` = make directory
- `hoc_wsl` = thư mục dùng riêng để học Linux / WSL

Kiểm tra:

```
ls
```

Kết quả:

```
hoc_wsl
```

------

## 3. Đi vào thư mục học

Lệnh:

```
cd hoc_wsl
```

Kiểm tra vị trí:

```
pwd
```

Kết quả:

```
/home/liem20k/hoc_wsl
```

👉 Đây là **workspace học WSL chính thức**.

------

## 4. Ghi nhớ quan trọng

- Không làm việc trong `/mnt/c` (Windows)
- Luôn `cd ~` trước khi bắt đầu
- Prompt chỉ để nhìn, **không gõ lại**

Ví dụ prompt:

```
liem20k@Hen-Hos:~/hoc_wsl$
```

------

## 5. Trạng thái hiện tại

- ✅ Đã vào HOME
- ✅ Đã tạo thư mục học
- ✅ Đã đứng đúng vị trí Linux

```
---

## 📌 Gợi ý bước tiếp theo (để ghi tiếp Markdown)
Bạn có thể thêm ngay dưới file này:

- Bài 2: `ls`, `pwd`, `cd`
- Bài 3: tạo file `.txt`, `.md`
- Bài 4: Bash script đầu tiên
- Bài 5: Git trong WSL

---

## 👉 Nếu bạn muốn làm tiếp NGAY
Mình đề xuất bước kế tiếp rất nhẹ:

### 🔹 Bài 2 – Tạo file Markdown đầu tiên trong WSL
```bash
nano hoc_wsl.md
```