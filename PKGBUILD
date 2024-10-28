pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=3
pkgrel=0
arch=('any')
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
source=('minecraft-setup.bash' 'minecraft@.container')
sha256sums=('SKIP' 'SKIP')

package() {
    install -D -m644 minecraft@.container $pkgdir/usr/share/containers/systemd/minecraft@.container
    install -D -m755 minecraft-setup.bash $pkgdir/usr/lib/systemd/scripts/minecraft
}
