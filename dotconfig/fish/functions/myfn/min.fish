function min
  if test $argv[1] -lt $argv[2]
    echo $argv[1]
  else
    echo $argv[2]
  end
end
