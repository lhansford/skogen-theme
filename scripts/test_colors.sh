COLOR_SCRIPT_REPO=https://api.github.com/repos/stark/Color-Scripts/contents/color-scripts
wget -q -O - $(curl -s $COLOR_SCRIPT_REPO | jq '.[] | "\(.path) \(.download_url)"' -r | shuf -n1 | cut -d " " -f2) | bash
