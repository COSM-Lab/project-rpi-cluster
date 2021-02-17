cat << 'EOF' >> "${ROOTFS_DIR}/etc/dhcpcd.conf"

interface eth0
nodhcp
static ip_address=100.100.100.99/24
static routers=192.168.88.1
static domain_name_servers=192.168.88.1 8.8.8.8
EOF
