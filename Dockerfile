FROM maven:3-jdk-8
LABEL maintainer="marco.miglierina@contentwise.tv"
ARG NODE_VERSION="7"
ARG DOCKER_VERSION="17.09.1-ce"
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get update \
    && apt-get install -y \
        make \
        nodejs \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && curl -L https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar -xz -C /usr/local/bin --strip 1 \
    && mkdir -p ~/.docker && echo "{}" > ~/.docker/config.json
CMD ["bash"]