# Docker Core Log (4.3)

> 범위: Docker 기본 운영 및 컨테이너 실습(hello-world, ubuntu, attach/exec)

## 1) Docker 엔진/컨텍스트 점검

### 1-1. 버전 확인

```bash
docker --version
docker version
```

출력:

```text
Client:
 Version:           28.5.2
 API version:       1.51
 Go version:        go1.25.3
 Git commit:        ecc6942
 Built:             Wed Nov  5 14:42:30 2025
 OS/Arch:           darwin/arm64
 Context:           orbstack

Server: Docker Engine - Community
 Engine:
  Version:          28.5.2
  API version:      1.51 (minimum version 1.24)
  Go version:       go1.24.9
  Git commit:       89c5e8f
  Built:            Wed Nov  5 14:43:35 2025
  OS/Arch:          linux/arm64
  Experimental:     false
 containerd:
  Version:          v2.2.0
  GitCommit:        1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc:
  Version:          1.3.3
  GitCommit:        d842d7719497cc3b774fd71620278ac9e17710e0
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

### 1-2. 엔진 상태 확인

```bash
docker info
```

출력:

```text
Client:
 Version:    28.5.2
 Context:    orbstack
 Debug Mode: false
 Plugins:
  ai: Docker AI Agent - Ask Gordon (Docker Inc.)
    Version:  v1.9.11
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-ai
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.29.1
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-buildx
  cloud: Docker Cloud (Docker Inc.)
    Version:  v0.4.27
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-cloud
  compose: Docker Compose (Docker Inc.)
    Version:  v2.40.3
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-compose
  debug: Get a shell into any image or container (Docker Inc.)
    Version:  0.0.42
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-debug
  desktop: Docker Desktop commands (Docker Inc.)
    Version:  v0.2.0
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-desktop
  extension: Manages Docker extensions (Docker Inc.)
    Version:  v0.2.31
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-extension
  init: Creates Docker-related starter files for your project (Docker Inc.)
    Version:  v1.4.0
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-init
  mcp: Docker MCP Plugin (Docker Inc.)
    Version:  v0.18.0
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-mcp
  model: Docker Model Runner (Docker Inc.)
    Version:  v0.1.40
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-model
  sbom: View the packaged-based Software Bill Of Materials (SBOM) for an image (Anchore Inc.)
    Version:  0.6.0
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-sbom
  scout: Docker Scout (Docker Inc.)
    Version:  v1.18.3
    Path:     /Users/baejaemin/.docker/cli-plugins/docker-scout

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 28.5.2
 Storage Driver: overlay2
  Backing Filesystem: btrfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc version: d842d7719497cc3b774fd71620278ac9e17710e0
 init version: de40ad0
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.17.8-orbstack-00308-g8f9c941121b1
 Operating System: OrbStack
 OSType: linux
 Architecture: aarch64
 CPUs: 10
 Total Memory: 7.807GiB
 Name: orbstack
 ID: 47ca002e-75f4-4fa8-8a6e-88f090dc635f
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  ::1/128
  127.0.0.0/8
 Live Restore Enabled: false
 Product License: Community Engine
 Default Address Pools:
   Base: 192.168.97.0/24, Size: 24
   Base: 192.168.107.0/24, Size: 24
   Base: 192.168.117.0/24, Size: 24
   Base: 192.168.147.0/24, Size: 24
   Base: 192.168.148.0/24, Size: 24
   Base: 192.168.155.0/24, Size: 24
   Base: 192.168.156.0/24, Size: 24
   Base: 192.168.158.0/24, Size: 24
   Base: 192.168.163.0/24, Size: 24
   Base: 192.168.164.0/24, Size: 24
   Base: 192.168.165.0/24, Size: 24
   Base: 192.168.166.0/24, Size: 24
   Base: 192.168.167.0/24, Size: 24
   Base: 192.168.171.0/24, Size: 24
   Base: 192.168.172.0/24, Size: 24
   Base: 192.168.181.0/24, Size: 24
   Base: 192.168.183.0/24, Size: 24
   Base: 192.168.186.0/24, Size: 24
   Base: 192.168.207.0/24, Size: 24
   Base: 192.168.214.0/24, Size: 24
   Base: 192.168.215.0/24, Size: 24
   Base: 192.168.216.0/24, Size: 24
   Base: 192.168.223.0/24, Size: 24
   Base: 192.168.227.0/24, Size: 24
   Base: 192.168.228.0/24, Size: 24
   Base: 192.168.229.0/24, Size: 24
   Base: 192.168.237.0/24, Size: 24
   Base: 192.168.239.0/24, Size: 24
   Base: 192.168.242.0/24, Size: 24
   Base: 192.168.247.0/24, Size: 24
   Base: fd07:b51a:cc66:d000::/56, Size: 64
