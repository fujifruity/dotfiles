function del
    mv --backup=numbered $argv /tmp
    and echo 'moved to /tmp :'
    and echo $argv
end
