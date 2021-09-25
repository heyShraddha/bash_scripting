#!/bin/bash
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
    echo "Command accepts only one argument, which should be directory"
    echo "Correct usage is: sameln.sh DIRECTORY_PATH" #It takes only one argument
    exit
fi

# echo "# Arg Count is $ARG_COUNT"


clear
echo "          ______          _     _____             "
echo "          | ___ \        | |   |_   _|            "
echo "          | |_/ /_ _ _ __| |_    | |_      _____  "
echo "          |  __/ _  |  __| __|   | \ \ /\ / / _ \ "
echo "          | | | (_| | |  | |_    | |\ V  V / (_) |"
echo "          \_|  \__,_|_|   \__|   \_/ \_/\_/ \___/ "

DIR_NAME=${ARGUMENTS[0]}
echo "---------------------------------------------------------"
echo "Performing operations under directory: $DIR_NAME" #displays the user parameter passed, for better user experience
if ! [ -d $DIR_NAME ] #check for the parameter passed
then
        echo "Directory doesn't exist" 
        exit 2
fi
cd $DIR_NAME  #moving inside the directory passsed
echo "---------------------------------------------------------"
for filee in *;do #checks for everything inside the directory passed in argument
	  
        if [[ -f $filee  ]]; # checks, if it is file or directory --> -f is for file, -d is for directory
	then
                if   [[ -r $filee ]]; # checks, if the file has read permissions --> -r is for read 
                then
                        if  [[ -w $filee ]]; # checks, if the file has write permissions --> -w is for write 
                        then

                                if ! [[ -L $filee ]]; #ignoring the file having symbolic links
                                then
                                        echo "---------------------------------------------------------"
                                        echo "Handling File with the file name:  $filee"
                                        hashh=$(md5sum ./"$filee" | awk '{ print $1 }') #taking out only the first argument, which is hash value
                                        #echo "$hashh -> $filee"
                                        if [ "${hash_map[$hashh]}"  = "" ] # checks, if the hash already exist in hash map
                                        then
                                                echo "Added $filee to the Hash Map" # prints the file whose hash doesnt exist in map
                                                hash_map[$hashh]="$filee" #defines the key value pair { hash value and filename }
                                        else

                                                rm ./"$filee" #removing the file which is the duplicate 
                                                ln ./"${hash_map[$hashh]}" ./"$filee" #added a hard link to the file with the same name of deleted file
                                                echo "Hard link $filee to ${hash_map[$hashh]}" #prints
                                        fi
                                        #else
                                                #Silently Ignoring as it is symbolically linked" 
                                fi
                                
                        else
                                echo "The file $filee does not have write permission. Please provide, if you want to run this script for the same"
                        fi      
                else
                        echo "The file $filee does not have read permission. Please provide, if you want to run this script for the same"     
                fi  
        #else
                #Silently Ignoring as it is a directory" 
        fi
done
echo "---------------------------------------------------------"
echo "---------------------------------------------------------"         


