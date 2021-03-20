# Copyright 2021-2021 Terry Cojean
# Distributed under the terms of the MIT License

EAPI=7
inherit bash-completion-r1


if [[ ${PV} = 9999* ]]; then
	EGIT_REPO_URI="https://github.com/Rudd-O/qubes-pass"
	inherit git-r3
else
	SRC_URI="https://github.com/Rudd-O/qubes-pass/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
	S="${WORKDIR}/qubes-pass-${PV}"
fi

DESCRIPTION="Inter-VM Pass password manager for Qubes OS"
HOMEPAGE="https://github.com/Rudd-O/qubes-pass"

SLOT="0"
# LICENSE="" # Maybe unlicensed?
IUSE="+client service dom0"


RDEPEND="
    service? ( app-admin/pass )
    "

src_install() {
    if euse client; then
        emake install-client \
            DESTDIR="${D}"
    fi
    if euse service; then
        emake install-service \
            DESTDIR="${D}"
    fi
    if euse dom0; then
        emake install-dom0 \
            DESTDIR="${D}"
    fi
}
