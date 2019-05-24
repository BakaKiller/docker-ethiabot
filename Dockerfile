FROM node:stretch

ARG botname
ENV botname ${botname}
RUN apt-get update && apt-get install git -y
RUN git clone https://github.com/BakaKiller/ethiabot.git /etc/${botname}
WORKDIR /etc/${botname}
COPY ./settings.json settings.json
RUN npm install
RUN chmod +x bot.js
CMD ./bot.js
