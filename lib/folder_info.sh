# Outputs the info of the folder
get_folder_info() {
    echo
    printf "\e[32m=== Folder Info ===\e[0m\n"
    file_type=$(file -b "$absolute_path")

    # The Size, Permissions, Owner, Group, Modified, Accessed, Created, and Inode
    # stat lines aren't indented because they will also apear indented on the cli,
    # making it look weird.
    stat -c "Type: $file_type
Permissions: %A
Owner: %U
Group: %G
Modified: %y
Accessed: %x
Created: %w
Inode: %i" "$absolute_path"

    echo "Path: "$(realpath "$absolute_path")""
    echo
}