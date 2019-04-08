pkg_name=splunkforwarder
pkg_origin=core
pkg_version=7.2.5
pkg_releaseref=088f49762779
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_filename="${pkg_name}-${pkg_version}-${pkg_releaseref}-Linux-x86_64.tgz"
pkg_source="http://download.splunk.com/products/splunk/releases/7.2.5/universalforwarder/linux/${pkg_filename}"
pkg_shasum=9a7b45b8b6d2d44308c4f071a8afeee72cc59323f99e51699a622885d6386787
pkg_dirname="${pkg_name}"
pkg_deps=(
  core/coreutils
  core/gcc-libs
  core/glibc
  core/libtool
  core/krb5
  core/openssl
  core/unixodbc
  core/util-linux
  core/zlib
  core/grep
  core/sed
  core/jemalloc
  core/pcre
  core/libxml2
  core/libxslt
  core/libarchive
  core/bzip2
  core/sqlite
)
pkg_build_deps=(
  core/coreutils
  core/binutils
  core/dpkg
  core/patchelf
)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
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
pkg_svc_user="root"
pkg_svc_group="${pkg_svc_user}"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"

do_build() {
  return 0
}

do_install() {
  # copyright.txt alread exists in the $pkg_prefix path.
  rm bin/copyright.txt

  fix_interpreter "bin/*.sh" core/coreutils bin/env

  patchelf --interpreter "$(pkg_path_for core/glibc)/lib/ld-linux-x86-64.so.2" bin/btool
  patchelf --interpreter "$(pkg_path_for core/glibc)/lib/ld-linux-x86-64.so.2" bin/openssl
  patchelf --interpreter "$(pkg_path_for core/glibc)/lib/ld-linux-x86-64.so.2" bin/splunkd
  patchelf --interpreter "$(pkg_path_for core/glibc)/lib/ld-linux-x86-64.so.2" bin/splunk

  find bin/ -type f -executable -exec file -i '{}' \; | grep executable | awk -F':' '{print $1}' | while read line; do
    patchelf --set-rpath "${LD_RUN_PATH}" "${line}"
  done

  cp -r . "${pkg_prefix}/"
}
