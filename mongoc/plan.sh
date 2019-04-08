pkg_name=mongoc
pkg_distname="mongo-c-driver"
pkg_origin=core
pkg_version="1.14.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="https://github.com/mongodb/mongo-c-driver/releases/download/${pkg_version}/${pkg_distname}-${pkg_version}.tar.gz"
pkg_filename="${pkg_distname}-${pkg_version}.tar.gz"
pkg_shasum="ebe9694f7fa6477e594f19507877bbaa0b72747682541cf0cf9a6c29187e97e8"
pkg_dirname="${pkg_distname}-${pkg_version}"
pkg_deps=(
  core/glibc
  core/openssl
  core/cyrus-sasl
  core/coreutils
)
pkg_build_deps=(
  core/cmake
  core/make
  core/gcc
)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_interpreters=(bin/bash)
pkg_description="A high-performance MongoDB driver for C"
pkg_upstream_url="https://github.com/mongodb/mongo-c-driver"

do_build() {
  mkdir cmake-build
  pushd cmake-build > /dev/null
  cmake \
    -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd > /dev/null
}

do_install() {
  make DESTDIR="${pkg+prefix}" install
}
