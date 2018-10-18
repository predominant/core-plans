pkg_name=redis
pkg_dist_name=redis
pkg_origin=core
pkg_version="5.0.0"
pkg_description="Persistent key-value database, with built-in net interface"
pkg_upstream_url="http://redis.io/"
pkg_license=("BSD-3-Clause")
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="http://download.redis.io/releases/${pkg_dist_name}-${pkg_version}.tar.gz"
pkg_shasum="70c98b2d0640b2b73c9d8adb4df63bcb62bad34b788fe46d1634b6cf87dc99a4"
pkg_bin_dirs=(bin)
pkg_build_deps=(
  core/make
  core/gcc
  core/jemalloc
  core/pkg-config
)
pkg_deps=(core/glibc)
pkg_svc_run="redis-server ${pkg_svc_config_path}/redis.config"
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

do_build() {
  make
}

do_check() {
  make test
}
