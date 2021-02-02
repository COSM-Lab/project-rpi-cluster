#!/bin/bash

#проверка подключение флешки /dev/sdb если есть, то делаем dd

if sudo fdisk /dev/sdb -l; then 
  #проверка наличия имаджа в папке
  IMAGES="*.img"
  if compgen -G "$IMAGES" ; then
    echo -e "Image exists in directory.\nPrepare for dd..."

    GET_LAST_IMAGE="ls *.img | sort -r"
    ## $GET_LAST_IMAGE это список, надо брать только верхний элемент
    LAST_IMAGE=$(eval "$GET_LAST_IMAGE")
     
    echo -e "\nLast builded image: $LAST_IMAGE\nBurning to sd card..."
    # dd имадж на флешку
    BURN_IMAGE="time sudo dd bs=4M if=$LAST_IMAGE of=/dev/sdb conv=fsync"
    RESULT=$(eval "$BURN_IMAGE")
    echo "$RESULT"
    else
    echo -e "\nNo any image!"
    exit 1
  fi
  echo -e "\nSuccess"
else 
    echo -e "\ndd Failed. No any sdcard..."
fi