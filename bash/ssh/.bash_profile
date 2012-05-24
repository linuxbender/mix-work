if [[ $- != *i* ]] ; then 
    ON_A_TTY=No 
else 
    ON_A_TTY=Yes 
fi 

# check that an ssh-agent is running 
if [ -x /usr/bin/ssh-agent ] 
then 
    SSH_AGENT_PID=-1 
    if [ -r ${HOME}/.ssh/agent_info ] 
    then 
        # 
        ## ##################################################################### 
        ## Share an already existing agent that I have started 
        ## ##################################################################### 
        # 
        source ${HOME}/.ssh/agent_info 
    fi 
    # 
    ## ######################################################################### 
    ## Make sure the agent is still running 
    ## ######################################################################### 
    # 
    if [ ! -r /proc/${SSH_AGENT_PID} ] 
    then 
        ssh-agent > ${HOME}/.ssh/agent_info 
        chmod u=rw,g=,o= ${HOME}/.ssh/agent_info 
        source ${HOME}/.ssh/agent_info # > /dev/null 2>&1 
        # 
        ## ################################################################# 
        ## Newly created agent, load up my id_dsa and id_rsa identities 
        ## ################################################################# 
        # 
        # now, we have an ssh-agent running, add my identity 
        # if [ "${ON_A_TTY}" = "Yes" ] 
        # then 
        #       xterm -e ssh-add ${HOME}/.ssh/identity 
        # fi 
    fi 
fi 