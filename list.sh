#!/bin/bash
clear
echo "---------------------------------------------------------"
echo "       ___           __    ____          "
echo "      / _ \___ _____/ /_  / __ \___  ___ "
echo "     / ___/ _  / __/ __/ / /_/ / _ \/ -_)"
echo "    /_/   \_,_/_/  \__/  \____/_//_/\__/ "
echo "---------------------------------------------------------"



while [ $# -gt 0 ] ; do # '$#' points to all the positional parameters passed as an argument
  case $1 in

    F) # the column number for file name
      arg="$arg\$9, " #column is present in 9th column of ls -l
      tit=("${tit[@]}" "File name (F)") #title display
      unl=("${unl[@]}" "-------------")
      fmt="$fmt%-35s" #space formatting
      ;;
    P) # the column number for permission
      arg="$arg\$1, " #column is present in 1st column of ls -l
      tit=("${tit[@]}" "Permissions (P)")
      unl=("${unl[@]}" "---------------")
      fmt="$fmt%-17s" #space formatting
      ;;
    T) # the column number for time
      arg="$arg\$8, " #column is present in 8th column of ls -l
      tit=("${tit[@]}" "Time (T)")
      unl=("${unl[@]}" "--------")
      fmt="$fmt%-10s" #space formatting
      ;;
    D) # the column number for date
      arg="$arg\$6\" \"\$7, " #column is present in 6th and 7th column of ls -l, considering month and day
      tit=("${tit[@]}" "Date (D)")
      unl=("${unl[@]}" "--------")
      fmt="$fmt%-10s" #space formatting
      ;;
    *)
      echo "invalid option $1" 
      exit 1
  esac
  shift #move the cmd line argument to one position left
done

if [ -z "$arg" ] ; then #argument validation
  echo "Invalid use of the command. Please provide parameters { F , D , T, P } to view the output"
  exit 2
fi

arg=${arg%, } # remove trailing comma and space from $arg

printf "$fmt\\n" "${tit[@]}"
printf "$fmt\\n" "${unl[@]}"

ls -l | grep -v '^total' > listout #ignoring the first line of the command 'ls -l' and redirecting the output to file name listout

grep -v "^total" listout | 
  awk "{ printf \"$fmt\\n\", $arg}" #fetching output from listout in the proper format

# finding the other details which were required - no. of files, normal files and directories
tf=$(cat listout | wc -l)
tnf=$(grep '^-' listout | wc -l)
td=$(grep '^d' listout | wc -l)

echo
echo "Total number of files:           $tf"
echo "Total number of normal files:    $tnf"
echo "Total number of directories:     $td"
