<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/198/rabbit-face_1f430.png" width="120px"></p>
<h1 align="center">memcached (container image)</h1>
<p align="center">Built-from-source container image of the <a href="https://memcached.org/">Memcached in-memory key-value store</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/memcached`](https://hub.docker.com/r/ricardbejarano/memcached):

- [`1.6.0-glibc`, `1.6.0`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.glibc) (about `3.97MB`)
- [`1.6.0-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.musl) (about `1.66MB`)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/memcached`](https://quay.io/repository/ricardbejarano/memcached), [`quay.io/ricardbejarano/memcached-glibc`](https://quay.io/repository/ricardbejarano/memcached-glibc), tags: [`1.6.0`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.glibc) (about `3.97MB`)
- [`quay.io/ricardbejarano/memcached-musl`](https://quay.io/repository/ricardbejarano/memcached-musl), tags: [`1.6.0`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.musl) (about `1.66MB`)


## Features

* Super tiny (see [Tags](#tags))
* Compiled from source (with binary exploit mitigations) during build time
* Built `FROM scratch`, with zero bloat (see [Filesystem](#filesystem))
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

- To build the `glibc`-based image: `$ docker build -t memcached:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `$ docker build -t memcached:musl -f Dockerfile.musl .`


## Filesystem

### `glibc`

Based on the [glibc](https://www.gnu.org/software/libc/) implementation of `libc`. Dynamically linked.

```
/
├── etc/
│   ├── group
│   └── passwd
├── lib/
│   └── x86_64-linux-gnu/
│       ├── libc.so.6
│       ├── libevent-2.1.so.7
│       └── libpthread.so.0
├── lib64/
│   └── ld-linux-x86-64.so.2
└── memcached
```

### `musl`

Based on the [musl](https://www.musl-libc.org/) implementation of `libc`. Statically linked.

```
/
├── etc/
│   ├── group
│   └── passwd
└── memcached
```


## License

See [LICENSE](https://github.com/ricardbejarano/memcached/blob/master/LICENSE).
