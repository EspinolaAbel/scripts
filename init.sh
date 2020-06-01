#!/bin/bash

# TODO: Algunas cosas que ya no andan:
# ideEclipseAbrir
# ideVisualstudiocodeAbrir
# ideVisualstudioAbrir

init() {
	USER_HOME="${ROOT_PATH}"#TODO
	DIRECTORIO_TICKET="`pwd`";
	DIRECTORIO_DE_TRABAJO="${ROOT_PATH}/"#TODO
	BRANCH_DE_TRABAJO="";#TODO

	source "${USER_HOME}Documents/bash-scripts/init.sh.template";
	source "${USER_HOME}Documents/bash-scripts/visualstudio.sh.template";
}

resolve_ROOT_PATH() {
	local bashPath=$( where $( basename $( echo $0 | sed 's@^-*@@' ) ) );
	if [[ $bashPath =~ "cygwin" ]]; then ROOT_PATH="/cygdrive/c";
	elif [[ $bashPath =~ "Git" ]]; then ROOT_PATH="C:";
	else { echo "No se puso establecer variable ROOT_PATH"; return 1; }; fi;
}

resolve_ROOT_PATH 
if (( $? == 0 )); 
then init;
else echo "Error";
fi;

unset resolve_ROOT_PATH;
unset init;

