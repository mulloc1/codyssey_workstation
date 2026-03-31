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
# 여기에 실제 출력 기록
```

## 2) 접속 검증

브라우저 또는 curl 중 하나 이상으로 확인:

```bash
curl -i http://localhost:8080
```

출력:

```text
# 여기에 실제 출력 기록 (HTTP 상태 코드/응답 헤더 포함 권장)
```

## 3) 정리

```bash
docker logs port-test
docker rm -f port-test
```

출력:

```text
# 여기에 실제 출력 기록
```

## 4) 체크리스트

- [ ] 포트 매핑 실행 성공 (`-p host:container`)
- [ ] 호스트 경유 접속 성공 (브라우저 또는 `curl`)
- [ ] 응답 결과 확인 (상태 코드/본문)
