# ybu-wifi-login
延边大学路由器自动登录校园网
下载后打开文件，找到 LOGIN_STATUS=$(curl -X GET "http://10.10.252.1:801/eportal/?c=Portal&a=login&callback=dr1708611535293&login_method=1&user_account=&user_password=&wlan_user_ip=${CURRENT_IP}&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.1&_=1708611532256")这段内容，在user_account=后输入wifi账户（学号），user_password=后输入密码，都不用加引号。

文件在运行时会确认是否能连接上baidu.com来确认是否登录。

要使用路由器登录。在路由器解锁sh功能后进入后台，用crontab设置定时，可以为开机运行，隔一段时间运行。

注意有的路由器在重启后会恢复文件，导致这个sh脚本消失，因此要固化一下文件。

# 免责声明：此代码仅为学习使用，出现任何问题所受法律责任与作者无关。
