cd bases
find artigo/p -name "*.mst" | cut -f 1 -d '.' > ../new_platform/tmp/p_list.txt
cd ..

proc/cisis/mx seq=new_platform/tmp/p_list.txt lw=9999 "pft=@new_platform/script/bases_p.pft" now | sort -u> new_platform/tmp/p_list.sh
chmod +x new_platform/tmp/p_list.sh
./new_platform/tmp/p_list.sh
