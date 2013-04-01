#!/usr/bin/env bash

#
# HJ Jacobs
# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
#
# Script for downloading the current PragPub (http://pragprog.com/magazines) in mobi format
# and mailing the file to my kindle.
#

# Location settings
DOWNLOAD_PATH="$( cd "$( dirname "$0" )" && pwd )"

# WGet options: normal verbose (nv) directory prefix (-P)
WGET_OPTS="-nv -P ${DOWNLOAD_PATH}"

# Pragmatic Pub settings
PB_YEAR=`date +%Y`
PB_MONTH=`date +%m`
PB_MAGAZINE="pragpub-${PB_YEAR}-${PB_MONTH}.mobi"
PB_URL="http://magazines.pragprog.com/${PB_YEAR}/${PB_MAGAZINE}"

# Mail settings
KINDLE_ADDRESS="PUT YOUR KINDLE MAIL ADDRESS HERE"

function mail-mobi {
	echo "Mailing ${PB_MAGAZINE} to ${KINDLE_ADDRESS}" 1>&2

	echo | mutt -s "Sending ${PB_MAGAZINE} to kindle" -a ${DOWNLOAD_PATH}/${PB_MAGAZINE} -- ${KINDLE_ADDRESS} 1>&2
}

echo "Checking if ${DOWNLOAD_PATH}/${PB_MAGAZINE} is present"  1>&2

if [[ ! -f "${DOWNLOAD_PATH}/${PB_MAGAZINE}" ]]; then
	echo "Downloading ${PB_MAGAZINE}"  1>&2

	wget ${WGET_OPTS} ${PB_URL}
	
	if [[ $? -eq 0 ]]; then
		mail-mobi
	else
		echo "Unable to download ${PB_MAGAZINE}. May not yet be available."  1>&2
	fi
else
	echo "${PB_MAGAZINE} already downloaded." 1>&2
	
	if [[ $1 = "-m" ]]; then
		mail-mobi
	else
		echo "Doing nothing.." 1>&2
	fi
fi

