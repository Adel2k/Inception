#!/bin/bash

echo "[Definition]
failregex = ^<HOST> -.* "GET .* HTTP/.*" 401
ignoreregex =
" >> /etc/fail2ban/filter.d/nginx-http-auth.conf
