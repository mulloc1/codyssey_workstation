# Custom Image Log (4.4)

> 목표: 기존 베이스 이미지를 활용해 커스텀 이미지를 빌드하고, 실행/접속까지 검증한다.

## 1) 선택한 베이스 이미지

- 베이스 이미지: `nginx:alpine`
- 선택 이유:
  - 공식 웹 서버 이미지로 정적 페이지 서빙 검증이 간단함
  - 이미지 크기가 작아 빌드/실행이 빠름
  - 포트 매핑 및 접속 검증(`curl`/브라우저)에 적합함

## 2) Dockerfile 커스텀 포인트

적용한 Dockerfile 예시:

```dockerfile
FROM nginx:alpine

LABEL org.opencontainers.image.title="workstation-custom-web"
LABEL org.opencontainers.image.description="Custom nginx image for codyssey mission"

ENV APP_ENV=dev

COPY site/ /usr/share/nginx/html/
EXPOSE 80
```

커스텀 포인트와 목적:

- `LABEL`: 이미지 식별/설명을 위한 메타데이터 부여
- `ENV APP_ENV=dev`: 설정값을 코드와 분리하는 패턴 연습
- `COPY site/ /usr/share/nginx/html/`: 기본 nginx 페이지를 사용자 정적 콘텐츠로 교체

## 3) 빌드/실행 명령

```bash
# workstaion 루트 기준
docker build -t workstation-web:1.0 .
docker run --name workstation-web -d -p 8082:80 workstation-web:1.0
docker ps
```

출력:

```text
❯ docker images
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
workstation-web   1.0       b2f62e490f3e   11 seconds ago   61.6MB
nginx             latest    f0bb7029dace   6 days ago       181MB
hello-world       latest    eb84fdc6f2a3   7 days ago       5.2kB
ubuntu            latest    e3847ac055b4   5 weeks ago      101MB

❯ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                                     NAMES
41f7ab1f20d9   workstation-web:1.0   "/docker-entrypoint.…"   3 seconds ago   Up 2 seconds   0.0.0.0:8082->80/tcp, [::]:8082->80/tcp   workstation-web
```

## 4) 접속 검증 (포트 매핑)

```bash
curl -i http://localhost:8082
```

출력:

```text
❯ curl -i http://localhost:8082
HTTP/1.1 200 OK
Server: nginx/1.29.7
Date: Tue, 31 Mar 2026 06:52:08 GMT
Content-Type: text/html
Content-Length: 326
Last-Modified: Tue, 31 Mar 2026 06:46:14 GMT
Connection: keep-alive
ETag: "69cb6db6-146"
Accept-Ranges: bytes

<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Workstation Custom Web</title>
</head>
<body>
  <h1>Hello from custom Docker image</h1>
  <p>Codyssey workstation custom image is running.</p>
  <p>APP_ENV: dev</p>
</body>
</html>
```

## 5) 운영 확인 및 정리

```bash
docker logs workstation-web
docker rm -f workstation-web
```

출력:

```text
❯ docker logs workstation-web
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/03/31 06:51:37 [notice] 1#1: using the "epoll" event method
2026/03/31 06:51:37 [notice] 1#1: nginx/1.29.7
2026/03/31 06:51:37 [notice] 1#1: built by gcc 15.2.0 (Alpine 15.2.0)
2026/03/31 06:51:37 [notice] 1#1: OS: Linux 6.17.8-orbstack-00308-g8f9c941121b1
2026/03/31 06:51:37 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 20480:1048576
2026/03/31 06:51:37 [notice] 1#1: start worker processes
2026/03/31 06:51:37 [notice] 1#1: start worker process 30
2026/03/31 06:51:37 [notice] 1#1: start worker process 31
2026/03/31 06:51:37 [notice] 1#1: start worker process 32
2026/03/31 06:51:37 [notice] 1#1: start worker process 33
2026/03/31 06:51:37 [notice] 1#1: start worker process 34
2026/03/31 06:51:37 [notice] 1#1: start worker process 35
2026/03/31 06:51:37 [notice] 1#1: start worker process 36
2026/03/31 06:51:37 [notice] 1#1: start worker process 37
2026/03/31 06:51:37 [notice] 1#1: start worker process 38
2026/03/31 06:51:37 [notice] 1#1: start worker process 39
192.168.215.1 - - [31/Mar/2026:06:52:08 +0000] "GET / HTTP/1.1" 200 326 "-" "curl/8.7.1" "-"
```

## 6) 체크리스트

- [x] 베이스 이미지 선택 이유 기록
- [x] 커스텀 포인트(목적 포함) 기록
- [x] 빌드/실행 명령 기록
- [x] 포트 매핑 접속 검증 기록
- [x] 정리 명령 기록
