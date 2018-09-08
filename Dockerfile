FROM node:jessie

ARG botname
ENV botname ${botname}
RUN apt-get update && apt-get install git -y
RUN git clone https://github.com/BakaKiller/ethiabot.git /etc/${botname}
COPY ./config.json /etc/${botname}/config.json
RUN cd /etc/${botname} && npm install
RUN chmod +x /etc/${botname}/bot.js
CMD /etc/${botname}/bot.js
