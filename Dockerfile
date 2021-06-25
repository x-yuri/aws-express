FROM node:alpine
ARG UID
RUN set -x && apk add --no-cache shadow \
    && if ! getent group "$UID"; then \
        groupadd -g "$UID" app; fi \
    && if ! getent passwd "$UID"; then \
        useradd -m -u "$UID" -g "$UID" app; fi
WORKDIR /app
