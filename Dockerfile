FROM docker:20.10-dind

RUN apk add --update alpine-sdk
RUN apk add --update bash python3 python3-dev py-pip libffi-dev build-base openssl-dev openssh jq rsync gcc libc-dev make gettext rust cargo make zip npm
RUN apk add -U --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing aufs-util
RUN pip install docker-compose
RUN pip install awscli
RUN mkdir -p ~/.ssh/
RUN echo -e "Host *\n  StrictHostKeyChecking no\n  UserKnownHostsFile=/dev/null" > ~/.ssh/config

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN curl -LO https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
