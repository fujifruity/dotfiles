function json_escape
	wl-paste | string join '\r\n' | string replace -a '"' '\\"' | wl-copy 
end
