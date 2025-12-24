# Calculate the size of a file, symlink, or broken symlink
calculate_size() {
    local bytes=$1

    if ((bytes < 1024 )); then
        printf "%d Bytes (B)" "$bytes"
    elif ((bytes < 1024**2 )); then
        printf "%.2f Kilobytes (KB)" "$(echo "$bytes / 1024" | bc -l)"
    elif ((bytes < 1024**3 )); then
        printf "%.2f Megabytes (MB)" "$(echo "$bytes / 1024 / 1024" | bc -l)"
    elif ((bytes < 1024**4 )); then
        printf "%.2f Gigabytes (GB)" "$(echo "$bytes / 1024 / 1024 / 1024" | bc -l)"
    else
        printf "%.2f Terabytes (TB)" "$(echo "$bytes / 1024 / 1024 / 1024 / 1024" | bc -l)"
    fi
}