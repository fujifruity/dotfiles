# Defined in /tmp/fish.hKS3TG/countup.fish @ line 2
function countup --argument start
for i in (seq $start 1000)
echo -ne (date -d@$i -u +%H:%M:%S)"\033[0K\r"
sleep 1
end
end
