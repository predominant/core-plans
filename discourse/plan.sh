pkg_name=discourse
pkg_origin=core
pkg_version="2.1.1"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("GPL-2.0-only")
pkg_source="https://github.com/discourse/discourse/archive/v${pkg_version}.tar.gz"
pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="bf1594100114b8133789b43a7be6a5880a5d02951c4be422eb62b9cc33c5a6a7"
pkg_deps=(
  core/bundler
  core/gcc
  core/gifsicle
  core/jemalloc
  core/node
  core/pngcrush
  core/pngquant
  core/ruby
)
pkg_build_deps=(
  core/bundler
  core/gcc
  core/make
  core/patch
  core/postgresql
)
# run as root so that discourse can write to disk
pkg_svc_user="root"
pkg_description="Discussion platform built for the next decade of the Internet."
pkg_upstream_url="https://www.discourse.org/"

do_setup_environment() {
  set_buildtime_env BUNDLE_SILENCE_ROOT_WARNING 1
  set_runtime_env HAB_DISCOURSE_PATH ${pkg_prefix}/${pkg_name}
}

do_build() {
  patch Gemfile ${PLAN_CONTEXT}/Gemfile.patch
  bundle install
  bundle install \
    --deployment \
    --without test \
    --without development
  patch vendor/bundle/ruby/2.5.0/bin/unicorn ${PLAN_CONTEXT}/unicorn.patch
}

do_install() {
  local target_dir="${pkg_prefix}/discourse"
  mkdir -p "${target_dir}"
  cp -r "${HAB_CACHE_SRC_PATH}/${pkg_dirname}/." "${target_dir}"
}
