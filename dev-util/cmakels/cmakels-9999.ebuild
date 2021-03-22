# Copyright 2020 Terry Cojean
# Distributed under the terms of the MIT License

EAPI=7

inherit cmake-utils

DESCRIPTION="CMake language server"
HOMEPAGE="https://github.com/havogt/cmakels"

if [[ ${PV} == *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/havogt/cmakels"
	SRC_URI=""
	inherit git-r3
fi


LICENSE="BSD-with-attribution"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
	)
	cmake-utils_src_configure
}
