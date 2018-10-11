source '../redis/plan.sh'

pkg_name=redis4
pkg_origin=core
pkg_version="4.0.11"
pkg_description="Persistent key-value database, with built-in net interface"
pkg_upstream_url="http://redis.io"
pkg_license=("BSD-3-Clause")
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="http://download.redis.io/releases/${pkg_dist_name}-${pkg_version}.tar.gz"
pkg_shasum="fc53e73ae7586bcdacb4b63875d1ff04f68c5474c1ddeda78f00e5ae2eed1bbb"
pkg_dirname="${pkg_dist_name}-${pkg_version}"
