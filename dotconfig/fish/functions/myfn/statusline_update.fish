function statusline_update
    set -U statusline_update (math "bitxor(1,"$statusline_update")")
end
