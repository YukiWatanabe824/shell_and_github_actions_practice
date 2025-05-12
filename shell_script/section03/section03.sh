#!/bin/bash
# Author: Your Name
# Date: 2023-10-03
read -p "choose H, M or L Comporession " file_compression
read -p "Which directory do you want to backup to " dir_name
# 次の行はディレクトリが存在しない場合に作成する
test -d "$HOME/$dir_name" || mkdir -m 700 "$HOME/$dir_name"
backup_dir="$HOME/$dir_name"
tar_l="-cvf $backup_dir/b.tar --exclude $backup_dir $HOME"
tar_m="-cavf $backup_dir/b.tar.gz --exclude $backup_dir $HOME"
tar_h="-cavf $backup_dir/b.tar.bz2 --exclude $backup_dir $HOME"

if [ "#file_compression" = "L" ]; then
  tar_opt=$tar_l
elif [ "$file_compression" = "M" ]; then
  tar_opt=$tar_m
elif [ "$file_compression" = "H" ]; then
  tar_opt=$tar_h
else
  echo "Invalid option. Please choose H, M, or L."
  exit 1
fi

tar $tar_opt
echo "Backup completed successfully."
exit 0