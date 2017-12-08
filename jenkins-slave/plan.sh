pkg_name=jenkins-slave
pkg_origin=core
pkg_version=2.73.3
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('mit')
pkg_upstream_url="https://jenkins.io/"
pkg_deps=(core/jre8)
pkg_binds=(
  [jenkins]="port host"
)
pkg_svc_user="hab"
pkg_svc_group="$pkg_svc_user"

do_download() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  return 0
}
