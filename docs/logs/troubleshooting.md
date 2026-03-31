# Troubleshooting Log (4.9)

> 목표: 작업 중 발생한 이슈를 원인/조치/재발 방지 관점으로 최소 2건 기록한다.

## 이슈 1

- 증상: Docker 명령 실행 시 컨테이너가 정상 동작하지 않거나 Docker 관련 오류가 발생함
- 원인: OrbStack(Docker 엔진)이 실행되지 않은 상태에서 Docker 명령을 수행함
- 조치: OrbStack을 실행해 Docker 엔진을 먼저 기동한 뒤 명령을 재실행함
- 검증: `docker --version`, `docker info`, `docker ps`가 정상 응답하는 것을 확인함
- 재발 방지: Docker 실습 시작 전 엔진 상태를 먼저 점검하는 루틴을 적용함

관련 명령/출력:

```bash
docker info
docker ps
```

```text
❯ docker ps
Cannot connect to the Docker daemon at unix:///Users/baejaemin/.orbstack/run/docker.sock. Is the docker daemon running?

=== orbstack 실행 후 ===

❯ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

---

## 이슈 2

- 증상: `docker run -d -p 8080:80 ...` 실행 시 포트 바인딩 오류로 컨테이너 실행이 실패함
- 원인: 실습 과정에서 이전 컨테이너를 제거하지 않은 상태로 진행하여, 호스트 `8080` 포트가 이미 점유되어 있었음
- 조치: 기존 컨테이너를 정리한 뒤 재실행하거나, 대체 포트(`8081`)로 실행함
- 검증: `docker ps`에서 포트 매핑(`0.0.0.0:8081->80/tcp`)을 확인하고 `curl http://localhost:8081` 응답(200 OK)을 확인함
- 재발 방지: 새 컨테이너 실행 전 `docker ps -a`로 기존 컨테이너/포트 점유 여부를 확인하고, 실습 종료 시 `docker rm -f <container>`로 정리함

관련 명령/출력:

```bash
docker run --name port-test -d -p 8080:80 nginx:latest
docker ps -a
docker rm -f port-test
docker run --name port-test -d -p 8081:80 nginx:latest
curl -i http://localhost:8081
```

```text
docker: Error response from daemon: driver failed programming external connectivity on endpoint ...
Bind for 0.0.0.0:8080 failed: port is already allocated

CONTAINER ID   IMAGE          ...   PORTS
...            nginx:latest         0.0.0.0:8081->80/tcp

HTTP/1.1 200 OK
Server: nginx/...
```

---

## 체크리스트

- [x] 이슈 2건 이상 기록
- [x] 원인/조치/검증/재발 방지 항목 포함
