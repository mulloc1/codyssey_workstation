# Docker Storage Log (4.6)

> 범위: 바인드 마운트 반영 검증 + 볼륨 영속성 검증

## 1) 바인드 마운트 검증

```bash
mkdir -p ./storage-lab/bind
echo "v1 from host" > ./storage-lab/bind/message.txt
docker run --rm -it -v "$(pwd)/storage-lab/bind:/data" ubuntu:latest bash
# container 내부에서 /data/message.txt 확인
```

출력:

```text
❯ docker run --rm -it -v "$(pwd)/storage-lab/bind:/data" ubuntu:latest bash

root@f6f374210f08:/# cat data/message.txt
v1 from host
```

호스트 파일 수정 후 재확인:

```bash
echo "v2 from host" > ./storage-lab/bind/message.txt
# container 내부에서 동일 파일 재확인
```

출력:

```text
❯ echo "v2 from host" > ./storage-lab/bind/message.txt

root@f6f374210f08:/# cat data/message.txt
v2 from host
```

## 2) 볼륨 영속성 검증

```bash
docker volume create ws_data
docker run --name volume-writer -v ws_data:/app/data ubuntu:latest bash -lc 'echo "persisted" > /app/data/state.txt'
docker rm volume-writer
docker run --rm -v ws_data:/app/data ubuntu:latest bash -lc 'cat /app/data/state.txt'
```

출력:

```text
❯ docker volume create ws_data
ws_data
❯ docker run --name volume-writer -v ws_data:/app/data ubuntu:latest bash -lc 'echo "persisted" > /app/data/state.txt'
❯ docker rm volume-writer
volume-writer
❯ docker run --rm -v ws_data:/app/data ubuntu:latest bash -lc 'cat /app/data/state.txt'
persisted
```

## 3) 체크리스트

- [ ] 바인드 마운트 전/후 반영 확인
- [ ] 볼륨 생성 및 마운트 확인
- [ ] 컨테이너 삭제 후 재생성 시 데이터 유지 확인

## 4) 바인드 마운트 vs 볼륨 차이 요약

- 바인드 마운트: 데이터가 로컬 PC의 지정 경로에 저장되며, 사용자가 직접 파일을 관리한다.
- 볼륨: 데이터는 Docker가 관리하는 저장소에 저장되며, 컨테이너 수명과 분리되어 유지된다.
- 바인드 마운트는 개발 중 즉시 반영/직접 편집에 유리하고, 볼륨은 영속성/이식성/운영 안정성에 유리하다.
