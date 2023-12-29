#!/bin/sh

mkdir -p /root/.ssh
chmod 800 /root/.ssh
echo "${PLUGIN_SSH_KEY}" > "/root/.ssh/id_rsa"
chmod 600 /root/.ssh/id_rsa
echo "${PLUGIN_SSH_KNOWN_HOSTS}" > "/root/.ssh/known_hosts"
chmod 600 /root/.ssh/known_hosts
scp -B ${PLUGIN_EXTRA_FLAGS} ${PLUGIN_SOURCE} ${PLUGIN_DESTINATION}