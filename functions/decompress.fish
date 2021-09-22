function decompress -a target -d "Decompress the compressed file or directory."

  if test -z "$target"
    echo \uf05c" You must pass the file or directory."
  end

  set command
  switch $target
    case "*.tar.gz" "*.tgz"
      set command "tar -zxvf $target"
    case "*.tar.bz2"
      set command "tar -jxvf $target"
    case "*.tar.xz"
      set command "tar -Jxvf $target"
    case "*.tar"
      set command "tar -xvf $target"
    case "*.zip" "*.jar"
      set command "unzip $target"
    case "*"
      echo \uf05c" I don't know how to decompress it as $argv[1] ..."
  end

  echo $command
  eval $command

end
