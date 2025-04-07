ACRON=$1
ACRON_FOLDER_PATH=new_platform/bases_for_upload/bases-work/${ACRON}
ACRON_PATH=${ACRON_FOLDER_PATH}/${ACRON}
SOURCE=bases-work/${ACRON}/${ACRON}
ACRON_PIDS=${ACRON_PATH}.article_pids.csv

if [ -f ${SOURCE}.mst ]; then
    if [ ! -d ${ACRON_FOLDER_PATH} ]; then
        mkdir -p ${ACRON_FOLDER_PATH}
    fi
    proc/cisis/i2id ${SOURCE} > ${ACRON_PATH}.id

else
    echo "Not found bases-work/${ACRON}/${ACRON}.mst"    
fi
proc/cisis/mx ${SOURCE} "pft=if v706='h' then v880/ fi" now > ${ACRON_PIDS}
echo "Total ${ACRON} article pids"
wc -l ${ACRON_PIDS}
cat ${ACRON_PIDS} >> new_platform/bases_for_upload/article_pids.csv