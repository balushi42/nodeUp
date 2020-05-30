FROM alpine:latest

ARG user=bit

COPY nodeUP config /

RUN apk update && apk upgrade && apk add bash \
		bash-completion \
		openssh \
		curl \
		&& rm -f /var/cache/apk/* \
		&& passwd -d root && adduser --disabled-password -s /bin/bash $user \
		&& sed -i -e 's/#PermitRootLogin.*/PermitRootLogin\ no/g' -e 's/#PasswordAuthentication.*/PasswordAuthentication\ no/g' /etc/ssh/sshd_config \
		&& mv /nodeUP /home/$user/nodeUP && mv /config /home/$user/.nodes.myconfig \
		&& chmod +x /home/$user/nodeUP && chmod 600 /home/$user/.nodes.myconfig \
		&& chown $user:$user /home/$user/nodeUP && chown $user:$user /home/$user/.nodes.myconfig \
		&& su $user -c "touch /home/$user/.bashrc && /home/$user/nodeUP" \
		&& ssh-keygen -A


EXPOSE 22/tcp
#EXPOSE 22/udp

ENTRYPOINT /usr/sbin/sshd -D -e
