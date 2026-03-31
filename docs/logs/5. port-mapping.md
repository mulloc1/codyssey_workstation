# Port Mapping Log (4.5)

> 목표: 호스트 포트를 통해 컨테이너 서비스에 정상 접근되는지 검증한다.

## 1) 실행 명령

```bash
# 예시: nginx를 호스트 8080 포트에 매핑
docker run --name port-test -d -p 8080:80 nginx:latest
docker ps
```

출력:

```text
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                     NAMES
ae79299b5aae   nginx:latest   "/docker-entrypoint.…"   8 seconds ago   Up 8 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   port-test
```

## 2) 접속 검증

브라우저 또는 curl 중 하나 이상으로 확인:

```bash
curl -i http://localhost:8080
```

출력:

```text
❯ curl -i http://localhost:8080
HTTP/1.1 200 OK
Server: nginx/1.29.7
Date: Tue, 31 Mar 2026 01:11:10 GMT
Content-Type: text/html
Content-Length: 896
Last-Modified: Tue, 24 Mar 2026 15:38:34 GMT
Connection: keep-alive
ETag: "69c2affa-380"
Accept-Ranges: bytes

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, nginx is successfully installed and working.
Further configuration is required for the web server, reverse proxy,
API gateway, load balancer, content cache, or other features.</p>

<p>For online documentation and support please refer to
<a href="https://nginx.org/">nginx.org</a>.<br/>
To engage with the community please visit
<a href="https://community.nginx.org/">community.nginx.org</a>.<br/>
For enterprise grade support, professional services, additional
security features and capabilities please refer to
<a href="https://f5.com/nginx">f5.com/nginx</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

## 3) 정리

```bash
docker logs port-test
docker rm -f port-test
```

출력:

```text
❯ docker logs port-test
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/03/31 01:10:40 [notice] 1#1: using the "epoll" event method
2026/03/31 01:10:40 [notice] 1#1: nginx/1.29.7
2026/03/31 01:10:40 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19)
2026/03/31 01:10:40 [notice] 1#1: OS: Linux 6.17.8-orbstack-00308-g8f9c941121b1
2026/03/31 01:10:40 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 20480:1048576
2026/03/31 01:10:40 [notice] 1#1: start worker processes
2026/03/31 01:10:40 [notice] 1#1: start worker process 29
2026/03/31 01:10:40 [notice] 1#1: start worker process 30
2026/03/31 01:10:40 [notice] 1#1: start worker process 31
2026/03/31 01:10:40 [notice] 1#1: start worker process 32
2026/03/31 01:10:40 [notice] 1#1: start worker process 33
2026/03/31 01:10:40 [notice] 1#1: start worker process 34
2026/03/31 01:10:40 [notice] 1#1: start worker process 35
2026/03/31 01:10:40 [notice] 1#1: start worker process 36
2026/03/31 01:10:40 [notice] 1#1: start worker process 37
2026/03/31 01:10:40 [notice] 1#1: start worker process 38
192.168.215.1 - - [31/Mar/2026:01:11:10 +0000] "GET / HTTP/1.1" 200 896 "-" "curl/8.7.1" "-"

❯ docker rm -f port-test
port-test
```

## 4) 체크리스트

- [ ] 포트 매핑 실행 성공 (`-p host:container`)
- [ ] 호스트 경유 접속 성공 (브라우저 또는 `curl`)
- [ ] 응답 결과 확인 (상태 코드/본문)
