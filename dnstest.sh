#!/usr/bin/env bash

# Check for required commands
for cmd in bc dig; do
    command -v "$cmd" > /dev/null || { printf "error: %s was not found. Please install %s.\n" "$cmd" "$cmd"; exit 1; }
done

# Get nameservers from /etc/resolv.conf
NAMESERVERS=$(grep "^nameserver" /etc/resolv.conf | cut -d " " -f 2 | sed 's/\(.*\)/&#&/')

# Define providers for IPv4 and IPv6
PROVIDERSV4="
103.87.68.23#BebasDNS-Malware
1.1.1.1#cloudflare
1.1.1.2#cloudflareMalware
8.8.8.8#google
9.9.9.9#quad9
208.67.222.222#opendns
176.103.130.132#adguard
4.2.2.1#level3-1
209.244.0.3#level3-2
80.80.80.80#freenom
84.200.69.80#DNS.Watch
199.85.126.20#norton
185.228.168.168#cleanbrowsing
77.88.8.7#yandex
156.154.70.3#neustar
8.26.56.26#comodo
45.90.28.202#nextdns
64.6.64.6#Verisign
223.5.5.5#alidns
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
2001:df1:7340:c::beba:51d#BebasDNS-Malware
2606:4700:4700::1111#cloudflare-v6
2606:4700:4700::1112#cloudflareMalware-v6
2001:4860:4860::8888#google-v6
2620:fe::fe#quad9-v6
2620:119:35::35#opendns-v6
2a0d:2a00:1::1#cleanbrowsing-v6
2a02:6b8::feed:0ff#yandex-v6
2a00:5a60::ad1:0ff#adguard-v6
2610:a1:1018::3#neustar-v6
2620:119:53::53#comodo-v6
2606:1a40::#ControlD-v6
2400:8901::f03c:93ff:fe25:a89b#OpenNIC-v6
2001:470:20::2#HE.NET-v6
2620:74:1b::1:1#Verisign-v6
"

# Test for IPv6 support by querying alsyundawy.my.id with cloudflare-v6 nameserver and checking for expected IPs in the output 
if dig +short +tries=1 +time=2 +stats @2606:4700:4700::1111 alsyundawy.my.id | grep -q '172\.67\.134\.149\|104\.21\.6\.70'; then 
    hasipv6="true"
fi

case "$1" in 
    ipv4) providerstotest=$PROVIDERSV4;;
    ipv6) 
        if [[ -z "$hasipv6" ]]; then 
            printf "error: IPv6 support not found.\n"
            exit 1;
        fi 
        providerstotest=$PROVIDERSV6;;
    all) 
        if [[ -z "$hasipv6" ]]; then 
            providerstotest=$PROVIDERSV4;
        else 
            providerstotest="$PROVIDERSV4 $PROVIDERSV6"
        fi;;
    *) providerstotest=$PROVIDERSV4;;
esac

    

# Domains to test (duplicates are ok)
DOMAINS2TEST="google.com telegram.org facebook.com youtube.com instagram.com wikipedia.org twitter.com www.tokopedia.com whatsapp.com tiktok.com"

totaldomains=0

printf "%-21s" ""
for d in $DOMAINS2TEST; do 
    (( totaldomains++ ))
    printf "%-8s" "test$totaldomains"
done

printf "%-8s\n" "Average"

for p in $NAMESERVERS $providerstotest; do 
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0

    printf "%-21s" "$pname"
    for d in $DOMAINS2TEST; do 
        ttime=$(dig +tries=1 +time=2 +stats @$pip $d | grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2)
        [[ -z "$ttime" ]] && ttime=1000 # timeout is 1000 ms
        [[ "$ttime" == 0 ]] && ttime=1 # minimum time is 1 ms

        printf "%-8s" "$ttime ms"
        (( ftime += ttime ))
    done
    avg=$(bc -l <<< "scale=2; $ftime/$totaldomains")

    printf "  %s\n" "$avg"
done

exit 0;
