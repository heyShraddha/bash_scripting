
  
<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="bash_scripting_0"></a>bash_scripting</h1>
<p >Description about list.sh</a> --&gt;</p>
• This shell script displays the contents of a directory from where it's being ran based on the positional arguments being passed. <br>
• This shell script takes care of any unknown character being passed as positional parameter or empty values.<br>
• The positions of the columns namely File(F), Permission(P), Time(T), Date(D) in the output of the command "ls -l" are being hard coded into the respective
variables.<br>
• Based on the order and the type of the arguments being passed the column numbers are being assigned to the respective variables
along with the name of the columns. This is executed using while loop and case statement in Shell script.<br>
• Once it got executed the script takes care of displaying the parameters name being passed and redirect the output of "ls -l"<br>
except the first line to a file name "listout". The "listout" file will be created everytime the script is being ran.<br>
• Finally it displays the contents of the directory by using grep and "awk" command along with displaying the total number of files,
normal files and directories.<br>

<br/>
<br/>
<p > Description about sameln.sh</a> --&gt;</p>
<p class="has-line-data" data-line-start="6" data-line-end="13">•   The program gives message when no argument is provided OR wrong argument { be it file or directory_name which does not exist}<br>
•   The program loops over every files that is present in the directory provided in the argument and also displays it, just for the user experience<br>
•   Before iterating over the file, the program checks that the file has read and write permissions as they are required for reading the file and removing { if they are duplicate }. It prompts the user if the file does not have the required permissions.<br>
•   The program takes care of the order in which the file has to be deleted. It make sure that the file appears first in lexicographical order, including leading special characters like '.' , '-' etc is kept as the original file and every other file that comes after it is hard linked.<br>
•   The program follows 2 different algorithm, one is <strong>md5sum</strong> in order to generate hash from the file to check the content, other to store hash and file name in <strong>key value pair</strong>, using <strong>Hash Map</strong><br>
•   The program silently ignores directories and soft links as when they are found, according to the question. However, we have left out commented code, which can account for a message when soft linked files or directories are found. { Line Number 78 and 88 } <br/>
•   As the question states, "If the file is not readable to you" we are assuming, by 'readable' it is referring to file permission unavailability which, if it occurs, is prompted to the user. <br>
•   The program delete the duplicate file and create another file with the same name to hardlink with the original file<br>
•   The program also <strong>handles</strong> the <strong>filename with spaces</strong> or the filename starts with “-”, “*”,&quot;_&quot; . It treats all of them in lexicographical manner. The only assumption that was made is that the directory name passed as an argument, is expected to not have any spaces. The program does work with the directory having special characters in their name.


