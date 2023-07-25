<?php

// Check for required commands
$commands = array("bc", "dig");
foreach ($commands as $cmd) {
    if (!shell_exec("command -v $cmd")) {
        echo "error: $cmd was not found. Please install $cmd.\n";
        exit(1);
    }
}

// Get nameservers from /etc/resolv.conf
$nameservers = array();
$resolv = file_get_contents("/etc/resolv.conf");
$lines = explode("\n", $resolv);
foreach ($lines as $line) {
    if (preg_match("/^nameserver\s+(\S+)/", $line, $match)) {
        $nameservers[] = "&" . $match[1];
    }
}

// Define providers for IPv4 and IPv6
$providersv4 = array(
    "1.1.1.1" => "cloudflare1",
    "1.1.1.2" => "cloudflare2",
    "8.8.8.8" => "google",
    "9.9.9.9" => "quad9",
    "208.67.222.123" => "opendns",
    "176.103.130.132" => "adguard",
    "4.2.2.1" => "level3-1",
    "209.244.0.3" => "level3-2",
    "80.80.80.80" => "freenom",
    "84.200.69.80" => "DNS.Watch",
    "199.85.126.20" => "norton",
    "185.228.168.168" => "cleanbrowsing",
    "77.88.8.7" => "yandex",
    "156.154.70.3" => "neustar",
    "8.26.56.26" => "comodo",
    "45.90.28.202" => "nextdns",
    "64.6.64.6" => "Verisign",
    "223.5.5.5" => "alidns",
    "195.46.39.39" => "SafeDNS",
    "216.146.35.35" => "DynDNS",
    "117.50.11." => 11#OneDNS,
    180 . 76 . 76 . 76#Baidu,
    74 . 82 . 42 . 42#HE.NET,
);

$providersv6 = array(
    "[2606:4700:4700::1111]" => "cloudflare-v6",
    "[2606:4700:4700::1112]" => "cloudflare-v62",
    "[2001:4860:4860::8888]" => "google-v6",
    "[2620:fe::fe]" => "quad9-v6",
    "[2620:119:35::35]" => "opendns-v6",
    "[2a0d:2a00:1::1]" => "cleanbrowsing-v6",
    "[2a02:6b8::feed:0ff]" => "yandex-v6",
    "[2a00:5a60::ad1:0ff]" => "adguard-v6",
    "[2610:a1:1018::3]" => "neustar-v6",
    "[2620:119:53::53]" => comodo - v6,
);

// Test for IPv6 support by querying alsyundawy.my.id with cloudflare-v6 nameserver and checking for expected IPs in the output 
$hasipv6 = false;
$output = shell_exec("dig +short +tries=1 +time=2 +stats @2606:4700:4700::1111 alsyundawy.my.id");
if (preg_match("/172\.67\.134\.149|104\.21\.6\.70/", $output)) {
    $hasipv6 = true;
}

switch ($argv[1]) {
case ipv4:
        $providerstotest = $providersv4;
        break;
case ipv6:
        if (!$hasipv6) {
            echo("error: IPv6 support not found.\n");
            exit(1);
        }
        $providerstotest = $providersv6;
        break;
case all:
        if (!$hasipv6) {
            $providerstotest = $providersv4;
        } else {
            $providerstotest = array_merge($providersv4, $providersv6);
        }
        break;
default:
        $providerstotest = $providersv4;
}

// Domains to test (duplicates are ok)
$domains2test = array(
    "google.com",
    "telegram.org",
    "facebook.com",
    "youtube.com",
    "instagram.com",
    "wikipedia.org",
    "twitter.com",
    "www.tokopedia.com",
    "whatsapp.com",
    "tiktok.com",
);

$totaldomains = count($domains2test);

printf("%-21s", "");
for ($i = 1; $i <= $totaldomains; $i++) {
    printf("%-8s", "test$i");
}

printf("%-8s\n", "Average");

foreach (array_merge($nameservers, $providerstotest) as $pip => $pname) {
    $ftime = 0;

    printf("%-21s", "$pname");
    foreach ($domains2test as $d) {
        $ttime = shell_exec("dig +tries=1 +time=2 +stats @$pip $d | grep \"Query time:\" | cut -d : -f 2- | cut -d \" \" -f 2");
        if (empty($ttime)) {
            $ttime = 1000; // timeout is 1000 ms
        }
        if ($ttime == 0) {
            $ttime = 1; // minimum time is 1 ms
        }

        printf("%-8s", "$ttime ms");
        $ftime += $ttime;
    }
    $avg = bcdiv($ftime, $totaldomains, 2);

    printf("  %s\n", "$avg");
}

exit(0);
?>
