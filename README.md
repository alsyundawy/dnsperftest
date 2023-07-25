# DNS Performance Test

Shell script to test the performance of the most popular DNS resolvers from your location.

Includes by default:
 * Internal DNS Server (/etc/resolv)
 * CloudFlare 1.1.1.1
 * CloudFlare 1.1.1.2
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

You need to install bc and dig. 

For Ubuntu / Debian Based:

```
 $ sudo apt-get install bc dnsutils
```

For RedHat / RPM Based:

```
 $ sudo yum install bc dnsutils
 $ sudo dnf install bc dnsutils
```

For macOS using homebrew:

```
 $ brew install bc bind
```

# Utilization

``` 
 $ git clone --depth=1 https://github.com/alsyundawy/dnsperftest/
 $ cd dnsperftest
 $ bash ./dnstest.sh 
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
127.0.0.1            1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
::1                  1 ms    1 ms    1 ms    1 ms    4 ms    1 ms    1 ms    1 ms    4 ms    1 ms      1.60
cloudflare1          16 ms   12 ms   12 ms   12 ms   16 ms   12 ms   16 ms   12 ms   12 ms   16 ms     13.60
cloudflare2          12 ms   16 ms   12 ms   16 ms   16 ms   16 ms   16 ms   16 ms   12 ms   12 ms     14.40
google               20 ms   16 ms   20 ms   16 ms   16 ms   16 ms   16 ms   32 ms   16 ms   16 ms     18.40
quad9                16 ms   16 ms   64 ms   28 ms   16 ms   24 ms   16 ms   44 ms   16 ms   20 ms     26.00
opendns              12 ms   12 ms   12 ms   12 ms   56 ms   192 ms  12 ms   16 ms   12 ms   16 ms     35.20
adguard              260 ms  240 ms  240 ms  256 ms  244 ms  240 ms  260 ms  336 ms  308 ms  260 ms    264.40
level3-1             1000 ms 1000 ms 1000 ms 1000 ms 12 ms   1000 ms 12 ms   1000 ms 12 ms   12 ms     604.80
level3-2             1000 ms 12 ms   1000 ms 12 ms   1000 ms 12 ms   1000 ms 1000 ms 1000 ms 12 ms     604.80
freenom              12 ms   56 ms   16 ms   60 ms   48 ms   184 ms  104 ms  348 ms  324 ms  28 ms     118.00
DNS.Watch            208 ms  1000 ms 1000 ms 1000 ms 256 ms  1000 ms 1000 ms 1000 ms 1000 ms 1000 ms   846.40
norton               44 ms   44 ms   44 ms   44 ms   44 ms   40 ms   40 ms   44 ms   40 ms   68 ms     45.20
cleanbrowsing        12 ms   16 ms   12 ms   12 ms   16 ms   12 ms   12 ms   16 ms   12 ms   244 ms    36.40
yandex               204 ms  228 ms  220 ms  204 ms  220 ms  216 ms  204 ms  280 ms  260 ms  244 ms    228.00
neustar              48 ms   48 ms   48 ms   48 ms   48 ms   44 ms   44 ms   140 ms  48 ms   104 ms    62.00
comodo               16 ms   16 ms   16 ms   16 ms   16 ms   12 ms   16 ms   16 ms   16 ms   16 ms     15.60
nextdns              16 ms   16 ms   16 ms   16 ms   20 ms   16 ms   16 ms   20 ms   16 ms   20 ms     17.20
Verisign             48 ms   44 ms   44 ms   44 ms   44 ms   44 ms   48 ms   44 ms   44 ms   116 ms    52.00
alidns               1 ms    4 ms    1 ms    1 ms    1 ms    1 ms    1 ms    4 ms    4 ms    4 ms      2.20
SafeDNS              16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   20 ms   16 ms   56 ms     20.40
DynDNS               192 ms  224 ms  184 ms  192 ms  180 ms  180 ms  192 ms  196 ms  216 ms  204 ms    196.00
OneDNS               344 ms  332 ms  332 ms  344 ms  336 ms  344 ms  352 ms  1476 ms 336 ms  1000 ms   519.60
Baidu                192 ms  84 ms   120 ms  100 ms  48 ms   88 ms   92 ms   168 ms  48 ms   88 ms     102.80
HE.NET               12 ms   12 ms   160 ms  16 ms   12 ms   16 ms   12 ms   12 ms   16 ms   24 ms     29.20
```

