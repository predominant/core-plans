pkg_name=discourse
pkg_origin=core
pkg_version="2.1.1"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("GPL-2.0-only")
pkg_source="https://github.com/discourse/discourse/archive/v${pkg_version}.tar.gz"
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="bf1594100114b8133789b43a7be6a5880a5d02951c4be422eb62b9cc33c5a6a7"
pkg_deps=(
  core/gifsicle
  core/jemalloc
  core/pngcrush
  core/pngquant
)
pkg_build_deps=(
  core/bundler
  core/gcc
  core/make
  core/postgresql
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
pkg_description="Discussion platform built for the next decade of the Internet."
pkg_upstream_url="https://www.discourse.org/"

do_build() {
  bundle install \
    --deployment \
    --without test \
    --without development
}

do_install() {
  local target_dir="${pkg_prefix}/discourse"
  mkdir -p "${target_dir}"
  cp -r "${HAB_CACHE_SRC_PATH}/${pkg_dirname}/." "${target_dir}"
}
