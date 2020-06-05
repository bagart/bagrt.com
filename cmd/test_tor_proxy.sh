#!/bin/bash
UA='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36'

echo 'whatismyipaddress.com:'
echo . . . . . socks5 . . . . .
curl -sx socks5://torproxy:9050 https://whatismyipaddress.com/ \
    | grep 'Your IP' \
    | php -r 'echo trim(strip_tags(stream_get_contents(STDIN)));'
echo
echo . . . . . . http . . . . . .
curl -sx torproxy:8118 https://whatismyipaddress.com/ \
    | grep 'Your IP' \
    | php -r 'echo trim(strip_tags(stream_get_contents(STDIN)));'
echo
echo . . . . . No proxy . . . . .
curl https://whatismyipaddress.com/
echo
echo . . . . No proxy + UA . . . .
curl -sA "$UA" https://whatismyipaddress.com/ \
    | grep '<strong>IPv4:</strong>' \
    | php -r 'echo trim(strip_tags(stream_get_contents(STDIN)));'
echo
