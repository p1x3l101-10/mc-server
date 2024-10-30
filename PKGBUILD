pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=3
pkgrel=8
arch=('any')
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
source=(
    'minecraft-setup.bash'
    'minecraft@.container'
    'minecraft@.image'
    'minecraft@.volume'
    'vanilla.override'
    'minecraft-configure.bash'
)
options=("!purge") # Conflicts with .pod
# Automatically generated with `makepkg -g`
sha256sums=('a16e0929e13f9675e376d532aa0cc06109a4186c197ad65dd092703cbbf9dd62'
            'a5facae687227987c89ded70fb9c6a65b97172b3d4fca59834c346b30e8a2f31'
            'c13ef7b89ff67ef667ec820419062f4581a561a5a62ca865b02cbc8fb1b09cc1'
            '62057be75e3ec3922b04afbcb589c28a3e2cb1285288a72d86a23d6ac261bfd6'
            'e41705acf49e214fa1278d06010c0f23ebc03ce40e63cda482669b365727c29f'
            '4cf34128c7b245e9e4d852f87483d8a0ebf1e1ea1ec81dc70f9594d8ada1bc98')

package() {
    for quadlet in container image volume; do
        install -D -m644 minecraft@.$quadlet $pkgdir/usr/share/containers/systemd/minecraft@.$quadlet
    done
    for override in vanilla; do
        install -D -m644 $override.override $pkgdir/usr/share/containers/systemd/minecraft@$override.d/override.conf
    done
	install -D -m755 minecraft-setup.bash $pkgdir/usr/lib/systemd/scripts/minecraft
	install -D -m755 minecraft-configure.bash $pkgdir/usr/bin/mc-cfg
}
