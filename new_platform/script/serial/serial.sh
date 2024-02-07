
find serial -name "*.mst" | grep "\/base\/" | cut -f 1 -d '.' > new_platform/tmp/serial_list.txt

proc/cisis/mx seq=new_platform/tmp/serial_list.txt lw=9999 "pft=@new_platform/script/serial/serial.pft" now | sort -u> new_platform/tmp/serial_list.sh
chmod +x new_platform/tmp/serial_list.sh
./new_platform/tmp/serial_list.sh
