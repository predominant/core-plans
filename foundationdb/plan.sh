pkg_name=foundationdb
pkg_origin=core
pkg_version="5.2.5"
pkg_description="The open source, distributed, transactional key-value store"
pkg_upstream_url="https://www.foundationdb.org"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
# pkg_source="https://github.com/apple/${pkg_name}/archive/${pkg_version}.tar.gz"
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
# pkg_shasum="25056568dfe283456f5b6b6ff822db133ecafc78319a29b6243c536f357d13b5"
pkg_deps=(
  core/coreutils
)
pkg_build_deps=(
  core/glibc
  core/libressl
  core/make
  core/gcc/5.2.0
  core/busybox-static
  core/jdk8
  core/git
  core/python2
  core/m4
  core/mono5
  core/boost
)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)
# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"

do_download() {
  do_default_clean
  git clone \
    --branch "${pkg_version}" \
    --depth 1 \
    https://github.com/apple/foundationdb.git \
    "${CACHE_PATH}"
}

do_clean() {
  return 0
}

do_build() {
  attach
  pushd "${CACHE_PATH}" > /dev/null
  make
  popd
}
