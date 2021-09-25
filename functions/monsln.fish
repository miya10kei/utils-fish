function monsln -a src -a dest
  argparse 'h/help' -- $argv
  or return 1

  if set -lq _flag_help
    echo -e '\033[1mNAME\033[0m'
    echo -e '    monsln - Move file or directory and link it back as symbolic.\n'
    echo -e '\033[1mSYNOPSIS\033[0m'
    echo -e '    monsln [SOURCE(file/directory)] [DESTINATION(direcotry)]'
    return 0
  end

  if not test -e $src
    echo "must pass source file or directory" > /dev/stderr
    return 1
  end

  if test -z "$dest"
    echo "must pass destination directory" > /dev/stderr
    return 1
  end

  if not test -e $dest
    mkdir -p $dest
  end

  set -l dest_path (echo $dest | sed 's/\/$//')"/"(basename $src)
  mv $src $dest_path
  ln -s $dest_path $src

  echo -e "\033[0;92mlink $dest_path to $src\033[0;0m"
end
