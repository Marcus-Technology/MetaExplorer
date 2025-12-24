lib_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$lib_dir/helpers/calculate_file_size.sh"

# Outputs info of the symlink
get_symlink_info() {
    bytes=$(stat -c %s "$symlink_path")
    size=$(calculate_size "$bytes")
    file_type=$(file -b "$symlink_path")

    echo
    printf "\e[32m=== Symlink Info ===\e[0m\n"
    
    # The Size, Permissions, Owner, Group, Modified, Accessed, Created, and Inode
    # stat lines aren't indented because they will also apear indented on the cli,
    # making it look weird.
    stat -c "Type: $file_type
Size: $size
Permissions: %A
Owner: %U
Group: %G
Modified: %y
Accessed: %x
Created: %w
Inode: %i" "$symlink_path"

    echo "Mime Type: $(file --mime-type -b "$symlink_path")"
    echo "Magic Bytes: $(xxd -l 16 "$symlink_path")"
    echo "Path: $symlink_path"

    echo "Symlink Resolution: $(readlink -f "$symlink_path")"
    
    echo
}