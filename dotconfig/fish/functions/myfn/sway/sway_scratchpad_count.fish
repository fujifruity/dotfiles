function sway_scratchpad_count --description 'How many scratch pads sway has'
  count (swaymsg -t get_tree | string join0 | string match -r '__i3_scratch.*?focus.*?(\[.*?\])' | tail -n1 | string match -ra '\d+')
end
