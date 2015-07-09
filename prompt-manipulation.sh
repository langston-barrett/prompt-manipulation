#!/bin/bash

# store in the environment, in case this script is quit without resetting
export PROMPT_MANIPULATION_OLD=$PS1
# store locally in case environment is manipulated during run
propmt_manipulation_old=$PS1

# Description: Echos the prompt prefix as a string
# Arguments: none
function current_prompt() {
    echo $PS1
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
# Should be called every time you use one of the above functions.
# Arguments: none
function reset_prompt() {
    # -z tests if this variable is zero length (i.e. unset)
    # -n tests if this variable is not zero length (i.e. set)
    if [ -z "$PROMPT_MANIPULATION_OLD" ] && [ -z "$old" ]; then
        echo "[ERROR] There was no old prompt to reset to!"
    elif [ -n "$propmt_manipulation_old" ]; then
        PS1=$propmt_manipulation_old
        export PS1
    elif [ -n "$PROMPT_MANIPULATION_OLD" ]; then
        PS1=$PROMPT_MANIPULATION_OLD
        export PS1
    fi
    unset PROMPT_MANIPULATION_OLD
    unset propmt_manipulation_old
}
