#!/bin/bash
sed -i 's#Source:.*$#Source: qubes-'"$(./vars.sh name)"'#' debian/control
sed -i 's#Homepage:.*$#Homepage: '"$(git remote get-url origin)"'#' debian/control
sed -i 's#Package:.*$#Package: qubes-'"$(./vars.sh name)"'#' debian/control
sed -i 's#Description:.*$#Description: '"$(./vars.sh summary)"'#' debian/control

sed -i 's#usr/lib64/qubes/.*-client#usr/lib64/qubes/'"$(./vars.sh name)"'-client#' debian/qubes.install
sed -i 's#usr/lib64/qubes/.*-server#usr/lib64/qubes/'"$(./vars.sh name)"'-server#' debian/qubes.install
sed -i 's#usr/share/man/man1/qvm-.*\.1\.gz#usr/share/man/man1/qvm-'"$(./vars.sh name)"'.1.gz#' debian/qubes.install
sed -i 's#usr/bin/qvm-.*#usr/bin/qvm-'"$(./vars.sh name)"'#' debian/qubes.install
sed -i 's#etc/qubes-rpc/qubes\..*#etc/qubes-rpc/qubes.'"$(./vars.sh camelname)"'#' debian/qubes.install
#rm debian/changelog
#gbp dch
