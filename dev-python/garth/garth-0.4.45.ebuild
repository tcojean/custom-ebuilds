# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Garmin SSO auth + Connect client"
HOMEPAGE="
	https://github.com/matin/garth/
	https://pypi.org/project/garth/
"
SRC_URI="https://github.com/matin/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
 >=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
 <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
 >=dev-python/pydantic-1.10.12[${PYTHON_USEDEP}]
 <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
 >=dev-python/requests-oauthlib-1.3.1[${PYTHON_USEDEP}]
 <dev-python/requests-oauthlib-3.0.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-vcr[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
