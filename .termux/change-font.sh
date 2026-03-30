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

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

info "Change Font"

# Collect all .ttf files except font.ttf (current active font)
fonts=()
while IFS= read -r f; do
    fonts+=("$f")
done < <(find "$SCRIPT_DIR" -maxdepth 1 -name "*.ttf" ! -name "font.ttf" -printf "%f\n" | sort)

# Check if there are alternative fonts available
if [ ${#fonts[@]} -eq 0 ]; then
    error "No alternative font files found!"
fi

# Display the list of available fonts
echo ""
log "Current font: font.ttf"
echo ""
log "Available fonts:"
echo ""

for i in "${!fonts[@]}"; do
    echo -e "  ${CYAN}[$((i+1))]${NC} ${fonts[$i]}"
done

echo ""
echo -e "  ${CYAN}[0]${NC} Cancel"
echo ""

# Prompt user to select a font
echo -ne "${PURPLE}Select a font number: ${NC}"
read -r choice

# Validate input
if [[ -z "$choice" ]] || ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    error "Invalid input!"
fi

# Cancel
if [ "$choice" -eq 0 ]; then
    warning "Cancelled."
    exit 0
fi

# Range check
if [ "$choice" -lt 1 ] || [ "$choice" -gt ${#fonts[@]} ]; then
    error "Invalid selection! Please choose between 1 and ${#fonts[@]}."
fi

# Get selected font
selected="${fonts[$((choice-1))]}"

log "Swapping: font.ttf <-> ${selected}"

# Swap font.ttf with selected font
cd "$SCRIPT_DIR" || error "Failed to change directory!"
mv font.ttf "__temp_font__.ttf"
mv "$selected" font.ttf
mv "__temp_font__.ttf" "$selected"

echo ""
info "Font changed to: ${selected}"
warning "Please Restart Termux!"

exit
