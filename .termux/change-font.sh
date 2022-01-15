#!/data/data/com.termux/files/usr/bin/bash

# Colors
NC="\e[0m"              # No Color
BLACK='\e[1;30m'        # Black
RED='\e[1;31m'          # Red
GREEN='\e[1;32m'        # Green
YELLOW='\e[1;33m'       # Yellow
BLUE='\e[0;34m'         # Blue
PURPLE='\e[1;35m'       # Purple
CYAN='\e[1;36m'         # Cyan
WHITE='\e[1;37m'        # White

# Functions
error   () { echo -e "${RED}${*}${NC}";exit 1;:; }
warning () { echo -e "${YELLOW}${*}${NC}";:; }
info    () { echo -e "${GREEN}-----";echo -e "# ${*}";echo -e "-----${NC}";:; }
log     () { echo -e "${BLUE}${*}${NC}";:; }

info "Change Font"

mv font.ttf temp.ttf
mv alternative.ttf font.ttf
mv temp.ttf alternative.ttf

warning "Please Restart Termux!"

exit
