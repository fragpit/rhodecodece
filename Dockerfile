#
# Copyright (c) New Cloud Technologies, Ltd., 2013-2016
#
# You can not use the contents of the file in any way without New Cloud Technologies, Ltd. written permission.
# To obtain such a permit, you should contact New Cloud Technologies, Ltd. at http://ncloudtech.com/contact.html
#

FROM        centos:latest

ENV         PATH /root/.rccontrol-profile/bin:$PATH

RUN         yum install -y sudo bzip2

RUN         sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers && \
            cd /tmp && \
            wget --progress=dot:giga --content-disposition https://dls-eu.rhodecode.com/dls/NzA2MjdhN2E2ODYxNzY2NzZjNDA2NTc1NjI3MTcyNzA2MjcxNzIyZTcwNjI3YQ==/rhodecode-control/latest-linux-ce && \
            chmod 775 RhodeCode-installer* && \
            yes | ./RhodeCode-installer* && \
            rm -f RhodeCode-installer* rccontrol.log rc-installer*.log accepted_con*.txt

RUN         yes | rccontrol install VCSServer '{"host":"127.0.0.1", "port":"10001"}' && \
            yes | rccontrol install Community '{"password":"111111", "email":"admin", "username":"admin", "host":"127.0.0.1", "port":"10000", "repo_dir":"/root/repos",  "database":"sqlite"}'

ADD         run.sh              /root/run.sh
ADD         supervisord.conf    /root/supervisord.conf

CMD         supervisord -c /root/supervisord.conf
