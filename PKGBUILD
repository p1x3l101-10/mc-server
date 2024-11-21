pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=4.0.8
pkgrel=1
arch=('x86_64') # Literally just change the arch in minecraft.image for another arch
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
_quadlets=(
    'minecraft.container'
    'minecraft.image'
    'minecraft-backup.container'
    'minecraft-backup.image'
    'minecraft.network'
    'minecraft.pod'
)
_units=(
    'minecraft.target'
)
source=(
    "${_quadlets[@]}"
    "${_units[@]}"
    'tmpfiles.conf'
    'sysuser.conf'
    'config.env'
    'config-system.env'
    'backup.env'
    'backup-system.env'
)
sha256sums=('62988ff28b0997f498fc182733d33db9ac2a8a3765ba7c7874dcf791684ca3c0'
            'd6a1ccc371fa4952f4e9b5cdbfbddb771cbe5b5bf1336771841fec8898d175eb'
            '1916a4337354fa053381e58da71f372a6e018b7d9972fc0adc8fc8e19968053b'
            'ef8b68996a225f3c5d2c0dbd2aa3c81bb0a26420086a75574b6ac8d119b750c2'
            'a46a6d99bc5978190160c4b4d3dec5ff10a24ae57cd3355ae25aa4f180735f0f'
            'dbcf51e1f763cf5c21542c9f686787546fdbcf5bc83148a78cb647dd7a4a7c29'
            '5e8b81bbee683724cb921177b4b4efac7fcdab4b8a3884de81d3ac82dc80a0b0'
            '1319b36ee8736a9f610b8fb88f9a511e7002088c31b38624707f59faf003a9b7'
            '36685e7b21cd891e42f0d2c5da27792f09f12c064b8c5f5da35cfa9b78c54101'
            'b0dde5c2e5ea28fce25bc4f2ca39d3d2a6213ee2ba7f09065b7fd47a87413248'
            '240241825c4656193eb44e90d8af9d392a60eebc1272d7b01b40d6723a1fcd3f'
            'f4602198e8dadb0383917a811e1cdb154ab1937f768b749b896b88a2907b402e'
            'b68cd159c75b5e49427233602ea65c7d9206cb48008e355dfe3fb626fe14689e')
options=("!purge") # I use .pod files, and purge removes them. Also there is nothing to purge here anyways

package() {
    for quadlet in "${_quadlets[@]}"; do
        install -D -m644 $quadlet $pkgdir/usr/share/containers/systemd/$quadlet
    done
    for unit in "${_units[@]}"; do
        install -D -m644 $unit $pkgdir/usr/lib/systemd/system/$unit
    done
    for config in config backup; do
        install -D -m644 $config.env $pkgdir/usr/share/factory/etc/minecraft/$config.env
        install -D -m644 $config-system.env $pkgdir/usr/lib/minecraft/$config.env
    done
    install -D -m644 tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/minecraft.conf
    install -D -m644 sysuser.conf $pkgdir/usr/lib/sysusers.d/minecraft.conf
}
