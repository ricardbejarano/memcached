<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/198/rabbit-face_1f430.png" width="120px"></p>
<h1 align="center">memcached (container image)</h1>
<p align="center">Built-from-source container image of the <a href="https://memcached.org/">Memcached</a> in-memory key-value store</p>


## Tags

### Docker Hub

Available on Docker Hub as [`docker.io/ricardbejarano/memcached`](https://hub.docker.com/r/ricardbejarano/memcached):

- [`1.6.10`, `latest` *(Dockerfile)*](Dockerfile)

### RedHat Quay

Available on RedHat Quay as [`quay.io/ricardbejarano/memcached`](https://quay.io/repository/ricardbejarano/memcached):

- [`1.6.10`, `latest` *(Dockerfile)*](Dockerfile)


## Features

* Compiled from source during build time
* Built `FROM scratch`, with zero bloat
* Statically linked to the [`musl`](https://musl.libc.org/) implementation of the C standard library
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

```bash
docker build --tag ricardbejarano/memcached --file Dockerfile .
```


## License

MIT licensed, see [LICENSE](LICENSE) for more details.