```

### 1-3. 컨텍스트 확인

```bash
docker context ls
docker context show
```

출력:

```text
NAME            DESCRIPTION                               DOCKER ENDPOINT                                     ERROR
default         Current DOCKER_HOST based configuration   unix:///var/run/docker.sock
desktop-linux   Docker Desktop                            unix:///Users/baejaemin/.docker/run/docker.sock
orbstack *      OrbStack                                  unix:///Users/baejaemin/.orbstack/run/docker.sock

orbstack
```

## 2) 이미지 조회 및 hello-world 검증

### 2-1. 이미지 조회/다운로드

```bash
docker pull hello-world
docker images
```

출력:

```text
Using default tag: latest
latest: Pulling from library/hello-world
58dee6a49ef1: Pull complete
Digest: sha256:452a468a4bf985040037cb6d5392410206e47db9bf5b7278d281f94d1c2d0931
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest

REPOSITORY    TAG       IMAGE ID       CREATED      SIZE
hello-world   latest    eb84fdc6f2a3   6 days ago   5.2kB
```

### 2-2. hello-world 실행 및 상태 확인

```bash
docker run --name hello-basic hello-world
docker ps
docker ps -a
docker logs hello-basic
```

출력:

```text
❯ docker run --name hello-basic hello-world


Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

❯ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

❯ docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
42eb0ba305ef   hello-world   "/hello"   12 seconds ago   Exited (0) 11 seconds ago             hello-basic

❯ docker logs hello-basic

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

```

## 3) ubuntu 컨테이너 실습

```bash
docker run -it --name ubuntu-practice ubuntu:latest bash
# container 내부
whoami
pwd
ls -al
exit
```

출력:

```text
❯ docker run -it --name ubuntu-practice ubuntu:latest bash
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
86790fc5660d: Pull complete
Digest: sha256:186072bba1b2f436cbb91ef2567abca677337cfc786c86e107d25b7072feef0c
Status: Downloaded newer image for ubuntu:latest
root@731c055f4a1d:/# whoami
root
root@731c055f4a1d:/# pwd
/
root@731c055f4a1d:/# ls -la
total 12
drwxr-xr-x   1 root root   6 Mar 30 13:36 .
drwxr-xr-x   1 root root   6 Mar 30 13:36 ..
-rwxr-xr-x   1 root root   0 Mar 30 13:36 .dockerenv
lrwxrwxrwx   1 root root   7 Apr 22  2024 bin -> usr/bin
...
root@731c055f4a1d:/# exit
exit
```

## 4) attach / exec 차이 확인

```bash
docker start ubuntu-practice
docker attach ubuntu-practice
docker exec -it ubuntu-practice bash
```

관찰 내용:

```text
start: 정지된 기존 컨테이너를 다시 실행한다. (실행만 하고 셸 진입은 아님)
attach: 이미 켜져 있는 컨테이너의 기존 창에 다시 붙는다.
exec -it ... bash: 실행 중 컨테이너 안에서 새 창을 열어 bash 셸로 들어간다.

-it 의미:
-i: 표준입력 유지(키보드 입력 가능)
-t: TTY 할당(터미널 형태 출력)
=> -it를 빼면 대화형 셸로 사용하기 어렵고, 명령이 바로 종료되거나 입력이 제한될 수 있다.
```

## 5) 체크리스트

- [ ] Docker 엔진 동작 확인
- [ ] 이미지/컨테이너 조회 및 로그 확인
- [ ] `hello-world` 실행 성공
- [ ] `ubuntu` 내부 명령 수행
- [ ] `attach/exec` 차이 관찰
