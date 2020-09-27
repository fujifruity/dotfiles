function refresh --description "Run this upon resume. Refreshes some services."
    
    logger refresh
    # connmanctl disable wifi 
    auto_backlight 
    # connmanctl enable wifi 
    systemctl --user restart redshift

end
