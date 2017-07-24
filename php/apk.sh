#!/bin/bash

#apk add --no-cache --virtual .persistent-deps \
apk add --update \
        bash \
		git \
		icu-libs \
 		zlib \
 		wget \
		ca-certificates \
		curl \
		nodejs@${NODE_VERSION} \
		yarn@${YARN_VERSION} \
		apache-ant

set -xe \
	&& apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
		icu-dev \
		zlib-dev \
	&& docker-php-ext-install \
		intl \
		zip \
	&& apk del .build-deps