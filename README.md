# 개발 워크스테이션 구축 과제

## 1. 프로젝트 개요

이 프로젝트는 터미널, Docker(OrbStack), Git/GitHub를 활용해 재현 가능한 개발 워크스테이션을 구축하고 검증하는 것을 목표로 한다.

핵심 목표:

- 터미널 기본 조작 및 권한 이해
- Docker 이미지/컨테이너 운영
- Dockerfile 기반 커스텀 이미지 제작
- 포트 매핑, 바인드 마운트, 볼륨 영속성 검증
- Git 설정 및 GitHub 연동 기반 협업 환경 준비

---

## 2. 실행 환경

- OS: `macOS 15.6.1 (24G90)`
- Shell: `/bin/zsh`
- Terminal: `Cursor Integrated Terminal`
- Docker Version: `28.5.2`
- Git Version: `2.39.5 (Apple Git-154)`

## 3. 수행 항목 체크리스트

- [ ] 터미널 조작 로그 기록 완료
- [ ] 파일/디렉토리 권한 실습(변경 전/후) 완료
- [ ] Docker 설치/기본 점검 완료
- [ ] Docker 기본 운영 명령 검증 완료
- [ ] `hello-world`, `ubuntu` 컨테이너 실습 완료
- [ ] Dockerfile 기반 커스텀 이미지 빌드/실행 완료
- [ ] 포트 매핑 접속 검증 완료
- [ ] 바인드 마운트 반영 검증 완료
- [ ] Docker 볼륨 영속성 검증 완료
- [ ] Git 설정 및 GitHub/VSCode 연동 완료
- [ ] 트러블슈팅 2건 이상 정리 완료
- [ ] 민감정보 마스킹 점검 완료

---

## 4. 검증 및 증빙

상세 명령어/출력은 각 증빙 문서에 기록하고, 본 문서에는 검증 기준과 참조 경로만 정리한다.

### 4.1 터미널 조작

- 검증 기준: 경로 확인, 목록(숨김 포함), 생성/복사/이동/이름변경/삭제, 파일 내용 확인, 빈 파일 생성이 수행되었는지 확인
- 상세 기록 참조: `docs/logs/terminal-operations.md`

### 4.2 권한 실습

- 검증 기준: 파일 1개/디렉토리 1개 권한 변경 전/후 비교 확인
- 상세 기록 참조: `docs/logs/permission-lab.md`

### 4.3 Docker 기본 운영 및 컨테이너 실습

- 검증 기준: Docker 엔진 동작, 이미지/컨테이너 조회, 로그/리소스 확인, `hello-world` 성공, `ubuntu` 내부 명령 수행, `attach/exec` 차이 관찰
- 상세 기록 참조: `docs/logs/docker-basic.md`, `docs/logs/container-practice.md`

### 4.5 Dockerfile 기반 커스텀 이미지

- 검증 기준: 커스텀 이미지 빌드 성공, 컨테이너 실행 성공, 커스텀 포인트 목적 설명 가능
- 상세 기록 참조: `docs/logs/custom-image.md`

### 4.6 포트 매핑 접속

- 검증 기준: 호스트 포트를 통한 서비스 접근 성공(브라우저 또는 curl)
- 상세 기록 참조: `docs/logs/port-mapping.md`

### 4.7 스토리지 실습 (바인드 마운트/볼륨 영속성)

- 검증 기준: 바인드 마운트에서 호스트 파일 변경의 컨테이너 반영 여부(전/후 비교), 볼륨에서 컨테이너 삭제 후 재생성에도 데이터 유지됨을 확인
- 상세 기록 참조: `docs/logs/bind-mount.md`, `docs/logs/volume-persistence.md`

### 4.8 Git/GitHub 연동

- 검증 기준: Git 사용자 설정/기본 브랜치 반영, GitHub/VSCode 연동 증거 확인
- 상세 기록 참조: `docs/logs/git-github-integration.md`

### 4.9 실행 환경 정보

- 검증 기준: OS/Shell/Terminal/Docker/Git 버전이 평가 환경 기준으로 기록됨
- 상세 기록 참조: `docs/logs/environment.md`

### 4.10 트러블슈팅

- 검증 기준: 이슈 원인/조치/재발 방지 관점으로 최소 2건 정리
- 상세 기록 참조: `docs/logs/troubleshooting.md`

---

## 5. 보안/개인정보 보호

- 민감정보(토큰/비밀번호/개인키/인증코드) 마스킹 확인
- 스크린샷/로그 업로드 전 최종 점검 완료 여부: `[ ]`
