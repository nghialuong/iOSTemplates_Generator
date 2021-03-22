#!/bin/bash

input=$1

if [ -z "$input" ]; then 
    echo "||==== 🐛 There is no feature name, please input it as format './template_gen.sh <feature name>', try again ... 🐛 ====||"
    exit 1
fi

echo $'\n'
echo "Here are the options:"
echo "1. MVP Builder FullScreenModal Module"
echo "2. MVP Builder Module"
echo "3. Builder"
echo "4. MVP Builder Module - Test"
echo "5. Builder - Test"
echo $'\n'
echo "Please enter option number (1/2/3/4/5):"
read option

re='^[1-5]+$'
if ! [[ $option =~ $re ]] ; then
   echo "||==== 🐛 There is no such that option, please try again ... ====||" >&2
   exit 1
fi

template_directory=""
if [ "$option" -eq "1" ]
then
  template_directory="MVP_Builder_FullScreenModal_Module"
elif [ "$option" -eq "2" ]
then 
  template_directory="MVP_Builder_FullScreenModal"
elif [ "$option" -eq "3" ]
then
  template_directory="Builder"
elif [ "$option" -eq "4" ]
then 
  template_directory="MVP_Builder_Test_Module"
elif [ "$option" -eq "5" ]
then 
  template_directory="Builder_Test"
fi

cd ./$template_directory

echo $'\n'

### Copy to the feature folder ####
feature_folder_name=$input
if [[ ! -d $feature_folder_name ]] 
then 
    mkdir $feature_folder_name
fi

if [ "$(ls -A $feature_folder_name)" ]; then
    rm -r $feature_folder_name/*
fi


# Copy from Original to Feature folder
original_folder_name="Original"
cp -a "./$original_folder_name/" "./$feature_folder_name"

#### Copy and change file name ####
filename_searchtext="___FILEBASENAME___"
replace_text=$input
cd ./$original_folder_name
source_files_string=$(find -P . -name "*.swift")
cd ..

source_files=($source_files_string)

for index in ${!source_files[@]};
do
    suffix_path="${source_files[$index]:1}"
    source_path="$feature_folder_name$suffix_path"
    # echo $source_path
    dest_path=${source_path/$filename_searchtext/$replace_text}

    # Rename file
    mv $source_path $dest_path

    # Replacing
    search_text="___VARIABLE_productName___"
    if [[ $search_text != "" && $replace_text != "" ]]
    then
        sed -i -e "s/$search_text/$replace_text/g" $dest_path 
    fi

    # Remove old file
    unsed_dest_file="$dest_path-e"
    rm $unsed_dest_file

    if [[ -f $unsed_dest_file ]]
    then
        echo "||==== Error: File $unsed_dest_file has not been removed. ====||"
    fi

    echo "||==== File '$dest_path' has been genereted 🚀. ====||"
done

open .
cd ..

echo $'\n'
echo "||==== Creating $template_directory template has successfully finished 🙌 ====||"
