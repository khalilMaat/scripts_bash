#!/bin/bash
DISK_NAME=nvme0n2

#
echo "=======phase 1 create partion======"
fdisk /dev/${DISK_NAME} <<EOF
n
p
1


w
EOF


echo "=======list disk======"
lsblk

echo "=======phase 2 make file system======"
mkfs.xfs -f /dev/${DISK_NAME}p1

echo "=======phase 3 get UUID======"
UUID=$(blkid /dev/${DISK_NAME}p1 | cut -d " " -f 2)
echo $UUID

echo "=======phase 4 modify fstab=========="
cat <<EOF >> /etc/fstab
${UUID} /path  xfs   defaults 0 0
EOF

echo "=========phase 5 mount disk====="
systemctl daemon-reload
mount -a

echo "=======Done!======="

