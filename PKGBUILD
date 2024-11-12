pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=3
pkgrel=10
arch=('any')
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
source=(
    'minecraft-setup.bash'
    'minecraft@.container'
    'minecraft-configure.bash'
    'minecraft.image'
)
sha256sums=('e3c65ef4f277f848146ad93b79153ae69e29f934695f41477c54ecd238d423a5'
            'da19de2275916d97136fb7a0ad7774a389488c985b36c942a2ae0c170d9a4022'
            '4cf34128c7b245e9e4d852f87483d8a0ebf1e1ea1ec81dc70f9594d8ada1bc98'
            '0342a35e0e75d8ee8541aeb28e11c02d58856d0969b2067e4775a7fff8c98da0')

package() {
    for quadlet in minecraft{@.container,.image}; do
        install -D -m644 ${quadlet} $pkgdir/usr/share/containers/systemd/${quadlet}
    done
    install -D -m755 minecraft-setup.bash $pkgdir/usr/lib/systemd/scripts/minecraft
    install -D -m755 minecraft-configure.bash $pkgdir/usr/bin/mc-cfg
}
