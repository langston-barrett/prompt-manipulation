#!/bin/bash

# Description: Echos the prompt prefix as a string
# Arguments: none
function current_prompt() {
    echo "$PS1"
}

# Description: store the provided prompt as a backup in as many places as we can!
# Arguments: prompt to store
# Returns (echoes): none
function store_prompt() {
    # store in the environment, in case this script is quit without resetting
    PROMPT_MANIPULATION_OLD=$1
    export PROMPT_MANIPULATION_OLD
    # env works where export doesn't if you spawn another process
    env PROMPT_MANIPULATION_OLD="$1" > /dev/null
    # store locally in case environment is manipulated during run
    prompt_manipulation_old=$1
}

# Description: The inverse function of store_prompt, deletes all stored variables
# Arguments: none
# Returns (echoes): none
function unstore_prompt() {
    unset "$prompt_manipulation_old"
    unset "$PROMPT_MANIPULATION_OLD"
}

# Description: store the current prompt as a backup in as many places as we can!
# Arguments: none
# Returns (echoes): none
function store_current_prompt() {
    store_prompt "$(current_prompt)"
}

# Description: Prefixes the user's shell prompt with a given string.
# Arguments: string to put in front of the prompt.
function prefix_prompt() {
    PS1=$1$PS1
}

# Description: Suffixes the user's shell prompt with a given string.
# Arguments: string to put behind the prompt.
function suffix_prompt() {
    PS1=$PS1$1
}

# Description: Replaces the user's shell prompt with a given string.
# Arguments: string to replace the prompt.
function replace_prompt() {
    PS1=$1
}

# Description: Reset the prompt to whatever it was before your script ran.
# The inverse of prefix_prompt, replace_prompt, etc.
# Should be called every time you use one of the above functions.
# Arguments: none
# Returns (echoes): none
function reset_prompt() {
    if [ -z "$PROMPT_MANIPULATION_OLD" ] && [ -z "$prompt_manipulation_old" ]; then
        echo "[ERROR] There was no old prompt to reset to!"
    elif [ -n "$prompt_manipulation_old" ]; then
        PS1=$prompt_manipulation_old
        export PS1
    elif [ -n "$PROMPT_MANIPULATION_OLD" ]; then
        PS1=$PROMPT_MANIPULATION_OLD
        export PS1
    fi
    unstore_prompt
}
