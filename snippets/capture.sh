#!/bin/bash
# THREADS="1" # set number of threads for process or comment out to utilize 100% of CPU
QUALITY=-1 # -2 for second best, -1 for best

INPUT="${1}"
OUTPUT="${2}" # filepath without extension

if [ "${OUTPUT}" == "" ]; then
	OUTPUT=`basename "${INPUT}"`
fi

if [ "${THREADS}" == "" ]; then
	THREADS_ARG=""
else
	THREADS_ARG="-thread_queue_size ${THREADS} -threads ${THREADS}"
fi

METADATA="${OUTPUT}.txt"
FORMATS=`mktemp`

youtube-dl --list-formats "${INPUT}" > "${FORMATS}"

FORMAT_FULL=`tail ${QUALITY} "${FORMATS}" | head -1`
FORMAT=`echo "${FORMAT_FULL}" | awk -F" " '{print $1}'`
M3U8=`youtube-dl -f "${FORMAT}" -g "${INPUT}"`
STARTED=`date "+%H%M%S-%d-%m-%Y"`
OUTPUT_TS="${OUTPUT}_${STARTED}.ts"

echo "Stream:  ${INPUT}"
echo "Format:  ${FORMAT_FULL}"
echo "Output:  ${OUTPUT_TS}"

if [ -f "${METADATA}" ]; then
	echo " " >> "${METADATA}"
else
	echo "==========================" > "${METADATA}"
	echo " " >> "${METADATA}"
fi

echo "Stream  : ${INPUT}" >> "${METADATA}"
echo "M3U8    : ${M3U8}" >> "${METADATA}"
echo "Format  : ${FORMAT_FULL}" >> "${METADATA}"
echo "Output  : ${OUTPUT_TS}" >> "${METADATA}"
echo "Started : ${STARTED}" >> "${METADATA}"

echo "Starting capture, press 'q' to finish"

# capture with no console output
ffmpeg ${THREADS_ARG} -i "${M3U8}" -loglevel warning -hide_banner -c copy "${OUTPUT_TS}"
# press q to finish capturing stream

FINISHED=`date "+%H%M%S-%d-%m-%Y"`
echo "Finished capturing at ${FINISHED}"
echo "Finished : ${FINISHED}" >> "${METADATA}"

if [ "${3}" == "convert" ]; then
	OUTPUT_MKV="${OUTPUT}_${STARTED}_to_${FINISHED}.mkv"
	echo "Creating MKV file ${OUTPUT_MKV}..."
	ffmpeg ${THREADS_ARG} -i "${OUTPUT_TS}" -loglevel warning -hide_banner -map 0 -c copy "${OUTPUT_MKV}"
	echo "Created ${OUTPUT_MKV}"
	echo "MKV      : ${OUTPUT_MKV}" >> "${METADATA}"
fi

echo " " >> "${METADATA}"
echo "==========================" >> "${METADATA}"
echo "Cleaning up..."
# cleanup
rm -f "${FORMATS}"

echo "Completed capturing ${INPUT}"
