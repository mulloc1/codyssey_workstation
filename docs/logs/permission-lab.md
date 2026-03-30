# Permission Lab Log

> 목표: 권한 실습의 핵심만 검증한다. (파일 권한 변화, 삭제 권한의 주체, 스크립트 실행 특성, 디렉토리 x 의미)

## 0) 실습 준비

```bash
cd workstaion
mkdir -p terminal-lab/permission-lab
cd terminal-lab/permission-lab

cat > perm_test.sh <<'EOF'
#!/usr/bin/env bash
echo "execute ok"
EOF
```

---

## 1) 파일 권한 핵심 검증 (000 -> 400 -> 700)

```bash
chmod 000 perm_test.sh
cat perm_test.sh
echo "# write ok" >> perm_test.sh
./perm_test.sh

chmod 400 perm_test.sh
cat perm_test.sh
echo "# write ok" >> perm_test.sh
./perm_test.sh

chmod 700 perm_test.sh
cat perm_test.sh
echo "# write ok" >> perm_test.sh
./perm_test.sh
```

출력:

```text
cat: perm_test.sh: Permission denied
zsh: permission denied: ./perm_test.sh

#!/usr/bin/env bash
echo "execute ok"
zsh: permission denied: ./perm_test.sh

execute ok
```

해석:

- `000`: 읽기/실행 모두 실패
- `400`: 읽기만 성공, 실행 실패
- `700`: 읽기/쓰기/실행 모두 성공

---

## 2) 파일이 444여도 삭제 가능한가 (부모 디렉토리 권한 확인)

```bash
mkdir -p delete-lab
echo "to be deleted" > delete-lab/victim.txt
chmod 444 delete-lab/victim.txt

ls -l delete-lab/victim.txt
ls -ld delete-lab

rm -i delete-lab/victim.txt
ls -la delete-lab
```

출력:

```text
-r--r--r--  ... delete-lab/victim.txt
drwxr-xr-x  ... delete-lab
override r--r--r-- ... for delete-lab/victim.txt? y
total 0
```

해석:

- 삭제 가능 여부는 파일 자체(`victim.txt`)보다 부모 디렉토리(`delete-lab`)의 `w+x` 권한에 좌우된다.
- `override ... ?`는 `rm -i`가 띄우는 "읽기 전용(쓰기 보호) 파일인데 정말 삭제할지"를 묻는 확인 프롬프트다.

---

## 3) 스크립트 실행: x 단독 vs r+x

```bash
cat > x_only.sh <<'EOF'
#!/usr/bin/env bash
echo "script run"
EOF

chmod 100 x_only.sh
./x_only.sh

chmod 500 x_only.sh
./x_only.sh
```

출력:

```text
bash: ./x_only.sh: Permission denied
script run
```

해석:

- shebang 스크립트는 인터프리터가 파일 내용을 읽는 과정이 있어 `x` 단독으로 실패할 수 있다.
- `r+x` 조합에서 실행이 정상 동작한다.

### 3-1) 번외: 바이너리는 x만으로 실행 가능한 경우

```bash
cat > tiny.c <<'EOF'
#include <stdio.h>
int main(void) {
  puts("binary run ok");
  return 0;
}
EOF

cc tiny.c -o tiny_bin
chmod 100 tiny_bin
ls -l tiny_bin

cat tiny_bin
./tiny_bin
```

출력:

```text
---x------  1 baejaemin  staff  33432 Mar 30 20:58 tiny_bin
cat: tiny_bin: Permission denied
binary run ok
```

해석:

- 바이너리 파일은 `r`이 없어도 `x`만으로 실행 가능한 경우가 있다.
- 스크립트의 `x` 단독 실패는 shebang/인터프리터 특성에 따른 현상이다.

---

## 4) 디렉토리 x only: 목록 조회와 경로 접근 차이

```bash
mkdir -p xr-lab/known
echo "inside" > xr-lab/known/data.txt
chmod 111 xr-lab

ls xr-lab
cat xr-lab/known/data.txt
```

출력:

```text
ls: xr-lab: Permission denied
inside
```

원복:

```bash
chmod 755 xr-lab
```

해석:

- 디렉토리에서 `r`이 없으면 목록 조회(`ls`)가 실패할 수 있다.
- `x`가 있으면 경로를 알고 있을 때 탐색/접근이 가능할 수 있다.

---

## 5) 평가용 최종 체크

- [x] 파일 권한 변화(`000/400/700`)에 따른 읽기/쓰기/실행 차이 확인
- [x] 파일 삭제 권한이 부모 디렉토리 권한에 의해 결정됨을 확인
- [x] 스크립트 실행에서 `x` 단독 실패 가능성과 `r+x` 성공 확인
- [x] 디렉토리 `x` 권한의 의미(탐색)와 `r` 권한의 의미(목록) 차이 확인
