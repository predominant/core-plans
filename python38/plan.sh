# shellcheck disable=SC2148,SC1091
source ../python/plan.sh

pkg_name=python38
pkg_distname=Python
pkg_version=3.8.1
pkg_origin=core
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('Python-2.0')
pkg_description="Python is a programming language that lets you work quickly \
  and integrate systems more effectively."
pkg_upstream_url=https://www.python.org
pkg_dirname="${pkg_distname}-${pkg_version}"
pkg_source="https://www.python.org/ftp/python/${pkg_version}/${pkg_dirname}.tgz"
pkg_shasum=c7cfa39a43b994621b245e029769e9126caa2a93571cee2e743b213cceac35fb
pkg_interpreters=(
  bin/python
  bin/python3
  bin/python3.8
)
