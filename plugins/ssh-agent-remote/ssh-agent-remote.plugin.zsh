# I need to be able to run a screen/tmux on a remote machine, and continue to use
# a forwarded ssh-agent from a remote machine after logging back into the
# session after having been logged out of that machine.
#
# This handles that problem.

local SSH_AUTH_SOCK_LINK=$HOME/.ssh/ssh-agent-auth-sock-$HOST

if [ "$SSH_AUTH_SOCK" != "" ] && [ "$SSH_AUTH_SOCK" != "$SSH_AUTH_SOCK_LINK" ]; then
    ln -sf $SSH_AUTH_SOCK $SSH_AUTH_SOCK_LINK
    export SSH_AUTH_SOCK=$SSH_AUTH_SOCK_LINK
fi
