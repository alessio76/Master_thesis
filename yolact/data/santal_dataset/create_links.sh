input_directory="/mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/santal_juice_dataset/val"

output_directory="dataset/val"

for dir in "$input_directory"/*; do
    echo $dir
    # Extract the subdirectory name
    subdirectory_name=$(basename "$dir")
    
    # Create symbolic link
    ln -s "$dir" "$output_directory/${subdirectory_name}"
    
    # Optionally, you can print a message for each symbolic link created
    echo "Symbolic link created for '$subdirectory_name'"
done
