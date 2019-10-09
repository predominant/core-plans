pkg_name=caddy
pkg_origin=core
pkg_version=2.0.0-beta4
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="https://github.com/caddyserver/caddy/releases/download/v${pkg_version}/caddy2_beta4_linux_amd64"
pkg_shasum=a172bcc398852cf7e9cd2c92f5c6220c52738edc89d2c4ae9a9816c074ad33d8
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

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  install -Dm755 "${HAB_CACHE_SRC_PATH}/caddy2_beta4_linux_amd64" "${pkg_prefix}/bin/caddy"
}
