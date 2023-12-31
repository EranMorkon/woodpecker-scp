#!/bin/sh

mkdir -p /root/.ssh
echo "${PLUGIN_SSH_KEY}" > "/root/.ssh/id_rsa"
chmod 0600 /root/.ssh/id_rsa
echo "${PLUGIN_SSH_KNOWN_HOSTS}" > "/root/.ssh/known_hosts"
chmod 0600 /root/.ssh/known_hosts
scp -Bv ${PLUGIN_EXTRA_FLAGS} ${PLUGIN_SOURCE} ${PLUGIN_DESTINATION}