To sort with the fastest first, add `sort -k 22 -n` at the end of the command:

```
  $ bash ./dnstest.sh | sort -k 22 -n
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
127.0.0.1            1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
::1                  1 ms    1 ms    1 ms    1 ms    4 ms    1 ms    1 ms    1 ms    4 ms    1 ms      1.60
cloudflare1          16 ms   12 ms   12 ms   12 ms   16 ms   12 ms   16 ms   12 ms   12 ms   16 ms     13.60
cloudflare2          12 ms   16 ms   12 ms   16 ms   16 ms   16 ms   16 ms   16 ms   12 ms   12 ms     14.40
google               20 ms   16 ms   20 ms   16 ms   16 ms   16 ms   16 ms   32 ms   16 ms   16 ms     18.40
quad9                16 ms   16 ms   64 ms   28 ms   16 ms   24 ms   16 ms   44 ms   16 ms   20 ms     26.00
opendns              12 ms   12 ms   12 ms   12 ms   56 ms   192 ms  12 ms   16 ms   12 ms   16 ms     35.20
adguard              260 ms  240 ms  240 ms  256 ms  244 ms  240 ms  260 ms  336 ms  308 ms  260 ms    264.40
level3-1             1000 ms 1000 ms 1000 ms 1000 ms 12 ms   1000 ms 12 ms   1000 ms 12 ms   12 ms     604.80
level3-2             1000 ms 12 ms   1000 ms 12 ms   1000 ms 12 ms   1000 ms 1000 ms 1000 ms 12 ms     604.80
freenom              12 ms   56 ms   16 ms   60 ms   48 ms   184 ms  104 ms  348 ms  324 ms  28 ms     118.00
DNS.Watch            208 ms  1000 ms 1000 ms 1000 ms 256 ms  1000 ms 1000 ms 1000 ms 1000 ms 1000 ms   846.40
norton               44 ms   44 ms   44 ms   44 ms   44 ms   40 ms   40 ms   44 ms   40 ms   68 ms     45.20
cleanbrowsing        12 ms   16 ms   12 ms   12 ms   16 ms   12 ms   12 ms   16 ms   12 ms   244 ms    36.40
yandex               204 ms  228 ms  220 ms  204 ms  220 ms  216 ms  204 ms  280 ms  260 ms  244 ms    228.00
neustar              48 ms   48 ms   48 ms   48 ms   48 ms   44 ms   44 ms   140 ms  48 ms   104 ms    62.00
comodo               16 ms   16 ms   16 ms   16 ms   16 ms   12 ms   16 ms   16 ms   16 ms   16 ms     15.60
nextdns              16 ms   16 ms   16 ms   16 ms   20 ms   16 ms   16 ms   20 ms   16 ms   20 ms     17.20
Verisign             48 ms   44 ms   44 ms   44 ms   44 ms   44 ms   48 ms   44 ms   44 ms   116 ms    52.00
alidns               1 ms    4 ms    1 ms    1 ms    1 ms    1 ms    1 ms    4 ms    4 ms    4 ms      2.20
SafeDNS              16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   20 ms   16 ms   56 ms     20.40
DynDNS               192 ms  224 ms  184 ms  192 ms  180 ms  180 ms  192 ms  196 ms  216 ms  204 ms    196.00
OneDNS               344 ms  332 ms  332 ms  344 ms  336 ms  344 ms  352 ms  1476 ms 336 ms  1000 ms   519.60
Baidu                192 ms  84 ms   120 ms  100 ms  48 ms   88 ms   92 ms   168 ms  48 ms   88 ms     102.80
HE.NET               12 ms   12 ms   160 ms  16 ms   12 ms   16 ms   12 ms   12 ms   16 ms   24 ms     29.20
```

