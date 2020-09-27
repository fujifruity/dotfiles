function del
    mv --backup=numbered $argv /tmp
    and echo deleted:
    and echo $argv
end
