function nixinstall_preview -a name
    # Assumes the caller nixinstall.fish has created this json file.
    set -l json '/tmp/nixinstall.fish.json'
    set -l fullname 'legacyPackages.x86_64-linux.'$name
    echo $fullname
    jq -r '.["'$fullname'"] | .[]' $json
end
