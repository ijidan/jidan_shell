#!/bin/bash

http_code= `curl -I www.baidu.com -w %{http_code} | tail -n1`
echo $http_code
