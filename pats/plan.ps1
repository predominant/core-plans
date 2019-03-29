$pkg_name="pats"
$pkg_origin="core"
$pkg_version="0.1.0"
$pkg_license=@("Apache-2.0")
$pkg_upstream_url="https://github.com/declarativesystems/pats"
$pkg_description="PowerShell Acceptance Testing System"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="https://github.com/declarativesystems/pats/archive/master.zip"
$pkg_shasum="8dd5b2a738e364d0ab14a5e99e2e9228eea2ce5a92645cbc322131e0a4e23aa4"
$pkg_bin_dirs=@("bin")

# function Invoke-Unpack {
#   mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"

#   Push-Location "$HAB_CACHE_SRC_PATH/$pkg_dirname"
#   Pop-Location
# }

function Invoke-Install {
  Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_dirname/node-v$pkg_version-x64/SourceDir/nodejs/*" "$pkg_prefix/bin" -Recurse
}

function Invoke-Check() {
  (& "$HAB_CACHE_SRC_PATH/$pkg_dirname/nodejs/node" --version) -eq "v$pkg_version"
}
