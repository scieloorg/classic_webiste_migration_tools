chmod +x new_platform/script/*/*.sh

if [ ! -f proc/cisis/i2id ]; then
    echo "migration must be installed in the same directory as bases, bases-work and proc"
    exit
fi

if [ ! -d new_platform/tmp ]; then
    mkdir -p new_platform/tmp
fi

if [ ! -d new_platform/bases_for_upload ]; then
    mkdir -p new_platform/bases_for_upload
fi


echo "...."
echo "Create new_platform/bases_for_upload/title.id"
proc/cisis/i2id bases/title/title > new_platform/bases_for_upload/title.id

echo "Create new_platform/bases_for_upload/issue.id"
proc/cisis/i2id bases/issue/issue > new_platform/bases_for_upload/issue.id

if [ -d serial ]; then
    echo "Create id files for serial"
    echo "...."
    ./new_platform/script/serial/serial.sh
    echo "...."
fi

echo "Create script ./new_platform/tmp/create_bases_work_acron.sh"
proc/cisis/mx bases/title/title lw=9999 "pft=@new_platform/script/bases_work_acron/bases_work_acron.pft" now | tr '[:upper:]' '[:lower:]' | sort -u > new_platform/tmp/create_bases_work_acron.sh

chmod +x new_platform/tmp/create_bases_work_acron.sh

echo "Create id files for bases-work/acron/acron"
echo "......."
./new_platform/tmp/create_bases_work_acron.sh
echo "...."

if [ -d bases/artigo/p ]; then
    echo "Create id files for bases-work/artigo/p"
    echo "...."
    ./new_platform/script/bases_p/bases_p.sh
    echo "...."
fi

echo "Created id files"
echo "...."
find new_platform/bases_for_upload -name "*.id"


