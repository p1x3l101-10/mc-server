pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=3
pkgrel=9
arch=('any')
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
source=('Makefile' 'minecraft-setup.bash' 'minecraft@.container' 'minecraft-configure.bash')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    make install DESTDIR="$pkgdir/usr"
}
