FROM alpine:3.16.2

# 安装基础包
RUN apk add --no-cache ca-certificates \
	&& apk add tzdata \
	&& apk add bash \
	#&& apk add vim \
	&& apk add s6 \
	&& apk add wget \
	&& apk add curl \
	# && apk add openssh-client \
	&& apk add iperf3 \
	# ethtool：用于获取以太网卡的配置信息，或者修改这些配置
	&& apk add ethtool \
	# nftables：是一个 netfilter 项目，旨在替换现有的 {ip,ip6,arp,eb}tables 框架，为{ip,ip6}tables提供一个新的包过滤框架、一个新的用户空间实用程序（nft）和一个兼容层。它使用现有的钩子、链接跟踪系统、用户空间排队组件和 netfilter 日志子系统。
	&& apk add nftables \
	# busybox-extras：包含 telnet 命令
	&& apk add busybox-extras \
	&& apk add tcpdump \
	&& apk add iputils \
	&& apk add iptables \
	# iproute2：ip link、ip route、ss 等命令
	&& apk add iproute2 \
	# net-tools：ifconfig、netstat、route 等命令
	&& apk add net-tools \
	#&& apk add telnet\
	#&& apk add traceroute \
	&& apk add coreutils \
	&& apk add libc6-compat \
	&& update-ca-certificates 2>/dev/null || true \
	&& rm -rf /tmp/* \
	&& rm -rf /var/cache/apk/* \
	# 缺少/etc/nsswitch.conf 文件，导致 golang 程序在 Alpine 镜像下hosts定义的域名不生效
	&& [ ! -e /etc/nsswitch.conf ] \
	&& echo "hosts: files dns" > /etc/nsswitch.conf
	
# 设置 操作系统时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	#&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone
	#&& apk del tzdata

# 设置时区变量
ENV TIME_ZONE Asia/Shanghai

# 设置 语言支持

ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
#设置字符集
#ENV LANG en_US.UTF-8


# 安装 python3、升级pip、setuptools
RUN apk add --no-cache python3 \
	# && apk add --no-cache python3-dev \
	# && apk add gcc libc-dev libffi-dev \
	&& python3 -m ensurepip \
	#&& rm -r /usr/lib/pyopenssh-client \
	#&& busybox-extras \thon*/ensurepip \
	&& pip3 install --default-timeout=100 --no-cache-dir --upgrade pip \
	&& pip3 install --default-timeout=100 --no-cache-dir --upgrade setuptools \
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
	&& if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf ~/.cache/pip \
	#&& mkdir -p /usr/share/fonts/win/ \
	#&& apk add --no-cache xvfb-run \
	&& apk add chromium chromium-chromedriver \
	&& pip install requests selenium \
	&& pip install flask \ 
	&& pip install flask_apscheduler traceback2

WORKDIR /cwzs
COPY . /cwzs

COPY SourceHanSansCN-Normal.otf /usr/share/fonts/SourceHanSansCN-Normal.otf

RUN set -ex \
	&& chmod 777 /usr/share/fonts/SourceHanSansCN-Normal.otf \
	&& chmod +x  /cwzs/unview.sh \
	#&& apk add --update --no-cache openssh \
	#&& echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
	#&& echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config \
	#&& adduser -h /home/vivek -s /bin/sh -D vivek \
	#&& echo -n 'vivek:172299' | chpasswd \
	#&& echo -n 'root:172299' | chpasswd \
	#&& chmod +x -v /cwzs/entrypoint.sh \
	#&& chmod +x -v /cwzs/unview.sh \
	&& chmod -R 777 /cwzs
       
ENTRYPOINT ["/cwzs/unview.sh"]

EXPOSE 8080 2222
