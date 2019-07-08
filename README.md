<p align=center><img src=https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/198/rabbit-face_1f430.png width=120px></p>
<h1 align=center>memcached (container image)</h1>
<p align=center>Built-from-source container image of the <a href=https://memcached.org/>Memcached in-memory key-value store</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/memcached`](https://hub.docker.com/r/ricardbejarano/memcached):

- [`1.5.16-glibc`, `1.5.16`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.glibc)
- [`1.5.16-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.musl)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/memcached-glibc`](https://quay.io/repository/ricardbejarano/memcached-glibc), tags: [`1.5.16`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.glibc)
- [`quay.io/ricardbejarano/memcached-musl`](https://quay.io/repository/ricardbejarano/memcached-musl), tags: [`1.5.16`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/memcached/blob/master/Dockerfile.musl)


## Features

* Super tiny (`glibc`-based is `~3.6MB` and `musl`-based is `~1.64MB`)
* Compiled from source during build time
* Built `FROM scratch`, see [Filesystem](#filesystem) for an exhaustive list of the image's contents
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Built with binary exploit mitigations enabled


## Building

- To build the `glibc`-based image: `$ docker build -t memcached:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `$ docker build -t memcached:musl -f Dockerfile.musl .`


## Filesystem

The images' contents are:

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
│       ├── libevent-2.0.so.5
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
