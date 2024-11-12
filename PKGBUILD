pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=3
pkgrel=11
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
sha256sums=('11467262ae4d8226d66b696dc08fb1701cedb8c10906da84ed3c1f4d145f21fe'
            'da19de2275916d97136fb7a0ad7774a389488c985b36c942a2ae0c170d9a4022'
            '4cf34128c7b245e9e4d852f87483d8a0ebf1e1ea1ec81dc70f9594d8ada1bc98'
            '4c5aceffbedbfe99ae8221ddda5ad47a452d51a8070f4688639b6bf82e1d348e')

package() {
    for quadlet in minecraft{@.container,.image}; do
        install -D -m644 ${quadlet} $pkgdir/usr/share/containers/systemd/${quadlet}
    done
    install -D -m755 minecraft-setup.bash $pkgdir/usr/lib/systemd/scripts/minecraft
    install -D -m755 minecraft-configure.bash $pkgdir/usr/bin/mc-cfg
}
