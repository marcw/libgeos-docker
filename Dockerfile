ARG DEBIAN_VERSION=bookworm
ARG GEOS_VERSION="3.13.1"

FROM debian:${DEBIAN_VERSION}-slim

RUN --mount=type=cache,target=/var/cache/apt \
  --mount=type=cache,target=/var/lib/apt \
  bash -c "set -o pipefail && apt-get update \
  && apt-get install -y --no-install-recommends curl ca-certificates wget build-essential cmake \
  && wget https://download.osgeo.org/geos/geos-${GEOS_VERSION}.tar.bz2 \
  && tar xvfj geos-${GEOS_VERSION}.tar.bz2 \
  && cd geos-${GEOS_VERSION} \
  && mkdir _build \
  && cd _build \
  && cmake -DCMAKE_BUILD_TYPE=Release  -DBUILD_TESTING=NO -DCMAKE_INSTALL_PREFIX=/usr/local .. \
  && make -j$(nproc) \
  && make install \
  && cd .. \
  && rm -rf geos-${GEOS_VERSION} geos-${GEOS_VERSION}.tar.bz2"
