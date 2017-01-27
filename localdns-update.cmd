@ECHO OFF
wget -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.bogus-nxdomain.China.conf --directory-prefix="E:\Program Files\unbound"
wget -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.forward-zone.China.conf --directory-prefix="E:\Program Files\unbound"
wget -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.local-zone.hosts.conf --directory-prefix="E:\Program Files\unbound"
wget -N ftp://ftp.internic.net/domain/named.cache --directory-prefix="E:\Program Files\unbound"

wget -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/dnscrypt-proxy/dnscrypt-blacklist-domains.txt --directory-prefix="E:\Program Files\DNSCrypt"
wget -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/dnscrypt-proxy/dnscrypt-blacklist-ips.txt --directory-prefix="E:\Program Files\DNSCrypt"

REM STOP DNSCrypt
taskkill /IM dnscrypt-proxy.exe /F

REM STOP Unbound
taskkill /IM unbound.exe /F

ipconfig /flushdns

REM START DNSCrypt
nircmd exec2 hide "E:\Program Files\DNSCrypt\" "E:\Program Files\DNSCrypt\dnscrypt-proxy.exe" dnscrypt-proxy-cisco.conf

REM START Unbound
nircmd exec2 hide "E:\Program Files\unbound\" "E:\Program Files\unbound\unbound.exe" -c unbound.conf
