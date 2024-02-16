SOURCE=$1
SOURCE_PATH=${SOURCE}
DEST=new_platform/bases_for_upload/${SOURCE}
DEST_PARENT="$(dirname "${DEST}")"

if [ ! -f ${DEST}.id ]; then
    if [ -f ${SOURCE}.mst ]; then
        if [ ! -d ${DEST_PARENT} ]; then
            mkdir -p ${DEST_PARENT}
        fi
        proc/cisis/i2id ${SOURCE_PATH} > ${DEST}.id

    else
        echo "Not found ${SOURCE_PATH}.mst"    
    fi
fi
