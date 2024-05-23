# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

distutils_enable_tests pytest

DESCRIPTION="CMake LSP Implementation"
HOMEPAGE="https://github.com/regen100/cmake-language-server"
SRC_URI="https://github.com/regen100/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

COMMON_DEPEND="
	$(python_gen_cond_dep '
		>=dev-python/pygls-1.1.1[${PYTHON_USEDEP}]
		>=dev-util/cmakelang-0.6.13[${PYTHON_USEDEP}]
	')
"
DEPEND="${COMMON_DEPEND}"
RDEPEND="
	${COMMON_DEPEND}
	dev-build/cmake
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			>=dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
			>=dev-python/pytest-datadir-1.4.1[${PYTHON_USEDEP}]
			>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		')
	)
"

export PDM_BUILD_SCM_VERSION=${PV}
