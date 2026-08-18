#!/bin/bash

# Bars characters
bar="▁▂▃▄▅▆▇█"
dict="s/;//g"
bar_length=${#bar}

# Build sed dictionary
for ((i=0; i<bar_length; i++)); do
    dict+=";s/$i/${bar:$i:1}/g"
done

# Temporary cava config
config_file="/tmp/waybar_cava"

cat > "$config_file" << EOF
[general]
framerate = 60
bars = 14

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 4
EOF

# Kill previous instance
pkill -f "cava -p $config_file" 2>/dev/null

# Run cava
cava -p "$config_file" | sed -u "$dict"
