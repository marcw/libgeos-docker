# libgeos-docker

An immature docker image to build [libgeos](https://libgeos.org/).

I personally use it like that:

```Dockerfile
FROM ghcr.io/marcw/libgeos-docker:latest-debian-bookworm AS libgeos

FROM ruby:3.4.5-slim-bookworm

COPY --from=libgeos /usr/local/lib/libgeos* /usr/local/lib
```

## Helpful command

As the container doesn't have an entrypoint, use this command to run a shell

```bash
docker run --rm -it --entrypoint /bin/bash ghcr.io/marcw/libgeos-docker:latest-debian-bookworm
```

## LICENSE

- This repository is MIT licensed
