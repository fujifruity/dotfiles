function guixlastlog
zcat (ls -trd /var/log/guix/drvs/** | tail -1) | less
end
