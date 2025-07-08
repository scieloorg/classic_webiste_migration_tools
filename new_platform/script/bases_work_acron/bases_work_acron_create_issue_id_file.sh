ACRON=$1
ISSUE_FOLDER=$2
ISSUE_YEAR=$3

ACRON_FOLDER_PATH=new_platform/bases_for_upload/bases-work/${ACRON}
ACRON_PATH=${ACRON_FOLDER_PATH}/${ACRON}
SOURCE=bases-work/${ACRON}/${ACRON}

TMP_ACRON_ISSUE_PIDS=new_platform/tmp/${ACRON}_${ISSUE_FOLDER}_pids.csv
TMP_ACRON_ISSUE_FOLDER=new_platform/tmp/${ACRON}_${ISSUE_FOLDER}

if [ -f ${SOURCE}.mst ]; then
    if [ ! -d ${ACRON_FOLDER_PATH} ]; then
        mkdir -p ${ACRON_FOLDER_PATH}
    fi
    proc/cisis/mx null create=${TMP_ACRON_ISSUE_FOLDER} now -all
    proc/cisis/mx ${SOURCE} "bool=${ISSUE_FOLDER}" append=${TMP_ACRON_ISSUE_FOLDER} now -all
    proc/cisis/i2id ${TMP_ACRON_ISSUE_FOLDER} > ${ACRON_PATH}_${ISSUE_YEAR}_${ISSUE_FOLDER}.id

    proc/cisis/mx ${TMP_ACRON_ISSUE_FOLDER} "pft=if v706='h' then v880/ fi" now > ${TMP_ACRON_ISSUE_PIDS}
    echo "Total ${ACRON} ${ISSUE_FOLDER} article pids"
    wc -l ${TMP_ACRON_ISSUE_PIDS}
    cat ${TMP_ACRON_ISSUE_PIDS} >> new_platform/bases_for_upload/article_pids.csv

    rm -rf ${TMP_ACRON_ISSUE_PIDS}
    rm -rf ${TMP_ACRON_ISSUE_FOLDER}.*
else
    echo "Not found bases-work/${ACRON}/${ACRON}.mst"    
fi
