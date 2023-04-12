#!/bin/bash

# fetch latest release tag
#CHATGPT_ON_WECHAT_TAG=`curl -sL "https://api.github.com/repos/zhayujie/chatgpt-on-wechat/releases/latest" | \
#     grep '"tag_name":' | \
#     sed -E 's/.*"([^"]+)".*/\1/'`
CHATGPT_ON_WECHAT_TAG=1.0.2

HTTP_PROXY=http://192.168.192.128:7890

# build image
docker build -f Dockerfile.alpine \
             --build-arg HTTP_PROXY=$HTTP_PROXY --build-arg HTTPS_PROXY=$HTTPS_PROXY \
             --build-arg CHATGPT_ON_WECHAT_VER=$CHATGPT_ON_WECHAT_TAG \
             -t kinboy/chatgpt-on-wechat .

# tag image
docker tag kinboy/chatgpt-on-wechat kinboy/chatgpt-on-wechat:$CHATGPT_ON_WECHAT_TAG-alpine
           