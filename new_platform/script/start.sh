chmod +x new_platform/script/*.sh

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

echo "Create script ./new_platform/tmp/script.sh"
proc/cisis/mx bases/title/title lw=9999 "pft=@new_platform/script/commands.pft" now | tr '[:upper:]' '[:lower:]' | sort -u > new_platform/tmp/script.sh

chmod +x new_platform/tmp/script.sh

echo "Create id files for bases-work/acron/acron"
echo "......."
./new_platform/tmp/script.sh
echo "...."

if [ -d bases/artigo/p ]; then
    echo "Created id files for bases-work/artigo/p"
    echo "...."
    ./new_platform/script/bases_p.sh
    echo "...."
fi

echo "Created id files"
find new_platform/bases_for_upload -name "*.id"


