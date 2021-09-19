function compress -a format -a target -d "Compress the file or directory"

  if test -z "$format"
    echo \uf05c" You must pass the format(ex. tar.gz, zip, ...)."
  end

  if test -z "$target"
    echo \uf05c" You must pass the file or directory."
  end

  set command
  switch $format
    case "tar.gz" "tgz"
      set command "tar -zcvf $target.$format $target"
    case "tar.bz2"
      set command "tar -jcvf $target.$format $target"
    case "tar.xz"
      set command "tar -Jcvf $target.$format $target"
    case "tar"
      set command "tar -cvf $target.$format $target"
    case "zip"
      set command "zip $target.$format $target"
    case "*"
      echo \uf05c" I don't know how to compress it as $format ..."
  end

  echo $command
  eval $command

end


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
