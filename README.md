
  
<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="bash_scripting_0"></a>bash_scripting</h1>
<p >Description about list.sh</a> --&gt;</p>
<p > Description about sameln.sh</a> --&gt;</p>
<p class="has-line-data" data-line-start="6" data-line-end="13">•   The program gives message when no argument is provided OR wrong argument { be it file or directory_name which does not exist}<br>
•   The program loops over every files that is present in the directory provided in the argument and also displays it, just for the user experience<br>
•   Before iterating over the file, the program checks that the file has read and write permissions as they are required for reading the file and removing { if they are duplicate }<br>
•   The program takes care of the order in which the file has to be deleted. It makes sure that it goes in lexicographical order.<br>
•   The program follows 2 different algorithm, one is <strong>md5sum</strong> in order to generate hash from the file to check the content, other to store hash and file name in <strong>key value pair</strong>, using <strong>Hash Map</strong><br>
•   The program delete the duplicate file and create another file with the same name to hardlink with the original file<br>
•   The program also <strong>handles</strong> the <strong>filename with spaces</strong> or the filename starts with “-”, “*”,&quot;_&quot; . It treats all of them in lexicographical manner</p>
