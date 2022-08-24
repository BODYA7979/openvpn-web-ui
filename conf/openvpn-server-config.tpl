management {{ .Management }}

port {{ .Port }}
proto {{ .Proto }}

dev tun

ca {{ .Ca }}
cert {{ .Cert }}
key {{ .Key }}
crl-verify keys/crl.pem

cipher {{ .Cipher }}
keysize {{ .Keysize }}
auth {{ .Auth }}
dh {{ .Dh }}

server {{ .Server }}
ifconfig-pool-persist {{ .IfconfigPoolPersist }}
push "route {{ .Server }}"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"

keepalive {{ .Keepalive }}

comp-lzo
max-clients {{ .MaxClients }}

persist-key
persist-tun

log         openvpn.log
verb 3

mute 10

client-to-client
topology subnet
push "route 192.168.1.0 255.255.255.0"