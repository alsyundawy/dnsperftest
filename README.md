# DNS Performance Test

[![Latest Version](https://img.shields.io/github/v/release/alsyundawy/dnsperftest)](https://github.com/alsyundawy/dnsperftest/releases)
[![Maintenance Status](https://img.shields.io/maintenance/yes/9999)](https://github.com/alsyundawy/dnsperftest/)
[![License](https://img.shields.io/github/license/alsyundawy/dnsperftest)](https://github.com/alsyundawy/dnsperftest/blob/master/LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/alsyundawy/dnsperftest)](https://github.com/alsyundawy/dnsperftest/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/alsyundawy/dnsperftest)](https://github.com/alsyundawy/dnsperftest/pulls)
[![Donate with PayPal](https://img.shields.io/badge/PayPal-donate-orange)](https://www.paypal.me/alsyundawy)
[![Sponsor with GitHub](https://img.shields.io/badge/GitHub-sponsor-orange)](https://github.com/sponsors/alsyundawy)
[![GitHub Stars](https://img.shields.io/github/stars/alsyundawy/dnsperftest?style=social)](https://github.com/alsyundawy/dnsperftest/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/alsyundawy/dnsperftest?style=social)](https://github.com/alsyundawy/dnsperftest/network/members)
[![GitHub Contributors](https://img.shields.io/github/contributors/alsyundawy/dnsperftest?style=social)](https://github.com/alsyundawy/dnsperftest/graphs/contributors)

**If you find this project helpful and would like to support it, please consider donating via https://www.paypal.me/alsyundawy. Thank you for your support!**

**Jika Anda merasa terbantu dan ingin mendukung proyek ini, pertimbangkan untuk berdonasi melalui https://www.paypal.me/alsyundawy. Terima kasih atas dukungannya!**



Skrip Shell untuk menguji kinerja penyelesai DNS paling populer dari lokasi Anda.

Termasuk secara default :
 * Internal DNS Server (/etc/resolv)
 * BebasDNS 103.87.68.2
 * CloudFlare 1.1.1.1
 * CloudFlareMalware 1.1.1.2
 * Level3 4.2.2.1
 * Level3 209.244.0.3
 * Google 8.8.8.8
 * Quad9 9.9.9.9
 * Freenom 80.80.80.80
 * OpenDNS 208.67.222.123
 * Norton 199.85.126.20
 * CleanBrowsing 185.228.168.168
 * Yandex 77.88.8.7
 * AdGuard 176.103.130.132
 * Neustar 156.154.70.3
 * Comodo 8.26.56.26
 * NextDNS 45.90.28.202
 * Verisign 64.6.64.6
 * alidns 223.5.5.5
 * SafeDNS 195.46.39.39
 * DynDNS 216.146.35.35
 * OneDNS 117.50.11.11
 * Baidu 180.76.76.76
 * HE.NET 74.82.42.42
 * DNS.Watch 84.200.69.80
 * CyberGhost 194.187.251.67
 * SafeServe 198.54.117.10
 * ControlD 76.76.2.0
 * OpenNIC 172.104.162.222


 # List Domain Test
 * google.com
 * telegram.org
 * facebook.com
 * youtube.com
 * instagram.com
 * wikipedia.org
 * twitter.com
 * tokopedia.com
 * whatsapp.com
 * tiktok.com

# Required 

Anda perlu menginstal bc dan dig.

Untuk Berbasis Ubuntu/Debian :

```
 $ sudo apt-get install bc dnsutils
```

Untuk Berbasis RedHat / RPM :

```
 $ sudo yum install bc dnsutils
OR
 $ sudo dnf install bc dnsutils
```

Untuk macOS menggunakan homebrew :

```
 $ brew install bc bind
```

# Pemanfaatan

``` 
 $ git clone --depth=1 https://github.com/alsyundawy/dnsperftest/
 $ cd dnsperftest
 $ bash ./dnstest.sh 
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
127.0.0.1            1 ms    4 ms    4 ms    4 ms    1 ms    8 ms    4 ms    24 ms   20 ms   28 ms     9.80
::1                  1 ms    4 ms    1 ms    1 ms    4 ms    8 ms    4 ms    4 ms    1 ms    4 ms      3.20
AliDNS               4 ms    4 ms    4 ms    4 ms    8 ms    1 ms    4 ms    12 ms   4 ms    1 ms      4.60
BebasDNS-Malware     4 ms    8 ms    4 ms    8 ms    8 ms    4 ms    8 ms    216 ms  12 ms   52 ms     32.40
Cloudflare           16 ms   16 ms   20 ms   12 ms   16 ms   20 ms   16 ms   24 ms   20 ms   12 ms     17.20
CloudflareMalware    16 ms   20 ms   16 ms   20 ms   16 ms   16 ms   20 ms   24 ms   16 ms   20 ms     18.40
Google               16 ms   12 ms   24 ms   16 ms   20 ms   16 ms   16 ms   20 ms   28 ms   20 ms     18.80
Quad9                16 ms   20 ms   44 ms   12 ms   52 ms   20 ms   16 ms   56 ms   20 ms   16 ms     27.20
OpenDNS              16 ms   20 ms   12 ms   60 ms   16 ms   216 ms  16 ms   20 ms   16 ms   24 ms     41.60
Adguard              276 ms  240 ms  240 ms  256 ms  236 ms  240 ms  260 ms  400 ms  256 ms  264 ms    266.80
Level3-1             1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 12 ms   16 ms   1000 ms 16 ms   16 ms     606.00
Level3-2             1000 ms 16 ms   16 ms   20 ms   1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms   705.20
Freenom              16 ms   24 ms   52 ms   16 ms   92 ms   12 ms   24 ms   208 ms  92 ms   164 ms    70.00
DNS.Watch            184 ms  1000 ms 176 ms  1000 ms 1000 ms 168 ms  192 ms  1000 ms 200 ms  172 ms    509.20
Norton               44 ms   44 ms   48 ms   44 ms   52 ms   48 ms   48 ms   336 ms  44 ms   40 ms     74.80
CleanBrowsing        20 ms   16 ms   32 ms   20 ms   32 ms   56 ms   40 ms   28 ms   16 ms   24 ms     28.40
Yandex               204 ms  220 ms  200 ms  212 ms  220 ms  204 ms  204 ms  440 ms  220 ms  236 ms    236.00
Meustar              48 ms   44 ms   44 ms   56 ms   44 ms   52 ms   48 ms   256 ms  48 ms   48 ms     68.80
Comodo               16 ms   20 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms     16.40
NextDNS              20 ms   16 ms   20 ms   20 ms   24 ms   20 ms   28 ms   20 ms   20 ms   92 ms     28.00
Verisign             52 ms   44 ms   44 ms   48 ms   44 ms   44 ms   48 ms   48 ms   264 ms  56 ms     69.20
SafeDNS              20 ms   16 ms   20 ms   16 ms   20 ms   16 ms   16 ms   24 ms   28 ms   20 ms     19.60
DynDNS               184 ms  248 ms  200 ms  180 ms  180 ms  180 ms  192 ms  268 ms  180 ms  212 ms    202.40
OneDNS               404 ms  396 ms  400 ms  376 ms  380 ms  396 ms  1000 ms 576 ms  340 ms  340 ms    460.80
Baidu                88 ms   88 ms   120 ms  44 ms   44 ms   92 ms   44 ms   188 ms  116 ms  128 ms    95.20
HE.NET               52 ms   48 ms   56 ms   36 ms   40 ms   48 ms   52 ms   96 ms   220 ms  60 ms     70.80
CyberGhost           188 ms  180 ms  200 ms  180 ms  1000 ms 1000 ms 252 ms  236 ms  188 ms  184 ms    360.80
SafeServe            192 ms  188 ms  264 ms  216 ms  196 ms  192 ms  192 ms  204 ms  232 ms  212 ms    208.80
ControlD             40 ms   20 ms   24 ms   16 ms   20 ms   20 ms   16 ms   20 ms   16 ms   16 ms     20.80
OpenNIC              20 ms   12 ms   16 ms   12 ms   12 ms   20 ms   16 ms   20 ms   52 ms   20 ms     20.00

```

Untuk mengurutkan dengan yang tercepat terlebih dahulu, tambahkan `sort -k 22 -n` di akhir perintah :

```
  $ bash ./dnstest.sh | sort -k 22 -n
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
::1                  1 ms    4 ms    1 ms    1 ms    1 ms    4 ms    1 ms    1 ms    8 ms    1 ms      2.30
AliDNS               1 ms    8 ms    8 ms    4 ms    1 ms    1 ms    8 ms    1 ms    12 ms   1 ms      4.50
127.0.0.1            4 ms    4 ms    4 ms    4 ms    4 ms    1 ms    1 ms    20 ms   12 ms   20 ms     7.40
Quad9                16 ms   16 ms   20 ms   20 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms     16.80
Cloudflare           20 ms   16 ms   12 ms   16 ms   16 ms   24 ms   20 ms   16 ms   16 ms   16 ms     17.20
CloudflareMalware    16 ms   16 ms   20 ms   16 ms   16 ms   24 ms   16 ms   20 ms   20 ms   12 ms     17.60
ControlD             12 ms   16 ms   20 ms   28 ms   16 ms   16 ms   20 ms   16 ms   12 ms   20 ms     17.60
OpenNIC              12 ms   16 ms   24 ms   20 ms   24 ms   12 ms   16 ms   20 ms   12 ms   20 ms     17.60
BebasDNS-Malware     1 ms    4 ms    4 ms    20 ms   4 ms    4 ms    8 ms    1 ms    16 ms   184 ms    24.60
Comodo               16 ms   16 ms   16 ms   24 ms   20 ms   20 ms   12 ms   16 ms   152 ms  20 ms     31.20
Google               16 ms   16 ms   20 ms   16 ms   16 ms   208 ms  20 ms   24 ms   20 ms   20 ms     37.60
CleanBrowsing        16 ms   28 ms   16 ms   16 ms   180 ms  12 ms   24 ms   56 ms   36 ms   20 ms     40.40
SafeDNS              16 ms   16 ms   16 ms   24 ms   16 ms   16 ms   20 ms   68 ms   16 ms   236 ms    44.40
Norton               52 ms   48 ms   44 ms   44 ms   48 ms   44 ms   44 ms   48 ms   48 ms   112 ms    53.20
OpenDNS              12 ms   20 ms   56 ms   64 ms   32 ms   204 ms  16 ms   84 ms   12 ms   56 ms     55.60
Meustar              48 ms   56 ms   44 ms   52 ms   84 ms   48 ms   48 ms   52 ms   48 ms   104 ms    58.40
Freenom              16 ms   16 ms   20 ms   16 ms   20 ms   20 ms   28 ms   388 ms  92 ms   88 ms     70.40
HE.NET               44 ms   36 ms   32 ms   36 ms   32 ms   48 ms   52 ms   248 ms  56 ms   148 ms    73.20
Baidu                84 ms   116 ms  96 ms   116 ms  112 ms  92 ms   84 ms   156 ms  120 ms  108 ms    108.40
NextDNS              16 ms   20 ms   20 ms   20 ms   20 ms   20 ms   1000 ms 20 ms   20 ms   84 ms     124.00
Level3-2             20 ms   20 ms   36 ms   20 ms   1000 ms 136 ms  12 ms   20 ms   16 ms   132 ms    141.20
Verisign             44 ms   40 ms   44 ms   52 ms   264 ms  1000 ms 52 ms   44 ms   48 ms   52 ms     164.00
DynDNS               180 ms  180 ms  180 ms  180 ms  192 ms  180 ms  180 ms  192 ms  244 ms  220 ms    192.80
Yandex               204 ms  216 ms  204 ms  216 ms  204 ms  220 ms  204 ms  324 ms  208 ms  272 ms    227.20
SafeServe            200 ms  192 ms  260 ms  192 ms  188 ms  228 ms  192 ms  348 ms  200 ms  308 ms    230.80
Adguard              240 ms  244 ms  240 ms  248 ms  256 ms  244 ms  240 ms  420 ms  244 ms  260 ms    263.60
CyberGhost           1000 ms 176 ms  180 ms  196 ms  204 ms  172 ms  196 ms  252 ms  208 ms  260 ms    284.40
OneDNS               1000 ms 348 ms  332 ms  328 ms  332 ms  332 ms  332 ms  1000 ms 340 ms  344 ms    468.80
DNS.Watch            168 ms  1000 ms 188 ms  188 ms  172 ms  1000 ms 1000 ms 244 ms  1000 ms 192 ms    515.20
Level3-1             1000 ms 1000 ms 12 ms   12 ms   24 ms   1000 ms 12 ms   1000 ms 1000 ms 1000 ms   606.00


```

Untuk menguji menggunakan alamat IPv6, tambahkan opsi "IPv6" :

```
  $ bash ./dnstest.sh ipv6 | sort -k 22 -n
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
::1                  1 ms    4 ms    1 ms    4 ms    4 ms    4 ms    4 ms    1 ms    1 ms    4 ms      2.80
127.0.0.1            4 ms    4 ms    1 ms    1 ms    4 ms    1 ms    1 ms    16 ms   16 ms   16 ms     6.40
Cloudflare-v6        12 ms   24 ms   16 ms   16 ms   16 ms   16 ms   12 ms   20 ms   12 ms   16 ms     16.00
CloudflareMalware-v6 20 ms   16 ms   20 ms   16 ms   16 ms   16 ms   20 ms   20 ms   20 ms   20 ms     18.40
Quad9-v6             20 ms   16 ms   52 ms   20 ms   16 ms   16 ms   20 ms   20 ms   12 ms   16 ms     20.80
CleanBrowsing-v6     12 ms   16 ms   24 ms   16 ms   56 ms   12 ms   16 ms   20 ms   12 ms   28 ms     21.20
ControlD-v6          20 ms   28 ms   24 ms   20 ms   36 ms   20 ms   16 ms   20 ms   16 ms   16 ms     21.60
Opendns-v6           60 ms   20 ms   52 ms   20 ms   16 ms   16 ms   16 ms   20 ms   16 ms   28 ms     26.40
HE.NET-v6            16 ms   20 ms   28 ms   12 ms   20 ms   32 ms   20 ms   68 ms   16 ms   40 ms     27.20
Comodo-v6            20 ms   16 ms   56 ms   16 ms   12 ms   24 ms   16 ms   84 ms   16 ms   16 ms     27.60
OpenNIC-v6           16 ms   12 ms   20 ms   16 ms   16 ms   216 ms  16 ms   28 ms   20 ms   24 ms     38.40
Google-v6            16 ms   16 ms   28 ms   24 ms   16 ms   248 ms  28 ms   48 ms   28 ms   28 ms     48.00
Neustar-v6           48 ms   48 ms   48 ms   52 ms   88 ms   48 ms   52 ms   48 ms   56 ms   56 ms     54.40
Verisign-v6          52 ms   104 ms  48 ms   56 ms   44 ms   48 ms   48 ms   312 ms  44 ms   52 ms     80.80
AliDNS-v6            212 ms  92 ms   76 ms   80 ms   80 ms   92 ms   84 ms   1088 ms 80 ms   80 ms     196.40
Yandex-v6            220 ms  200 ms  196 ms  208 ms  220 ms  204 ms  220 ms  272 ms  204 ms  204 ms    214.80
Adguard-v6           284 ms  276 ms  256 ms  276 ms  256 ms  240 ms  240 ms  404 ms  240 ms  252 ms    272.40
BebasDNS-Malware-v6  1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms   1000.00
```

Untuk menguji IPv6 dan IPv4, tambahkan opsi "all" :

```
  $ bash ./dnstest.sh all | sort -k 22 -n
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
::1                  1 ms    1 ms    4 ms    1 ms    8 ms    8 ms    1 ms    1 ms    1 ms    8 ms      3.40
AliDNS               4 ms    4 ms    8 ms    4 ms    4 ms    4 ms    8 ms    4 ms    8 ms    8 ms      5.60
ControlD             20 ms   16 ms   16 ms   16 ms   20 ms   12 ms   16 ms   12 ms   16 ms   16 ms     16.00
CleanBrowsing-v6     12 ms   20 ms   12 ms   16 ms   12 ms   24 ms   20 ms   20 ms   16 ms   12 ms     16.40
OpenNIC-v6           16 ms   16 ms   16 ms   16 ms   20 ms   16 ms   16 ms   16 ms   20 ms   12 ms     16.40
127.0.0.1            16 ms   4 ms    20 ms   12 ms   20 ms   8 ms    1 ms    60 ms   16 ms   20 ms     17.70
Comodo               16 ms   20 ms   16 ms   16 ms   20 ms   20 ms   16 ms   16 ms   16 ms   24 ms     18.00
Quad9-v6             16 ms   20 ms   12 ms   16 ms   20 ms   24 ms   16 ms   24 ms   16 ms   16 ms     18.00
ControlD-v6          20 ms   16 ms   24 ms   16 ms   28 ms   20 ms   12 ms   16 ms   20 ms   12 ms     18.40
CloudflareMalware    12 ms   20 ms   16 ms   16 ms   24 ms   24 ms   20 ms   20 ms   20 ms   16 ms     18.80
CloudflareMalware-v6 20 ms   20 ms   20 ms   24 ms   12 ms   20 ms   20 ms   20 ms   16 ms   16 ms     18.80
Cloudflare-v6        12 ms   16 ms   20 ms   20 ms   12 ms   20 ms   24 ms   20 ms   20 ms   24 ms     18.80
Cloudflare           24 ms   20 ms   16 ms   20 ms   16 ms   16 ms   12 ms   20 ms   20 ms   28 ms     19.20
HE.NET-v6            24 ms   16 ms   24 ms   20 ms   24 ms   12 ms   12 ms   24 ms   20 ms   16 ms     19.20
SafeDNS              20 ms   16 ms   20 ms   24 ms   20 ms   16 ms   16 ms   20 ms   24 ms   20 ms     19.60
BebasDNS-Malware     1 ms    4 ms    16 ms   8 ms    48 ms   4 ms    4 ms    8 ms    52 ms   52 ms     19.70
OpenNIC              16 ms   12 ms   16 ms   20 ms   16 ms   12 ms   20 ms   52 ms   16 ms   24 ms     20.40
NextDNS              16 ms   20 ms   24 ms   20 ms   20 ms   24 ms   28 ms   20 ms   20 ms   24 ms     21.60
Opendns-v6           56 ms   20 ms   16 ms   20 ms   56 ms   20 ms   20 ms   24 ms   20 ms   24 ms     27.60
Comodo-v6            20 ms   16 ms   56 ms   56 ms   16 ms   12 ms   12 ms   16 ms   16 ms   92 ms     31.20
OpenDNS              12 ms   16 ms   16 ms   12 ms   16 ms   212 ms  12 ms   20 ms   20 ms   20 ms     35.60
CleanBrowsing        16 ms   20 ms   16 ms   12 ms   44 ms   16 ms   24 ms   160 ms  20 ms   40 ms     36.80
Google-v6            20 ms   20 ms   24 ms   20 ms   20 ms   212 ms  16 ms   28 ms   20 ms   24 ms     40.40
Quad9                20 ms   24 ms   76 ms   16 ms   192 ms  24 ms   16 ms   20 ms   20 ms   20 ms     42.80
Google               20 ms   12 ms   24 ms   20 ms   20 ms   244 ms  24 ms   52 ms   20 ms   16 ms     45.20
Norton               48 ms   48 ms   48 ms   44 ms   40 ms   48 ms   48 ms   44 ms   40 ms   44 ms     45.20
Verisign             44 ms   56 ms   48 ms   44 ms   52 ms   44 ms   48 ms   44 ms   56 ms   44 ms     48.00
Neustar-v6           48 ms   56 ms   48 ms   52 ms   48 ms   48 ms   52 ms   56 ms   52 ms   44 ms     50.40
Freenom              20 ms   56 ms   16 ms   20 ms   16 ms   16 ms   16 ms   236 ms  16 ms   104 ms    51.60
Meustar              48 ms   48 ms   44 ms   48 ms   52 ms   48 ms   48 ms   48 ms   48 ms   84 ms     51.60
HE.NET               12 ms   20 ms   20 ms   20 ms   296 ms  16 ms   16 ms   72 ms   20 ms   32 ms     52.40
Verisign-v6          48 ms   44 ms   44 ms   44 ms   48 ms   48 ms   48 ms   264 ms  44 ms   52 ms     68.40
AliDNS-v6            212 ms  84 ms   80 ms   80 ms   80 ms   80 ms   84 ms   1000 ms 88 ms   80 ms     186.80
Baidu                88 ms   120 ms  92 ms   88 ms   120 ms  112 ms  1000 ms 200 ms  112 ms  56 ms     198.80
DynDNS               180 ms  260 ms  180 ms  180 ms  184 ms  184 ms  188 ms  224 ms  192 ms  276 ms    204.80
SafeServe            192 ms  192 ms  192 ms  192 ms  212 ms  188 ms  192 ms  244 ms  208 ms  240 ms    205.20
Yandex-v6            216 ms  204 ms  200 ms  216 ms  204 ms  204 ms  212 ms  264 ms  232 ms  220 ms    217.20
Yandex               212 ms  220 ms  216 ms  220 ms  200 ms  220 ms  220 ms  364 ms  220 ms  204 ms    229.60
Adguard-v6           240 ms  240 ms  244 ms  240 ms  240 ms  272 ms  236 ms  320 ms  264 ms  260 ms    255.60
Adguard              244 ms  236 ms  240 ms  244 ms  304 ms  236 ms  244 ms  392 ms  244 ms  268 ms    265.20
DNS.Watch            172 ms  188 ms  184 ms  180 ms  180 ms  180 ms  1000 ms 312 ms  168 ms  192 ms    275.60
CyberGhost           1000 ms 184 ms  188 ms  172 ms  236 ms  180 ms  196 ms  284 ms  192 ms  228 ms    286.00
OneDNS               340 ms  332 ms  332 ms  344 ms  340 ms  344 ms  336 ms  340 ms  340 ms  1000 ms   404.80
Level3-2             1000 ms 1000 ms 16 ms   1000 ms 16 ms   1000 ms 1000 ms 16 ms   132 ms  1000 ms   618.00
Level3-1             12 ms   1000 ms 1000 ms 1000 ms 12 ms   1000 ms 1000 ms 16 ms   1000 ms 1000 ms   704.00
BebasDNS-Malware-v6  1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms 1000 ms   1000.00

```


# Untuk pengguna Windows yang menggunakan subsistem Linux

Jika Anda menerima kesalahan `$'\r': command not found`, konversikan file ke akhiran baris yang kompatibel dengan Linux menggunakan : (Titikd Dua/Colon)

# Terima kasih Khususnya Untuk CleanBrowsing

**Anda bebas untuk mengubah, mendistribusikan script ini untuk keperluan anda**

### Anda Memang Luar Biasa | Harry DS Alsyundawy | Kaum Rebahan Garis Keras & Militan
