# Docker Basic Log

> 목표: Docker 엔진 동작, 이미지/컨테이너 조회, 로그/리소스 확인 가능 여부를 검증한다.

## 1) 설치/버전 확인

```bash
cd workstaion
docker --version
docker version
```

출력:

```text
# 여기에 실제 출력 기록
```

---

## 2) Docker 엔진(daemon) 동작 및 컨텍스트 확인

```bash
docker info
docker context ls
docker context show
```

출력:

```text
# 여기에 실제 출력 기록
```

---

## 3) 이미지 조회 및 다운로드 확인

```bash
docker images
docker pull hello-world
docker images
```

출력:

```text
# 여기에 실제 출력 기록
```

---

## 4) 컨테이너 실행 및 상태 조회

```bash
docker run --name hello-basic hello-world
docker ps
docker ps -a
```

출력:

```text
# 여기에 실제 출력 기록
```

---

## 5) 로그 확인

```bash
docker logs hello-basic
```

출력:

```text
# 여기에 실제 출력 기록
```

---

## 6) 리소스 확인 및 정리

```bash
docker stats --no-stream
docker rm hello-basic
docker ps -a
```

출력:

```text
# 여기에 실제 출력 기록
```

---

## 검증 결론

- [ ] Docker 버전 확인 완료 (`docker --version`, `docker version`)
- [ ] Docker 엔진 동작 확인 완료 (`docker info`)
- [ ] Docker 컨텍스트 확인 완료 (`docker context ls`, `docker context show`)
- [ ] 이미지 조회/다운로드 확인 완료 (`docker images`, `docker pull`)
- [ ] 컨테이너 실행 및 상태 조회 확인 완료 (`docker run`, `docker ps`, `docker ps -a`)
- [ ] 컨테이너 로그 확인 완료 (`docker logs`)
- [ ] 리소스 확인 및 정리 완료 (`docker stats --no-stream`, `docker rm`)
