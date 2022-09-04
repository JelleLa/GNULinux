#! /bin/bash
# THIS SCRIPT IS INCOMPLETE
#=================================
# - Title: Compile
# - Author: Jelle Langedijk
# - Filename: `compile.sh`
# - Purpose: Compile any filetype.
#	Based on arguments it "smartly"
#	selects the compile procedure
#=================================

# VARS============================
FILEDIR=$1
if [ -z $FILEDIR ];then
	echo "No file given to compile!"
	return ${FILEDIR} 2> /dev/null
	exit ${FILEDIR}
fi
FILE=$(basename $FILEDIR)
DIR="$(dirname $FILEDIR)"
TYPE="${FILE##*.}"
NAME="${FILE%.*}"

# ZATHURA FUNCTION ===============
function pdfrender (){
	NAME_LOC="$1"
	echo $NAME_LOC
	zathura --synctex-forward :: ${NAME_LOC} 2> /dev/null &
}

# PROCEDURE=======================
printf "Give method of compilation\n"\
"-> doc Compiles Markdown to a .pdf document\n"\
"-> beamer Compiles Markdown to a .pdf beamer presentation\n"\
"-> pdf Compiles LaTeX to a .pdf document using pdflatex\n"\
"-> lua Compiles LaTeX to a .pdf document using lualatex\n"

if [ -z $COMPILATION_METHOD ];then
	printf "Method: "
	read METHOD
	export COMPILATION_METHOD="$METHOD"
fi

if [ -n $TYPE ];then
	case $TYPE in
		md)
		if [ -z $METHOD ];then
			pandoc -s ${FILEDIR} -o ${NAME}.pdf && pdfrender ${NAME}
		else
			case $METHOD in
				doc) pandoc -s ${FILEDIR} -o ${NAME}.pdf && pdfrender ${NAME}.pdf;;
				beamer) pandoc -t beamer ${FILEDIR} -o ${NAME}.pdf && pdfrender ${NAME}.pdf;;
			esac
		fi;;
		tex)
		if [ -z $METHOD ];then
			lualatex ${FILEDIR} && pdfrender ${NAME}.pdf
		else
			case $METHOD in
				pdf) pdflatex ${FILEDIR} && pdfrender ${NAME}.pdf;;
				lua) lualatex ${FILEDIR} && pdfrender ${NAME}.pdf;;
			esac
		fi;;

	esac
else
	echo "'$1' is likely not a compilable file!"
fi
