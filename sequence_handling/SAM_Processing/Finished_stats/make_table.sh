#!/bin/bash

SAMPLE_LIST=/panfs/roc/groups/9/morrellp/shared/Projects/IPK_Landraces/sequence_handling/SAM_Processing/Finished_stats/stats.list

declare -a SAMPLE_ARRAY=($(grep -E "stat" "${SAMPLE_LIST}"))

for i in {1..137};
        do
                SAMPLE="${SAMPLE_ARRAY[${i}]}"
                total=$(grep "total" "${SAMPLE}" | cut -f 1 -d " ")
		mapped=$(grep "mapped (" "${SAMPLE}" | cut -f 2 -d "(" | cut -f 1 -d "%")
		paired=$(grep "paired (" "${SAMPLE}" | cut -f 2 -d "(" | cut -f 1 -d "%")
		single=$(grep "singletons" "${SAMPLE}" | cut -f 2 -d "(" | cut -f 1 -d "%")
		chr=$(grep "with mate mapped to a different chr" "${SAMPLE}" | head -n 1 | cut -f 1 -d " ")
		echo -e "${total}\t${mapped}\t${paired}\t${single}\t${chr}"
done
