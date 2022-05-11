function launcher_guide
    dunstify (\
        cat ~/.config/i3/config |\
        string join0 |\
        string match -r '(?<="Launcher" {).*?(?=})' |\
        string match -ar "\w(?=\s+exec)" |\
        string join ' '
    )
end

