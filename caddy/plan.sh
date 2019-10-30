pkg_name=caddy
pkg_origin=core
pkg_version=2.0.0-beta8
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="https://github.com/caddyserver/caddy/releases/download/v${pkg_version}/caddy2_beta8_linux_amd64"
pkg_shasum=ac4367a54c6429fac25887c307434c8177e256aeb43998594d228308573e295a
pkg_description="Fast, cross-platform HTTP/2 web server with automatic HTTPS"
pkg_upstream_url=https://caddyserver.com
pkg_svc_run="caddy run --config ${pkg_svc_config_path}/Caddyfile --adapter caddyfile"
pkg_exposes=(port)
pkg_exports=(
  [port]=http.port
)
pkg_bin_dirs=(bin)
pkg_deps=(core/glibc)
pkg_dirname="${pkg_name}-v${pkg_version}"
pkg_svc_user="root"
pkg_svc_group="root"

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  install -Dm755 "${HAB_CACHE_SRC_PATH}/caddy2_beta8_linux_amd64" "${pkg_prefix}/bin/caddy"
}
