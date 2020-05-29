#!/bin/bash
#version 1

init() {
	USER_HOME="${ROOT_PATH}# poner path directorio home de usuario";
	DIRECTORIO_TICKET="`pwd`";
	DIRECTORIO_DE_TRABAJO="${ROOT_PATH}# poner path del directorio donde esta el proyecto";
	BRANCH_DE_TRABAJO="#nombre del branch de git que se va a usar";

	source "${USER_HOME}/Documents/init.sh.template";
	source "${USER_HOME}/Documents/visualstudio.sh.template";
}

resolve_ROOT_PATH() {
	local bashPath=$( where $( basename $( echo $0 | sed 's@^.*/@/@' ) ) );
	if [[ $bashPath =~ "cygwin" ]]; then ROOT_PATH="/cygdrive/c";
	elif [[ $bashPath =~ "Git" ]]; then ROOT_PATH="C:";
	else { echo "No se puso establecer variable ROOT_PATH"; return 1; }; fi;
}

resolve_ROOT_PATH 
if (( $? == 0 )); 
then {
	init;
}
else {
	echo "Error";
};
fi;

unset resolve_ROOT_PATH;
unset init;
