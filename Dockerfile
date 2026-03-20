ARG CROMITE_SHA
ARG VERSION

FROM uazo/cromite-build:$VERSION-$CROMITE_SHA

ARG HTTP_PROXY
ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTP_PROXY
ENV https_proxy=$HTTP_PROXY

USER lg
WORKDIR /home/lg/working_dir

RUN rm -f apply-cromite-patches.sh

COPY apply-cromite-patches.sh .
COPY Statusbar-force-light-icon-color-in-incognito.patch cromite/build/patches/

ENV CIPD_CACHE_DIR=/home/lg/working_dir/.cipd_cache
ENV VPYTHON_VIRTUALENV_ROOT=/home/lg/vpython_root

RUN sudo chmod +x ./apply-cromite-patches.sh
RUN ./apply-cromite-patches.sh

