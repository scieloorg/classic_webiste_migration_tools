# artigo/p/0034-8910/1996/0005/00013
SOURCE=$1
SOURCE_PATH=bases/${SOURCE}
DEST=new_platform/bases_for_upload/bases-work/${SOURCE}
DEST_PARENT="$(dirname "${DEST}")"

if [ ! -f ${DEST}.id ]; then
    if [ -f bases/${SOURCE}.mst ]; then
        if [ ! -d ${DEST_PARENT} ]; then
            mkdir -p ${DEST_PARENT}
        fi
        proc/cisis/i2id ${SOURCE_PATH} > ${DEST}.id

    else
        echo "Not found ${SOURCE_PATH}.mst"    
    fi
fi
