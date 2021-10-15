#!/usr/bin/env bash

SCM_THEME_PROMPT_PREFIX=" ${purple}"
SCM_THEME_PROMPT_SUFFIX=" ${normal}"
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"
SCM_GIT_SHOW_DETAILS="false"


function prompt_command() {
    if [[ -n $(condaenv_prompt) ]]; then
        PYTHON_ENV_INFO=" ${bold_white}($(condaenv_prompt))${normal}"
    elif [[ -n $(virtualenv_prompt) ]]; then
        PYTHON_ENV_INFO="${bold_white}$(virtualenv_prompt)${normal}"
    else
        PYTHON_ENV_INFO=""
    fi
	PS1="${yellow}\u${normal}${cyan}@\h${normal}${purple}$PYTHON_ENV_INFO ${normal}${green}\w${normal}$(scm_prompt_info)> "
}

safe_append_prompt_command prompt_command
