set modes \
config_dialog \
dictionary_tool \
word_register_dialog \
hand_writing \
character_palette
set arguments "--mode="$modes
complete -c mozc_tool -x -a '$arguments'