To test using the IPv6 addresses, add the IPv6 option:

```
  $ bash ./dnstest.sh ipv6 | sort -k 22 -n
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
::1                  1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
127.0.0.1            1 ms    1 ms    1 ms    1 ms    1 ms    4 ms    1 ms    8 ms    1 ms    1 ms      2.00
cloudflare-v6        16 ms   12 ms   16 ms   12 ms   12 ms   16 ms   16 ms   12 ms   12 ms   12 ms     13.60
quad9-v6             16 ms   16 ms   16 ms   16 ms   16 ms   12 ms   16 ms   16 ms   16 ms   16 ms     15.60
cloudflare-v62       16 ms   16 ms   16 ms   12 ms   16 ms   16 ms   20 ms   16 ms   16 ms   16 ms     16.00
cleanbrowsing-v6     16 ms   16 ms   16 ms   16 ms   16 ms   12 ms   12 ms   16 ms   28 ms   16 ms     16.40
comodo-v6            16 ms   12 ms   16 ms   64 ms   12 ms   12 ms   12 ms   88 ms   12 ms   16 ms     26.00
google-v6            20 ms   16 ms   16 ms   20 ms   24 ms   208 ms  16 ms   20 ms   16 ms   24 ms     38.00
opendns-v6           20 ms   16 ms   56 ms   16 ms   16 ms   252 ms  12 ms   84 ms   12 ms   56 ms     54.00
neustar-v6           48 ms   84 ms   52 ms   48 ms   48 ms   44 ms   52 ms   260 ms  52 ms   132 ms    82.00
yandex-v6            216 ms  200 ms  200 ms  228 ms  220 ms  200 ms  232 ms  260 ms  228 ms  420 ms    240.40
adguard-v6           272 ms  260 ms  272 ms  260 ms  252 ms  264 ms  244 ms  480 ms  324 ms  252 ms    288.00
```

