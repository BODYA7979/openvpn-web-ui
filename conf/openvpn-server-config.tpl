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
push "dhcp-option DNS {{ .DNSServerOne }}"
push "dhcp-option DNS {{ .DNSServerTwo }}"

keepalive {{ .Keepalive }}

comp-lzo
max-clients {{ .MaxClients }}

persist-key
persist-tun

log         openvpn.log
verb 3

mute 10

{{ .ExtraServerOptions }}