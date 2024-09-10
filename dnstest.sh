#!/usr/bin/env bash

# Check for required commands
command -v bc > /dev/null || { echo "error: bc not found. Please install bc."; exit 1; }
command -v drill > /dev/null && dig="drill" || { command -v dig > /dev/null && dig="dig" || { echo "error: dig not found. Please install dnsutils."; exit 1; } }

# Extract nameservers from /etc/resolv.conf
NAMESERVERS=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf)

# Define DNS providers
PROVIDERSV4="
42.247.23.161#DNS-BERSAMA
223.5.5.5#AliDNS
103.87.68.23#BebasDNS-Malware
1.1.1.1#Cloudflare
1.1.1.2#CloudflareMalware
8.8.8.8#Google
9.9.9.9#Quad9
208.67.222.222#OpenDNS
176.103.130.132#Adguard
4.2.2.1#Level3-1
209.244.0.3#Level3-2
80.80.80.80#Freenom
84.200.69.80#DNS.Watch
199.85.126.20#Norton
185.228.168.168#CleanBrowsing
77.88.8.7#Yandex
156.154.70.3#Neustar
8.26.56.26#Comodo
45.90.28.202#NextDNS
64.6.64.6#Verisign
195.46.39.39#SafeDNS
216.146.35.35#DynDNS
117.50.11.11#OneDNS
180.76.76.76#Baidu
74.82.42.42#HE.NET
194.187.251.67#CyberGhost
198.54.117.10#SafeServe
76.76.2.0#ControlD
172.104.162.222#OpenNIC
"

PROVIDERSV6="
2402:1200:155:23:43:247:23:161#DNS-BERSAMA-v6
2400:3200::1#AliDNS-v6
2606:4700:4700::1111#Cloudflare-v6
2606:4700:4700::1112#CloudflareMalware-v6
2001:4860:4860::8888#Google-v6
2620:fe::fe#Quad9-v6
2620:119:35::35#OpenDNS-v6
2a0d:2a00:1::1#CleanBrowsing-v6
2a02:6b8::feed:0ff#Yandex-v6
2a00:5a60::ad1:0ff#Adguard-v6
2610:a1:1018::3#Neustar-v6
2620:119:53::53#Comodo-v6
2606:1a40::#ControlD-v6
2400:8901::f03c:93ff:fe25:a89b#OpenNIC-v6
2001:470:20::2#HE.NET-v6
2620:74:1b::1:1#Verisign-v6
2001:df1:7340:c::beba:51d#BebasDNS-Malware-v6
"

# Test for IPv6 support
if $dig +short -6 @2606:4700:4700::1111 cloudflare.com > /dev/null; then 
    hasipv6=true
else
    hasipv6=false
fi

# Determine providers to test
providerstotest=$PROVIDERSV4
case "$1" in
    ipv6)
        [ -z "$hasipv6" ] && { echo "error: IPv6 support not found."; exit 1; }
        providerstotest=$PROVIDERSV6
        ;;
    all)
        [ -n "$hasipv6" ] && providerstotest="$PROVIDERSV4 $PROVIDERSV6"
        ;;
esac

# Domains to test
DOMAINS2TEST="google.com amazon.com facebook.com www.youtube.com www.reddit.com wikipedia.org twitter.com www.tokopedia.com whatsapp.com tiktok.com"

# Display header
totaldomains=$(wc -w <<< "$DOMAINS2TEST")
printf "%-21s" ""
for i in $(seq 1 $totaldomains); do printf "%-8s" "test$i"; done
printf "%-8s\n" "Average"

# Perform tests
for p in $NAMESERVERS $providerstotest; do
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0
    printf "%-21s" "$pname"
    
    for d in $DOMAINS2TEST; do
        ttime=$($dig +tries=1 +time=2 +stats @$pip $d | awk '/Query time:/ {print $4}')
        ttime=${ttime:-1000}
        printf "%-8s" "${ttime}ms"
        ftime=$((ftime + ttime))
    done
    
    avg=$(bc <<< "scale=2; $ftime/$totaldomains")
    printf "%-8s\n" "$avg"
done

exit 0
