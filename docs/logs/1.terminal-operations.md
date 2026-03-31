# Terminal Operations Log

> 실행 기준: repository root에서 시작

## 0) 작업 폴더 준비

```bash
cd workstaion
mkdir -p terminal-lab/practice/subdir
```

출력:

# 정상 실행 시 출력 없음

---

## 1) 현재 위치 확인

```bash
pwd
```

출력:

```text
/Users/baejaemin/Project/codyssey/workstaion
```

---

## 2) 목록 확인(숨김 포함)

```bash
ls -la
```

출력:

```text
drwxr-xr-x   7 baejaemin  staff    224 Mar 30 19:54 .
drwxr-xr-x   3 baejaemin  staff     96 Mar 30 19:48 ..
drwxr-xr-x  12 baejaemin  staff    384 Mar 30 19:10 .git
drwxr-xr-x   3 baejaemin  staff     96 Mar 30 19:54 docs
-rw-r--r--   1 baejaemin  staff   3754 Mar 30 19:53 README.md
drwxr-xr-x   3 baejaemin  staff     96 Mar 30 19:48 scripts
-rw-r--r--   1 baejaemin  staff  12668 Mar 30 19:22 subject.md
```

---

## 3) 생성 (파일)

````bash
echo "hello codyssey" > terminal-lab/practice/note.txt
cat terminal-lab/practice/note.txt ```

출력:

```text
hello codyssey
````

---

## 4) 이동

```bash
cd terminal-lab/practice
pwd
```

출력:

```text
/Users/baejaemin/Project/codyssey/workstaion/terminal-lab/practice
```

---

## 5) 파일 내용 확인

```bash
cat note.txt
```

출력:

```text
hello codyssey
```

---

## 6) 빈 파일 생성

```bash
touch empty.log
ls -la
```

출력:

```text
total 8
drwxr-xr-x  5 baejaemin  staff  160 Mar 30 20:05 .
drwxr-xr-x  3 baejaemin  staff   96 Mar 30 20:03 ..
-rw-r--r--  1 baejaemin  staff    0 Mar 30 20:05 empty.log
-rw-r--r--  1 baejaemin  staff   15 Mar 30 20:03 note.txt
drwxr-xr-x  2 baejaemin  staff   64 Mar 30 20:03 subdir
```

---

## 7) 복사

```bash
cp note.txt note-copy.txt
ls -la
```

출력:

```text
total 16
drwxr-xr-x  6 baejaemin  staff  192 Mar 30 20:06 .
drwxr-xr-x  3 baejaemin  staff   96 Mar 30 20:03 ..
-rw-r--r--  1 baejaemin  staff    0 Mar 30 20:05 empty.log
-rw-r--r--  1 baejaemin  staff   15 Mar 30 20:06 note-copy.txt
-rw-r--r--  1 baejaemin  staff   15 Mar 30 20:03 note.txt
drwxr-xr-x  2 baejaemin  staff   64 Mar 30 20:03 subdir
```

---

## 8) 이동/이름변경

```bash
mv note-copy.txt renamed-note.txt
mv renamed-note.txt subdir/final-note.txt
ls -la
ls -la subdir
```

출력:

```text
total 8
drwxr-xr-x  5 baejaemin  staff  160 Mar 30 20:06 .
drwxr-xr-x  3 baejaemin  staff   96 Mar 30 20:03 ..
-rw-r--r--  1 baejaemin  staff    0 Mar 30 20:05 empty.log
-rw-r--r--  1 baejaemin  staff   15 Mar 30 20:03 note.txt
drwxr-xr-x  3 baejaemin  staff   96 Mar 30 20:06 subdir
```

```text
total 8
drwxr-xr-x  3 baejaemin  staff   96 Mar 30 20:06 .
drwxr-xr-x  5 baejaemin  staff  160 Mar 30 20:06 ..
-rw-r--r--  1 baejaemin  staff   15 Mar 30 20:06 final-note.txt
```

---

## 9) 삭제(파일/디렉토리)

```bash
rm empty.log
rm subdir/final-note.txt
rmdir subdir
ls -la
```

출력:

```text
total 8
drwxr-xr-x  3 baejaemin  staff  96 Mar 30 20:07 .
drwxr-xr-x  3 baejaemin  staff  96 Mar 30 20:03 ..
-rw-r--r--  1 baejaemin  staff  15 Mar 30 20:03 note.txt
```

---

## 10) 상위로 복귀 및 최종 확인

```bash
cd ..
pwd
ls -la
```

출력:

```text
total 0
drwxr-xr-x  3 baejaemin  staff   96 Mar 30 20:03 .
drwxr-xr-x  8 baejaemin  staff  256 Mar 30 20:04 ..
drwxr-xr-x  3 baejaemin  staff   96 Mar 30 20:07 practice
```

---

## 검증 결론

- [ ] 현재 위치 확인
- [ ] 목록 확인(숨김 포함)
- [ ] 이동
- [ ] 생성
- [ ] 복사
- [ ] 이동/이름변경
- [ ] 삭제
- [ ] 파일 내용 확인
- [ ] 빈 파일 생성
