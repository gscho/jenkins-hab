pkg_name=jenkins
pkg_origin=gscho
pkg_version=2.121.1
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="The leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project."
pkg_license=('mit')
pkg_upstream_url="https://jenkins.io/"
pkg_shasum="5bb075b81a3929ceada4e960049e37df5f15a1e3cfc9dc24d749858e70b48919"
pkg_deps=(
  core/curl
  core/git
  indellient/jenkins
)
pkg_exports=(
  [port]=jenkins.http.port
)
pkg_exposes=(port)
pkg_svc_user="root"

do_download() {
  return 0
}

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  return 0
}
