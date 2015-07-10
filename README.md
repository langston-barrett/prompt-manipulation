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
function current_prompt()

# Description: store the provided prompt as a backup in as many places as we can!
# Arguments: prompt to store
# Returns (echoes): none
function store_prompt()

# Description: The inverse function of store_prompt, deletes all stored variables
# Arguments: none
# Returns (echoes): none
function unstore_prompt()

# Description: store the current prompt as a backup in as many places as we can!
# Arguments: none
# Returns (echoes): none
function store_current_prompt()

# Description: Prefixes the user's shell prompt with a given string.
# Arguments: string to put in front of the prompt.
function prefix_prompt()

# Description: Suffixes the user's shell prompt with a given string.
# Arguments: string to put behind the prompt.
function suffix_prompt()

# Description: Replaces the user's shell prompt with a given string.
# Arguments: string to replace the prompt.
function replace_prompt()

# Description: Reset the prompt to whatever it was before your script ran.
# Should be called every time you use one of the above functions.
# Arguments: none
function reset_prompt()

# Description: Reset the prompt to whatever it was before your script ran.
# The inverse of prefix_prompt, replace_prompt, etc.
# Should be called every time you use one of the above functions.
# Arguments: none
# Returns (echoes): none
function reset_prompt()
```

### Examples

```bash
prompt-manipulation ➤ source prompt-manipulation.sh
prompt-manipulation ➤ current_prompt
%{%}%1~%  ➤%{%}
prompt-manipulation ➤ store_current_prompt
prompt-manipulation ➤ prefix_prompt "---"
---prompt-manipulation ➤ suffix_prompt "--- "
---prompt-manipulation ➤ --- replace_prompt "---"
---reset_prompt
prompt-manipulation ➤
```
