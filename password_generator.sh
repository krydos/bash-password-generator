#!/usr/bin/bash

#symbols array
symbolsArray=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9)

#password string accum
passwordString=""

#length of the password
length=$1

#command for copy password to the clipboard
copy_to_clipboard_command="xclip -selection clipboard"
uname=`uname`

if [[ "$uname" == "Darwin" ]]; then
    copy_to_clipboard_command="pbcopy"
fi


#counter for loop
counter=0
while [ $counter -lt $length ]; do
    passwordString=$passwordString${symbolsArray[$(( ( RANDOM % ${#symbolsArray[*]} )  + 1 ))]}
    let counter=counter+1
done

echo $passwordString
echo $passwordString | `$copy_to_clipboard_command`
