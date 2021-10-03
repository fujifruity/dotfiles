function pipefailed
    echo $pipestatus | tr ' ' '+' | math | read sum
    test $sum -ne 0
end
