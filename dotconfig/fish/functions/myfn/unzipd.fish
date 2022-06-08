function unzipd --argument f
    set name (basename $f .zip)
    unzip $f -d $name
end
