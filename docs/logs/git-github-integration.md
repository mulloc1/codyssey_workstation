# Git/GitHub Integration Log (4.7)

> 목표: Git 사용자 설정, 기본 브랜치 설정, GitHub 연동 상태를 검증한다.

## 1) Git 사용자/기본 브랜치 설정 확인

```bash
git --version
git config --global user.name
git config --global user.email
git config --global init.defaultBranch
```

출력:

```text
# 여기에 실제 출력 기록
```

## 2) 로컬 저장소 상태 확인

```bash
git rev-parse --is-inside-work-tree
git branch --show-current
git status -sb
```

출력:

```text
# 여기에 실제 출력 기록
```

## 3) GitHub 연동 확인

```bash
git remote -v
# 선택: gh CLI 사용 시
gh auth status
```

출력:

```text
# 여기에 실제 출력 기록
```

## 4) 체크리스트

- [ ] Git 사용자 설정 확인 완료 (`user.name`, `user.email`)
- [ ] 기본 브랜치 정책 확인 완료 (`init.defaultBranch`)
- [ ] 원격 저장소(GitHub) 연결 확인 완료 (`git remote -v`)
- [ ] 필요 시 GitHub 인증 상태 확인 완료 (`gh auth status`)
