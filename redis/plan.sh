pkg_name=redis
pkg_dist_name=redis
pkg_origin=core
pkg_version="4.0.11"
pkg_description="Persistent key-value database, with built-in net interface"
pkg_upstream_url="http://redis.io/"
pkg_license=("BSD-3-Clause")
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="http://download.redis.io/releases/${pkg_dist_name}-${pkg_version}.tar.gz"
pkg_shasum="fc53e73ae7586bcdacb4b63875d1ff04f68c5474c1ddeda78f00e5ae2eed1bbb"
pkg_bin_dirs=(bin)
pkg_build_deps=(
  core/make
  core/gcc
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
