#!/bin/sh
#Part1
declare -A hash_map

# argparser

ARGUMENTS=()

for arg in "$@"
do
    case $arg in
        *)
        ARGUMENTS+=("$1")
        shift # Remove generic argument from processing
        ;;
    esac
done

# echo "# Arguments: ${ARGUMENTS[*]}"
# echo "# The size is ${#ARGUMENTS[@]}"

ARG_COUNT=${#ARGUMENTS[@]}

if [ $ARG_COUNT != 1 ]
then
    echo "Correct usage is: sameln.sh DIRECTORY_PATH"
    exit
fi

# echo "# Arg Count is $ARG_COUNT"

DIR_NAME=${ARGUMENTS[0]}

echo "You are trying to access directory: $DIR_NAME"
if ! [ -d $DIR_NAME ]
then
	echo "Directory doesn't exist"
	exit 2
fi	
cd $DIR_NAME
for filee in $(ls -a);do

	if [ -f $filee ] 
	then 
		if   [ -r $filee ] 
		then
	   		if  [ -w $filee ]
			then

				if ! [ -L $filee ]
				then

					hashh=$(md5sum "./$filee" | awk '{ print $1 }')
					echo "$hashh -> './$filee' "
					if [ "${hash_map[$hashh]}"  = "" ]
					then
						echo "added '$filee'"
						hash_map[$hashh]='./$filee'
					else
						rm './$filee'
						ln "./${hash_map[$hashh]}" "./$filee"
						echo "hard link $filee to ${hash_map[$hashh]}"
					fi	
				fi
			fi
		fi

	fi		
		
done	
