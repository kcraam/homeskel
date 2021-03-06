#!/bin/bash

screen -xRR -S sshwrap

# clean up after detach'ing
# drop ssh identities
ssh-add -D 2>/dev/null

# kill agent
if [[ ! -z "$SSH_SHOULD_KILL_AGENT_ON_STOP" ]]; then
	eval `ssh-agent -k`
fi

# set terminal title to something sane
# just in case he does not restore
# it itself
echo -ne "\033]0;was: ${HOSTNAME%%.*}\007"

exit 0
