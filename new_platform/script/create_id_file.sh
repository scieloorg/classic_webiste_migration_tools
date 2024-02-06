ACRON=$1
ACRON_FOLDER_PATH=new_platform/bases_for_upload/bases-work/${ACRON}
ACRON_PATH=${ACRON_FOLDER_PATH}/${ACRON}
SOURCE=bases-work/${ACRON}/${ACRON}


if [ -f ${SOURCE}.mst ]; then
    if [ ! -d ${ACRON_FOLDER_PATH} ]; then
        mkdir -p ${ACRON_FOLDER_PATH}
    fi

    echo "Create ${ACRON_PATH}.id"
    proc/cisis/id2i ${SOURCE} > ${ACRON_PATH}.id

else
    echo "Not found bases-work/${ACRON}/${ACRON}.mst"    
fi
