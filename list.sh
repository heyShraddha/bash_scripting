#!/bin/bash

while [ $# -gt 0 ] ; do
  case $1 in

    F) 
      arg="$arg\$9, " 
      tit=("${tit[@]}" "File name (F)")
      unl=("${unl[@]}" "-------------")
      fmt="$fmt%-35s"
      ;;
    P) 
      arg="$arg\$1, " 
      tit=("${tit[@]}" "Permissions (P)")
      unl=("${unl[@]}" "---------------")
      fmt="$fmt%-17s"
      ;;
    T) 
      arg="$arg\$8, "
      tit=("${tit[@]}" "Time (T)")
      unl=("${unl[@]}" "--------")
      fmt="$fmt%-10s"
      ;;
    D) 
      arg="$arg\$6\" \"\$7, "
      tit=("${tit[@]}" "Date (D)")
      unl=("${unl[@]}" "--------")
      fmt="$fmt%-10s"
      ;;
    *)
      echo "invalid option $1"
      exit 1
  esac
  shift
done

if [ -z "$arg" ] ; then
  echo "missing options"
  exit 2
fi

arg=${arg%, } # remove trailing comma and space from $arg

printf "$fmt\\n" "${tit[@]}"
printf "$fmt\\n" "${unl[@]}"

ls -l | grep -v '^total' > listout

grep -v "^total" listout | 
  awk "{ printf \"$fmt\\n\", $arg}"

tf=$(cat listout | wc -l)
tnf=$(grep '^-' listout | wc -l)
td=$(grep '^d' listout | wc -l)

echo
echo "Total number of files:           $tf"
echo "Total number of normal files:    $tnf"
echo "Total number of directories:     $td"