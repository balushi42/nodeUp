FROM alpine:latest

ARG user=bit

COPY nodeUP /
copy config /

RUN apk update && apk upgrade && apk add bash \
		bash-completion \
		openssh \
		&& rm -f /var/cache/apk/* \
		&& adduser --disabled-password -s /bin/bash $user \
		&& sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config \
		&& mv /nodeUP /home/$user/nodeUP && mv /config /home/$user/.nodes.myconfig \
		&& chmod +x /home/$user/nodeUP && chmod 600 /home/$user/.nodes.myconfig \
		&& chown $user:$user /home/$user/nodeUP && chown $user:$user /home/$user/.nodes.myconfig \
		&& su $user -c "touch /home/$user/.bashrc && /home/$user/nodeUP"

USER $user

WORKDIR /home/$user/bin

EXPOSE 22/tcp
#EXPOSE 22/udp


ENTRYPOINT /bin/bash
