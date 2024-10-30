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
            'f0b78ef724a9b65c65caef4528c90cc7b711018e6c8e2cd88a5cef5f8087e525'
            '004bf8042658e49283d9fa8c1b26db8e1492c2329df2c76876a12d49c589b800'
            '2df9ef8482643dc82352a6d07b7f7739c68367dd5cd24506197af0477d76ae05'
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
