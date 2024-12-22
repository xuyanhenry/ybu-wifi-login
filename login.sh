#!/bin/sh
logger "start check the net connect"
echo "start check the net connect"
KEYWORD=$(curl -s http://baidu.com | grep "NextURL")
if [[ ${KEYWORD} != "" ]]; then
  logger "has not login, trying to login"
  echo "has not login, trying to login"
  CURRENT_IP=$(ifconfig | grep inet | grep -v inet6 | grep -v 127 | grep -v 192 | awk '{print $(NF-2)}' | cut -d ':' -f2)
  LOGIN_STATUS=$(curl -X GET "http://10.10.252.1:801/eportal/?c=Portal&a=login&callback=dr1708611535293&login_method=1&user_account=&user_password=&wlan_user_ip=${CURRENT_IP}&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.1&_=1708611532256")
  SUCCESS=$(echo "${LOGIN_STATUS}" | grep success)
  if [[ ${SUCCESS} == "" ]]; then
    logger "success to login: ${SUCCESS}"
    echo "success to login: ${SUCCESS}"
  else
    LOGIN_STATUS=$(echo "${LOGIN_STATUS}" | cut -d ',' -f3 | cut -d '"' -f4)
    logger "fall to login: ${LOGIN_STATUS}"
    echo "fall to login: ${LOGIN_STATUS}"
  fi
else
  logger "check shows already logged in"
  echo "check shows already logged in"
fi