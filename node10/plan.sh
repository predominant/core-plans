source "../node/plan.sh"

pkg_name=node10
pkg_origin=core
pkg_version=10.13.0
pkg_description="Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine."
pkg_license=('MIT')
pkg_upstream_url=https://nodejs.org/
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://nodejs.org/dist/v${pkg_version}/node-v${pkg_version}.tar.gz"
pkg_shasum=aa06825fff375ece7c0d881ae0de5d402a857e8cabff9b4a50f2f0b7b44906be
pkg_dirname="node-v${pkg_version}"