To test both IPv6 and IPv4, add the "all" option:
```
  $ bash ./dnstest.sh all | sort -k 22 -n
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
::1                  1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
127.0.0.1            4 ms    1 ms    1 ms    1 ms    1 ms    4 ms    1 ms    1 ms    1 ms    1 ms      1.60
alidns               1 ms    1 ms    1 ms    4 ms    4 ms    4 ms    4 ms    4 ms    4 ms    4 ms      3.10
level3-2             12 ms   12 ms   16 ms   12 ms   12 ms   12 ms   12 ms   12 ms   8 ms    12 ms     12.00
cloudflare1          12 ms   12 ms   12 ms   16 ms   12 ms   12 ms   12 ms   12 ms   12 ms   16 ms     12.80
cloudflare-v6        16 ms   12 ms   12 ms   12 ms   12 ms   12 ms   12 ms   12 ms   16 ms   12 ms     12.80
cloudflare-v62       12 ms   12 ms   12 ms   12 ms   12 ms   12 ms   16 ms   16 ms   16 ms   12 ms     13.20
cloudflare2          12 ms   12 ms   12 ms   16 ms   12 ms   12 ms   16 ms   28 ms   16 ms   16 ms     15.20
google-v6            12 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   20 ms   16 ms   20 ms     16.40
quad9-v6             16 ms   20 ms   16 ms   12 ms   16 ms   16 ms   16 ms   16 ms   20 ms   20 ms     16.80
nextdns              16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   24 ms   20 ms   20 ms     17.60
HE.NET               16 ms   12 ms   12 ms   12 ms   12 ms   16 ms   16 ms   64 ms   12 ms   36 ms     20.80
quad9                16 ms   12 ms   16 ms   16 ms   16 ms   16 ms   24 ms   16 ms   16 ms   112 ms    26.00
opendns-v6           16 ms   12 ms   16 ms   16 ms   52 ms   12 ms   12 ms   92 ms   16 ms   20 ms     26.40
cleanbrowsing        16 ms   24 ms   16 ms   16 ms   20 ms   16 ms   24 ms   16 ms   120 ms  20 ms     28.80
comodo               16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   16 ms   20 ms   156 ms  16 ms     30.40
opendns              12 ms   12 ms   12 ms   16 ms   12 ms   188 ms  12 ms   84 ms   12 ms   16 ms     37.60
google               16 ms   16 ms   16 ms   16 ms   32 ms   224 ms  16 ms   20 ms   24 ms   20 ms     40.00
cleanbrowsing-v6     12 ms   16 ms   12 ms   16 ms   144 ms  16 ms   20 ms   112 ms  36 ms   20 ms     40.40
comodo-v6            12 ms   12 ms   12 ms   56 ms   52 ms   192 ms  12 ms   88 ms   12 ms   16 ms     46.40
neustar-v6           52 ms   48 ms   52 ms   52 ms   52 ms   48 ms   44 ms   44 ms   48 ms   48 ms     48.80
Verisign             44 ms   44 ms   40 ms   44 ms   44 ms   40 ms   44 ms   48 ms   44 ms   116 ms    50.80
neustar              44 ms   44 ms   44 ms   60 ms   44 ms   48 ms   48 ms   44 ms   48 ms   104 ms    52.80
norton               44 ms   44 ms   44 ms   40 ms   44 ms   40 ms   44 ms   80 ms   44 ms   112 ms    53.60
freenom              16 ms   24 ms   164 ms  56 ms   24 ms   12 ms   16 ms   212 ms  236 ms  96 ms     85.60
level3-1             12 ms   1000 ms 12 ms   12 ms   12 ms   16 ms   20 ms   12 ms   12 ms   12 ms     112.00
SafeDNS              16 ms   60 ms   528 ms  92 ms   16 ms   16 ms   16 ms   240 ms  16 ms   132 ms    113.20
Baidu                92 ms   116 ms  116 ms  88 ms   116 ms  120 ms  88 ms   272 ms  84 ms   116 ms    120.80
DynDNS               188 ms  188 ms  192 ms  192 ms  180 ms  192 ms  180 ms  184 ms  244 ms  192 ms    193.20
yandex-v6            224 ms  200 ms  228 ms  204 ms  204 ms  224 ms  220 ms  208 ms  204 ms  208 ms    212.40
yandex               208 ms  204 ms  216 ms  220 ms  204 ms  208 ms  216 ms  492 ms  224 ms  240 ms    243.20
adguard              240 ms  236 ms  252 ms  256 ms  256 ms  236 ms  256 ms  348 ms  260 ms  256 ms    259.60
adguard-v6           240 ms  264 ms  244 ms  240 ms  244 ms  264 ms  240 ms  372 ms  264 ms  276 ms    264.80
OneDNS               348 ms  348 ms  332 ms  328 ms  332 ms  328 ms  340 ms  340 ms  352 ms  348 ms    339.60
DNS.Watch            204 ms  1000 ms 176 ms  1000 ms 204 ms  1000 ms 1000 ms 1000 ms 1000 ms 1000 ms   758.40
```


# For Windows users using the Linux subsystem

If you receive an error `$'\r': command not found`, convert the file to a Linux-compatible line endings using:


# Credit Special Thank's To CleanBrowsing

**Anda bebas untuk mengubah, mendistribusikan script ini untuk keperluan anda**

### Anda Memang Luar Biasa | Harry DS Alsyundawy | Kaum Rebahan Garis Keras & Militan
