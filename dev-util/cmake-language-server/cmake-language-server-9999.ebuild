# Copyright 2020 Terry Cojean
# Distributed under the terms of the MIT License

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6..10} )

inherit python-single-r1

DESCRIPTION="CMake LSP Implementation"
HOMEPAGE="https://github.com/regen100/cmake-language-server"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"


if [[ ${PV} == *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/regen100/cmake-language-server"
	SRC_URI=""
	inherit git-r3
fi


LICENSE="MIT"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-util/pygls-9999
	>=dev-python/pyparsing-2.4"
BDEPEND="${RDEPEND}"

