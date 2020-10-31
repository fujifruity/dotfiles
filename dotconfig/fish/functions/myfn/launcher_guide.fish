function launcher_guide
    notify-send (\
        cat ~/.config/i3/config |\
        string join0 |\
        string match -r '(?<="Launcher" {).*?(?=})' |\
        string match -ar "\w(?=\s+exec)" |\
        string join ' '
    )
end

