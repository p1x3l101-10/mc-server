pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=2
pkgrel=2
arch=('any')
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('dash' 'podman')
source=('run.sh' 'minecraft@.service')
sha256sums=('SKIP' 'SKIP')

package() {
    install -D -m755 run.sh "$pkgdir/usr/share/mc-server/run.sh"
    install -D -m644 minecraft@.service "$pkgdir/usr/lib/systemd/system/minecraft@.service"
}
