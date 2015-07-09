# prompt-manipulation
Manipulate bash/zsh prompts in your shell scripts!

### Installation
```bash
wget https://raw.githubusercontent.com/siddharthist/prompt-manipulation/master/prompt-manipulation.sh
```

### Usage
```bash
source prompt_manipulation.sh
```
or
```bash
. prompt_manipulation.sh
```
and then just call one of the functions!

### Provided functions
```bash
# Description: Echos the prompt prefix as a string
# Arguments: none
function current_prompt() {
    ...
}

# Description: Prefixes the user's shell prompt with a given string.
# Arguments: string to put in front of the prompt.
function prefix_prompt() {
    ...
}

# Description: Suffixes the user's shell prompt with a given string.
# Arguments: string to put behind the prompt.
function suffix_prompt() {
    ...
}

# Description: Replaces the user's shell prompt with a given string.
# Arguments: string to replace the prompt.
function replace_prompt() {
    ...
}

# Description: Reset the prompt to whatever it was before your script ran.
# Should be called every time you use one of the above functions.
# Arguments: none
function reset_prompt() {
    ...
}
```

### Examples

```bash
shell/prompt-manipulation% source prompt_manipulation.sh
shell/prompt-manipulation% current_prompt
%{%}%2~% %# %{%}
shell/prompt-manipulation% prefix_prompt "~~~PREFIX~~~"
~~~PREFIX~~~shell/prompt-manipulation% suffix_prompt "~~~SUFFIX~~~ "
~~~PREFIX~~~shell/prompt-manipulation% ~~~SUFFIX~~~ replace_prompt "~~~"
~~~reset_prompt
```
