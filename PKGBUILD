pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=3.12
pkgrel=1
arch=('any')
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
source=(
    'minecraft-setup.bash'
    'minecraft@.container'
    'minecraft-configure.bash'
    'minecraft.image'
    'minecraft-downloads.volume'
    'minecraft-setup@.service'
)
sha256sums=('49446b0975a61229971c05447f3e9de2ec97da8658ec82060ef913c9642cdfd9'
            '985ba0805c1ad11302af6092da0c32d5657e7f225aa93b1b10b066eb41d4ccbb'
            '4cf34128c7b245e9e4d852f87483d8a0ebf1e1ea1ec81dc70f9594d8ada1bc98'
            '4c5aceffbedbfe99ae8221ddda5ad47a452d51a8070f4688639b6bf82e1d348e'
            '177ca9a91b33d54c943ead4d92e8adebba65f46ea4c0b51f7555a4533b681f2f'
            '80598d89c3decfaea199988807bc7062576b27bad5efcbea0c935905f8136505')

package() {
    for quadlet in minecraft{@.container,.image,-downloads.volume}; do
        install -D -m644 ${quadlet} $pkgdir/usr/share/containers/systemd/${quadlet}
    done
    install -D -m644 minecraft-setup@.service $pkgdir/usr/lib/systemd/system/minecraft-setup@.service
    install -D -m755 minecraft-setup.bash $pkgdir/usr/lib/systemd/scripts/minecraft
    install -D -m755 minecraft-configure.bash $pkgdir/usr/bin/mc-cfg
}
