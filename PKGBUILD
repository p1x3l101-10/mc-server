pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=3.13
pkgrel=1
arch=('any')
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
source=(
    'minecraft-cleanup.bash'
    'minecraft-setup.bash'
    'minecraft@.container'
    'minecraft-configure.bash'
    'minecraft.image'
    'minecraft-setup@.service'
)
sha256sums=('3e4d96d5d763deef3f6d759a786b76e8339c06cd78d3f36272d027e0e945690e'
            '1c3720bf983607005f73ffb182dbc912c406686f2ebb73ea32968446a272a92f'
            '914494a4c5946057214aaea72d9716b2b2deeb1273b93bee3ba1986698527c10'
            '4cf34128c7b245e9e4d852f87483d8a0ebf1e1ea1ec81dc70f9594d8ada1bc98'
            '4c5aceffbedbfe99ae8221ddda5ad47a452d51a8070f4688639b6bf82e1d348e'
            '80598d89c3decfaea199988807bc7062576b27bad5efcbea0c935905f8136505')

package() {
    for quadlet in minecraft{@.container,.image}; do
        install -D -m644 ${quadlet} $pkgdir/usr/share/containers/systemd/${quadlet}
    done
    install -D -m644 minecraft-setup@.service $pkgdir/usr/lib/systemd/system/minecraft-setup@.service
    install -D -m755 minecraft-setup.bash $pkgdir/usr/lib/systemd/scripts/minecraft
    install -D -m755 minecraft-configure.bash $pkgdir/usr/bin/mc-cfg
    install -D -m755 minecraft-cleanup.bash $pkgdir/usr/bin/mc-rm
}
