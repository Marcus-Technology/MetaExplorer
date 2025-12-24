lib_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$lib_dir/helpers/calculate_file_size.sh"

# Outputs info of the file.
get_file_info() {
    bytes=$(stat -c %s "$absolute_path")
    size=$(calculate_size "$bytes")
    file_type=$(file -b "$absolute_path")

    echo

    printf "\e[32m=== File Info ===\e[0m\n"
    
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
Inode: %i" "$absolute_path"

    echo "Mime Type: $(file --mime-type -b "$absolute_path")"
    echo "Magic Bytes: $(xxd -l 16 "$absolute_path")"
    echo "Path: "$(realpath "$absolute_path")""
    
    echo

    if (!($no_hashes)); then
        printf "\e[32m=== File Hashes ===\e[0m\n"
        echo "MD5: $(md5sum "$absolute_path" | awk '{print $1}')"
        echo "SHA-1: $(sha1sum "$absolute_path" | awk '{print $1}')"
        echo "SHA-224: $(sha224sum "$absolute_path" | awk '{print $1}')"
        echo "SHA-256: $(sha256sum "$absolute_path" | awk '{print $1}')"
        echo "SHA-384: $(sha384sum "$absolute_path" | awk '{print $1}')"
        echo "SHA-512: $(sha512sum "$absolute_path" | awk '{print $1}')"
        echo
    fi
}