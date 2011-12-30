EAPI=3

inherit qt4-r2 git-2
EGIT_REPO_URI="git://github.com/kekekeks/skypetab-ng.git"

DESCRIPTION="Tabssss"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-im/skype"
RDEPEND="${DEPEND}"

src_configure() 
{
        eqmake4
}
