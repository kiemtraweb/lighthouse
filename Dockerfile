FROM sitespeedio/webbrowsers:chrome-74-firefox-66

RUN apt-get update \
 && apt-get install -y gnupg curl ca-certificates \
    apt-transport-https sudo xvfb --no-install-recommends \
 && npm install -g lighthouse \
 && rm -rf /var/lib/apt/lists/*


ENV USER lighthouse
ENV HOME /home/$USER

RUN useradd -ms /bin/bash -U $USER \
 && passwd -d $USER \
 && mkdir -p $HOME/result \
 && chown lighthouse:lighthouse $HOME/result

USER $USER
WORKDIR $HOME/result

VOLUME $HOME/result

COPY --chown=lighthouse:lighthouse start.sh $HOME/start.sh

RUN chmod a+x $HOME/start.sh

ENTRYPOINT ["../start.sh"]
#CMD $HOME/start.sh
