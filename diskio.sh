rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
yum install zabbix-agent
yum install sysstat -y
cd /etc/zabbix/zabbix_agentd.d
wget https://raw.githubusercontent.com/mack078/zabbix_disk_sheel/master/userparameter_disk_io.sh
wget https://raw.githubusercontent.com/mack078/zabbix_disk_sheel/master/userparameter_discovery.sh
sed -i 's/#UnsafeUserParameters=0/UnsafeUserParameters=1/g' /etc/zabbix/zabbix_agentd.conf 
echo 'UserParameter=tcp_status[*],/etc/zabbix/zabbix_agentd.d/userparameter_tcp_status.sh "$1"' >> /etc/zabbix/zabbix_agentd.conf
echo 'UserParameter=disk.discovery[*],/etc/zabbix/zabbix_agentd.d/userparameter_discovery.sh' >> /etc/zabbix/zabbix_agentd.conf
echo 'UserParameter=disk.io[*],/etc/zabbix/zabbix_agentd.d/userparameter_disk_io.sh $1 $2 $3' >> /etc/zabbix/zabbix_agentd.conf
