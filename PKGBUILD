pkgname=mc-server
pkgdesc="Minecraft server service"
pkgver=4.0.0
pkgrel=2
arch=('x86_64') # Literally just change the arch in minecraft.image for another arch
url="https://github.com/p1x3l101-10/mc-server"
licence=('none')
depends=('podman')
source=(
    'minecraft.container'
    'minecraft.image'
    'minecraft-backup.container'
    'minecraft-backup.image'
    'minecraft.network'
    'minecraft.pod'
    'minecraft.target'
    'tmpfiles.conf'
    'sysuser.conf'
    'config.env'
    'config-system.env'
    'backup.env'
    'backup-system.env'
)
sha256sums=('4cfae21b037c8b8f44d1338eac8d167ec811dad770b59d6c9cd454bdfd87966e'
            'd6a1ccc371fa4952f4e9b5cdbfbddb771cbe5b5bf1336771841fec8898d175eb'
            '1916a4337354fa053381e58da71f372a6e018b7d9972fc0adc8fc8e19968053b'
            '87b07ff9224d0ce0abfeb3448b8af62470b0ecf251ac8ee0945ccd7d2ba1c40c'
            'c230c77f9c8e64cbcc94cc6cd2a23193b00071d596e05cad740466f984e34b0d'
            '7b36fdd255194af6fa244261250dc8d1d5b5ac0dad05e4e36c084b56a599037c'
            '6fcfcda2c0f6b3ca0042118fd4b3baf4fd4585abc3aa6132983b9c217e5b601d'
            '1319b36ee8736a9f610b8fb88f9a511e7002088c31b38624707f59faf003a9b7'
            '9647c78990576121420e2ce2e8539b62b8f63e6853c4302e20c7ed62de855f8e'
            'b0dde5c2e5ea28fce25bc4f2ca39d3d2a6213ee2ba7f09065b7fd47a87413248'
            '240241825c4656193eb44e90d8af9d392a60eebc1272d7b01b40d6723a1fcd3f'
            'f4602198e8dadb0383917a811e1cdb154ab1937f768b749b896b88a2907b402e'
            'b68cd159c75b5e49427233602ea65c7d9206cb48008e355dfe3fb626fe14689e')

package() {
    for quadlet in minecraft{.{container,image,pod,network},-backup.{container,image}}; do
        install -D -m644 $quadlet $pkgdir/usr/share/containers/systemd/$quadlet
    done
    for unit in minecraft.target; do # Should only run once, but I am a big fan of future-proofing
        install -D -m644 $unit $pkgdir/usr/lib/systemd/system/$unit
    done
    for config in config backup; do
        install -D -m644 $config.env $pkgdir/usr/share/factory/etc/minecraft/$config.env
        install -D -m644 $config-system.env $pkgdir/usr/lib/minecraft/$config.env
    done
    install -D -m644 tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/minecraft.conf
    install -D -m644 sysuser.conf $pkgdir/usr/lib/sysusers.d/minecraft.conf
}
