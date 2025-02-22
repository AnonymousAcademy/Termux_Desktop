
#!/bin/bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[0m')"
BOLD="$(printf '\033[1m')"

function banner() {
clear
printf "%s############################################################\n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s#  ▀█▀ █▀▀ █▀█ █▀▄▀█ █ █ ▀▄▀   █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█  #\n" "$C"
printf "%s#   █  ██▄ █▀▄ █   █ █▄█ █ █   █▄▀ ██▄ ▄█ █ █  █  █▄█ █▀▀  #\n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s######################### Termux Gui #######################%s\n" "$C" "$W"

echo " "
echo -e "${BOLD}${Y} | Tool Name           ${C}: ${G}Termux Desktop    ${Y}|"
echo -e "${BOLD}${Y} | Author              ${C}: ${G}MrCyber           ${Y}|"    
echo -e "${BOLD}${Y} | YouTube Channel Name${C}: ${G}Anonymous Academy ${Y}|"
echo -e "${BOLD}${Y} | YouTube Channel Link${C}: ${R}https://youtube.com/@anonymousacademy404${W}"
echo " "
}
function notcon() {
clear
printf "%s############################################################\n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s#                    "$R"█▀▄       █  █▀▀▀█   "$R"         
                     █    ▀▄   █  █   █     "$R"                     
                     █       ▀▄█  █▄▄▄█  "$R"                        
"$R"
█▀▄      █  █▀▀▀  ▀▀█▀▀ ♣█        █ █▀▀▀█ █▀▀▄ █  ▄▀ "$R"            
█   ▀▄   █  █▄▄▄    █    █   ▄▀▄  █ █   █ █▄▄▀ █▄▀    "$R"           
█      ▀▄█  █▄▄▄    █    █▄▀    ▀▄█ █▄▄▄█ █  ▀▄█ ▀▄▄  "$R"   \n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s######################### No Internet connection ###########%s\n" "$C" "$W"

echo " "
}

function check_termux() {
	if [[ $HOME != *termux* ]]; then
	echo "${R}[${R}☓${R}]${R}${BOLD}Please run it inside termux${W}"
	exit 0
	fi
}

function download_and_install() {
  if 
  echo
    then
    #!/data/data/com.termux/files/usr/bin/bash

#########################################################################
#
# Call First
#
#########################################################################
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[0m')"
BOLD="$(printf '\033[1m')"

cd "$HOME" || exit
termux_desktop_path="$PREFIX/etc/termux-desktop"
config_file="$termux_desktop_path/configuration.conf"
log_file="$HOME/termux-desktop.log"

# create log
function debug() {
	exec > >(tee -a "$log_file") 2>&1
}

function bannerb() {
clear
printf "%s############################################################\n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s#  ▀█▀ █▀▀ █▀█ █▀▄▀█ █ █ ▀▄▀   █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█  #\n" "$C"
printf "%s#   █  ██▄ █▀▄ █   █ █▄█ █ █   █▄▀ ██▄ ▄█ █ █  █  █▄█ █▀▀  #\n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s######################### Termux Gui #######################%s\n" "$C" "$W"

echo " "
}

# check if the script is running on termux or not

check_termux
#########################################################################
#
# Shortcut Functions
#
#########################################################################

function print_log() {
    local call_stack=""

    for ((i = 1; i < ${#FUNCNAME[@]}; i++)); do
        if [[ -n "${FUNCNAME[$i]}" ]]; then
            call_stack+="${FUNCNAME[$i]} -> "
        fi
    done

    # Remove the trailing " -> "
    call_stack="${call_stack::-4}"

    # Print the logs in a structured way
    {
     	echo "========== $(date '+%Y-%m-%d %H:%M:%S') under ${call_stack:-main} =========="

        # If multiple arguments are passed, print each on a new line
        if [[ $# -gt 1 ]]; then
            for arg in "$@"; do
                echo "$arg"
            done
        else
            # Print single argument as-is
            echo "$1"
        fi

	echo "========================================"
    } >> "$log_file"
}

function print_success() {
	local msg
	msg="$1"
	echo "${R}[${G}✓${R}]${G} $msg${W}"
	print_log "$msg"
}

function print_failed() {
	local msg
	msg="$1"
	echo "${R}[${R}☓${R}]${R} $msg${W}"
	print_log "$msg"
}

function print_warn() {
	local msg
	msg="$1"
	echo "${R}[${Y}!${R}]${Y} $msg${W}"
	print_log "$msg"
}

function wait_for_keypress() {
	read -n1 -s -r -p "${R}[${C}-${R}]${G} Press any key to continue...${W}"
	echo
}

function check_and_create_directory() {
    if [[ ! -d "$1" ]]; then
        mkdir -p "$1"
		print_log "$1"
    fi
}

# first check then delete
function check_and_delete() {
    local file
	local files_folders
    for files_folders in "$@"; do
        for file in $files_folders; do
            if [[ -e "$file" ]]; then
                if [[ -d "$file" ]]; then
                    rm -rf "$file" >/dev/null 2>&1
                elif [[ -f "$file" ]]; then
                    rm "$file" >/dev/null 2>&1
                fi
            fi
		print_log "$file"
        done
    done
}

# first check then backup
function check_and_backup() {
	local file
	local files_folders
    for files_folders in "$@"; do
        for file in $files_folders; do
            if [[ -e "$file" ]]; then
            local date_str
			date_str=$(date +"%d-%m-%Y")
			local backup="${file}-${date_str}.bak"
			    if [[ -e "$backup" ]]; then
				echo "${R}[${C}-${R}]${G}Backup file ${C}${backup} ${G}already exists${W}"
				echo
				fi
		    echo "${R}[${C}-${R}]${G}backing up file ${C}$file${W}"
			mv "$1" "$backup"
			print_log "$1 $backup"
            fi
        done
    done
}

function download_file() {
    local dest
    local url
    dest="$1"
    url="$2"
	print_log "$dest"
	print_log "$url"
    if [[ -z "$dest" ]]; then
        wget --tries=5 --timeout=15 --retry-connrefused "$url"
    else
        wget --tries=5 --timeout=15 --retry-connrefused -O "$dest" "$url"
    fi

    # Check if the file was downloaded successfully
    if [[ -f "$dest" || -f "$(basename "$url")" ]]; then
        print_success "Successfully downloaded the file"
    else
        print_failed "Failed to download the file, retrying..."
        if [[ -z "$dest" ]]; then
            wget --tries=5 --timeout=15 --retry-connrefused "$url"
        else
            wget --tries=5 --timeout=15 --retry-connrefused -O "$dest" "$url"
        fi

        # Final check
        if [[ -f "$dest" || -f "$(basename "$url")" ]]; then
            print_success "Successfully downloaded the file after retry"
        else
            print_failed "Failed to download the file after retry"
            exit 0
        fi
    fi
}

# find a backup file which end with a number pattern and restore it
function check_and_restore() {
    local target_path="$1"
    local dir
    local base_name

    dir=$(dirname "$target_path")
    base_name=$(basename "$target_path")

    local latest_backup
   latest_backup=$(find "$dir" -maxdepth 1 -type f -name "$base_name-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9].bak" 2>/dev/null | sort | tail -n 1)

    if [[ -z "$latest_backup" ]]; then
        print_failed "No backup file found for ${target_path}."
		echo
        return 1
    fi

    if [[ -e "$target_path" ]]; then
        print_failed "${C}Original file or directory ${target_path} already exists.${W}"
		echo
    else
        mv "$latest_backup" "$target_path"
        print_success "Restored ${latest_backup} to ${target_path}"
		echo
    fi
	print_log "$target_path $dir $base_name $latest_backup"
}

function detact_package_manager() {
	source "/data/data/com.termux/files/usr/bin/termux-setup-package-manager"
	if [[ "$TERMUX_APP_PACKAGE_MANAGER" == "apt" ]]; then
	PACKAGE_MANAGER="apt"
	elif [[ "$TERMUX_APP_PACKAGE_MANAGER" == "pacman" ]]; then
	PACKAGE_MANAGER="pacman"
	else
	print_failed "${C} Could not detact your package manager, Switching To ${C}pkg ${W}" 
	fi
	print_log "$PACKAGE_MANAGER"
}

# will check if the package is already installed or not, if it installed then it will reinstall it and at the end it will print success/failed message
function package_install_and_check() {
    packs_list=($@)
    for package_name in "${packs_list[@]}"; do
        echo "${R}[${C}-${R}]${G}${BOLD} Processing package: ${C}$package_name ${W}"

        if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
            if pacman -Qi "$package_name" >/dev/null 2>&1; then
				print_log "$package_name = already_exist"
                continue
            fi

            if [[ $package_name == *"*"* ]]; then
                echo "${R}[${C}-${R}]${C} Processing wildcard pattern: $package_name ${W}"
				print_log "Processing wildcard pattern: $package_name"
                packages=$(pacman -Ssq "${package_name%*}" 2>/dev/null)
                for pkgs in $packages; do
                    echo "${R}[${C}-${R}]${G}${BOLD} Installing matched package: ${C}$pkgs ${W}"
                    pacman -Sy --noconfirm --overwrite '*' "$pkgs"
                done
            else
                pacman -Sy --noconfirm --overwrite '*' "$package_name"
            fi

        else
            if [[ $package_name == *"*"* ]]; then
                echo "${R}[${C}-${R}]${C} Processing wildcard pattern: $package_name ${W}"
				print_log "Processing wildcard pattern: $package_name"
                packages_by_name=$(apt-cache search "${package_name%*}" | awk "/^${package_name}/ {print \$1}")
				packages_by_description=$(apt-cache search "${package_name%*}" | grep -Ei "\b${package_name%*}\b" | awk '{print $1}')
				packages=$(echo -e "${packages_by_name}\n${packages_by_description}" | sort -u)
                for pkgs in $packages; do
                    echo "${R}[${C}-${R}]${G}${BOLD} Installing matched package: ${C}$pkgs ${W}"
                    if dpkg -s "$pkgs" >/dev/null 2>&1; then
						print_log "$pkgs = already_exist"
                        pkg reinstall "$pkgs" -y
                    else
                        pkg install "$pkgs" -y
                    fi
                done
            else
                if dpkg -s "$package_name" >/dev/null 2>&1; then
					print_log "$package_name = already_exist"
                    pkg reinstall "$package_name" -y
                else
                    pkg install "$package_name" -y
                fi
            fi
        fi

        # Check installation success
        if [ $? -ne 0 ]; then
            echo "${R}[${C}-${R}]${G}${BOLD} Error detected during installation of: ${C}$package_name ${W}"
			print_log "Error detected during installation of: $package_name"
            if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                pacman -Sy --overwrite '*' "$package_name"
                pacman -Sy --noconfirm "$package_name"
            else
                apt --fix-broken install -y
                dpkg --configure -a
                pkg install "$package_name" -y
            fi
        fi

        # Final verification
		if [[ $package_name != *"*"* ]]; then
        	if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        	    if pacman -Qi "$package_name" >/dev/null 2>&1; then
        	        print_success "$package_name installed successfully"
        	    else
        	        print_failed "$package_name installation failed ${W}"
        	    fi
        	else
        	    if dpkg -s "$package_name" >/dev/null 2>&1; then
        	        print_success "$package_name installed successfully"
        	    else
        	        print_failed "$package_name installation failed ${W}"
        	    fi
        	fi
		fi
    done
    echo ""
	print_log "package list: $packs_list"
}

# will check the package is installed or not then remove it
function package_check_and_remove() {
    packs_list=($@)
    for package_name in "${packs_list[@]}"; do
        echo "${R}[${C}-${R}]${G}${BOLD} Processing package: ${C}$package_name ${W}"

        if [[ $package_name == *"*"* ]]; then
            echo "${R}[${C}-${R}]${C} Processing wildcard pattern: $package_name ${W}"
			print_log "Processing wildcard pattern: $package_name"
            if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                packages=$(pacman -Qq | grep -E "${package_name//\*/.*}")
            else
                packages=$(dpkg --get-selections | awk '{print $1}' | grep -E "${package_name//\*/.*}")
            fi

            for pkg in $packages; do
                echo "${R}[${C}-${R}]${G}${BOLD} Removing matched package: ${C}$pkg ${W}"
                if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                    if pacman -Qi "$pkg" >/dev/null 2>&1; then
                        pacman -Rnds --noconfirm "$pkg"
                        if [ $? -eq 0 ]; then
                            print_success "$pkg removed successfully"
							print_log "Processing wildcard pattern: $package_name"
                        else
                            print_failed "Failed to remove $pkg ${W}"
                        fi
                    fi
                else
                    if dpkg -s "$pkg" >/dev/null 2>&1; then
                        apt autoremove "$pkg" -y
                        if [ $? -eq 0 ]; then
                            print_success "$pkg removed successfully"
                        else
                            print_failed "Failed to remove $pkg ${W}"
                        fi
                    fi
                fi
            done
        else
            if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                if pacman -Qi "$package_name" >/dev/null 2>&1; then
                    echo "${R}[${C}-${R}]${G}${BOLD} Removing package: ${C}$package_name ${W}"
                    pacman -Rnds --noconfirm "$package_name"
                    if [ $? -eq 0 ]; then
                        print_success "$package_name removed successfully"
                    else
                        print_failed "Failed to remove $package_name ${W}"
                    fi
                fi
            else
                if dpkg -s "$package_name" >/dev/null 2>&1; then
                    echo "${R}[${C}-${R}]${G}${BOLD} Removing package: ${C}$package_name ${W}"
                    apt autoremove "$package_name" -y
                    if [ $? -eq 0 ]; then
                        print_success "$package_name removed successfully"
                    else
                        print_failed "Failed to remove $package_name ${W}"
                    fi
                fi
            fi
        fi
    done
    echo ""
	print_log "$package_name"
}

function get_file_name_number() {
    current_file=$(basename "$0")
    folder_name="${current_file%.sh}"
    theme_number=$(echo "$folder_name" | grep -oE '[1-9][0-9]*')
	print_log "$theme_number"
}

function extract_zip_with_progress() {
    local archive="$1"
    local target_dir="$2"

    # Check if the archive file exists
    if [[ ! -f "$archive" ]]; then
        print_failed "$archive doesn't exist"
        return 1
    fi

    local total_files
    total_files=$(unzip -l "$archive" | grep -c -E '^\s+[0-9]+')

    if [[ "$total_files" -eq 0 ]]; then
        print_failed "No files found in the archive"
        return 1
    fi

    echo "Total files to extract: $total_files"
    local extracted_files=0
    unzip -o "$archive" -d "$target_dir" | while read -r line; do
        if [[ "$line" =~ inflating: ]]; then
            ((extracted_files++))
            progress=$((extracted_files * 100 / total_files))
            echo -ne "${G}Extracting: ${C}$progress% ($extracted_files/$total_files) \r${W}"
        fi
    done
    print_success "${archive} Extraction complete!"
}

function extract_archive() {
    local archive="$1"
    if [[ ! -f "$archive" ]]; then
        print_failed "$archive doesn't exist"
        return 1
    fi

    local total_size
    total_size=$(stat -c '%s' "$archive")

    case "$archive" in
        *.tar.gz|*.tgz)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xzf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.tar.xz)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xJf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.tar.bz2|*.tbz2)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xjf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.tar)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.bz2)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | bunzip2 > "${archive%.bz2}" || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.gz)
            print_success "Extracting ${C}$archive${W}"
            pv -s "$total_size" -p -r "$archive" | gunzip > "${archive%.gz}" || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.7z)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | 7z x -si -y > /dev/null || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
		*.zip)
            extract_zip_with_progress "${archive}"
            ;;
        *.rar)
            print_success "Extracting ${C}$archive"
            unrar x "$archive" || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *)
            print_failed "Unsupported archive format: ${C}$archive"
            return 1
            ;;
    esac

    print_success "Successfully extracted ${C}$archive"
	print_log "$archive"
}

# download a archive file and extract it in a folder
function download_and_extract() {
    local url="$1"
    local target_dir="$2"
    local filename="${url##*/}"

    # Notify user about downloading
    echo "${R}[${C}-${R}]${C}${BOLD}Downloading ${G}${filename}...${W}"
    sleep 1.5

    # Change to the target directory
    cd "$target_dir" || return 1

    local attempt=1
    local success=false

    # Attempt to download the file with retries
    while [[ $attempt -le 3 ]]; do
        if curl -# -L "$url" -o "$filename"; then
            success=true
            break
        else
            print_failed "Failed to download ${C}${filename}"
            echo "${R}[${C}☓-{R}]${G}Retrying... Attempt ${C}$attempt${W}"
            ((attempt++))
            sleep 1
        fi
    done

    # If download is successful, extract and remove the archive
    if [[ "$success" = true ]]; then
        if [[ -f "$filename" ]]; then
            echo
            echo "${R}[${C}-${R}]${R}[${C}-${R}]${G} Extracting $filename${W}"
            extract_archive "$filename"
            rm "$filename"
        fi
    else
        # Notify if download fails after all attempts
        print_failed "Failed to download ${C}${filename}"
        echo "${R}[${C}-${R}]${C}Please check your internet connection${W}"
    fi
	print_log "$url $target_dir $filename"
}

# count the number subfolders inside a folder in my repo
function count_subfolders() {
    local owner="$1"
    local repo="$2"
    local path="$3"
    local url="https://api.github.com/repos/$owner/$repo/contents/$path"
    local response
	response=$(curl -s "$url")
    local subfolder_count
	subfolder_count=$(echo "$response" | jq -r '.[] | select(.type == "dir") | .name' | wc -l)

    if [[ -z "$subfolder_count" || "$subfolder_count" -eq 0 ]]; then
        subfolder_count=0
    fi

    echo "$subfolder_count"
	print_log "$url $response $subfolder_count"
}

# create a yes / no confirmation prompt
function confirmation_y_or_n() {
	 while true; do
        read -r -p "${R}[${C}-${R}]${Y}${BOLD} $1 ${Y}(y/n) ${W}" response
        response="${response:-y}"
        eval "$2='$response'"
        case $response in
            [yY]* )
				echo
                print_success "Continuing with answer: $response"
				echo
				sleep 0.2
                break;;
            [nN]* )
				echo
                echo "${R}[${C}-${R}]${C} Skipping this setp${W}"
				echo
				sleep 0.2
                break;;
            * )
				echo
               	print_failed " Invalid input. Please enter 'y' or 'n'."
				echo
                ;;
        esac
    done
	print_log "$1 $response"
}

# get the latest version from a github releases
# ex. latest_tag=$(get_latest_release "$repo_owner" "$repo_name")
function get_latest_release() {
	local repo_owner="$1"
	local repo_name="$2"
	curl -s "https://api.github.com/repos/$repo_owner/$repo_name/releases/latest" |
	grep '"tag_name":' |
	sed -E 's/.*"v?([^"]+)".*/\1/'
}

function install_font_for_style() {
	local style_number="$1"
	echo "${R}[${C}-${R}]${G} Installing Fonts...${W}"
	check_and_create_directory "$HOME/.fonts"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/$de_name/look_${style_number}/font.tar.gz" "$HOME/.fonts"
	fc-cache -f
	cd "$HOME" || return
}

function download_github_action_artifact() {
    # Parse arguments passed to the function
    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            --user)
                GITHUB_USER="$2"
                shift 2
                ;;
            --repo)
                REPO="$2"
                shift 2
                ;;
            --workflow-name)
                WORKFLOW_NAME="$2" # The name of the CI workflow
                shift 2
                ;;
            --run-name)
                RUN_NAME="$2" # Specific name/description of the workflow run
                shift 2
                ;;
            --artifact-name)
                ARTIFACT_NAME="$2" # Artifact name prefix (can be modified as needed)
                shift 2
                ;;
            *)
                echo "${R}[${R}☓${R}]Unknown option: $1${W}"
                shift
                ;;
        esac
    done

    # Get the workflow ID using the workflow name
    WORKFLOW_ID=$(gh api repos/$GITHUB_USER/$REPO/actions/workflows --jq ".workflows[] | select(.name == \"$WORKFLOW_NAME\") | .id")
    # Check if WORKFLOW_ID is found
    if [ -z "$WORKFLOW_ID" ]; then
        print_failed " Workflow '$WORKFLOW_NAME' not found."
        exit 1
    fi

    # Display the workflow ID
    echo "${R}[${C}-${R}]${G} Workflow ID for ${W}'$WORKFLOW_NAME' ${G}is ${W}$WORKFLOW_ID"

    # Get the latest workflow run ID with the specific display title
    WORKFLOW_RUN_ID=$(gh api repos/$GITHUB_USER/$REPO/actions/workflows/$WORKFLOW_ID/runs --paginate --jq ".workflow_runs[] | select(.display_title == \"$RUN_NAME\") | .id" | head -n 1)
    # Check if WORKFLOW_RUN_ID is obtained
    if [ -z "$WORKFLOW_RUN_ID" ]; then
        print_failed " No workflow run found with the name '$RUN_NAME' for workflow '$WORKFLOW_NAME'."
        exit 1
    fi

    # List artifacts for the found run
    ARTIFACT_URL=$(gh api repos/$GITHUB_USER/$REPO/actions/runs/$WORKFLOW_RUN_ID/artifacts --jq ".artifacts[] | select(.name == \"$ARTIFACT_NAME\") | .archive_download_url")
    # If no exact match, look for an artifact starting with ARTIFACT_NAME
    if [ -z "$ARTIFACT_URL" ]; then
        echo "${R}[${C}-${R}]${C} Artifact with the exact name '$ARTIFACT_NAME' not found. Looking for artifacts starting with '$ARTIFACT_NAME'...${W}"
        ARTIFACT_URL=$(gh api repos/$GITHUB_USER/$REPO/actions/runs/$WORKFLOW_RUN_ID/artifacts --jq ".artifacts[] | select(.name | startswith(\"$ARTIFACT_NAME\")) | .archive_download_url" | head -n 1)
    fi

    # Check if ARTIFACT_URL is found
    if [ -z "$ARTIFACT_URL" ]; then
        print_failed " No artifact found starting with '$ARTIFACT_NAME'."
        exit 1
    fi

    # Download the artifact using the URL
    print_success "Downloading artifact from run '$RUN_NAME'..."
    curl -# -L -H "Authorization: Bearer $(gh auth token)" -o artifact.zip "$ARTIFACT_URL"

    # Extract the artifact
    extract_archive "artifact.zip"
}

function print_status() {
    local status
	status=$1
    local message
	message=$2
    if [[ "$status" == "ok" ]]; then
        print_success "$message"
    elif [[ "$status" == "warn" ]]; then
        print_warn "$message"
    elif [[ "$status" == "error" ]]; then
        print_failed "$message"
    fi
}

function select_an_option() {
    local max_options=$1
    local default_option=${2:-1}
    local response_var=$3
    local response

    while true; do
        read -r -p "${Y}select an option (Default ${default_option}): ${W}" response
        response=${response:-$default_option}

        if [[ $response =~ ^[0-9]+$ ]] && ((response >= 1 && response <= max_options)); then
            echo
            print_success "Continuing with answer: $response"
            sleep 0.2
            eval "$response_var=$response"
            break
        else
            echo
            print_failed " Invalid input, Please enter a number between 1 and $max_options"
        fi
    done
}

function preprocess_conf() {
    # Preprocess configuration file:
    # 1. Remove lines where keys contain dashes (-).
    # 2. Remove quotes from keys and values.
	echo "${R}[${C}-${R}]${G} Prepering config file...${W}"
    sed -i -E '/^[[:space:]]*[^#=]+-.*=/d; s/^([[:space:]]*[^#=]+)="([^"]*)"/\1=\2/g' "$config_file"
}

function read_conf() {
    if [[ ! -f "$config_file" ]]; then
        print_failed " Configuration file $config_file not found"
		exit 0
    fi

	source "$config_file"

    # Process each line of the file
    # while IFS='=' read -r key value; do
    #     # Trim whitespace and surrounding quotes from key and value
    #     key=$(echo "$key" | xargs | sed 's/"//g')
    #     value=$(echo "$value" | xargs | sed 's/"//g')

    #     # Skip empty lines and comments
    #     if [[ -z "$key" || "$key" =~ ^# ]]; then
    #         continue
    #     fi

    #     # Dynamically create variables
    #     export "$key"="$value"
    # done < "$config_file"

    print_success "Configuration variables loaded"
}

#########################################################################
#
# Ask Required Questions
#
#########################################################################

# check the avilable styles and create a list to type the corresponding number
# in the style readme file the name must use this'## number name :' pattern, like:- ## 1. Basic Style:
function questions_theme_select() {
    local owner="sabamdarif"
    local repo="termux-desktop"
    local main_folder="setup-files/$de_name"
    local subfolder_count_value
    subfolder_count_value=$(count_subfolders "$owner" "$repo" "$main_folder" 2>/dev/null)
    cd "$HOME" || return
    echo "${R}[${C}-${R}]${G} Downloading list....${W}"
    check_and_backup "${current_path}/styles.md"
    download_file "${current_path}/styles.md" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/${de_name}_styles.md"

    clear
    banner

    if [[ -n "$subfolder_count_value" ]]; then
        echo "${R}[${C}-${R}]${G} Check the $de_name styles section in GitHub${W}"
        echo
        echo "${R}[${C}-${R}]${B} https://github.com/sabamdarif/termux-desktop/blob/main/${de_name}_styles.md${W}"
        echo
        echo "${R}[${C}-${R}]${G} Number of available custom styles for $de_name is: ${C}${subfolder_count_value}${W}"
        echo
        echo "${R}[${C}-${R}]${G} Available Styles:${W}"
        echo
        grep -oP '## \d+\..+?(?=(\n## \d+\.|\Z))' styles.md | while read -r style; do
            echo "${Y}${style#### }${W}"
        done

        while true; do
            echo
            read -r -p "${R}[${C}-${R}]${Y} Type number of the style: ${W}" style_answer

            if [[ -z "$style_answer" ]]; then
                echo
                print_failed "Input cannot be empty. Please type a number"
                continue
            fi

            if [[ "$style_answer" =~ ^[0-9]+$ ]] && [[ "$style_answer" -ge 0 ]] && [[ "$style_answer" -le "$subfolder_count_value" ]]; then
                style_name=$(grep -oP "^## $style_answer\..+?(?=(\n## \d+\.|\Z))" styles.md | sed -e "s/^## $style_answer\. //" -e "s/:$//")
                break
            else
                echo
                print_failed "The entered style number is incorrect"
                echo
                if [[ "$subfolder_count_value" == "0" ]]; then
                    echo "${R}[${C}-${R}]${Y} Please enter 0 because for $de_name only stock style is available${W}"
                    echo
                else
                    echo "${R}[${C}-${R}]${Y} Please enter a number between 0 to ${subfolder_count_value}${W}"
                    echo
                fi
                echo "${R}[${C}-${R}]${G} Check the $de_name styles section in GitHub${W}"
                echo
                echo "${R}[${C}-${R}]${B} https://github.com/sabamdarif/termux-desktop/blob/main/${de_name}_styles.md${W}"
                echo
            fi
        done
        rm "${current_path}/styles.md"
    else
        print_failed "Failed to get total available styles value"
		exit 0
    fi
    print_log "$style_answer $subfolder_count_value"
}

function questions() {
	banner
	echo "${R}[${C}-${R}]${G} Select Desktop Environment${W}"
	echo " "
	echo "${Y}1. XFCE${W}"
	echo
	echo "${Y}2. LXQT${W}"
	echo
	echo "${Y}3. OPENBOX WM${W}"
	echo
	echo "${Y}4. MATE (Unstable)${W}"
	echo
	select_an_option 4 1 desktop_answer
	# set the variables based on chosen de
	sys_icons_folder="$PREFIX/share/icons"
	sys_themes_folder="$PREFIX/share/themes"
	if [[ "$desktop_answer" == "1" ]]; then
	de_name="xfce"
	themes_folder="$HOME/.themes"
	icons_folder="$HOME/.icons"
	de_startup="xfce4-session"
	elif [[ "$desktop_answer" == "2" ]]; then
	de_name="lxqt"
	themes_folder="$sys_themes_folder"
	icons_folder="$sys_icons_folder"
	de_startup="startlxqt"
	elif [[ "$desktop_answer" == "3" ]]; then
	de_name="openbox"
	themes_folder="$sys_themes_folder"
	icons_folder="$sys_icons_folder"
	de_startup="openbox-session"
	elif [[ "$desktop_answer" == "4" ]]; then
	de_name="mate"
	themes_folder="$HOME/.themes"
	icons_folder="$HOME/.icons"
	de_startup="mate-session"
	fi
	echo "de_startup=\"$de_startup\"" >> "$config_file"
	echo "de_name=\"$de_name\"" >> "$config_file"
	echo "themes_folder=\"$themes_folder\"" >> "$config_file"
	echo "icons_folder=\"$icons_folder\"" >> "$config_file"

	banner
	questions_theme_select
	echo
	print_success "Continuing with answer: ${style_answer}.$style_name"
	echo "style_answer=\"$style_answer\"" >> "$config_file"
	echo "style_name=\'$style_name\'" >> "$config_file"
	sleep 0.2
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select browser you want to install${W}"
	echo
	echo "${Y}1. firefox${W}"
	echo
	echo "${Y}2. chromium${W}"
	echo
	echo "${Y}3. firefox & chromium (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 browser_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select IDE you want to install${W}"
	echo
	echo "${Y}1. VS Code${W}"
	echo
	echo "${Y}2. Geany (lightweight IDE)${W}"
	echo
	echo "${Y}3. VS Code & Geany (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 ide_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select Media Player you want to install${W}"
	echo
	echo "${Y}1. Vlc${W}"
	echo
	echo "${Y}2. Audacious${W}"
	echo
	echo "${Y}3. Vlc & Audacious (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 player_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select Photo Editor${W}"
	echo
	echo "${Y}1. Gimp${W}"
	echo
	echo "${Y}2. Inkscape${W}"
	echo
	echo "${Y}3. Gimp & Inkscape (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 photo_editor_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Do you want to install wine in termux ${C}(without proot-distro)${W}"
	echo
	echo "${Y}1. Natively ${C}(can run only arm64 based exe)${W}"
	echo
	echo "${Y}2. Using Mobox ${C}${W}"
	echo
	echo "${R}[${C}-${R}]${B} Know More About Mobox:- https://github.com/olegos2/mobox/${W}"
	echo
	echo "${Y}3. Wine Hangover (Best)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 wine_answer
	banner
	confirmation_y_or_n "Do you want to install a graphical package manager [Synaptic]" synaptic_answer
	banner
	echo "${R}[${C}-${R}]${G} By Default it only add 4 - 5 wallpaper${W}"
	echo
	confirmation_y_or_n "Do you want to add some more wallpaper" ext_wall_answer
	banner
	confirmation_y_or_n "Do you want to Configuring Zsh" zsh_answer
	banner
	echo
	echo "${R}[${C}-${R}]${B} Know More About Terminal Utility:- https://github.com/sabamdarif/termux-desktop/blob/main/see-more.md#hammer_and_wrenchlearn-about-terminal-utilities${W}"
	echo
	confirmation_y_or_n "Do you want install some terminal utility to make better terminal exprience" terminal_utility_setup_answer
	if [[ "$de_name" != "mate" ]]; then
	banner
	echo -e "
Typing 'Y' to this option will add a variety of options to your file manager's right-click menu. Using this, you can do a lot more things within the right-click menu than you ever imagined, such as:

- Most basic video/image-related tasks
- Audio/PDF-related tasks
- Archive-related tasks, file permissions, document handling, encryption, and hash checks
- And much more

In File Manager click on the scripts meanu to see them all
	"
	echo
	confirmation_y_or_n "Do you want to Configuring File Manager Tools (Testing)" fm_tools
	fi
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select Gui Mode${W}"
	echo
	echo "${Y}1. Termux:x11${W}"
	echo
	echo "${Y}2. Both Termux:x11 and VNC${W}"
	echo
	select_an_option 2 1 gui_mode_num

	# set gui_mode and display_number value
	if [[ "$gui_mode_num" == "1" ]]; then
		gui_mode="termux_x11"
		display_number="0"
		echo "display_number=\"$display_number\"" >> "$config_file"
	elif [[ "$gui_mode_num" == "2" ]]; then
		gui_mode="both"
		display_number="0"
		echo "display_number=\"$display_number\"" >> "$config_file"
	fi
	echo "gui_mode_num=\"$gui_mode_num\"" >> "$config_file"

	banner
	confirmation_y_or_n "Do you want to start the desktop at Termux startup" de_on_startup
	if [[ "$de_on_startup" == "y" && "$gui_mode" == "both" ]]; then
	echo "${R}[${C}-${R}]${G} You chose both vnc and termux:x11 to access gui mode${W}"
	echo
	echo "${R}[${C}-${R}]${G} Which will be your default${W}"
	echo
	echo "${Y}1. Termux:x11${W}"
	echo
	echo "${Y}2. Vnc${W}"
	echo
	select_an_option 2 1 autostart_gui_mode_num
	echo "autostart_gui_mode_num=\"$autostart_gui_mode_num\"" >> "$config_file"

		if [[ "$autostart_gui_mode_num" == "1" ]]; then
			autostart_gui_mode="termux_x11"
		elif [[ "$autostart_gui_mode_num" == "2" ]]; then
			autostart_gui_mode="vnc"
		fi

	echo "autostart_gui_mode=\"$autostart_gui_mode\"" >> "$config_file"
	fi
	banner
	echo -e "
${R}[${C}-${R}]${G}${BOLD} Linux Distro Container (proot distro):- ${W}

It will help you to install app that aren't avilable in termux.
So it will setup a linux distro container and add option to install those apps.
Also you can launch those installed apps from termux like other apps.
"
echo "Learn More:- https://github.com/sabamdarif/termux-desktop/blob/main/proot-caontainer.md"
echo
	confirmation_y_or_n "Do you want to add a Linux container" distro_add_answer
	echo "distro_add_answer=\"$distro_add_answer\"" >> "$config_file"
	banner
echo -e "${R}[${C}-${R}]${G}${BOLD} Extra App Suite:- ${W}
It will install this listed apps:-

- Gedit (Text Editor)
- Rhythmbox (Music Player)
- Xpdf Reader
- Thunderbird (Email Client)
- Transmission (Bittorrent Client)
"
if [[ "$distro_add_answer" == "y" ]]; then
echo -e "apps that will be installed using linux distro container (proot distro):-
- Libreoffice (Office Suite)
"
fi
echo
confirmation_y_or_n "Do you want to install extra app suite" extra_app_suite
	banner
	if ! type -p pacman >/dev/null 2>&1; then
	echo "${R}[${C}-${R}]${R}${BOLD} Read This Carefully${W}"
	echo -e "
${R}[${C}-${R}]${G}${BOLD} Mesa Vulkan ICD-Wrapper:- ${W}

In my tests, I achieved 1000+ FPS in vkmark on all my devices. I tried it on an 
- Adreno 619 (everything work fine)
- Adreno 750 (good overall but with few issues)
- Mali G76 (similar issue like Adreno 750).
- Mali G57 everything work with this driver\n

Also if you have Adreno GPU then please select ubuntu or debian as Linux container so it can use ternip in the Linux container.\n
Sadly for other then adreno, GPU might / might not work on the Linux container./n

If you type 'n/N' then it will use the old virtualizing way to setup Hardware Acceleration

Also type 'n/N' for Freedreno KGSL (Adreno GPU Only)./n
"
	confirmation_y_or_n "Do you want to install the new mesa-vulkan-icd-wrapper Driver" confirmation_mesa_vulkan_icd_wrapper
	echo "confirmation_mesa_vulkan_icd_wrapper=\"$confirmation_mesa_vulkan_icd_wrapper\"" >> "$config_file"
	fi
}

# distro hardware accelrration related questions
function distro_hw_questions() {
	if [[ "$distro_add_answer" == "y" ]]; then
	   if [[ "$termux_hw_answer" == "virgl" ]] || [[ "$termux_hw_answer" == "virgl_vulkan" ]]; then
	   	if [[ "$device_gpu_model_name" != "adreno" ]]; then
	   		pd_hw_answer="virgl"
	   	else
	   		banner
	   		echo "${R}[${C}-${R}]${G}${BOLD} Select Hardware Acceleration Driver For Linux Container${W}"
	   		echo "${Y}1. OpenGL (VIRGL ANGLE)${W}"
	   		echo
	   		echo "${Y}2. Turnip (Adreno GPU Only)${W}"
	   		echo
	   		select_an_option 2 1 pd_hw_answer_n
	   		# set gpu api
	   		if [[ "$pd_hw_answer_num" == "1" ]]; then
	   		pd_hw_answer="virgl"
	   		elif [[ "$pd_hw_answer_num" == "2" ]]; then
	   		pd_hw_answer="turnip"
	   		fi
	   	fi
	   elif [[ "$termux_hw_answer" == "freedreno" ]]; then
	   # set gpu api
	   pd_hw_answer="freedreno"
	   else
	   banner
	   echo "${R}[${C}-${R}]${G}${BOLD} Select Hardware Acceleration Driver For Linux Container${W}"
	   echo
	   echo "${R}[${C}-${R}]${G} If You Skip It, It Will Use The Previous Selection${W}"
       echo
	   echo "${Y}1. Vulkan (ZINK)${W}"
	   echo
	   echo "${Y}2. OpenGL ES (ZINK VIRGL)${W}"
	   echo
	   echo "${Y}3. Turnip (Adreno GPU Only)${W}"
	   echo
	   echo "${Y}4. Skip${W}"
	   echo
	   select_an_option 4 1 pd_hw_answer_num

	   	# set gpu api
	   	if [[ "$pd_hw_answer_num" == "1" ]]; then
	   	pd_hw_answer="zink"
	   	elif [[ "$pd_hw_answer_num" == "2" ]]; then
	   	pd_hw_answer="zink_virgl"
	   	elif [[ "$pd_hw_answer_num" == "3" ]]; then
	   	pd_hw_answer="turnip"
	   	fi

	   fi
	   echo "pd_hw_answer_num=\"$pd_hw_answer_num\"" >> "$config_file"
	   echo "pd_hw_answer=\"$pd_hw_answer\"" >> "$config_file"
    fi
}

# hardware accelrration related questions

function exp_termux_gl_hw_support() {
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} First Read This${W}"
	echo
	echo "${R}[${C}-${R}]${B} This:- https://github.com/sabamdarif/termux-desktop/blob/main/hw-acceleration.md${W}"
	echo
	echo "${R}[${C}-${R}]${G}${BOLD} It will be used to enable opengl support${W}"
	echo
	echo "${Y}1. Vulkan (ZINK)${W}"
	echo
	echo "${Y}2. OpenGL (VIRGL ANGLE)${W}"
	echo
	echo "${Y}3. Vulkan (VIRGL ANGLE)${W}"
	echo
	echo "${Y}4. OpenGL ES (ZINK VIRGL)${W}"
	echo
	echo "${Y}5. The Vulkan-Icd-Wrapper Driver With Mesa${W}"
	echo
	echo "${Y}6. The Vulkan-Icd-Wrapper Driver With Mesa-Zink${W}"
	echo
	echo "${Y}7. Freedreno KGSL (Unstable | Adreno GPU Only)${W}"
	echo
	select_an_option 7 1 exp_termux_gl_hw_answer_num
	echo "exp_termux_gl_hw_answer_num=\"$exp_termux_gl_hw_answer_num\"" >> "$config_file"

	# set gpu api name
	case "$exp_termux_gl_hw_answer_num" in
	    1) exp_termux_gl_hw_answer="zink" ;;
	    2) exp_termux_gl_hw_answer="virgl" ;;
	    3) exp_termux_gl_hw_answer="virgl_vulkan" ;;
	    4) exp_termux_gl_hw_answer="zink_virgl" ;;
	    5) exp_termux_gl_hw_answer="zink_with_mesa" ;;
	    6) exp_termux_gl_hw_answer="zink_with_mesa_zink" ;;
	    7) exp_termux_gl_hw_answer="freedreno" ;;
	esac
	echo "exp_termux_gl_hw_answer=\"$exp_termux_gl_hw_answer\"" >> "$config_file"
	termux_hw_answer="${exp_termux_gl_hw_answer}"
	echo "termux_hw_answer=\"$exp_termux_gl_hw_answer\"" >> "$config_file"

    if [[ "$distro_add_answer" == "y" ]]; then
        case "$exp_termux_gl_hw_answer" in
            "virgl"|"virgl_vulkan")
				if [[ "$device_gpu_model_name" == "adreno" ]]; then
					distro_hw_questions
				else
                	pd_hw_answer="virgl"
                	echo "pd_hw_answer=\"$pd_hw_answer\"" >> "$config_file"
				fi
                ;;
            *)
                distro_hw_questions
                ;;
        esac
    fi
}

function exp_hwa_support() {
	if [[ "$confirmation_mesa_vulkan_icd_wrapper" == "y" ]]; then
	echo -e "${R}[${C}-${R}]${G} The new Hardware Acceleration Will Use The mesa-vulkan-icd-wrapper Package\n ${W}"
	echo -e "${R}[${C}-${R}]${G} GPU Found: ${W}$detected_gpu\n"
	sleep 0.2
	if [[ "$gpu_name" == "unknown" ]]; then
		echo -e "${R}[${C}-${R}]${G} The above GPU is unknown to me\n ${W}"
		echo "${R}[${C}-${R}]${G}${BOLD} Please Select Your Device GPU${W}"
    	echo
		echo "${Y}1. Adreno${W}"
		echo
    	echo "${Y}2. Mali${W}"
		echo
		echo "${Y}3. Xclipse${W}"
		echo
		echo "${Y}4. Others (Unstable)${W}"
		echo
		select_an_option 4 1 device_gpu_model
		echo "device_gpu_model=\"$device_gpu_model\"" >> "$config_file"

		# set gpu model name
		case "$device_gpu_model" in
    	1) device_gpu_model_name="adreno" ;;
    	2) device_gpu_model_name="mali" ;;
    	3) device_gpu_model_name="xclipse" ;;
    	4) device_gpu_model_name="others" ;;
		esac
	else
		device_gpu_model_name="$gpu_name"
	fi
	echo "device_gpu_model_name=\"$device_gpu_model_name\"" >> "$config_file"

	exp_termux_gl_hw_support
	fi
}

function hw_questions() {
	if [[ "$confirmation_mesa_vulkan_icd_wrapper" == "y" ]]; then
	exp_hwa_support
	else
    echo "${R}[${C}-${R}]${G}${BOLD} First Read This${W}"
    echo
    echo "${R}[${C}-${R}]${B} This:- https://github.com/sabamdarif/termux-desktop/blob/main/hw-acceleration.md${W}"
    echo
    echo "${R}[${C}-${R}]${G}${BOLD} Select Hardware Acceleration API${W}"
    echo
	echo "${Y}1. Vulkan (ZINK)${W}"
	echo
    echo "${Y}2. OpenGL (VIRGL ANGLE)${W}"
	echo
	echo "${Y}3. Vulkan (VIRGL ANGLE)${W}"
	echo
	echo "${Y}4. OpenGL ES (ZINK VIRGL)${W}"
	echo
	echo "${Y}5. Freedreno KGSL (Unstable | Adreno GPU Only)${W}"
	echo
	select_an_option 5 1 termux_hw_answer_num
	echo "termux_hw_answer_num=\"$termux_hw_answer_num\"" >> "$config_file"

	# set gpu api name
	case "$termux_hw_answer_num" in
	    1) termux_hw_answer="zink" ;;
	    2) termux_hw_answer="virgl" ;;
	    3) termux_hw_answer="virgl_vulkan" ;;
	    4) termux_hw_answer="zink_virgl" ;;
	    5) termux_hw_answer="freedreno" ;;
	esac
		distro_hw_questions
	fi
}

# distro related questions
function choose_distro() {
	echo "${R}[${C}-${R}]${G}${BOLD} Select Linux Distro You Want To Add${W}"
	echo " "
	echo "${Y}1. Debian${W}"
	echo " "
	echo "${Y}2. Ubuntu${W}"
	echo " "
	echo "${Y}3. Arch (Unstable)${W}"
	echo " "
	echo "${Y}4. Alpine${W}"
	echo " "
	echo "${Y}5. Fedora${W}"
	echo " "
	select_an_option 5 1 distro_answer
	echo "distro_answer=\"$distro_answer\"" >> "$config_file"

	case "$distro_answer" in
        1) selected_distro="debian" ;;
        2) selected_distro="ubuntu" ;;
        3) selected_distro="archlinux" ;;
        4) selected_distro="alpine" ;;
        5) selected_distro="fedora" ;;
        *) selected_distro="debian" ;;
    esac
    echo "selected_distro=\"$selected_distro\"" >> "$config_file"

}

function distro_questions() {
	banner
	choose_distro
	banner
	confirmation_y_or_n "Do you want to configure audio support for Linux distro container" pd_audio_config_answer

	if [[ "$distro_add_answer" == "y" ]] && [[ "$zsh_answer" == "y" ]]; then
	banner
	confirmation_y_or_n "Do you want to Configuring Zsh also for Linux distro container ${C}(take longer time to login into distro)" distro_zsh_answer
	else
	distro_zsh_answer="$zsh_answer"
	fi
	echo "distro_zsh_answer=\"$distro_zsh_answer\"" >> "$config_file"

	if [[ "$distro_add_answer" == "y" ]] && [[ "$terminal_utility_setup_answer" == "y" ]]; then
	banner
	confirmation_y_or_n "Do you want install the terminal utility also for Linux distro container" distro_terminal_utility_setup_answer
	else
	distro_terminal_utility_setup_answer="$terminal_utility_setup_answer"
	fi
	echo "distro_terminal_utility_setup_answer=\"$distro_terminal_utility_setup_answer\"" >> "$config_file"

	banner
	confirmation_y_or_n "Do you want to create a normal user account ${C}(Recomended)" pd_useradd_answer
	echo "pd_useradd_answer=\"$pd_useradd_answer\"" >> "$config_file"
	echo

	if [[ "$pd_useradd_answer" == "n" ]]; then
	echo "${R}[${C}-${R}]${G} Skiping User Account Setup${W}"
	else
	echo "${R}[${C}-${R}]${G}${BOLD} Select user account type${W}"
	echo
	echo "${Y}1. User with no password confirmation${W}"
	echo
	echo "${Y}2. User with password confirmation${W}"
	echo
	select_an_option 2 1 pd_pass_type
	echo "pd_pass_type=\"$pd_pass_type\"" >> "$config_file"
	    if [[ "$pd_pass_type" == "1" ]]; then
	    while true; do
		echo " "
		echo "${R}[${C}-${R}]${G} Default Password Will Be Set, Because Sometime It Might Ask You For Password${W}"
		echo
		echo "${R}[${C}-${R}]${G} Password:-${C}root${W}"
		echo
	    read -r -p "${R}[${C}-${R}]${G} Input username [Lowercase]: ${W}" user_name
	    echo
	    read -r -p "${R}[${C}-${R}]${Y} Do you want to continue with username ${C}$user_name ${Y}? (y/n) : ${W}" choice
	    echo
	    choice="${choice:-y}"
	    echo
	    print_success "Continuing with answer: $choice"
	    sleep 0.2
	    case $choice in
	    [yY]* )
	    print_success "Continuing with username ${C}$user_name"
	    break;;
	    [nN]* )
	    echo "${R}[${C}-${R}]${G}Please provide username again.${W}"
	    echo
	    ;;
	    * )
	    print_failed "Invalid input, Please enter y or n"
	    ;;
	    esac
	    done
	    echo "user_name=\"$user_name\"" >> "$config_file"
	    elif [[ "$pd_pass_type" == "2" ]]; then
	    echo
	    echo "${R}[${C}-${R}]${G}${BOLD} Create user account${W}"
	    echo
	    while true; do
	    read -r -p "${R}[${C}-${R}]${G}Input username [Lowercase]: ${W}" user_name
	    echo
	    read -r -p "${R}[${C}-${R}]${G}Input Password: ${W}" pass
	    echo
	    read -r -p "${R}[${C}-${R}]${Y}Do you want to continue with username ${C}$user_name ${Y}and password ${C}$pass${Y} ? (y/n) : ${W}" choice
	    echo
	    choice="${choice:-y}"
	    echo
	    print_success "Continuing with answer: $choice"
	    echo ""
	    sleep 0.2
	    case $choice in
	    [yY]* )
	    print_success "Continuing with username ${C}$user_name ${G}and password ${C}$pass"
	    break;;
	    [nN]* )
	    echo "${R}[${C}-${R}]${G}Please provide username and password again.${W}"
	    echo
	    ;;
	    * )
	    print_failed "Invalid input, Please enter y or n"
	    ;;
	    esac
	    done
	    echo "user_name=\"$user_name\"" >> "$config_file"
	    echo "pass=\"$pass\"" >> "$config_file"
	    fi

	fi
}

#########################################################################
#
# Update System And Install Required Packages Repo And Bssic Task
#
#########################################################################

function chose_mirror() {
	echo "${R}[${C}-${R}]${G}${BOLD}Selecting best termux packages mirror please wait${W}"
	local todays_date
	todays_date=$(date +"%d-%m")
    unlink "$PREFIX/etc/termux/chosen_mirrors" &>/dev/null
    ln -s "$PREFIX/etc/termux/mirrors/all" "$PREFIX/etc/termux/chosen_mirrors" &>/dev/null
    pkg --check-mirror update
	touch "$HOME/.run_chosen_mirrors_once"
	echo "$todays_date" > "$HOME/.run_chosen_mirrors_once"
}

function update_sys() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Updating System....${W}"
    echo

    local todays_date
    todays_date=$(date +"%d-%m")

    if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        pacman -Syu --noconfirm
    else
        if [[ -f "$HOME/.run_chosen_mirrors_once" ]]; then
			local date_on_file
			date_on_file="$(cat "$HOME"/.run_chosen_mirrors_once)"
			# Check if the file is older than today
            if [[ $(find "$HOME/.run_chosen_mirrors_once" -mtime +0 2>/dev/null) ]] && [[ "$date_on_file" != "$todays_date" ]]; then # although [[ "$date_on_file" != "$todays_date" ]] is unnecessary
                chose_mirror
            fi
            pkg update -y -o Dpkg::Options::="--force-confnew"
            pkg upgrade -y -o Dpkg::Options::="--force-confnew"
        else
            chose_mirror
            pkg update -y -o Dpkg::Options::="--force-confnew"
            pkg upgrade -y -o Dpkg::Options::="--force-confnew"
        fi
    fi
}

function check_system_requirements() {
	local errors=0
	clear

	# Disable keyboard interruptions
    trap '' SIGINT SIGTSTP

	printf "%s############################################################\n" "$C"
	printf "%s#                                                          #\n" "$C"
	printf "%s#  ▀█▀ █▀▀ █▀█ █▀▄▀█ █ █ ▀▄▀   █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█  #\n" "$C"
	printf "%s#   █  ██▄ █▀▄ █   █ █▄█ █ █   █▄▀ ██▄ ▄█ █ █  █  █▄█ █▀▀  #\n" "$C"
	printf "%s#                                                          #\n" "$C"
	printf "%s################# System Compatibility Check ###############%s\n" "$C" "$W"
	echo " "
    sleep 0.3
    # Check if running on Android
	android_version=$(getprop ro.build.version.release | cut -d'.' -f1)

    if [[ "$(uname -o)" == "Android" ]]; then
		if [[ "$android_version" -ge 8 ]]; then
        	print_status "ok" "Running on: ${W}Android $android_version"
		else
			print_status "error" "Running on: ${W}Android $android_version is not recomended"
			((errors++))
		fi
    else
        print_status "error" "Not running on Android"
        ((errors++))
    fi
    sleep 0.2
	# Android device soc & model details
	model="$(getprop ro.product.brand) $(getprop ro.product.model)"
	print_status "ok" "Device: ${W}$model"
	sleep 0.2
	PROCESSOR_BRAND_NAME="$(getprop ro.soc.manufacturer)"
	PROCESSOR_NAME="$(getprop ro.soc.model)"
	print_status "ok" "SOC: ${W}$PROCESSOR_BRAND_NAME $PROCESSOR_NAME"
	sleep 0.2
	# Check GPU
	gpu_egl=$(getprop ro.hardware.egl)
    gpu_vulkan=$(getprop ro.hardware.vulkan)
    detected_gpu="$(echo -e "$gpu_egl\n$gpu_vulkan" | sort -u | tr '\n' ' ' | sed 's/ $//')"
	if echo "$detected_gpu" | grep -iq "adreno"; then
		gpu_name="adreno"
	elif echo "$detected_gpu" | grep -iq "mali"; then
		gpu_name="mali"
	elif echo "$detected_gpu" | grep -iq "xclipse"; then
		gpu_name="xclipse"
	else
		gpu_name="unknown"
	fi

	if [[ "$gpu_name" == "adreno" ]] ||  [[ "$gpu_name" == "mali" ]] || [[ "$gpu_name" == "xclipse" ]]; then
        print_status "ok" "GPU: ${W}$gpu_name"
    else
        print_status "warn" "Unknown GPU: ${W}$detected_gpu"
    fi
	sleep 0.2
    # Check architecture
	app_arch=$(uname -m)
	supported_arch="$(getprop ro.product.cpu.abilist)"
	local archtype
	case "$app_arch" in
    aarch64) archtype="aarch64" ;;
    armv7*|arm) archtype="arm" ;;
	esac

    if [[ "$archtype" == "aarch64" ]] || [[ "$archtype" == "arm" ]]; then
        print_status "ok" "App architecture: ${W}$app_arch"
    else
        print_status "error" "Unsupported architecture: $app_arch, requires aarch64/arm/armv7*"
        ((errors++))
    fi
	sleep 0.2
    # Check for termux app requirements
    if [[ -d "$PREFIX" ]]; then
        print_status "ok" "Termux PREFIX: ${W}Directory found"
		sleep 0.2
		local latest_tag
		latest_tag=$(get_latest_release "termux" "termux-app")
		if [[ "$TERMUX_VERSION" == "$latest_tag" ]]; then
			print_status "ok" "Termux Version: ${W}$TERMUX_VERSION"
			sleep 0.2
			local termux_build
			termux_build=$(echo "$TERMUX_APK_RELEASE" | awk '{print tolower($0)}')
			if [[ "$termux_build" == "github" ]] || [[ "$termux_build" == "fdroid" ]]; then
				print_status "ok" "Termux Build: ${W}$TERMUX_APK_RELEASE"
				sleep 0.2
			else
        		print_status "error" "$TERMUX_APK_RELEASE build is not recomended"
				echo "${W}Update Termux:- https://github.com/termux/termux-app/releases ${W}"
				sleep 0.2
			fi
		else
			print_status "warn" "Termux Version: ${W}$TERMUX_VERSION (Not Recomended)"
			echo "${R}[${G}!${R}]${G} Update Termux:- https://github.com/termux/termux-app/releases ${W}"
			sleep 0.2
		fi
    else
        print_status "error" "Termux PREFIX: directory not found"
        ((errors++))
		sleep 0.2
    fi
    # Check available storage space
	free_space=$(df -h "$HOME" | awk 'NR==2 {print $4}')
    if [[ $(df "$HOME" | awk 'NR==2 {print $4}') -gt 4194304 ]]; then
        print_status "ok" "Available storage: ${W}$free_space"
    else
        print_status "warn" "Low storage space: ${W}$free_space (4GB recommended)"
    fi
	sleep 0.2
    # Check RAM
	total_ram=$(free -htm | awk '/Mem:/ {print $2}')
    if [[ $(free -m | awk 'NR==2 {print $2}') -gt 2048 ]]; then
        print_status "ok" "RAM: ${W}${total_ram}"
    else
        print_status "warn" "Low RAM: ${W}${total_ram} (2GB recommended)"
    fi
	sleep 0.2
    echo
    if [[ $errors -eq 0 ]]; then
        print_success "All system requirements met!"
		sleep 0.2
        return 0
    else
        print_failed "Found $errors error(s). System requirements not met."
		sleep 0.2
		echo
        confirmation_y_or_n "Do you want to continue anyway (Not Recomended)" continue_install_anyway
		if [[ "$continue_install_anyway" == "n" ]]; then
			trap - SIGINT SIGTSTP
			exit 1
		fi
    fi
}

function print_recomended_msg() {
check_system_requirements
echo
echo "${R}[${C}-${R}]${G}${BOLD} Please read this..."
echo -e "${W}
1. Ensure it's a clean installation.\n
2. Make sure you have at least 1 GB of internet data.\n
3. Use a reliable VPN to avoid any internet connection issues.\n
4. Long press on Termux and enable "Keep screen on".\n
5. Do not close Termux during the installation process.\n
6. Make sure to read all README files carefully."
if [[ "$android_version" -ge 12 ]]; then
echo -e "${W}
7. Make sure to disable Phantom Process Killer.
"
fi
# Re-enable keyboard interruptions
trap - SIGINT SIGTSTP
wait_for_keypress
}

function install_required_packages() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Installing required packages...${W}"
    echo

    if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        package_install_and_check "wget pv jq curl pulseaudio termux-am"
    else
        package_install_and_check "wget pv jq curl pulseaudio tar xz-utils gzip termux-am x11-repo tur-repo"
    fi
    update_sys
}

function install_desktop() {
    banner

    if [[ "$desktop_answer" == "1" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing Xfce4 Desktop${W}"
        echo
        package_install_and_check "xfce4 xfce4-goodies"
    elif [[ "$desktop_answer" == "2" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing Lxqt Desktop${W}"
        echo
        package_install_and_check "lxqt openbox gtk3 papirus-icon-theme xorg-xsetroot"
    elif [[ "$desktop_answer" == "3" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing Openbox WM${W}"
        echo
        package_install_and_check "openbox polybar xorg-xsetroot lxappearance wmctrl feh termux-api thunar firefox mpd rofi bmon xcompmgr xfce4-settings gtk3 gedit"
    elif [[ "$desktop_answer" == "4" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing MATE${W}"
        echo
        package_install_and_check "mate*"
        package_install_and_check "marco mousepad xfce4-taskmanager lximage-qt"
    fi
	package_install_and_check "kvantum xwayland file-roller pavucontrol gnome-font-viewer atril galculator gdk-pixbuf libwayland-protocols xorg-xrdb"
    # Uncomment if additional package installation is needed
    # if [[ "$distro_add_answer" == "y" ]]; then
    #     package_install_and_check "xdg-utils"
    # fi
}

#########################################################################
#
# Theme Installer
#
#########################################################################
function set_config_dir() {
	if [[ "$de_name" == "xfce" ]]; then
	config_dirs=(autostart cairo-dock dconf gtk-3.0 Mousepad pulse Thunar menu ristretto rofi xfce4)
	elif [[ "$de_name" == "lxqt" ]]; then
	config_dirs=(fontconfig gtk-3.0 lxqt pcmanfm-qt QtProject.conf glib-2.0 Kvantum openbox qterminal.org)
	elif [[ "$de_name" == "openbox" ]]; then
	config_dirs=(dconf gedit Kvantum openbox pulse rofi xfce4 enchant gtk-3.0 mimeapps.list polybar QtProject.conf Thunar)
	elif [[ "$de_name" == "mate" ]]; then
	config_dirs=(caja dconf galculator gtk-3.0 Kvantum lximage-qt menus Mousepad pavucontrol.ini xfce4)
    fi
}

function theme_installer() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Theme: ${C}${style_name}${W}"
    echo

    if [[ "$de_name" == "xfce" ]] || [[ "$de_name" == "openbox" ]]; then
        package_install_and_check "gnome-themes-extra"
    fi

    sleep 3
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Wallpapers...${W}"
    echo
    check_and_create_directory "$PREFIX/share/backgrounds"
    download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/wallpaper.tar.gz" "$PREFIX/share/backgrounds/"

    banner
    check_and_create_directory "$icons_folder"
    download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/icon.tar.gz" "$icons_folder"

    if [[ "$de_name" == "xfce" ]]; then
        local icons_themes_names
		icons_themes_names=$(ls "$icons_folder")
        local icons_theme
        for icons_theme in $icons_themes_names; do
            if [[ -d "$icons_folder/$icons_theme" ]]; then
                echo "${R}[${C}-${R}]${G} Creating icon cache...${W}"
                gtk-update-icon-cache -f -t "$icons_folder/$icons_theme"
            fi
        done
    fi

    local sys_icons_themes_names
	sys_icons_themes_names=$(ls "$sys_icons_folder")
    local sys_icons_theme
    for sys_icons_theme in $sys_icons_themes_names; do
        if [[ -d "$sys_icons_folder/$sys_icons_theme" ]]; then
            echo "${R}[${C}-${R}]${G} Creating icon cache...${W}"
            gtk-update-icon-cache -f -t "$sys_icons_folder/$sys_icons_theme"
        fi
    done

    echo "${R}[${C}-${R}]${G}${BOLD} Installing Theme...${W}"
    echo
    check_and_create_directory "$themes_folder"
    download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/theme.tar.gz" "$themes_folder"

    echo "${R}[${C}-${R}]${G} Making Additional Configuration...${W}"
    echo
    check_and_create_directory "$HOME/.config"
    set_config_dir

    for the_config_dir in "${config_dirs[@]}"; do
        check_and_delete "$HOME/.config/$the_config_dir"
    done

    if [[ "$de_name" == "openbox" ]]; then
        download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/config.tar.gz" "$HOME"
    else
        download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/config.tar.gz" "$HOME/.config/"
    fi
}

#########################################################################
#
# Install Additional Packages For Theme
#
#########################################################################

function additional_required_package_installler() {
    banner
	if [[ "$de_name" == "xfce" ]]; then
    echo "${R}[${C}-${R}]${G}${BOLD} Installing Additional Packages If Required...${W}"
	echo
	if [[ "$style_answer" == "2" ]] || [[ "$style_answer" == "5" ]] || [[ "$style_answer" == "6" ]]; then
	package_install_and_check "cairo-dock-core"
	elif [[ "$style_answer" == "2" ]] || [[ "$style_answer" == "6" ]]; then
	package_install_and_check "rofi"
	elif [[ "$style_answer" == "2" ]]; then
	package_install_and_check "fluent-icon-theme vala-panel-appmenu"
	elif [[ "$style_answer" == "4" ]]; then
    package_install_and_check "gtk2-engines-murrine"
	elif [[ "$style_answer" == "5" ]] || [[ "$style_answer" == "6" ]]; then
	cp "$HOME/.config/xpple_menu/applications/*" "$PREFIX/share/applications/"
	elif [[ "$style_answer" == "7" ]]; then
	install_font_for_style "7"
	else
	echo "${R}[${C}-${R}]${G} No Additional Packages Required For Theme: ${style_answer}${W}"
	sleep 1
	fi
	elif [[ "$de_name" == "openbox" ]]; then
	    if [[ "$style_answer" == "1" ]]; then
	    install_font_for_style "1"
		else
		echo "${R}[${C}-${R}]${G} No Additional Packages Required For Theme: ${style_answer}${W}"
	    sleep 1
	    fi
	fi
}

#########################################################################
#
# Setup Selected Style And Wallpapers
#
#########################################################################

function setup_config() {
	cd "$HOME" || return
	if [[ ${style_answer} =~ ^[1-9][0-9]*$ ]]; then
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Installing $de_name Style: ${C}${style_answer}${W}"
	theme_installer
	additional_required_package_installler
	fi
	if [[ "$ext_wall_answer" == "n" ]]; then
	echo "${R}[${C}-${R}]${C} Skipping Extra Wallpapers Setup...${W}"
	echo
	elif [[ "$ext_wall_answer" == "y" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Installing Some Extra Wallpapers...${W}"
	echo
	check_and_create_directory "$PREFIX/share/backgrounds"
	download_and_extract "https://archive.org/download/wallpaper-extra.tar/wallpaper-extra.tar.gz" "$PREFIX/share/backgrounds/"
	fi
}

function setup_folder() {
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Configuring Storage...${W}"
	echo
	while true; do
	termux-setup-storage
	sleep 4
    if [[ -d ~/storage ]]; then
	break
    else
	print_failed "Storage permission denied"
    fi
    sleep 3
	done
	cd "$HOME" || return
	termux-reload-settings
	directories=(Music Download Pictures Videos)
	for dir in "${directories[@]}"; do
	check_and_create_directory "$HOME/storage/shared/$dir"
	done
	check_and_create_directory "$HOME/Desktop"
	ln -s "$HOME/storage/shared/Music" "$HOME/"
	ln -s "$HOME/storage/shared/Download" "$HOME/Downloads"
	ln -s "$HOME/storage/shared/Pictures" "$HOME/"
	ln -s "$HOME/storage/shared/Videos" "$HOME/"
}

#########################################################################
#
# Hardware Acceleration Setup
#
#########################################################################

# setup hardware acceleration, check if the enable-hw-acceleration already exist then then first check if it different from github , then ask user if they want to replace it or not, if not then continue with the lacal enable-hw-acceleration file
function hw_config() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Hardware Acceleration${W}"
    echo

    if [[ -f ${current_path}/enable-hw-acceleration ]]; then
        local current_script_hash
        current_script_hash=$(curl -sL https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/enable-hw-acceleration | sha256sum | cut -d ' ' -f 1)
        local local_script_hash
        local_script_hash=$(sha256sum "${current_path}/enable-hw-acceleration" | cut -d ' ' -f 1)

        if [[ "$local_script_hash" != "$current_script_hash" ]]; then
            echo "${R}[${C}-${R}]${G} A different version of the hardware acceleration installer is detected.${W}"
            echo

            confirmation_y_or_n "Do you want to replace it with the latest version?" change_old_hw_installer

            if [[ "$change_old_hw_installer" == "y" ]]; then
                check_and_backup "${current_path}/enable-hw-acceleration"
                download_file "${current_path}/enable-hw-acceleration" https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/enable-hw-acceleration
				chmod +x "${current_path}/enable-hw-acceleration"
                . "${current_path}"/enable-hw-acceleration
            else
                echo "${R}[${C}-${R}]${G} Using the local hardware acceleration setup file.${W}"
                chmod +x "${current_path}/enable-hw-acceleration"
                . "${current_path}"/enable-hw-acceleration
            fi

            echo "change_old_hw_installer=\"$change_old_hw_installer\"" >> "$config_file"
        else
            echo "${R}[${C}-${R}]${G} Using the local hardware acceleration setup file.${W}"
            chmod +x "${current_path}/enable-hw-acceleration"
            . "${current_path}"/enable-hw-acceleration
        fi
    else
        download_file "${current_path}/enable-hw-acceleration" https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/enable-hw-acceleration
		chmod +x "${current_path}/enable-hw-acceleration"
        . "${current_path}"/enable-hw-acceleration
    fi

    check_and_delete "${current_path}/enable-hw-acceleration"
	print_log "$current_path $current_script_hash $local_script_hash"
}

#########################################################################
#
# Proot Distro Setup
#
#########################################################################

# same as the hardware acceleration setup but for distro-container-setup file
function distro_container_setup() {
    if [[ "$distro_add_answer" == "n" ]]; then
        banner
        echo "${R}[${C}-${R}]${C} Skipping Linux Distro Container Setup...${W}"
        echo
        hw_config
    else
        banner
        echo "${R}[${C}-${R}]${G}${BOLD} Configuring Linux Distro Container${W}"
        echo

        if [[ -f "${current_path}/distro-container-setup" ]]; then
            local current_script_hash
            current_script_hash=$(curl -sL https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/distro-container-setup | sha256sum | cut -d ' ' -f 1)
            local local_script_hash
            local_script_hash=$(basename "$(sha256sum "${current_path}/distro-container-setup" | cut -d ' ' -f 1)")

            if [[ "$local_script_hash" != "$current_script_hash" ]]; then
                echo "${R}[${C}-${R}]${G} It looks like you already have a different distro-container setup script in your current directory${W}"
                echo
                confirmation_y_or_n "Do you want to change it with the latest installer" change_old_distro_installer

                if [[ "$change_old_distro_installer" == "y" ]]; then
                    check_and_backup "${current_path}/distro-container-setup"
                    download_file "${current_path}/distro-container-setup" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/distro-container-setup"

                    chmod +x "${current_path}/distro-container-setup"
                    . "${current_path}/distro-container-setup"
                else
                    echo "${R}[${C}-${R}]${G} Using the local distro-container setup file${W}"
                    chmod +x "${current_path}/distro-container-setup"
                    . "${current_path}/distro-container-setup"
                fi

                echo "change_old_distro_installer=\"$change_old_distro_installer\"" >> "$config_file"
            else
                echo "${R}[${C}-${R}]${G} Using the local distro-container setup file${W}"
                chmod +x "${current_path}/distro-container-setup"
                . "${current_path}/distro-container-setup"
            fi
        else
            download_file "${current_path}/distro-container-setup" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/distro-container-setup"

            # Check if arguments are passed
            if [[ ("$1" == "--change" || "$1" == "-c") && ("$2" == "distro" || "$2" == "pd") ]]; then
                sed -i 's/\(call_from_change_d="\)[^"]*/\1y/' "${current_path}/distro-container-setup"
            fi

            chmod +x "${current_path}/distro-container-setup"
            . "${current_path}/distro-container-setup"
        fi
	check_and_delete "${current_path}/distro-container-setup"
    fi

    echo "distro_add_answer=\"$distro_add_answer\"" >> "$config_file"
	print_log "$current_path $distro_add_answer $local_script_hash"
}

#########################################################################
#
# Vnc | Termux:x11 | Launch Scripts
#
#########################################################################

function setup_vncstart_cmd() {
    check_and_delete "$PREFIX/bin/vncstart"

cat <<EOF > "$PREFIX/bin/vncstart"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-lock

vnc_server_pid=\$(pgrep -f "vncserver")
de_pid=\$(pgrep -f "$de_startup")
if [[ -n "\$de_pid" ]] || [[ -n "\$vnc_server_pid" ]]>/dev/null 2>&1; then
vncstop -f
fi

pulseaudio --start --exit-idle-time=-1

case \$1 in
--nogpu)
env XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe vncserver
;;
--help|-h)
echo "${C}vncstart ${G}to start vncserver with gpu acceleration${W}"
echo "${C}vncstart ---nogpu ${G}to start vncserver without gpu acceleration${W}"
;;
*)
export ${set_to_export}
${initialize_server_method} &
env XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg $hw_method vncserver
;;
esac
EOF
    chmod +x "$PREFIX/bin/vncstart"
}

function setup_vncstop_cmd() {
    check_and_delete "$PREFIX/bin/vncstop"
cat <<'EOF' > "$PREFIX/bin/vncstop"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-unlock

if [[ "$1" == "-f" ]]; then
pkill -9 Xtigervnc > /dev/null 2>&1
else
display_numbers=$(vncserver -list | awk '/^:[0-9]+/ {print $1}')

for display in $display_numbers; do
    vncserver -kill "$display"
done
fi
rm $HOME/.vnc/localhost:*.log > /dev/null 2>&1
rm $PREFIX/tmp/.X1-lock > /dev/null 2>&1
rm $PREFIX/tmp/.X11-unix/X1 > /dev/null 2>&1
EOF
    chmod +x "$PREFIX/bin/vncstop"
}

function setup_vnc() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Vnc...${W}"
    echo
    package_install_and_check "tigervnc"
    check_and_create_directory "$HOME/.vnc"
    check_and_delete "$HOME/.vnc/xstartup"
cat << EOF > "$HOME/.vnc/xstartup"
    $de_startup &
EOF
    chmod +x "$HOME/.vnc/xstartup"
	setup_vncstart_cmd
	setup_vncstop_cmd
}

function setup_tx11start_cmd() {
	check_and_delete "$PREFIX/bin/tx11start"
cat <<EOF > "$PREFIX/bin/tx11start"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-lock

termux_x11_pid=\$(pgrep -f /system/bin/app_process.*com.termux.x11.Loader)
de_pid=\$(pgrep -f "$de_startup")
if [ -n "\$termux_x11_pid" ] || [ -n "\$de_pid" ] >/dev/null 2>&1; then
pkill -f com.termux.x11 > /dev/null 2>&1
kill -9 \$de_pid > /dev/null 2>&1
fi

pulseaudio --start --exit-idle-time=-1

###########################################################
#                                                         #
#************************* Debug *************************#
#                                                         #
###########################################################

if [[ "\$1" == "--debug" ]]; then
case \$2 in
--nogpu)
    # Start Termux X11 without GPU acceleration
    XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe dbus-launch --exit-with-session $de_startup

    # Check if the second argument is --legacy
    if [[ "\$3" == "--legacy" ]]; then
        XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing &
        sleep 1
        am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
        sleep 1
        env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} dbus-launch --exit-with-session $de_startup
    fi
    ;;

--nodbus)
    # Start Termux X11 without dbus-launch
	export ${set_to_export}
	${initialize_server_method} &
    env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -xstartup $de_startup
    exit 0

    # Nested case to check for additional options
    case \$3 in
    --nogpu)
        env LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -xstartup $de_startup

        if [[ "\$4" == "--legacy" ]]; then
            env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup
        fi
        ;;
    --legacy)
	export ${set_to_export}
	${initialize_server_method} &
        env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup
        ;;
    *)
        echo -e "${C}--legacy ${G}to start termux:x11 with -legacy-drawing${W}"
        echo -e "${C}--nogpu ${G}to start termux:x11 without GPU acceleration${W}"
        exit 0
        ;;
    esac
    ;;

--legacy)
    # Start Termux X11 with legacy drawing mode
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup
    ;;

*)
    # Default behavior: start Termux X11 with GPU acceleration and dbus
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup
    ;;
esac

elif [[ "\$1" == "--help" ]]; then

###########################################################
#                                                         #
#************************** Help *************************#
#                                                         #
###########################################################

    # Display help information
    echo -e "${C}tx11start ${G}to start termux:x11 with GPU acceleration${W}"
    echo -e "${C}tx11start --nogpu ${G}to start termux:x11 without GPU acceleration${W}"
    echo -e "${C}tx11start --nodbus ${G}to start termux:x11 without dbus${W}"
    echo -e "${C}tx11start --legacy ${G}to start termux:x11 with -legacy-drawing${W}"
	echo -e "${C}tx11start --debug ${G}at the start to see debug log${W}"
    exit 0
else

###########################################################
#                                                         #
#************************* Main **************************#
#                                                         #
###########################################################

case \$1 in
--nogpu)
    # Start Termux X11 without GPU acceleration
    XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &

    # Check if the second argument is --legacy
    if [[ "\$2" == "--legacy" ]]; then
        XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} -legacy-drawing &
        sleep 1
        am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
        sleep 1
        env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &
    fi
    ;;

--nodbus)
    # Start Termux X11 without dbus-launch
	export ${set_to_export}
	${initialize_server_method} &
    env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} termux-x11 :${display_number} -xstartup $de_startup > /dev/null 2>&1 &
    exit 0

    # Nested case to check for additional options
    case \$2 in
    --nogpu)
        env LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} termux-x11 :${display_number} -xstartup $de_startup > /dev/null 2>&1 &

        if [[ "\$3" == "--legacy" ]]; then
            env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup > /dev/null 2>&1 &
        fi
        ;;
    --legacy)
	export ${set_to_export}
	${initialize_server_method} &
        env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup > /dev/null 2>&1 &
        ;;
    *)
        echo -e "${C}--legacy ${G}to start termux:x11 with -legacy-drawing${W}"
        echo -e "${C}--nogpu ${G}to start termux:x11 without GPU acceleration${W}"
        exit 0
        ;;
    esac
    ;;

--legacy)
    # Start Termux X11 with legacy drawing mode
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} -legacy-drawing &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &
    ;;
*)
    # Default behavior: start Termux X11 with GPU acceleration and dbus
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &
    ;;
esac
fi
EOF

if [[ "$de_name" == "xfce" ]]; then
cat <<'EOF' >> "$PREFIX/bin/tx11start"
sleep 5
process_id=$(ps -aux | grep '[x]fce4-screensaver' | awk '{print $2}')
kill "$process_id" > /dev/null 2>&1
EOF
fi
chmod +x "$PREFIX/bin/tx11start"
}

function setup_tx11stop_cmd() {
	check_and_delete "$PREFIX/bin/tx11stop"
if [[ "$de_name" == "openbox" ]]; then
cat <<EOF > "$PREFIX/bin/tx11stop"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-unlock

termux_x11_pid=\$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
de_pid=\$(pgrep -f $de_startup)
if [[ -n "\$termux_x11_pid" ]] || [[ -n "\$de_pid" ]]; then
kill -9 "\$termux_x11_pid" > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 openbox* > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
pkill -f com.termux.x11 > /dev/null 2>&1
	if [[ ! -n "\$termux_x11_pid" ]] || [[ ! -n "\$de_pid" ]]; then
	echo -e "${G}Termux:X11 Stopped Successfully ${W}"
	fi
elif [[ "\$1" == "-f" ]]; then
pkill -f com.termux.x11 > /dev/null 2>&1
pkill -9 openbox* > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
echo -e "${G}Termux:X11 Successfully Force Stopped ${W}"
elif [[ "\$1" == "-h" ]]; then
echo -e "tx11stop       to stop termux:x11"
echo -e "tx11stop -f    to kill termux:x11"
fi
exec 2>/dev/null
EOF
else
cat <<EOF > "$PREFIX/bin/tx11stop"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-unlock

termux_x11_pid=\$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
de_pid=\$(pgrep -f $de_startup)
if [[ -n "\$termux_x11_pid" ]] || [[ -n "\$de_pid" ]]; then
kill -9 "\$termux_x11_pid" > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 $de_name-* > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
pkill -f com.termux.x11 > /dev/null 2>&1
	if [[ ! -n "\$termux_x11_pid" ]] || [[ ! -n "\$de_pid" ]]; then
	echo -e "${G}Termux:X11 Stopped Successfully ${W}"
	fi
elif [[ "\$1" == "-f" ]]; then
pkill -f com.termux.x11 > /dev/null 2>&1
pkill -9 $de_name-* > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
echo -e "${G}Termux:X11 Successfully Force Stopped ${W}"
elif [[ "\$1" == "-h" ]]; then
echo -e "tx11stop       to stop termux:x11"
echo -e "tx11stop -f    to kill termux:x11"
fi
exec 2>/dev/null
EOF
fi
chmod +x "$PREFIX/bin/tx11stop"
}

function setup_termux_x11() {
	banner
        echo "${R}[${C}-${R}]${G}${BOLD} Configuring Termux:X11 ${W}"
        echo
        package_install_and_check "termux-x11-nightly"
		local repo_owner="termux"
		local repo_name="termux-x11"
		local latest_tag
		latest_tag=$(get_latest_release "$repo_owner" "$repo_name")
		local termux_x11_url="https://github.com/$repo_owner/$repo_name/releases/download/v$latest_tag/"
		local assets
		assets=$(curl -s "https://api.github.com/repos/$repo_owner/$repo_name/releases/latest" | grep -oP '(?<="name": ")[^"]*')
		deb_assets=$(echo "$assets" | grep "termux-x11.*all.deb")
		download_file "$current_path/termux-x11.deb" "$termux_x11_url/$deb_assets"
		apt install "$current_path/termux-x11.deb" -y
		rm "$current_path/termux-x11.deb"
		# "sed -i '12s/^#//' "$HOME/.termux/termux.properties"
		setup_tx11start_cmd
		setup_tx11stop_cmd
}

function gui_termux_x11() {
cat << EOF > "$PREFIX/bin/gui"
#!/data/data/com.termux/files/usr/bin/bash
case \$1 in
--start|-l)
tx11start
;;
--stop|-s)
tx11stop
;;
--kill|-k|-kill)
tx11stop -f
;;
--help|-h)
echo -e "${G} Use ${C}gui --start / gui -l ${G}to start termux:x11\n Use ${C}gui --stop / gui -s ${G}to stop termux:x11${W}"
;;
*)
echo "${R}Invalid choise${W}"
gui -h
;;
esac
EOF
}

function gui_both() {
cat << EOF > "$PREFIX/bin/gui"
#!/data/data/com.termux/files/usr/bin/bash
case \$1 in
    --start|-l)
        case \$2 in
            tx11)
                tx11start
                ;;
            vnc)
                vncstart
                ;;
            *)
                echo -e "${R}Invalid choise. Use ${C}tx11${R} or ${C}vnc ${G}with it${W}"
                ;;
        esac
        ;;
	--kill|-k|-kill)
	vncstop -f > /dev/null 2>&1
	tx11stop -f > /dev/null 2>&1
	echo -e "${G}Gui services killed successfully ${W}"
	;;
    --stop|-s)
        case \$2 in
            tx11)
                tx11stop
                ;;
            vnc)
                vncstop
                ;;
            *)
                echo -e "${R}Invalid choise. Use ${C}tx11${R} or ${C}vnc ${G}with it${W}"
                ;;
        esac
        ;;
    --help|-h)
        echo -e "${G}Use ${C}gui --start tx11/vnc${G} or ${C}gui -l tx11/vnc${G} to start a gui"
        echo -e "Use ${C}gui --stop tx11/vnc${G} or ${C}gui -s tx11/vnc${G} to stop a gui${W}"
		echo -e "Use ${C}gui --kill ${G} To kill both at once${W}"
        ;;
    *)
        echo -e "${R}Invalid choice${W}"
        gui -h
        ;;
esac
EOF
}

function gui_launcher() {
	check_and_delete "$PREFIX/bin/gui"
	package_install_and_check "xorg-xhost"
	if [[ "$gui_mode" == "termux_x11" ]]; then
	setup_termux_x11
	echo "gui_mode=\"termux_x11\"" >> "$config_file"
	gui_termux_x11
	elif [[ "$gui_mode" == "both" ]]; then
	setup_termux_x11
	setup_vnc
	echo "gui_mode=\"both\"" >> "$config_file"
	gui_both
	else
	setup_termux_x11
	echo "gui_mode=\"termux_x11\"" >> "$config_file"
	gui_termux_x11
	fi
	chmod +x "$PREFIX/bin/gui"
	check_and_create_directory "$PREFIX/share/applications/"
cat <<EOF > "$PREFIX/share/applications/killgui.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Stop Desktop
Comment=Kill or stop termux desktop
Exec=gui --kill
Icon=system-shutdown
Categories=System;
Path=
Terminal=false
StartupNotify=false
EOF
	chmod 644 "$PREFIX/share/applications/killgui.desktop"
	cp "$PREFIX/share/applications/killgui.desktop" "$HOME/Desktop/"
}

function check_desktop_process() {
	banner
	echo "${R}[${C}-${R}]${G} Checking Termux:X11 and $de_name setup or not... ${W}"
	echo
    sleep 0.5
	# check tx11start file and run it to ckeck termux x11 process
	if [[ -f "${PREFIX}/bin/tx11start" ]]; then
        print_status "ok" "Found tx11start file."
		echo "${R}[${C}-${R}]${G} Starting Termux:X11 for checkup...${W}"
		tax11start
		print_log "$(cat $PREFIX/bin/tx11start)"
		termux_x11_pid=$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
		if [[ -n "$termux_x11_pid" ]]; then
        	print_status "ok" "Termux:X11 Working"
		else
			print_status "error" "No Termux:X11 process found."
		fi
	fi

	# check for the desktop environment related process
	case "$de_name" in
	    xfce)
	        de_pid="$(pgrep xfce4)"
	        ;;
	    lxqt|openbox|mate)
	        de_pid="$(pgrep $de_name)"
	        ;;
	    *)
	        print_status "error" "Unknown desktop environment: $de_name"
	        sleep 0.2
	        ;;
	esac

	if [[ -n "$de_pid" ]]; then
	    print_status "ok" "$de_name is running fine"
		sleep 0.2
	else
	    print_status "error" "No $de_name process found"
		sleep 0.2
	fi

	# check tx11stop file and run it to ckeck if there any termux x11 process exist or not
	if [[ -f "${PREFIX}/bin/tx11stop" ]]; then
		print_status "ok" "Found tx11stop file."
		tx11stop
		print_log "$(cat $PREFIX/bin/tx11stop)"
		termux_x11_pid=$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
		if [[ -z "$termux_x11_pid" ]]; then
        	print_status "ok" "Tx11stop command working"
		else
			print_status "error" "Tx11stop command not working"
		fi
	fi
}

#########################################################################
#
# Install Browser
#
#########################################################################

function browser_installer() {
	banner
	if [[ ${browser_answer} == "1" ]]; then
	package_install_and_check "firefox"
	echo "installed_browser=\"firefox\"" >> "$config_file"
	elif [[ ${browser_answer} == "2" ]]; then
	package_install_and_check "chromium"
	echo "installed_browser=\"chromium\"" >> "$config_file"
	elif [[ ${browser_answer} == "3" ]]; then
	package_install_and_check "firefox chromium"
	echo "installed_browser=\"both\"" >> "$config_file"
	elif [[ ${browser_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Browser Installation...${W}"
	echo "installed_browser=\"skip\"" >> "$config_file"
	echo
	sleep 2
	else
	package_install_and_check "firefox"
	echo "installed_browser=\"firefox\"" >> "$config_file"
	fi
}

#########################################################################
#
# Install Ide
#
#########################################################################

function ide_installer() {
	banner
	if [[ ${ide_answer} == "1" ]]; then
		package_install_and_check "code-oss code-is-code-oss"
	echo "installed_ide=\"code\"" >> "$config_file"
	elif [[ ${ide_answer} == "2" ]]; then
		package_install_and_check "geany"
	echo "installed_ide=\"geany\"" >> "$config_file"
	elif [[ ${ide_answer} == "3" ]]; then
		package_install_and_check "code-oss code-is-code-oss geany"
	echo "installed_ide=\"both\"" >> "$config_file"
	elif [[ ${ide_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Ide Installation...${W}"
	echo
	echo "installed_ide=\"skip\"" >> "$config_file"
	sleep 2
	else
		package_install_and_check "code-oss code-is-code-oss"
	echo "installed_ide=\"code\"" >> "$config_file"
	fi
}

#########################################################################
#
# Install Media Player
#
#########################################################################

function media_player_installer() {
	banner
	if [[ ${player_answer} == "1" ]]; then
		package_install_and_check "vlc-qt-static"
	echo "installed_media_player=\"vlc\"" >> "$config_file"
	elif [[ ${player_answer} == "2" ]]; then
		package_install_and_check "audacious"
	echo "installed_media_player=\"audacious\"" >> "$config_file"
	elif [[ ${player_answer} == "3" ]]; then
		package_install_and_check "vlc-qt-static audacious"
	echo "installed_media_player=\"both\"" >> "$config_file"
	elif [[ ${player_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Media Player Installation...${W}"
	echo
	sleep 2
	echo "installed_media_player=\"skip\"" >> "$config_file"
	else
		package_install_and_check "vlc-qt-static"
	echo "installed_media_player=\"vlc\"" >> "$config_file"
	fi
}

#########################################################################
#
# Install Photo Editor
#
#########################################################################

function photo_editor_installer() {
	banner
	if [[ ${photo_editor_answer} == "1" ]]; then
		package_install_and_check "gimp"
	echo "installed_photo_editor=\"gimp\"" >> "$config_file"
	elif [[ ${photo_editor_answer} == "2" ]]; then
		package_install_and_check "inkscape"
	echo "installed_photo_editor=\"inkscape\"" >> "$config_file"
	elif [[ ${photo_editor_answer} == "3" ]]; then
		package_install_and_check "gimp inkscape"
	echo "installed_photo_editor=\"both\"" >> "$config_file"
	elif [[ ${photo_editor_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Photo Editor Installation...${W}"
	echo
	sleep 2
	echo "installed_photo_editor=\"skip\"" >> "$config_file"
	else
		package_install_and_check "gimp"
	echo "installed_photo_editor=\"gimp\"" >> "$config_file"
	fi

}

#########################################################################
#
# Install Software Manager
#
#########################################################################

function setup_synaptic() {
	banner
    if [[ "$synaptic_answer" == "n" ]]; then
	banner
    echo "${R}[${C}-${R}]${C} Skipping Synaptic Setup..${W}"
	echo
    sleep 1.5
	else
	echo "${R}[${C}-${R}]${G} Installing Synaptic Graphical Package Manager...${W}"
	echo
	package_install_and_check "synaptic"
	fi
	echo "install_synaptic=\"$synaptic_answer\"" >> "$config_file"
}

#########################################################################
#
# Install Extra Apps
#
#########################################################################

function install_extra_apps() {
	if [[ "$extra_app_suite" == "y" ]]; then
		banner
    	echo "${R}[${C}-${R}]${C} Installing The Extra App Suite...${W}"
		echo
		package_install_and_check "gedit rhythmbox xpdf thunderbird transmission-gtk "
		if [[ "$distro_add_answer" == "y" ]]; then
			echo "${R}[${C}-${R}]${G} Installing Libreoffice ${W}"
			echo
			if [[ "$selected_distro" == "archlinux" ]]; then
				$selected_distro install libreoffice-fresh -y
			else
				$selected_distro install libreoffice -y
			fi
		fi
	fi

}

#########################################################################
#
# Setup Zsh And Terminal and File Manager Utility
#
#########################################################################

function get_shellrc_path() {
	if [[ "$shell_name" == "bash" ]]; then
	shell_rc_file="/data/data/com.termux/files/usr/etc/bash.bashrc"
	elif [[ "$shell_name" == "zsh" ]]; then
	shell_rc_file="$HOME/.zshrc"
	fi
}

function setup_zsh() {
	banner
    if [[ "$zsh_answer" == "n" ]]; then
	echo "${R}[${C}-${R}]${C} Canceling Zsh Setup...${W}"
    sleep 1.5
	shell_name="bash"
	else
	shell_name="zsh"
	echo "${R}[${C}-${R}]${G}${BOLD} Configuring Zsh..${W}"
	echo
	package_install_and_check "zsh git"
	wget --tries=5 --retry-connrefused https://raw.githubusercontent.com/sabamdarif/simple-linux-scripts/main/install-zsh.sh
	if [[ "$distro_add_answer" == "y" ]]; then
	bash install-zsh.sh -u "$user_name"
	else
	bash install-zsh.sh
	fi
	check_and_delete "install-zsh.sh"
	clear
	fi
	get_shellrc_path
	echo "zsh_answer=\"$zsh_answer\"" >> "$config_file"
}

function terminal_utility_setup() {
	if [[ "$terminal_utility_setup_answer" == "n" ]]; then
    banner
	echo "${R}[${C}-${R}]${C} Skipping Terminal Utility Setup...${W}"
	echo
	else
	banner
	echo "${R}[${C}-${R}]${C}${BOLD} Configuring Terminal Utility For Termux...${W}"
	echo
	package_install_and_check "bat eza zoxide fastfetch openssh fzf"
	check_and_backup "$PREFIX/etc/motd"
	check_and_backup "$PREFIX/etc/motd-playstore"
    check_and_backup "$PREFIX/etc/motd.sh"
	download_file "$PREFIX/etc/motd.sh" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/motd.sh"
	if grep -q "motd.sh$" "$PREFIX/etc/termux-login.sh"; then
	sed -i "s|.*motd\.sh$|bash $PREFIX/etc/motd.sh|" "$PREFIX/etc/termux-login.sh"
    else
	echo "bash $PREFIX/etc/motd.sh" >> "$PREFIX/etc/termux-login.sh"
    fi
	check_and_create_directory "$HOME/.termux"
	check_and_backup "$HOME/.termux/colors.properties $HOME/.termux/termux.properties $HOME/.aliases"

	check_and_create_directory "$HOME/.config/fastfetch"
	download_file "$HOME/.config/fastfetch/config.jsonc" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/config.jsonc" 
	download_file "$HOME/.termux/termux.properties" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/termux.properties"
	download_file "$HOME/.aliases" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/.aliases"
	download_file "$HOME/.termux/colors.properties" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/colors.properties"
	download_file "$PREFIX/bin/termux-ssh" "https://raw.githubusercontent.com/sabamdarif/simple-linux-scripts/main/termux-ssh" && chmod +x "$PREFIX/bin/termux-ssh"
	cp "$shell_rc_file" "${shell_rc_file}-2"
	check_and_backup "$shell_rc_file"
	mv "${shell_rc_file}-2" "${shell_rc_file}"
cat <<'EOF' >> "$shell_rc_file"
#######################################################
# SPECIAL FUNCTIONS
#######################################################
# Extracts any archive(s)
extract() {
	for archive in "$@"; do
    if [[ ! -f "$archive" ]]; then
        echo "Error: '$archive' does not exist!"
        continue
    fi

    total_size=$(stat -c '%s' "$archive")

    case "$archive" in
        *.tar.gz|*.tgz)
            pv -s "$total_size" "$archive" | tar xzf -
            ;;
        *.tar.xz)
            pv -s "$total_size" "$archive" | tar xJf -
            ;;
        *.tar.bz2|*.tbz2)
            pv -s "$total_size" "$archive" | tar xjf -
            ;;
        *.tar)
            pv -s "$total_size" "$archive" | tar xf -
            ;;
        *.bz2)
            pv -s "$total_size" "$archive" | bunzip2 > "${archive%.bz2}"
            ;;
        *.gz)
            pv -s "$total_size" "$archive" | gunzip > "${archive%.gz}"
            ;;
        *.7z)
            pv -s "$total_size" "$archive" | 7z x -si -y > /dev/null
            ;;
        *.rar)
            pv -s "$total_size" "$archive" | unrar x -
            ;;
        *.zip)
            pv -s "$total_size" "$archive" | unzip -
            ;;
        *.Z)
            pv -s "$total_size" "$archive" | uncompress -
            ;;
        *)
            echo "Unsupported archive format: $archive"
            ;;
    esac
	done
}
# Searches for text in all files in the current folder
ftext() {
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}
# Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}
# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}
# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}
EOF
cat <<EOF >> "$shell_rc_file"
# set zoxide as cd
eval "\$(zoxide init --cmd cd ${shell_name})"
source $HOME/.aliases
EOF
	fi
cat <<EOF >> "$shell_rc_file"
# print your current termux-desktop configuration
alias 'tdconfig'='cat "$config_file"'
EOF
if [[ "$distro_add_answer" == "y" ]]; then
cat <<EOF >> "$shell_rc_file"
# open the folder where all the apps added by proot-distro are located
alias 'pdapps'='cd /data/data/com.termux/files/usr/share/applications/pd_added && ls'
EOF
fi
echo "terminal_utility_setup_answer=\"$terminal_utility_setup_answer\"" >> "$config_file"
}

function install_fm_tools() {
	if [[ "$fm_tools" == "y" ]]; then
		banner
		echo "${R}[${C}-${R}]${G}${BOLD} Installing File Manager Tools...${W}"
		check_and_backup "nautilus-scripts"
		git clone https://github.com/sabamdarif/nautilus-scripts
		cd nautilus-scripts
    	wget --tries=5 --retry-connrefused https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/setup-termux.sh
		bash setup-termux.sh
		cd ..
		check_and_delete "nautilus-scripts"
	fi
}

#########################################################################
#
# Install Fonts
#
#########################################################################

function setup_fonts() {
	if [[ "$terminal_utility_setup_answer" == "y" ]]; then
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Installing Fonts...${W}"
	package_install_and_check "nerdfix fontconfig-utils"
	check_and_create_directory "$HOME/.termux"
	check_and_create_directory "$HOME/.fonts"
	check_and_backup "$HOME/.termux/font.ttf"
	download_and_extract "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip" "$HOME/.fonts"
	clear
	check_and_delete "$HOME/.fonts/README.md $HOME/.fonts/LICENSE"
	cp "$HOME/.fonts/0xProtoNerdFont-Regular.ttf" "$HOME/.termux/font.ttf"
	fc-cache -f
	fi
}

#########################################################################
#
# Install Wine
#
#########################################################################

function run_wine_shortcut_script() {
	download_file "${current_path}/add-wine-shortcut" https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/add-wine-shortcut
	chmod +x "${current_path}/add-wine-shortcut"
    . "${current_path}"/add-wine-shortcut
	check_and_delete "add-wine-shortcut"
}

function setup_wine() {
	banner
    if [[ "$wine_answer" == "1" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Installing Wine Natively In Termux${W}"
	echo
	package_install_and_check "wine-stable winetricks"
	run_wine_shortcut_script
	echo "setup_wine=\"default-wine\"" >> "$config_file"
	elif [[ "$wine_answer" == "2" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Addind Mobox Launch Option To Termux${W}"
	echo
	echo "${R}[${C}-${R}]${C}${BOLD} After the installation finishes, make sure to install Mobox using their official instructions${W}"
	echo
	echo "${R}[${C}-${R}]${G}${BOLD} Mobox:- ${C}https://github.com/olegos2/mobox${W}"
	echo
	sleep 4
	download_file "$PREFIX/bin/wine" "https://raw.githubusercontent.com/LinuxDroidMaster/Termux-Desktops/main/scripts/termux_native/mobox_run.sh"
	chmod +x "$PREFIX/bin/wine"
	run_wine_shortcut_script
	cp "$PREFIX/share/applications/wine-explorer.desktop" "$HOME/Desktop/MoboxExplorer.desktop"
	echo "setup_wine=\"mobox\"" >> "$config_file"
	elif [[ "$wine_answer" == "3" ]]; then
	package_install_and_check "hangover hangover-wine winetricks"
	run_wine_shortcut_script
	echo "setup_wine=\"hangover-wine\"" >> "$config_file"
	elif [[ "$wine_answer" == "4" ]]; then
	echo "${R}[${C}-${R}]${C} Skipping wine Installation...${W}"
	echo "setup_wine=\"skip\"" >> "$config_file"
	else
    echo "${R}[${C}-${R}]${G} Installing Wine Natively In Termux${W}"
	echo
	package_install_and_check "wine-stable winetricks"
	run_wine_shortcut_script
	echo "setup_wine=\"default-wine\"" >> "$config_file"
	fi
}

#########################################################################
#
# Add Autostart
#
#########################################################################

function add_vnc_autostart() {
	echo "${R}[${C}-${R}]${G}${BOLD} Adding vnc to autostart${W}"
	if grep -q "^vncstart" "$shell_rc_file"; then
	echo "${R}[${C}-${R}]${G} Termux:X11 start already exist${W}"
	else
cat << EOF >> "$shell_rc_file"
# Start Vnc
if ! pgrep Xvnc > /dev/null; then
echo "${G}Starting Vnc...${W}"
vncstart
fi
EOF
	fi
}

function add_tx11_autostart() {
	echo "${R}[${C}-${R}]${G}${BOLD} Adding Termux:x11 to autostart${W}"
	if grep -q "^tx11start" "$shell_rc_file"; then
	echo "${R}[${C}-${R}]${G} Termux:X11 start already exist${W}"
	else
cat << EOF >> "$shell_rc_file"
# Start Termux:X11
termux_x11_pid=\$(pgrep -f "app_process -Xnoimage-dex2oat / com.termux.x11.Loader :1")
if [ -z "\$termux_x11_pid" ]; then
echo "${G}Starting Termux:x11...${W}"
tx11start
fi
EOF
	fi
}

function add_to_autostart() {
	if [[ "$de_on_startup" == "y" ]]; then
		if [[ "$gui_mode" == "vnc" ]] || [[ "$autostart_gui_mode" == "vnc" ]]; then
			add_vnc_autostart
		elif [[ "$gui_mode" == "termux_x11" ]] || [[ "$autostart_gui_mode" == "termux_x11" ]]; then
			add_tx11_autostart
		fi
	fi
	echo "de_on_startup=\"$de_on_startup\"" >> "$config_file"
}


#########################################################################
#
# Finish | Notes
#
#########################################################################
function cleanup_cache() {
	banner
	echo "${R}[${C}-${R}]${G} Cleaning up the cache...${W}"
	if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
	pacman -Scc
	else
	apt clean all
	fi
}

function add_common_function() {
	check_and_delete "$PREFIX/etc/termux-desktop/common_functions"
cat <<'EOF' > "$PREFIX/etc/termux-desktop/common_functions"
#!/data/data/com.termux/files/usr/bin/bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[0m')"
BOLD="$(printf '\033[1m')"

cd "$HOME" || exit
termux_desktop_path="$PREFIX/etc/termux-desktop"
config_file="$termux_desktop_path/configuration.conf"
log_file="$HOME/termux-desktop.log"
EOF
typeset -f check_termux print_log print_success print_failed wait_for_keypress check_and_create_directory check_and_delete check_and_backup download_file check_and_restore detact_package_manager package_install_and_check package_check_and_remove get_file_name_number extract_zip_with_progress extract_archive download_and_extract count_subfolders confirmation_y_or_n get_latest_release install_font_for_style select_an_option preprocess_conf read_conf >> "$PREFIX/etc/termux-desktop/common_functions"
chmod +x "$PREFIX/etc/termux-desktop/common_functions"
}

function delete_installer_file() {
	current_script_path="$(realpath "$0")"
	if [[ "$current_script_path" != */bin* ]]; then
	    if [[ -f "${current_path}/setup-termux-desktop" ]]; then
		(exec rm -- "${current_path}/setup-termux-desktop") &
		else
		print_failed "Installer file not found"
		fi
	fi
}

function notes() {
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Installation Successfull...${W}"
	echo
	sleep 2
	echo "${R}[${C}-${R}]${C}${BOLD} Now Restart Termux ${G}(Must)${W}"
	echo
	echo "${R}[${C}-${R}]${C}${BOLD} See Uses Section in github to know how to use it${W}"
	echo
	echo "${R}[${C}-${R}]${C} URL:- ${B}https://github.com/sabamdarif/termux-desktop/blob/main/README.md#uses${W}"
	echo
	if [[ "$distro_add_answer" == "y" ]]; then
	echo "${R}[${C}-${R}]${C}${BOLD} See how to use Linux distro container${W}"
	echo
	echo "${R}[${C}-${R}]${C} URL:- ${B}https://github.com/sabamdarif/termux-desktop/blob/main/proot-caontainer.md${W}"
	fi
}

#########################################################################
#
# Remove
#
#########################################################################

function remove_termux_desktop() {
	if [[ ! -e "$config_file" ]]; then
	echo "${R}[${C}-${R}]${C}${BOLD} Please Install Termux Desktop First${W}"
	exit 0
	else
	banner
	echo "${R}[${C}-${R}]${R}${BOLD} Remove Termux Desktop${W}"
	echo ""
	confirmation_y_or_n "Are You Sure You Want To Remove Termux Desktop Completely" ask_remove
	if [[ "$ask_remove" == "n" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Canceling...${W}"
	exit 0
	else
	echo "${R}[${C}-${R}]${R}${BOLD} Removeing Termux Desktop${W}"
	sleep 3
	read_conf
	#remove basic packages
	package_check_and_remove "pulseaudio x11-repo tur-repo"
	#remove desktop related packages
	if [[ "$de_name" == "xfce" ]]; then
	package_check_and_remove "xfce4 xfce4-goodies xwayland kvantum"
	elif [[ "$de_name" == "lxqt" ]]; then
	package_check_and_remove "lxqt xorg-xsetroot papirus-icon-theme xwayland kvantum"
	elif [[ "$de_name" == "openbox" ]]; then
	package_check_and_remove "openbox polybar xorg-xsetroot lxappearance wmctrl feh xwayland kvantum thunar firefox mpd rofi bmon xcompmgr xfce4-settings gedit"
	fi
	#remove zsh
	if [[ "$zsh_answer" == "y" ]]; then
	package_check_and_remove "zsh"
	check_and_delete ".oh-my-zsh .zsh_history .zshrc"
	fi
	#remove terminal utility
	if [[ "$terminal_utility_setup_answer" == "y" ]]; then
	check_and_delete "$PREFIX/etc/motd.sh $HOME/.termux $HOME/.fonts/font.ttf $HOME/.termux/colors.properties"
	check_and_restore "$PREFIX/etc/motd"
	check_and_restore "$PREFIX/etc/motd-playstore"
	check_and_restore "$PREFIX/etc/motd.sh"
	check_and_restore "$HOME/.termux/colors.properties"
	if grep -q "motd.sh$" "$PREFIX/etc/termux-login.sh"; then
	sed -i "s|.*motd\.sh$|# |" "$PREFIX/etc/termux-login.sh"
	fi
	package_check_and_remove "nerdfix fontconfig-utils bat eza"
	fi
	#remove browser
	if [[ "$installed_browser" == "firefox" ]]; then
	package_check_and_remove "firefox"
	elif [[ "$installed_browser" == "chromium" ]]; then
	package_check_and_remove "chromium"
	elif [[ "$installed_browser" == "both" ]]; then
	package_check_and_remove "firefox chromium"
	fi
	#remove ide
	if [[ "$installed_ide" == "code" ]]; then
	package_check_and_remove "code-oss code-is-code-oss"
	elif [[ "$installed_ide" == "geany" ]]; then
	package_check_and_remove "geany"
	elif [[ "$installed_ide" == "both" ]]; then
	package_check_and_remove "code-oss code-is-code-oss geany"
	fi
	#remove media player
	if [[ "$installed_media_player" == "vlc" ]]; then
	package_check_and_remove "vlc-qt-static"
	elif [[ "$installed_media_player" == "audacious" ]]; then
	package_check_and_remove "audacious"
	elif [[ "$installed_media_player" == "both" ]]; then
	package_check_and_remove "vlc-qt-static audacious"
	fi
	#remove photo editor
	if [[ "$installed_photo_editor" == "gimp" ]]; then
	package_check_and_remove "gimp"
	elif [[ "$installed_photo_editor" == "audacious" ]]; then
	package_check_and_remove "audacious"
	elif [[ "$installed_photo_editor" == "both" ]]; then
	package_check_and_remove "gimp audacious"
	fi
	#remove synaptic
	if [[ "$install_synaptic" == "y" ]]; then
	package_check_and_remove "synaptic"
	fi
	#remove wine
	if [[ "$setup_wine" == "default-wine" ]]; then
	package_check_and_remove "wine winetricks"
	elif [[ "$setup_wine" == "mobox" ]]; then
	echo "${R}[${C}-${R}]${C}${BOLD} Make Sure To Uninstall Mobox Using Their Instruction${W}"
	check_and_delete "$HOME/Desktop/MoboxExplorer.desktop"
	sleep 4
	elif [[ "$setup_wine" == "hangover-wine" ]]; then
	package_check_and_remove "hangover-wine winetricks"
	fi
	check_and_delete "$PREFIX/bin/wine $PREFIX/share/applications/wine-*"
	#remove styles
	if [[ "$style_name" == "Modern Style" ]] || [[ "$style_name" == "MacOS Inspired-1 Style" ]] || [[ "$style_name" == "MacOS Inspired-2 Style" ]]; then
	package_check_and_remove "cairo-dock-core"
	elif [[ "$style_name" == "Modern Style" ]] || [[ "$style_name" == "MacOS Inspired-2 Style" ]]; then
	package_check_and_remove "rofi"
	elif [[ "$style_name" == "Modern Style" ]]; then
	package_check_and_remove "fluent-icon-theme vala-panel-appmenu"
	elif [[ "$style_name" == "Windows10 Style" ]]; then
	package_check_and_remove "gtk2-engines-murrine"
	fi
	#Remove folders and other files
	check_and_delete "$PREFIX/share/backgrounds $themes_folder $icons_folder $PREFIX/etc/termux-desktop"
	check_and_delete "$HOME/.config/$the_config_dir"
	check_and_delete "$HOME/Desktop $HOME/Downloads $HOME/Videos $HOME/Pictures $HOME/Music"
	#remove hw packages
	package_check_and_remove "mesa-zink virglrenderer-mesa-zink vulkan-loader-android angle-android virglrenderer-android mesa-vulkan-icd-freedreno mesa-vulkan-icd-wrapper mesa-zink"
	#remove distro container
	if [[ "$distro_add_answer" == "y" ]]; then
	proot-distro remove "$selected_distro"
	proot-distro clear-cache
	package_check_and_remove "proot-distro"
	check_and_delete "$PREFIX/bin/$selected_distro $PREFIX/bin/pdrun"
	fi
	#remove vnc and termux x11
	check_and_delete "$PREFIX/bin/gui"
	if [[ "$gui_mode" == "termux_x11" ]]; then
	package_check_and_remove "termux-x11-nightly xorg-xhost"
	check_and_delete "$PREFIX/bin/tx11start $PREFIX/bin/tx11stop"
	elif [[ "$gui_mode" == "vnc" ]]; then
	package_check_and_remove "tigervnc xorg-xhost"
	check_and_delete "$HOME/.vnc/xstartup $PREFIX/bin/vncstart $PREFIX/bin/vncstop $PREFIX/bin/gui $PREFIX/bin/tx11start $PREFIX/bin/tx11stop"
	elif [[ "$gui_mode" == "both" ]]; then
	package_check_and_remove "termux-x11-nightly tigervnc xorg-xhost"
	check_and_delete "$PREFIX/bin/tx11start $PREFIX/bin/tx11stop $HOME/.vnc/xstartup $PREFIX/bin/vncstart $PREFIX/bin/vncstop $PREFIX/bin/gui $PREFIX/bin/tx11start $PREFIX/bin/tx11stop"
	fi
	check_and_delete "$PREFIX/etc/termux-desktop $PREFIX/bin/setup-termux-desktop"
	clear
	echo "${R}[${C}-${R}]${G}${BOLD} Everything remove successfully${W}"
	fi
	fi
}

#########################################################################
#
# Change Style
#
#########################################################################

function gui_check_up() {
termux_x11_pid=$(pgrep -f /system/bin/app_process.*com.termux.x11.Loader)
vnc_server_pid=$(pgrep -f "vncserver")
de_pid=$(pgrep -f "$de_startup")
if [[ -n "$termux_x11_pid" ]] || [[ -n "$de_pid" ]] || [[ -n "$vnc_server_pid" ]]>/dev/null 2>&1; then
echo "${G}Please Stop The Gui Desktop Server First${W}"
exit 0
fi
}

function change_style() {
	if [[ ! -e "$config_file" ]]; then
	echo -e "${C} It look like you haven't install the desktop yet\n Please install the desktop first${W}"
	exit 0
	else
	read_conf
	gui_check_up
	banner
	echo "${R}[${C}-${R}]${G} Your currently installed style is ${C}${BOLD}$style_name ${W}"
	echo
	sleep 2
	questions_theme_select
	rm -rf ~/.cache/sessions/x*
	setup_config
	banner
	echo "${R}[${C}-${R}]${G} Style changed successfully${W}"
	echo
	read_conf
	echo "${R}[${C}-${R}]${G} Your currently installed style is ${C}${BOLD}$style_name ${W}"
	fi
}

#########################################################################
#
# Change Hardware Acceleration
#
#########################################################################

function change_hw() {
	# Check if the configuration file exists
	if [[ ! -e "$config_file" ]]; then
	    echo -e "${C} It looks like you haven't installed the desktop yet\n Please install the desktop first${W}"
	    exit 0
	else
	    read_conf
	    banner
	    echo "${R}[${C}-${R}]${G} Your current hardware acceleration method for Termux is: ${C}${BOLD}${termux_hw_answer}${W}"
	    echo
	    echo "${R}[${C}-${R}]${G} Changing drivers might break the desktop environment sometimes${W}"
	    confirmation_y_or_n "Do you want to continue" confirmation_break_de
	    if [[ "$confirmation_break_de" == "y" ]]; then
	        package_check_and_remove "mesa-zink vulkan-loader-android virglrenderer-android angle-android mesa-vulkan-icd-freedreno-dri3"
	    else
	        exit 0
	    fi
	    echo "${R}[${C}-${R}]${R}${BOLD} This process might break your desktop environment${W}"
	    echo "${R}[${C}-${R}]${G}${BOLD} Make your new choice${W}"
	    echo
	    hw_questions
	    hw_config
	    if [[ "$gui_mode" == "termux_x11" ]]; then
	        setup_tx11start_cmd
	    elif [[ "$gui_mode" == "vnc" ]]; then
	        setup_vncstart_cmd
	    elif [[ "$gui_mode" == "both" ]]; then
	        setup_tx11start_cmd
	        setup_vncstart_cmd
	    fi
	    if [[ "$distro_add_answer" == "y" ]]; then
	        sed -i "s|selected_pd_hw_method=\"[^\"]*\"|selected_pd_hw_method=\"$pd_hw_method\"|" "$PREFIX/bin/pdrun"
	    fi
	    clear
	    print_success "${BOLD}Hardware acceleration method changed successfully"
	fi
}

#########################################################################
#
# Change Distro
#
#########################################################################

function change_distro() {
	if [[ ! -e "$config_file" ]]; then
	echo -e "${C} It look like you haven't install the desktop yet\n Please install the desktop first${W}"
	exit 0
	else
	read_conf
	banner
	if [[ "$distro_add_answer" == "y" ]]; then
		call_from_change_pd="y"
	    if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/$selected_distro" ]] ;then
		echo "${R}[${C}-${R}]${G} Your currently installed distro is :${C}${BOLD}${selected_distro}${W}"
		echo
		echo "${R}[${C}-${R}]${R} Changing distro will delete all the data from your previous distro${W}"
		echo
		confirmation_y_or_n "Do you want to continue" distro_change_confirmation
		    if [[ "$distro_change_confirmation" == "y" ]]; then
			choose_distro
			echo "${R}[${C}-${R}]${G} Removing $selected_distro and it's data${W}"
			pd remove $selected_distro
			check_and_delete "$PREFIX/share/applications/pd_added"
			check_and_delete "$PREFIX/bin/$selected_distro"
			pd_hw_method=$(grep 'selected_pd_hw_method=' "$PREFIX/bin/pdrun" | sed -e 's/.*selected_pd_hw_method="\([^"]*\)".*/\1/')
			if [[ "$pd_audio_config_answer" == "y" ]]; then
			rm "$HOME/.${selected_distro}-sound-access"
			fi
			echo
			distro_container_setup "$1" "$2"
			else
			echo "${R}[${C}-${R}]${C} Canceling distro change process...${W}"
			sleep 2
			exit 0
			fi
	     fi
	else
		echo "${R}[${C}-${R}]${G} It look like you haven't install any distro yet${W}"
		echo
		echo "${R}[${C}-${R}]${G}${BOLD} Do you want to add a Linux distro container (proot distro)${W}"
		echo
		echo "${R}[${C}-${R}]${G} It will help you to install those app which are not avilable in termux${W}"
		echo
		echo "${R}[${C}-${R}]${G} You can launch those installed apps from termux like other apps${W}"
		echo
		confirmation_y_or_n "Do you want to continue" distro_add_answer
		echo "distro_add_answer=\"$distro_add_answer\"" >> "$config_file"
			distro_questions
			distro_hw_questions
			distro_container_setup "$1" "$2"
	fi
	fi
}

#########################################################################
#
# Change Autostart
#
#########################################################################

function change_autostart() {
    read_conf

    if [[ $SHELL = *zsh ]]; then
        current_shell="zsh"
        shell_rc_file="$HOME/.zshrc"
    elif [[ $SHELL = *bash ]]; then
        current_shell="bash"
        shell_rc_file="/data/data/com.termux/files/usr/etc/bash.bashrc"
    fi

    if [[ "$zsh_answer" == "y" && "$current_shell" == "bash" ]] || [[ "$zsh_answer" == "n" && "$current_shell" == "zsh" ]]; then
        print_failed "It looks like you have changed your shell after the installation"
        exit 0
    fi

    if [[ "$de_on_startup" == "y" ]]; then
        if grep -q "^vncstart" "$shell_rc_file"; then
            sed -i '/# Start Vnc/,/fi/d' "$shell_rc_file"
			echo "de_on_startup=\"n\"" >> "$config_file"
		fi
        if grep -q "^tx11start" "$shell_rc_file"; then
            sed -i '/# Start Termux:X11/,/fi/d' "$shell_rc_file"
			echo "de_on_startup=\"n\"" >> "$config_file"
        fi
	elif [[ "$de_on_startup" == "n" ]]; then
	    if [[ "$de_on_startup" == "y" && "$gui_mode" == "both" ]]; then
		echo "${R}[${C}-${R}]${G} You chose both vnc and termux:x11 to access gui mode${W}"
		echo
		echo "${R}[${C}-${R}]${G} Which will be your default${W}"
		echo
		echo "${Y}1. Termux:x11${W}"
		echo
		echo "${Y}2. Vnc${W}"
		echo
		select_an_option 2 1 autostart_gui_mode_num
			if [[ "$autostart_gui_mode_num" == "1" ]]; then
				autostart_gui_mode="termux_x11"
			elif [[ "$autostart_gui_mode_num" == "2" ]]; then
				autostart_gui_mode="vnc"
			fi
		fi
		add_to_autostart
    fi
}

#########################################################################
#
# Change Display Port
#
#########################################################################

# change the Display Port/Display Number where it will show the output
function change_display() {
	read_conf
	gui_check_up
	if [[ "$gui_mode" == "termux_x11" ]] || [[ "$gui_mode" == "both" ]]; then
		echo "${R}[${C}-${R}]${G}${BOLD} Your Current Display Port: ${display_number}${W}"
		echo
		confirmation_y_or_n "Do you want to change the display port" change_display_port
		if [[ "$change_display_port" == "y" ]]; then
			while true; do
        	read -r -p "${R}[${C}-${R}]${Y}${BOLD} Type the Display Port number: ${W}" display_number
				if [[ "$display_number" =~ ^[0-9]+$ ]]; then
					break
				else
					echo "${R}[${C}-${R}]${R} Please enter a valid number between 0-9 ${W}"
				fi
    		done
			setup_tx11start_cmd
			echo "display_number=\"$display_number\"" >> "$config_file"
			sed -i "s|DISPLAY=:[0-9]*|DISPLAY=:$display_number|" "${PREFIX}/bin/pdrun"
			sed -i "s|DISPLAY=:[0-9]*|DISPLAY=:$display_number|" "${PREFIX}/bin/$selected_distro"
			print_log "Type the Display Port number: $display_number"
		fi
	else
	echo "${R}[${C}-${R}]${G} Changing display port only supported in Termux:x11${W}"
	fi
}


#########################################################################
#
# Reinstall themes
#
#########################################################################

function reinstall_themes() {
	read_conf
	gui_check_up
	tmp_themes_folder="$PREFIX/tmp/themes"
	check_and_create_directory "$tmp_themes_folder"
	echo "${R}[${C}-${R}]${G} Reinstalling Themes...${W}"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/theme.tar.gz" "$tmp_themes_folder"
	local theme_names
	theme_names=$(ls "$tmp_themes_folder")
	local theme_name
	for theme_name in $theme_names; do
	check_and_delete "$themes_folder/$theme_name"
	mv "$tmp_themes_folder/$theme_name" "$themes_folder/"
	done
	echo "${R}[${C}-${R}]${G}${BOLD} Themes reinstall successfully${W}"
}

#########################################################################
#
# Reinstall icons
#
#########################################################################

function reinstall_icons() {
	read_conf
	gui_check_up
	tmp_icons_folder="$PREFIX/tmp/icons"
	check_and_create_directory "$tmp_icons_folder"
	package_install_and_check "gdk-pixbuf"
	if [[ "$style_answer" == "2" ]]; then
	package_install_and_check "fluent-icon-theme"
	else
	echo "${R}[${C}-${R}]${G} Reinstalling Icons...${W}"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/icon.tar.gz" "$tmp_icons_folder"
	local icon_themes_names
	icon_themes_names=$(ls "$tmp_icons_folder")
	local icon_theme
	for icon_theme in $icon_themes_names; do
	check_and_delete "$icons_folder/$icon_theme"
	mv "$tmp_icons_folder/$icon_theme" "$icons_folder/"
	echo "${R}[${C}-${R}]${G} Creating icon cache...${W}"
	if [[ "$de_name" == "xfce" ]]; then
	gtk-update-icon-cache -f -t "$icons_folder/$icons_theme"
	fi
	gtk-update-icon-cache -f -t "$PREFIX/share/icons/$icons_theme"
	done
	echo "${R}[${C}-${R}]${G}${BOLD} Icons reinstall successfully${W}"
	fi
}

#########################################################################
#
# Reinstall config
#
#########################################################################

function reinstall_config() {
	read_conf
	gui_check_up
	tmp_config_folder="$PREFIX/tmp/config"
	check_and_create_directory "$tmp_config_folder"
	echo "${R}[${C}-${R}]${G} Reinstalling Config...${W}"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/config.tar.gz" "$tmp_config_folder"
	local config_file_names
	config_file_names=$(ls "$tmp_config_folder")
	local config_file
	for config_file in $config_file_names; do
	check_and_delete "$HOME/.config/$config_file"
	mv "$tmp_config_folder/$config_file" "$HOME/.config/"
	done
	echo "${R}[${C}-${R}]${G}${BOLD} Config reinstall successfully${W}"
}

#########################################################################
#
# Some Fixes | Basic Task
#
#########################################################################

function disable_vblank_mode() {
	if [[ "$de_name" == "xfce" ]]; then
		sed -i 's|<property name="vblank_mode" type="string" value="auto"/>|<property name="vblank_mode" type="string" value="off"/>|' "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml"
	fi
}

function some_fixes() {

	# samsung oneui-6 audio fixes
	local device_brand_name
	device_brand_name=$(getprop ro.product.brand | cut -d ' ' -f 1)
	if [[ $device_brand_name == samsung* && $android_version -ge 14 ]]; then
    grep -q "LD_PRELOAD=/system/lib64/libskcodec.so" "$shell_rc_file" || echo "LD_PRELOAD=/system/lib64/libskcodec.so" >> "$shell_rc_file"
	fi

	# tx11start and vncstart
	if [[ $termux_hw_answer == "freedreno" ]] || [[ $termux_hw_answer == "zink_with_mesa" ]] || [[ $termux_hw_answer == "zink_with_mesa_zink" ]]; then
	sed -i 's/^[[:space:]]*&[[:space:]]*$/ /' "$PREFIX/bin/tx11start"
	sed -i 's/^[[:space:]]*&[[:space:]]*$/ /' "$PREFIX/bin/vncstart"
	disable_vblank_mode
	fi

	if [[ "$confirmation_mesa_vulkan_icd_wrapper" == "y" ]]; then
		disable_vblank_mode
		if [[ "$device_gpu_model" == "1" ]]; then
		sed -i 's/^[[:space:]]*initialize_server="\s*"/ /' "$PREFIX/bin/pdrun"
		fi

		if [[ "$browser_answer" == "2" ]] || [[ "$browser_answer" == "3" ]]; then
		sed -i 's|Exec=/data/data/com.termux/files/usr/bin/chromium-browser %U|Exec=/data/data/com.termux/files/usr/bin/chromium-browser --enable-features=Vulkan %U|' /data/data/com.termux/files/usr/share/applications/chromium.desktop
		fi

		if [[ "$ide_answer" == "2" ]] || [[ "$ide_answer" == "3" ]]; then
		sed -i 's|/data/data/com.termux/files/usr/bin/code-oss|/data/data/com.termux/files/usr/bin/code-oss --enable-features=Vulkan|g' /data/data/com.termux/files/usr/share/applications/code-oss*
		fi
	fi
}

# add the basic details into a config file
function print_basic_details() {
	local net_condition
	local country
	net_condition="$(getprop gsm.network.type)"
	country="$(getprop gsm.sim.operator.iso-country)"
cat <<EOF > "$config_file"
####################################
########## Termux Desktop ##########
####################################

########################
#  -:Device Details:-  #
########################
#
# Termux Version: ${TERMUX_VERSION}-${TERMUX_APK_RELEASE}
# Device Model: $model
# Android Version: $android_version
# Free Space: $free_space
# Total Ram: $total_ram
# Architecture: $app_arch
# System CPU Architecture: $supported_arch
# Processor: $PROCESSOR_BRAND_NAME $PROCESSOR_NAME
# GPU: $detected_gpu
# Network Condition: $net_condition (On first run)
# Country: $country
#
########################

##### Please don't modify this file otherwise some functions won't work #####

EOF
}

function add_installer() {
	if [[ ! -e "$PREFIX/bin/setup-termux-desktop" ]]; then
		echo "${R}[${C}-${R}]${G} Adding setup-termux-desktop installer to bin${W}"
    	download_file "$PREFIX/bin/setup-termux-desktop" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-termux-desktop"
    	chmod +x "$PREFIX/bin/setup-termux-desktop"
	fi
}

# check for the changes in the installer file
function check_for_update_and_update_installer() {
    if [[ -e "$PREFIX/bin/setup-termux-desktop" ]]; then
        echo "${R}[${C}-${R}]${G} Checking for update...${W}"
        echo

        check_and_create_directory "$termux_desktop_path"
        local current_script_hash
		current_script_hash=$(curl -sL https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-termux-desktop | sha256sum | cut -d ' ' -f 1)
        local local_script_hash
		local_script_hash=$(basename "$(sha256sum "$PREFIX/bin/setup-termux-desktop" | cut -d ' ' -f 1)")

        if [[ "$local_script_hash" != "$current_script_hash" ]]; then
            confirmation_y_or_n "You are using an old installer. Do you want to update it to the latest version" update_installer

            if [[ "$update_installer" == "y" ]]; then
				check_and_create_directory "$PREFIX/etc/termux-desktop"
                mv "$PREFIX/bin/setup-termux-desktop" "$PREFIX/etc/termux-desktop/"
                check_and_backup "$PREFIX/etc/termux-desktop/setup-termux-desktop"
                add_installer
                add_common_function
				unset local_script_hash
                local new_local_script_hash
				new_local_script_hash=$(basename "$(sha256sum "$PREFIX/bin/setup-termux-desktop" | cut -d ' ' -f 1)")
                if [[ "$new_local_script_hash" == "$current_script_hash" ]]; then
                    echo "${R}[${C}-${R}]${G} Installer updated successfully${W}"
                    check_and_delete "$termux_desktop_path/skip_update_checkup"
                    exit 0
                else
                    echo "${R}[${C}-${R}]${G} Failed to update the installer${W}"
                    exit 0
                fi
            elif [[ "$update_installer" == "n" ]]; then
            	echo "${R}[${C}-${R}]${G} Keeping the old installer${W}"
            	check_and_create_directory "$termux_desktop_path"
            	touch "$termux_desktop_path/skip_update_checkup"
            	exit 0
            fi
        else
            echo -e "${R}[${C}-${R}]${G}${BOLD} Good job, you are using the latest installer${W}"
        fi
    fi
}

function check_installer_status() {
    if [[ -e "$PREFIX/bin/setup-termux-desktop" ]]; then
        if [[ ! -e "$termux_desktop_path/skip_update_checkup" ]]; then
            check_for_update_and_update_installer
        else
            echo "${R}[${C}-${R}]${G}${BOLD} Update check skipped${W}"
            echo "${R}[${C}-${R}]${G}${BOLD} Use ${C}--update ${G}to force update check${W}"
        fi
    fi
}

#########################################################################
#
# Reset Changes
#
#########################################################################

function reset_changes() {
    if [[ ! -e "$config_file" ]]; then
        echo -e "${C} It looks like you haven't installed the desktop yet.\n Please install the desktop first.${W}"
        exit 0
    else
        read_conf
        banner
        echo "${R}[${C}-${R}]${G} Removing $de_name Config...${W}"
        set_config_dir
		check_and_delete "${config_dirs}"
		shell_name=$(basename "$SHELL")
        get_shellrc_path
		if [[ "$distro_add_answer" == "y" ]]; then
            confirmation_y_or_n "Do you want to reset the Linux distro container as well?" conf_distro_reset
            if [[ "$conf_distro_reset" == "y" ]]; then
                check_and_restore "$save_path/.${pd_shell_name}rc"
            fi
        fi

        if [[ "$terminal_utility_setup_answer" == "y" ]]; then
            check_and_delete "$PREFIX/etc/motd.sh $HOME/.termux $HOME/.fonts/font.ttf $HOME/.termux/colors.properties" ; termux-reload-settings
            check_and_restore "$PREFIX/etc/motd" ; termux-reload-settings
            check_and_restore "$PREFIX/etc/motd-playstore"
            check_and_restore "$PREFIX/etc/motd.sh" ; termux-reload-settings
            check_and_restore "$HOME/.termux/colors.properties"
            if grep -q "motd.sh$" "$PREFIX/etc/termux-login.sh"; then
                sed -i "s|.*motd\.sh$|# |" "$PREFIX/etc/termux-login.sh" ; termux-reload-settings
            fi
            rm "$PREFIX/share/applications/wine-*.desktop" >/dev/null 2>&1
            check_and_delete "$termux_desktop_path"
            check_and_delete "$PREFIX/bin/tx11start $PREFIX/bin/tx11stop $PREFIX/bin/vncstop $PREFIX/bin/vncstart $PREFIX/bin/gui $PREFIX/bin/pdrun"
        fi

        check_and_delete "$HOME/Music"
        check_and_delete "$HOME/Downloads"
        check_and_delete "$HOME/Desktop"
        check_and_delete "$HOME/Pictures"
        check_and_delete "$HOME/Videos"

        if [[ "$shell_name" == "zsh" ]]; then
            chsh -s bash
            rm -rf "$HOME/.oh-my-zsh"
        fi

        check_and_delete "$shell_rc_file"
        check_and_restore "$shell_rc_file"
		check_and_backup "$config_file"
        touch "$config_file"
        print_basic_details

        echo -e "${R}[${C}-${R}]${G}${BOLD} Reset successful.\n Now restart Termux.${W}"
    fi
}

#########################################################################
#
# Call Functions
#
#########################################################################
check_termux
if [[ -z "$1" ]] || [[ "$1" == "--install" ]] || [[ "$1" == "-i" ]]; then
check_installer_status "$1"
fi
current_path=$(pwd)
function install_termux_desktop() {
print_recomended_msg
cleanup_cache
detact_package_manager
update_sys
sleep 2
termux-wake-lock
sleep 2
check_and_create_directory "$PREFIX/etc/termux-desktop"
touch "$config_file"
print_basic_details
add_common_function
install_required_packages
questions
if [[ "$distro_add_answer" == "y" ]]; then
distro_questions
fi
banner
hw_questions
setup_folder
setup_zsh
setup_fonts
install_desktop
browser_installer
ide_installer
media_player_installer
photo_editor_installer
setup_synaptic
setup_wine
if [[ "$style_answer" == "0" ]]; then
banner
echo "${R}[${C}-${R}]${G}${BOLD} Configuring Stock $de_name Style...${W}"
echo
echo "style_name=\"Stock\"" >> "$config_file"
else
setup_config
fi
banner
call_from_change_pd="n"
distro_container_setup
gui_launcher
check_desktop_process
install_extra_apps
terminal_utility_setup
if [[ "$de_name" != "mate" ]]; then
install_fm_tools
fi
add_to_autostart
some_fixes
preprocess_conf
cleanup_cache
termux-wake-unlock
add_installer
notes
print_log "$(cat $config_file)"
delete_installer_file
}

function show_help() {
echo -e "
--debug           to create a log file
-i,--install      to start installation
-r,--remove       to remove termux desktop
-c,--change       to change some previous configuration
-ri,--reinstall   to reinstall some previously install stuff
--reset           to reset all changes made by this script without uninstalling any package
-h,--help         to show help
"
}

function show_change_help() {
echo "options you can use with --change"
echo -e "
style      to change installed style
pd,distro  to change installed linux distro container
hw,hwa     to change hardware acceleration method
autostart  to change autostart behaviour
display    to change termux:x11 display port
h,help     to show help

example uses : --change style
"
}

function show_reinstall_help() {
echo -e "
options you can use with --reinstall

icons      to reinstall icons pack
themes     to reinstall themes pack
config     to reinstall config
h,help     to show help

example uses : --reinstall icons
example uses : --reinstall icons,themes...etc to reinstall them at once
"
}

if [[ $1 == "--debug" ]]; then
    debug
    shift
fi

case $1 in
    --remove|-r)
        remove_termux_desktop
        ;;
    --install|-i)
        install_termux_desktop
        ;;
    --change|-c)
        case $2 in
            style)
                change_style
                ;;
			distro|pd)
                change_distro "$1" "$2"
                ;;
			hw|hwa)
                change_hw
                ;;
			autostart)
                change_autostart
                ;;
			display)
                change_display
                ;;
			h|help|-h|--help)
			    show_change_help
                ;;
            *)
                print_failed "${BOLD} Invalid option: ${C}$2"
				echo "${R}[${C}-${R}]${G} Use --change help to show help${W}"
                ;;
        esac
        ;;
		--reinstall|-ri)
        IFS=',' read -ra OPTIONS <<< "$2"
        for option in "${OPTIONS[@]}"; do
            case $option in
                icons)
                    reinstall_icons
                    ;;
                themes)
                    reinstall_themes
                    ;;
                config)
                    reinstall_config
                    ;;
                h|help|-h|--help)
				    show_reinstall_help
                    exit
                    ;;
                *)
                    print_failed "${BOLD} Invalid option: ${C}$option"
					echo "${R}[${C}-${R}]${G} Use --reinstall help to show help${W}"
                    ;;
            esac
        done
        ;;
	--update)
	check_for_update_and_update_installer "$1"
	;;
    --help|-h)
        show_help
        ;;
	--reset)
	    reset_changes
		;;
    *)
        install_termux_desktop
        ;;
esac
  else
   sleep 10
 notcon
  fi
}
function auto_install(){
if 
echo
    then
#!/data/data/com.termux/files/usr/bin/bash

#########################################################################
#
# Call First
#
#########################################################################
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[0m')"
BOLD="$(printf '\033[1m')"

cd "$HOME" || exit
termux_desktop_path="$PREFIX/etc/termux-desktop"
config_file="$termux_desktop_path/configuration.conf"
log_file="$HOME/termux-desktop.log"

# create log
function debug() {
	exec > >(tee -a "$log_file") 2>&1
}

function bannerb() {
clear
printf "%s############################################################\n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s#  ▀█▀ █▀▀ █▀█ █▀▄▀█ █ █ ▀▄▀   █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█  #\n" "$C"
printf "%s#   █  ██▄ █▀▄ █   █ █▄█ █ █   █▄▀ ██▄ ▄█ █ █  █  █▄█ █▀▀  #\n" "$C"
printf "%s#                                                          #\n" "$C"
printf "%s######################### Termux Gui #######################%s\n" "$C" "$W"

echo " "
}

# check if the script is running on termux or not

check_termux
#########################################################################
#
# Shortcut Functions
#
#########################################################################

function print_log() {
    local call_stack=""

    for ((i = 1; i < ${#FUNCNAME[@]}; i++)); do
        if [[ -n "${FUNCNAME[$i]}" ]]; then
            call_stack+="${FUNCNAME[$i]} -> "
        fi
    done

    # Remove the trailing " -> "
    call_stack="${call_stack::-4}"

    # Print the logs in a structured way
    {
     	echo "========== $(date '+%Y-%m-%d %H:%M:%S') under ${call_stack:-main} =========="

        # If multiple arguments are passed, print each on a new line
        if [[ $# -gt 1 ]]; then
            for arg in "$@"; do
                echo "$arg"
            done
        else
            # Print single argument as-is
            echo "$1"
        fi

	echo "========================================"
    } >> "$log_file"
}

function print_success() {
	local msg
	msg="$1"
	echo "${R}[${G}✓${R}]${G} $msg${W}"
	print_log "$msg"
}

function print_failed() {
	local msg
	msg="$1"
	echo "${R}[${R}☓${R}]${R} $msg${W}"
	print_log "$msg"
}

function print_warn() {
	local msg
	msg="$1"
	echo "${R}[${Y}!${R}]${Y} $msg${W}"
	print_log "$msg"
}

function wait_for_keypress() {
	echo -n1 -s -r -p "${R}[${C}-${R}]${G} Press any key to continue...${W}"
	sleep 0.2
}

function check_and_create_directory() {
    if [[ ! -d "$1" ]]; then
        mkdir -p "$1"
		print_log "$1"
    fi
}

# first check then delete
function check_and_delete() {
    local file
	local files_folders
    for files_folders in "$@"; do
        for file in $files_folders; do
            if [[ -e "$file" ]]; then
                if [[ -d "$file" ]]; then
                    rm -rf "$file" >/dev/null 2>&1
                elif [[ -f "$file" ]]; then
                    rm "$file" >/dev/null 2>&1
                fi
            fi
		print_log "$file"
        done
    done
}

# first check then backup
function check_and_backup() {
	local file
	local files_folders
    for files_folders in "$@"; do
        for file in $files_folders; do
            if [[ -e "$file" ]]; then
            local date_str
			date_str=$(date +"%d-%m-%Y")
			local backup="${file}-${date_str}.bak"
			    if [[ -e "$backup" ]]; then
				echo "${R}[${C}-${R}]${G}Backup file ${C}${backup} ${G}already exists${W}"
				echo
				fi
		    echo "${R}[${C}-${R}]${G}backing up file ${C}$file${W}"
			mv "$1" "$backup"
			print_log "$1 $backup"
            fi
        done
    done
}

function download_file() {
    local dest
    local url
    dest="$1"
    url="$2"
	print_log "$dest"
	print_log "$url"
    if [[ -z "$dest" ]]; then
        wget --tries=5 --timeout=15 --retry-connrefused "$url"
    else
        wget --tries=5 --timeout=15 --retry-connrefused -O "$dest" "$url"
    fi

    # Check if the file was downloaded successfully
    if [[ -f "$dest" || -f "$(basename "$url")" ]]; then
        print_success "Successfully downloaded the file"
    else
        print_failed "Failed to download the file, retrying..."
        if [[ -z "$dest" ]]; then
            wget --tries=5 --timeout=15 --retry-connrefused "$url"
        else
            wget --tries=5 --timeout=15 --retry-connrefused -O "$dest" "$url"
        fi

        # Final check
        if [[ -f "$dest" || -f "$(basename "$url")" ]]; then
            print_success "Successfully downloaded the file after retry"
        else
            print_failed "Failed to download the file after retry"
            notcon
            exit 0
        fi
    fi
}

# find a backup file which end with a number pattern and restore it
function check_and_restore() {
    local target_path="$1"
    local dir
    local base_name

    dir=$(dirname "$target_path")
    base_name=$(basename "$target_path")

    local latest_backup
   latest_backup=$(find "$dir" -maxdepth 1 -type f -name "$base_name-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9].bak" 2>/dev/null | sort | tail -n 1)

    if [[ -z "$latest_backup" ]]; then
        print_failed "No backup file found for ${target_path}."
		echo
        return 1
    fi

    if [[ -e "$target_path" ]]; then
        print_failed "${C}Original file or directory ${target_path} already exists.${W}"
		echo
    else
        mv "$latest_backup" "$target_path"
        print_success "Restored ${latest_backup} to ${target_path}"
		echo
    fi
	print_log "$target_path $dir $base_name $latest_backup"
}

function detact_package_manager() {
	source "/data/data/com.termux/files/usr/bin/termux-setup-package-manager"
	if [[ "$TERMUX_APP_PACKAGE_MANAGER" == "apt" ]]; then
	PACKAGE_MANAGER="apt"
	elif [[ "$TERMUX_APP_PACKAGE_MANAGER" == "pacman" ]]; then
	PACKAGE_MANAGER="pacman"
	else
	print_failed "${C} Could not detact your package manager, Switching To ${C}pkg ${W}" 
	fi
	print_log "$PACKAGE_MANAGER"
}

# will check if the package is already installed or not, if it installed then it will reinstall it and at the end it will print success/failed message
function package_install_and_check() {
    packs_list=($@)
    for package_name in "${packs_list[@]}"; do
        echo "${R}[${C}-${R}]${G}${BOLD} Processing package: ${C}$package_name ${W}"

        if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
            if pacman -Qi "$package_name" >/dev/null 2>&1; then
				print_log "$package_name = already_exist"
                continue
            fi

            if [[ $package_name == *"*"* ]]; then
                echo "${R}[${C}-${R}]${C} Processing wildcard pattern: $package_name ${W}"
				print_log "Processing wildcard pattern: $package_name"
                packages=$(pacman -Ssq "${package_name%*}" 2>/dev/null)
                for pkgs in $packages; do
                    echo "${R}[${C}-${R}]${G}${BOLD} Installing matched package: ${C}$pkgs ${W}"
                    pacman -Sy --noconfirm --overwrite '*' "$pkgs"
                done
            else
                pacman -Sy --noconfirm --overwrite '*' "$package_name"
            fi

        else
            if [[ $package_name == *"*"* ]]; then
                echo "${R}[${C}-${R}]${C} Processing wildcard pattern: $package_name ${W}"
				print_log "Processing wildcard pattern: $package_name"
                packages_by_name=$(apt-cache search "${package_name%*}" | awk "/^${package_name}/ {print \$1}")
				packages_by_description=$(apt-cache search "${package_name%*}" | grep -Ei "\b${package_name%*}\b" | awk '{print $1}')
				packages=$(echo -e "${packages_by_name}\n${packages_by_description}" | sort -u)
                for pkgs in $packages; do
                    echo "${R}[${C}-${R}]${G}${BOLD} Installing matched package: ${C}$pkgs ${W}"
                    if dpkg -s "$pkgs" >/dev/null 2>&1; then
						print_log "$pkgs = already_exist"
                        pkg reinstall "$pkgs" -y
                    else
                        pkg install "$pkgs" -y
                    fi
                done
            else
                if dpkg -s "$package_name" >/dev/null 2>&1; then
					print_log "$package_name = already_exist"
                    pkg reinstall "$package_name" -y
                else
                    pkg install "$package_name" -y
                fi
            fi
        fi

        # Check installation success
        if [ $? -ne 0 ]; then
            echo "${R}[${C}-${R}]${G}${BOLD} Error detected during installation of: ${C}$package_name ${W}"
			print_log "Error detected during installation of: $package_name"
            if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                pacman -Sy --overwrite '*' "$package_name"
                pacman -Sy --noconfirm "$package_name"
            else
                apt --fix-broken install -y
                dpkg --configure -a
                pkg install "$package_name" -y
            fi
        fi

        # Final verification
		if [[ $package_name != *"*"* ]]; then
        	if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        	    if pacman -Qi "$package_name" >/dev/null 2>&1; then
        	        print_success "$package_name installed successfully"
        	    else
        	        print_failed "$package_name installation failed ${W}"
        	    fi
        	else
        	    if dpkg -s "$package_name" >/dev/null 2>&1; then
        	        print_success "$package_name installed successfully"
        	    else
        	        print_failed "$package_name installation failed ${W}"
        	    fi
        	fi
		fi
    done
    echo ""
	print_log "package list: $packs_list"
}

# will check the package is installed or not then remove it
function package_check_and_remove() {
    packs_list=($@)
    for package_name in "${packs_list[@]}"; do
        echo "${R}[${C}-${R}]${G}${BOLD} Processing package: ${C}$package_name ${W}"

        if [[ $package_name == *"*"* ]]; then
            echo "${R}[${C}-${R}]${C} Processing wildcard pattern: $package_name ${W}"
			print_log "Processing wildcard pattern: $package_name"
            if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                packages=$(pacman -Qq | grep -E "${package_name//\*/.*}")
            else
                packages=$(dpkg --get-selections | awk '{print $1}' | grep -E "${package_name//\*/.*}")
            fi

            for pkg in $packages; do
                echo "${R}[${C}-${R}]${G}${BOLD} Removing matched package: ${C}$pkg ${W}"
                if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                    if pacman -Qi "$pkg" >/dev/null 2>&1; then
                        pacman -Rnds --noconfirm "$pkg"
                        if [ $? -eq 0 ]; then
                            print_success "$pkg removed successfully"
							print_log "Processing wildcard pattern: $package_name"
                        else
                            print_failed "Failed to remove $pkg ${W}"
                        fi
                    fi
                else
                    if dpkg -s "$pkg" >/dev/null 2>&1; then
                        apt autoremove "$pkg" -y
                        if [ $? -eq 0 ]; then
                            print_success "$pkg removed successfully"
                        else
                            print_failed "Failed to remove $pkg ${W}"
                        fi
                    fi
                fi
            done
        else
            if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
                if pacman -Qi "$package_name" >/dev/null 2>&1; then
                    echo "${R}[${C}-${R}]${G}${BOLD} Removing package: ${C}$package_name ${W}"
                    pacman -Rnds --noconfirm "$package_name"
                    if [ $? -eq 0 ]; then
                        print_success "$package_name removed successfully"
                    else
                        print_failed "Failed to remove $package_name ${W}"
                    fi
                fi
            else
                if dpkg -s "$package_name" >/dev/null 2>&1; then
                    echo "${R}[${C}-${R}]${G}${BOLD} Removing package: ${C}$package_name ${W}"
                    apt autoremove "$package_name" -y
                    if [ $? -eq 0 ]; then
                        print_success "$package_name removed successfully"
                    else
                        print_failed "Failed to remove $package_name ${W}"
                    fi
                fi
            fi
        fi
    done
    echo ""
	print_log "$package_name"
}

function get_file_name_number() {
    current_file=$(basename "$0")
    folder_name="${current_file%.sh}"
    theme_number=$(echo "$folder_name" | grep -oE '[1-9][0-9]*')
	print_log "$theme_number"
}

function extract_zip_with_progress() {
    local archive="$1"
    local target_dir="$2"

    # Check if the archive file exists
    if [[ ! -f "$archive" ]]; then
        print_failed "$archive doesn't exist"
        return 1
    fi

    local total_files
    total_files=$(unzip -l "$archive" | grep -c -E '^\s+[0-9]+')

    if [[ "$total_files" -eq 0 ]]; then
        print_failed "No files found in the archive"
        return 1
    fi

    echo "Total files to extract: $total_files"
    local extracted_files=0
    unzip -o "$archive" -d "$target_dir" | while read -r line; do
        if [[ "$line" =~ inflating: ]]; then
            ((extracted_files++))
            progress=$((extracted_files * 100 / total_files))
            echo -ne "${G}Extracting: ${C}$progress% ($extracted_files/$total_files) \r${W}"
        fi
    done
    print_success "${archive} Extraction complete!"
}

function extract_archive() {
    local archive="$1"
    if [[ ! -f "$archive" ]]; then
        print_failed "$archive doesn't exist"
        return 1
    fi

    local total_size
    total_size=$(stat -c '%s' "$archive")

    case "$archive" in
        *.tar.gz|*.tgz)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xzf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.tar.xz)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xJf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.tar.bz2|*.tbz2)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xjf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.tar)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | tar xf - || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.bz2)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | bunzip2 > "${archive%.bz2}" || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.gz)
            print_success "Extracting ${C}$archive${W}"
            pv -s "$total_size" -p -r "$archive" | gunzip > "${archive%.gz}" || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *.7z)
            print_success "Extracting ${C}$archive"
            pv -s "$total_size" -p -r "$archive" | 7z x -si -y > /dev/null || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
		*.zip)
            extract_zip_with_progress "${archive}"
            ;;
        *.rar)
            print_success "Extracting ${C}$archive"
            unrar x "$archive" || { print_failed "Failed to extract ${C}$archive"; return 1; }
            ;;
        *)
            print_failed "Unsupported archive format: ${C}$archive"
            return 1
            ;;
    esac

    print_success "Successfully extracted ${C}$archive"
	print_log "$archive"
}

# download a archive file and extract it in a folder
function download_and_extract() {
    local url="$1"
    local target_dir="$2"
    local filename="${url##*/}"

    # Notify user about downloading
    echo "${R}[${C}-${R}]${C}${BOLD}Downloading ${G}${filename}...${W}"
    sleep 1.5

    # Change to the target directory
    cd "$target_dir" || return 1

    local attempt=1
    local success=false

    # Attempt to download the file with retries
    while [[ $attempt -le 3 ]]; do
        if curl -# -L "$url" -o "$filename"; then
            success=true
            break
        else
            print_failed "Failed to download ${C}${filename}"
            echo "${R}[${C}☓-{R}]${G}Retrying... Attempt ${C}$attempt${W}"
            ((attempt++))
            sleep 1
        fi
    done

    # If download is successful, extract and remove the archive
    if [[ "$success" = true ]]; then
        if [[ -f "$filename" ]]; then
            echo
            echo "${R}[${C}-${R}]${R}[${C}-${R}]${G} Extracting $filename${W}"
            extract_archive "$filename"
            rm "$filename"
        fi
    else
        # Notify if download fails after all attempts
        print_failed "Failed to download ${C}${filename}"
        echo "${R}[${C}-${R}]${C}Please check your internet connection${W}"
    fi
	print_log "$url $target_dir $filename"
}

# count the number subfolders inside a folder in my repo
function count_subfolders() {
    local owner="$1"
    local repo="$2"
    local path="$3"
    local url="https://api.github.com/repos/$owner/$repo/contents/$path"
    local response
	response=$(curl -s "$url")
    local subfolder_count
	subfolder_count=$(echo "$response" | jq -r '.[] | select(.type == "dir") | .name' | wc -l)

    if [[ -z "$subfolder_count" || "$subfolder_count" -eq 0 ]]; then
        subfolder_count=0
    fi

    echo "$subfolder_count"
	print_log "$url $response $subfolder_count"
}

# create a yes / no confirmation prompt
function confirmation_y_or_n() {
	 while true; do
        echo - "${R}[${C}-${R}]${Y}${BOLD} $1 ${Y}(y/n) ${W}" 
        response="${response:-y}"
        eval "$2='$response'"
        case $response in
            [yY]* )
				echo
                print_success "Continuing with answer: $response"
				echo
				sleep 0.2
                break;;
            [nN]* )
				echo
                echo "${R}[${C}-${R}]${C} Skipping this setp${W}"
				echo
				sleep 0.2
                break;;
            * )
				echo
               	print_failed " Invalid input. Please enter 'y' or 'n'."
				echo
                ;;
        esac
    done
	print_log "$1 $response"
}

# get the latest version from a github releases
# ex. latest_tag=$(get_latest_release "$repo_owner" "$repo_name")
function get_latest_release() {
	local repo_owner="$1"
	local repo_name="$2"
	curl -s "https://api.github.com/repos/$repo_owner/$repo_name/releases/latest" |
	grep '"tag_name":' |
	sed -E 's/.*"v?([^"]+)".*/\1/'
}

function install_font_for_style() {
	local style_number="$1"
	echo "${R}[${C}-${R}]${G} Installing Fonts...${W}"
	check_and_create_directory "$HOME/.fonts"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/$de_name/look_${style_number}/font.tar.gz" "$HOME/.fonts"
	fc-cache -f
	cd "$HOME" || return
}

function download_github_action_artifact() {
    # Parse arguments passed to the function
    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            --user)
                GITHUB_USER="$2"
                shift 2
                ;;
            --repo)
                REPO="$2"
                shift 2
                ;;
            --workflow-name)
                WORKFLOW_NAME="$2" # The name of the CI workflow
                shift 2
                ;;
            --run-name)
                RUN_NAME="$2" # Specific name/description of the workflow run
                shift 2
                ;;
            --artifact-name)
                ARTIFACT_NAME="$2" # Artifact name prefix (can be modified as needed)
                shift 2
                ;;
            *)
                echo "${R}[${R}☓${R}]Unknown option: $1${W}"
                shift
                ;;
        esac
    done

    # Get the workflow ID using the workflow name
    WORKFLOW_ID=$(gh api repos/$GITHUB_USER/$REPO/actions/workflows --jq ".workflows[] | select(.name == \"$WORKFLOW_NAME\") | .id")
    # Check if WORKFLOW_ID is found
    if [ -z "$WORKFLOW_ID" ]; then
        print_failed " Workflow '$WORKFLOW_NAME' not found."
        exit 1
    fi

    # Display the workflow ID
    echo "${R}[${C}-${R}]${G} Workflow ID for ${W}'$WORKFLOW_NAME' ${G}is ${W}$WORKFLOW_ID"

    # Get the latest workflow run ID with the specific display title
    WORKFLOW_RUN_ID=$(gh api repos/$GITHUB_USER/$REPO/actions/workflows/$WORKFLOW_ID/runs --paginate --jq ".workflow_runs[] | select(.display_title == \"$RUN_NAME\") | .id" | head -n 1)
    # Check if WORKFLOW_RUN_ID is obtained
    if [ -z "$WORKFLOW_RUN_ID" ]; then
        print_failed " No workflow run found with the name '$RUN_NAME' for workflow '$WORKFLOW_NAME'."
        exit 1
    fi

    # List artifacts for the found run
    ARTIFACT_URL=$(gh api repos/$GITHUB_USER/$REPO/actions/runs/$WORKFLOW_RUN_ID/artifacts --jq ".artifacts[] | select(.name == \"$ARTIFACT_NAME\") | .archive_download_url")
    # If no exact match, look for an artifact starting with ARTIFACT_NAME
    if [ -z "$ARTIFACT_URL" ]; then
        echo "${R}[${C}-${R}]${C} Artifact with the exact name '$ARTIFACT_NAME' not found. Looking for artifacts starting with '$ARTIFACT_NAME'...${W}"
        ARTIFACT_URL=$(gh api repos/$GITHUB_USER/$REPO/actions/runs/$WORKFLOW_RUN_ID/artifacts --jq ".artifacts[] | select(.name | startswith(\"$ARTIFACT_NAME\")) | .archive_download_url" | head -n 1)
    fi

    # Check if ARTIFACT_URL is found
    if [ -z "$ARTIFACT_URL" ]; then
        print_failed " No artifact found starting with '$ARTIFACT_NAME'."
        exit 1
    fi

    # Download the artifact using the URL
    print_success "Downloading artifact from run '$RUN_NAME'..."
    curl -# -L -H "Authorization: Bearer $(gh auth token)" -o artifact.zip "$ARTIFACT_URL"

    # Extract the artifact
    extract_archive "artifact.zip"
}

function print_status() {
    local status
	status=$1
    local message
	message=$2
    if [[ "$status" == "ok" ]]; then
        print_success "$message"
    elif [[ "$status" == "warn" ]]; then
        print_warn "$message"
    elif [[ "$status" == "error" ]]; then
        print_failed "$message"
    fi
}

function select_an_option() {
    local max_options=$1
    local default_option=${2:-1}
    local response_var=$3
    local response

    while true; do
        read  "${Y}select an option (Default ${default_option}): ${W}" 
        response=${response:-$default_option}

        if [[ $response =~ ^[0-9]+$ ]] && ((response >= 1 && response <= max_options)); then
            echo
            print_success "Continuing with answer: $response"
            sleep 0.2
            eval "$response_var=$response"
            break
        else
            echo
            print_failed " Invalid input, Please enter a number between 1 and $max_options"
        fi
    done
}

function preprocess_conf() {
    # Preprocess configuration file:
    # 1. Remove lines where keys contain dashes (-).
    # 2. Remove quotes from keys and values.
	echo "${R}[${C}-${R}]${G} Prepering config file...${W}"
    sed -i -E '/^[[:space:]]*[^#=]+-.*=/d; s/^([[:space:]]*[^#=]+)="([^"]*)"/\1=\2/g' "$config_file"
}

function read_conf() {
    if [[ ! -f "$config_file" ]]; then
        print_failed " Configuration file $config_file not found"
		exit 0
    fi

	source "$config_file"

    # Process each line of the file
    # while IFS='=' read -r key value; do
    #     # Trim whitespace and surrounding quotes from key and value
    #     key=$(echo "$key" | xargs | sed 's/"//g')
    #     value=$(echo "$value" | xargs | sed 's/"//g')

    #     # Skip empty lines and comments
    #     if [[ -z "$key" || "$key" =~ ^# ]]; then
    #         continue
    #     fi

    #     # Dynamically create variables
    #     export "$key"="$value"
    # done < "$config_file"

    print_success "Configuration variables loaded"
}

#########################################################################
#
# Ask Required Questions
#
#########################################################################

# check the avilable styles and create a list to type the corresponding number
# in the style readme file the name must use this'## number name :' pattern, like:- ## 1. Basic Style:
function questions_theme_select() {
    local owner="sabamdarif"
    local repo="termux-desktop"
    local main_folder="setup-files/$de_name"
    local subfolder_count_value
    subfolder_count_value=$(count_subfolders "$owner" "$repo" "$main_folder" 2>/dev/null)
    cd "$HOME" || return
    echo "${R}[${C}-${R}]${G} Downloading list....${W}"
    check_and_backup "${current_path}/styles.md"
    download_file "${current_path}/styles.md" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/${de_name}_styles.md"

    clear
    banner

    if [[ -n "$subfolder_count_value" ]]; then
        echo "${R}[${C}-${R}]${G} Check the $de_name styles section in GitHub${W}"
        echo
        echo "${R}[${C}-${R}]${B} https://github.com/sabamdarif/termux-desktop/blob/main/${de_name}_styles.md${W}"
        echo
        echo "${R}[${C}-${R}]${G} Number of available custom styles for $de_name is: ${C}${subfolder_count_value}${W}"
        echo
        echo "${R}[${C}-${R}]${G} Available Styles:${W}"
        echo
        grep -oP '## \d+\..+?(?=(\n## \d+\.|\Z))' styles.md | while read -r style; do
            echo "${Y}${style#### }${W}"
        done

        while true; do
            echo
            read "${R}[${C}-${R}]${Y} Type number of the style: ${W}" style_answer
            style_answer=${style_answer:-0}
           
            if [[ -z "$style_answer" ]]; then
                echo
                print_failed "Input cannot be empty. Please type a number"
                continue
            fi

            if [[ "$style_answer" =~ ^[0-9]+$ ]] && [[ "$style_answer" -ge 0 ]] && [[ "$style_answer" -le "$subfolder_count_value" ]]; then
                style_name=$(grep -oP "^## $style_answer\..+?(?=(\n## \d+\.|\Z))" styles.md | sed -e "s/^## $style_answer\. //" -e "s/:$//")
                break
            else
                echo
                print_failed "The entered style number is incorrect"
                echo
                if [[ "$subfolder_count_value" == "0" ]]; then
                    echo "${R}[${C}-${R}]${Y} Please enter 0 because for $de_name only stock style is available${W}"
                    echo
                else
                    echo "${R}[${C}-${R}]${Y} Please enter a number between 0 to ${subfolder_count_value}${W}"
                    echo
                fi
                echo "${R}[${C}-${R}]${G} Check the $de_name styles section in GitHub${W}"
                echo
                echo "${R}[${C}-${R}]${B} https://github.com/sabamdarif/termux-desktop/blob/main/${de_name}_styles.md${W}"
                echo
            fi
        done
        rm "${current_path}/styles.md"
    else
        print_failed "Failed to get total available styles value"
		exit 0
    fi
    print_log "$style_answer $subfolder_count_value"
}

function questions() {
	banner
	echo "${R}[${C}-${R}]${G} Select Desktop Environment${W}"
	echo " "
	echo "${Y}1. XFCE${W}"
	echo
	echo "${Y}2. LXQT${W}"
	echo
	echo "${Y}3. OPENBOX WM${W}"
	echo
	echo "${Y}4. MATE (Unstable)${W}"
	echo
	select_an_option 4 1 desktop_answer
	# set the variables based on chosen de
	sys_icons_folder="$PREFIX/share/icons"
	sys_themes_folder="$PREFIX/share/themes"
	if [[ "$desktop_answer" == "4" ]]; then
	de_name="xfce"
	themes_folder="$HOME/.themes"
	icons_folder="$HOME/.icons"
	de_startup="xfce4-session"
	elif [[ "$desktop_answer" == "2" ]]; then
	de_name="lxqt"
	themes_folder="$sys_themes_folder"
	icons_folder="$sys_icons_folder"
	de_startup="startlxqt"
	elif [[ "$desktop_answer" == "3" ]]; then
	de_name="openbox"
	themes_folder="$sys_themes_folder"
	icons_folder="$sys_icons_folder"
	de_startup="openbox-session"
	elif [[ "$desktop_answer" == "1" ]]; then
	de_name="mate"
	themes_folder="$HOME/.themes"
	icons_folder="$HOME/.icons"
	de_startup="mate-session"
	fi
	echo "de_startup=\"$de_startup\"" >> "$config_file"
	echo "de_name=\"$de_name\"" >> "$config_file"
	echo "themes_folder=\"$themes_folder\"" >> "$config_file"
	echo "icons_folder=\"$icons_folder\"" >> "$config_file"

	banner
	questions_theme_select
	echo
	print_success "Continuing with answer: ${style_answer}.$style_name"
	echo "style_answer=\"$style_answer\"" >> "$config_file"
	echo "style_name=\'$style_name\'" >> "$config_file"
	sleep 0.2
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select browser you want to install${W}"
	echo
	echo "${Y}1. firefox${W}"
	echo
	echo "${Y}2. chromium${W}"
	echo
	echo "${Y}3. firefox & chromium (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 browser_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select IDE you want to install${W}"
	echo
	echo "${Y}1. VS Code${W}"
	echo
	echo "${Y}2. Geany (lightweight IDE)${W}"
	echo
	echo "${Y}3. VS Code & Geany (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 ide_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select Media Player you want to install${W}"
	echo
	echo "${Y}1. Vlc${W}"
	echo
	echo "${Y}2. Audacious${W}"
	echo
	echo "${Y}3. Vlc & Audacious (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 player_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select Photo Editor${W}"
	echo
	echo "${Y}1. Gimp${W}"
	echo
	echo "${Y}2. Inkscape${W}"
	echo
	echo "${Y}3. Gimp & Inkscape (both)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 photo_editor_answer
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Do you want to install wine in termux ${C}(without proot-distro)${W}"
	echo
	echo "${Y}1. Natively ${C}(can run only arm64 based exe)${W}"
	echo
	echo "${Y}2. Using Mobox ${C}${W}"
	echo
	echo "${R}[${C}-${R}]${B} Know More About Mobox:- https://github.com/olegos2/mobox/${W}"
	echo
	echo "${Y}3. Wine Hangover (Best)${W}"
	echo
	echo "${Y}4. Skip${W}"
	echo
	select_an_option 4 1 wine_answer
	banner
	confirmation_y_or_n "Do you want to install a graphical package manager [Synaptic]" synaptic_answer
	banner
	echo "${R}[${C}-${R}]${G} By Default it only add 4 - 5 wallpaper${W}"
	echo
	confirmation_y_or_n "Do you want to add some more wallpaper" ext_wall_answer
	banner
	confirmation_y_or_n "Do you want to Configuring Zsh" zsh_answer
	banner
	echo
	echo "${R}[${C}-${R}]${B} Know More About Terminal Utility:- https://github.com/sabamdarif/termux-desktop/blob/main/see-more.md#hammer_and_wrenchlearn-about-terminal-utilities${W}"
	echo
	confirmation_y_or_n "Do you want install some terminal utility to make better terminal exprience" terminal_utility_setup_answer
	if [[ "$de_name" != "mate" ]]; then
	banner
	echo -e "
Typing 'Y' to this option will add a variety of options to your file manager's right-click menu. Using this, you can do a lot more things within the right-click menu than you ever imagined, such as:

- Most basic video/image-related tasks
- Audio/PDF-related tasks
- Archive-related tasks, file permissions, document handling, encryption, and hash checks
- And much more

In File Manager click on the scripts meanu to see them all
	"
	echo
	confirmation_y_or_n "Do you want to Configuring File Manager Tools (Testing)" fm_tools
	fi
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Select Gui Mode${W}"
	echo
	echo "${Y}1. Termux:x11${W}"
	echo
	echo "${Y}2. Both Termux:x11 and VNC${W}"
	echo
	select_an_option 2 1 gui_mode_num

	# set gui_mode and display_number value
	if [[ "$gui_mode_num" == "2" ]]; then
		gui_mode="termux_x11"
		display_number="0"
		echo "display_number=\"$display_number\"" >> "$config_file"
	elif [[ "$gui_mode_num" == "1" ]]; then
		gui_mode="both"
		display_number="0"
		echo "display_number=\"$display_number\"" >> "$config_file"
	fi
	echo "gui_mode_num=\"$gui_mode_num\"" >> "$config_file"

	banner
	confirmation_y_or_n "Do you want to start the desktop at Termux startup" de_on_startup
	if [[ "$de_on_startup" == "y" && "$gui_mode" == "both" ]]; then
	echo "${R}[${C}-${R}]${G} You chose both vnc and termux:x11 to access gui mode${W}"
	echo
	echo "${R}[${C}-${R}]${G} Which will be your default${W}"
	echo
	echo "${Y}1. Termux:x11${W}"
	echo
	echo "${Y}2. Vnc${W}"
	echo
	select_an_option 2 1 autostart_gui_mode_num
	echo "autostart_gui_mode_num=\"$autostart_gui_mode_num\"" >> "$config_file"

		if [[ "$autostart_gui_mode_num" == "1" ]]; then
			autostart_gui_mode="termux_x11"
		elif [[ "$autostart_gui_mode_num" == "2" ]]; then
			autostart_gui_mode="vnc"
		fi

	echo "autostart_gui_mode=\"$autostart_gui_mode\"" >> "$config_file"
	fi
	banner
	echo -e "
${R}[${C}-${R}]${G}${BOLD} Linux Distro Container (proot distro):- ${W}

It will help you to install app that aren't avilable in termux.
So it will setup a linux distro container and add option to install those apps.
Also you can launch those installed apps from termux like other apps.
"
echo "Learn More:- https://github.com/sabamdarif/termux-desktop/blob/main/proot-caontainer.md"
echo
	confirmation_y_or_n "Do you want to add a Linux container" distro_add_answer
	echo "distro_add_answer=\"$distro_add_answer\"" >> "$config_file"
	banner
echo -e "${R}[${C}-${R}]${G}${BOLD} Extra App Suite:- ${W}
It will install this listed apps:-

- Gedit (Text Editor)
- Rhythmbox (Music Player)
- Xpdf Reader
- Thunderbird (Email Client)
- Transmission (Bittorrent Client)
"
if [[ "$distro_add_answer" == "y" ]]; then
echo -e "apps that will be installed using linux distro container (proot distro):-
- Libreoffice (Office Suite)
"
fi
echo
confirmation_y_or_n "Do you want to install extra app suite" extra_app_suite
	banner
	if ! type -p pacman >/dev/null 2>&1; then
	echo "${R}[${C}-${R}]${R}${BOLD} Read This Carefully${W}"
	echo -e "
${R}[${C}-${R}]${G}${BOLD} Mesa Vulkan ICD-Wrapper:- ${W}

In my tests, I achieved 1000+ FPS in vkmark on all my devices. I tried it on an 
- Adreno 619 (everything work fine)
- Adreno 750 (good overall but with few issues)
- Mali G76 (similar issue like Adreno 750).
- Mali G57 everything work with this driver\n

Also if you have Adreno GPU then please select ubuntu or debian as Linux container so it can use ternip in the Linux container.\n
Sadly for other then adreno, GPU might / might not work on the Linux container./n

If you type 'n/N' then it will use the old virtualizing way to setup Hardware Acceleration

Also type 'n/N' for Freedreno KGSL (Adreno GPU Only)./n
"
	confirmation_y_or_n "Do you want to install the new mesa-vulkan-icd-wrapper Driver" confirmation_mesa_vulkan_icd_wrapper
	echo "confirmation_mesa_vulkan_icd_wrapper=\"$confirmation_mesa_vulkan_icd_wrapper\"" >> "$config_file"
	fi
}

# distro hardware accelrration related questions
function distro_hw_questions() {
	if [[ "$distro_add_answer" == "y" ]]; then
	   if [[ "$termux_hw_answer" == "virgl" ]] || [[ "$termux_hw_answer" == "virgl_vulkan" ]]; then
	   	if [[ "$device_gpu_model_name" != "adreno" ]]; then
	   		pd_hw_answer="virgl"
	   	else
	   		banner
	   		echo "${R}[${C}-${R}]${G}${BOLD} Select Hardware Acceleration Driver For Linux Container${W}"
	   		echo "${Y}1. OpenGL (VIRGL ANGLE)${W}"
	   		echo
	   		echo "${Y}2. Turnip (Adreno GPU Only)${W}"
	   		echo
	   		select_an_option 2 1 pd_hw_answer_n
	   		# set gpu api
	   		if [[ "$pd_hw_answer_num" == "1" ]]; then
	   		pd_hw_answer="virgl"
	   		elif [[ "$pd_hw_answer_num" == "2" ]]; then
	   		pd_hw_answer="turnip"
	   		fi
	   	fi
	   elif [[ "$termux_hw_answer" == "freedreno" ]]; then
	   # set gpu api
	   pd_hw_answer="freedreno"
	   else
	   banner
	   echo "${R}[${C}-${R}]${G}${BOLD} Select Hardware Acceleration Driver For Linux Container${W}"
	   echo
	   echo "${R}[${C}-${R}]${G} If You Skip It, It Will Use The Previous Selection${W}"
       echo
	   echo "${Y}1. Vulkan (ZINK)${W}"
	   echo
	   echo "${Y}2. OpenGL ES (ZINK VIRGL)${W}"
	   echo
	   echo "${Y}3. Turnip (Adreno GPU Only)${W}"
	   echo
	   echo "${Y}4. Skip${W}"
	   echo
	   select_an_option 4 1 pd_hw_answer_num

	   	# set gpu api
	   	if [[ "$pd_hw_answer_num" == "1" ]]; then
	   	pd_hw_answer="zink"
	   	elif [[ "$pd_hw_answer_num" == "2" ]]; then
	   	pd_hw_answer="zink_virgl"
	   	elif [[ "$pd_hw_answer_num" == "3" ]]; then
	   	pd_hw_answer="turnip"
	   	fi

	   fi
	   echo "pd_hw_answer_num=\"$pd_hw_answer_num\"" >> "$config_file"
	   echo "pd_hw_answer=\"$pd_hw_answer\"" >> "$config_file"
    fi
}

# hardware accelrration related questions

function exp_termux_gl_hw_support() {
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} First Read This${W}"
	echo
	echo "${R}[${C}-${R}]${B} This:- https://github.com/sabamdarif/termux-desktop/blob/main/hw-acceleration.md${W}"
	echo
	echo "${R}[${C}-${R}]${G}${BOLD} It will be used to enable opengl support${W}"
	echo
	echo "${Y}1. Vulkan (ZINK)${W}"
	echo
	echo "${Y}2. OpenGL (VIRGL ANGLE)${W}"
	echo
	echo "${Y}3. Vulkan (VIRGL ANGLE)${W}"
	echo
	echo "${Y}4. OpenGL ES (ZINK VIRGL)${W}"
	echo
	echo "${Y}5. The Vulkan-Icd-Wrapper Driver With Mesa${W}"
	echo
	echo "${Y}6. The Vulkan-Icd-Wrapper Driver With Mesa-Zink${W}"
	echo
	echo "${Y}7. Freedreno KGSL (Unstable | Adreno GPU Only)${W}"
	echo
	select_an_option 7 1 exp_termux_gl_hw_answer_num
	echo "exp_termux_gl_hw_answer_num=\"$exp_termux_gl_hw_answer_num\"" >> "$config_file"

	# set gpu api name
	case "$exp_termux_gl_hw_answer_num" in
	    1) exp_termux_gl_hw_answer="zink" ;;
	    2) exp_termux_gl_hw_answer="virgl" ;;
	    3) exp_termux_gl_hw_answer="virgl_vulkan" ;;
	    4) exp_termux_gl_hw_answer="zink_virgl" ;;
	    5) exp_termux_gl_hw_answer="zink_with_mesa" ;;
	    6) exp_termux_gl_hw_answer="zink_with_mesa_zink" ;;
	    7) exp_termux_gl_hw_answer="freedreno" ;;
	esac
	echo "exp_termux_gl_hw_answer=\"$exp_termux_gl_hw_answer\"" >> "$config_file"
	termux_hw_answer="${exp_termux_gl_hw_answer}"
	echo "termux_hw_answer=\"$exp_termux_gl_hw_answer\"" >> "$config_file"

    if [[ "$distro_add_answer" == "y" ]]; then
        case "$exp_termux_gl_hw_answer" in
            "virgl"|"virgl_vulkan")
				if [[ "$device_gpu_model_name" == "adreno" ]]; then
					distro_hw_questions
				else
                	pd_hw_answer="virgl"
                	echo "pd_hw_answer=\"$pd_hw_answer\"" >> "$config_file"
				fi
                ;;
            *)
                distro_hw_questions
                ;;
        esac
    fi
}

function exp_hwa_support() {
	if [[ "$confirmation_mesa_vulkan_icd_wrapper" == "y" ]]; then
	echo -e "${R}[${C}-${R}]${G} The new Hardware Acceleration Will Use The mesa-vulkan-icd-wrapper Package\n ${W}"
	echo -e "${R}[${C}-${R}]${G} GPU Found: ${W}$detected_gpu\n"
	sleep 0.2
	if [[ "$gpu_name" == "unknown" ]]; then
		echo -e "${R}[${C}-${R}]${G} The above GPU is unknown to me\n ${W}"
		echo "${R}[${C}-${R}]${G}${BOLD} Please Select Your Device GPU${W}"
    	echo
		echo "${Y}1. Adreno${W}"
		echo
    	echo "${Y}2. Mali${W}"
		echo
		echo "${Y}3. Xclipse${W}"
		echo
		echo "${Y}4. Others (Unstable)${W}"
		echo
		select_an_option 4 1 device_gpu_model
		echo "device_gpu_model=\"$device_gpu_model\"" >> "$config_file"

		# set gpu model name
		case "$device_gpu_model" in
    	1) device_gpu_model_name="adreno" ;;
    	2) device_gpu_model_name="mali" ;;
    	3) device_gpu_model_name="xclipse" ;;
    	4) device_gpu_model_name="others" ;;
		esac
	else
		device_gpu_model_name="$gpu_name"
	fi
	echo "device_gpu_model_name=\"$device_gpu_model_name\"" >> "$config_file"

	exp_termux_gl_hw_support
	fi
}

function hw_questions() {
	if [[ "$confirmation_mesa_vulkan_icd_wrapper" == "y" ]]; then
	exp_hwa_support
	else
    echo "${R}[${C}-${R}]${G}${BOLD} First Read This${W}"
    echo
    echo "${R}[${C}-${R}]${B} This:- https://github.com/sabamdarif/termux-desktop/blob/main/hw-acceleration.md${W}"
    echo
    echo "${R}[${C}-${R}]${G}${BOLD} Select Hardware Acceleration API${W}"
    echo
	echo "${Y}1. Vulkan (ZINK)${W}"
	echo
    echo "${Y}2. OpenGL (VIRGL ANGLE)${W}"
	echo
	echo "${Y}3. Vulkan (VIRGL ANGLE)${W}"
	echo
	echo "${Y}4. OpenGL ES (ZINK VIRGL)${W}"
	echo
	echo "${Y}5. Freedreno KGSL (Unstable | Adreno GPU Only)${W}"
	echo
	select_an_option 5 1 termux_hw_answer_num
	echo "termux_hw_answer_num=\"$termux_hw_answer_num\"" >> "$config_file"

	# set gpu api name
	case "$termux_hw_answer_num" in
	    1) termux_hw_answer="zink" ;;
	    2) termux_hw_answer="virgl" ;;
	    3) termux_hw_answer="virgl_vulkan" ;;
	    4) termux_hw_answer="zink_virgl" ;;
	    5) termux_hw_answer="freedreno" ;;
	esac
		distro_hw_questions
	fi
}

# distro related questions
function choose_distro() {
	echo "${R}[${C}-${R}]${G}${BOLD} Select Linux Distro You Want To Add${W}"
	echo " "
	echo "${Y}1. Debian${W}"
	echo " "
	echo "${Y}2. Ubuntu${W}"
	echo " "
	echo "${Y}3. Arch (Unstable)${W}"
	echo " "
	echo "${Y}4. Alpine${W}"
	echo " "
	echo "${Y}5. Fedora${W}"
	echo " "
	select_an_option 5 1 distro_answer
	echo "distro_answer=\"$distro_answer\"" >> "$config_file"

	case "$distro_answer" in
        3) selected_distro="debian" ;;
        2) selected_distro="ubuntu" ;;
        1) selected_distro="archlinux" ;;
        4) selected_distro="alpine" ;;
        5) selected_distro="fedora" ;;
        *) selected_distro="debian" ;;
    esac
    echo "selected_distro=\"$selected_distro\"" >> "$config_file"

}

function distro_questions() {
	banner
	choose_distro
	banner
	confirmation_y_or_n "Do you want to configure audio support for Linux distro container" pd_audio_config_answer

	if [[ "$distro_add_answer" == "y" ]] && [[ "$zsh_answer" == "y" ]]; then
	banner
	confirmation_y_or_n "Do you want to Configuring Zsh also for Linux distro container ${C}(take longer time to login into distro)" distro_zsh_answer
	else
	distro_zsh_answer="$zsh_answer"
	fi
	echo "distro_zsh_answer=\"$distro_zsh_answer\"" >> "$config_file"

	if [[ "$distro_add_answer" == "y" ]] && [[ "$terminal_utility_setup_answer" == "y" ]]; then
	banner
	confirmation_y_or_n "Do you want install the terminal utility also for Linux distro container" distro_terminal_utility_setup_answer
	else
	distro_terminal_utility_setup_answer="$terminal_utility_setup_answer"
	fi
	echo "distro_terminal_utility_setup_answer=\"$distro_terminal_utility_setup_answer\"" >> "$config_file"

	banner
	confirmation_y_or_n "Do you want to create a normal user account ${C}(Recomended)" pd_useradd_answer
	echo "pd_useradd_answer=\"$pd_useradd_answer\"" >> "$config_file"
	echo

	if [[ "$pd_useradd_answer" == "n" ]]; then
	echo "${R}[${C}-${R}]${G} Skiping User Account Setup${W}"
	else
	echo "${R}[${C}-${R}]${G}${BOLD} Select user account type${W}"
	echo
	echo "${Y}1. User with no password confirmation${W}"
	echo
	echo "${Y}2. User with password confirmation${W}"
	echo
	select_an_option 2 1 pd_pass_type
	echo "pd_pass_type=\"$pd_pass_type\"" >> "$config_file"
	    if [[ "$pd_pass_type" == "1" ]]; then
	    while true; do
		echo " "
		echo "${R}[${C}-${R}]${G} Default Password Will Be Set, Because Sometime It Might Ask You For Password${W}"
		echo
		echo "${R}[${C}-${R}]${G}Input Password: ${W}" 
		echo
		def_pass="${def_pass:-root}"
		echo
	    echo  "${R}[${C}-${R}]${G} Input username [Lowercase]: ${W}" 
	    echo
	    u_name="${u_name:-anonymous_academy_student}"
	    echo
	    read  "${R}[${C}-${R}]${Y} Do you want to continue with username ${C}$u_name ${Y} and password ${C}$def_pass${Y} ? (y/n) : ${W}" choicet
	    echo
	    choicet="${choicet:-y}"
	    echo
	    print_success "Continuing with answer: $choice"
	    sleep 0.2
	    case $choicet in
	    [yY]* )
	    print_success "Continuing with username ${C}$user_name"
	    break;;
	    [nN]* )
	    echo "${R}[${C}-${R}]${G}Please provide username again.${W}"
	    echo
	    ;;
	    * )
	    print_failed "Invalid input, Please enter y or n"
	    ;;
	    esac
	    done
	    echo "user_name=\"$user_name\"" >> "$config_file"
	    elif [[ "$pd_pass_type" == "2" ]]; then
	    echo
	    echo "${R}[${C}-${R}]${G}${BOLD} Create user account${W}"
	    echo
	    while true; do
	    read -r -p "${R}[${C}-${R}]${G}Input username [Lowercase]: ${W}" user_name
	    echo
	    read -r -p "${R}[${C}-${R}]${G}Input Password: ${W}" pass
	    echo
	    read -r -p "${R}[${C}-${R}]${Y}Do you want to continue with username ${C}$user_name ${Y}and password ${C}$pass${Y} ? (y/n) : ${W}" choice
	    echo
	    choice="${choice:-y}"
	    echo
	    print_success "Continuing with answer: $choice"
	    echo ""
	    sleep 0.2
	    case $choice in
	    [yY]* )
	    print_success "Continuing with username ${C}$user_name ${G}and password ${C}$pass"
	    break;;
	    [nN]* )
	    echo "${R}[${C}-${R}]${G}Please provide username and password again.${W}"
	    echo
	    ;;
	    * )
	    print_failed "Invalid input, Please enter y or n"
	    ;;
	    esac
	    done
	    echo "user_name=\"$user_name\"" >> "$config_file"
	    echo "pass=\"$pass\"" >> "$config_file"
	    fi

	fi
}

#########################################################################
#
# Update System And Install Required Packages Repo And Bssic Task
#
#########################################################################

function chose_mirror() {
	echo "${R}[${C}-${R}]${G}${BOLD}Selecting best termux packages mirror please wait${W}"
	local todays_date
	todays_date=$(date +"%d-%m")
    unlink "$PREFIX/etc/termux/chosen_mirrors" &>/dev/null
    ln -s "$PREFIX/etc/termux/mirrors/all" "$PREFIX/etc/termux/chosen_mirrors" &>/dev/null
    pkg --check-mirror update
	touch "$HOME/.run_chosen_mirrors_once"
	echo "$todays_date" > "$HOME/.run_chosen_mirrors_once"
}

function update_sys() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Updating System....${W}"
    echo

    local todays_date
    todays_date=$(date +"%d-%m")

    if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        pacman -Syu --noconfirm
    else
        if [[ -f "$HOME/.run_chosen_mirrors_once" ]]; then
			local date_on_file
			date_on_file="$(cat "$HOME"/.run_chosen_mirrors_once)"
			# Check if the file is older than today
            if [[ $(find "$HOME/.run_chosen_mirrors_once" -mtime +0 2>/dev/null) ]] && [[ "$date_on_file" != "$todays_date" ]]; then # although [[ "$date_on_file" != "$todays_date" ]] is unnecessary
                chose_mirror
            fi
            pkg update -y -o Dpkg::Options::="--force-confnew"
            pkg upgrade -y -o Dpkg::Options::="--force-confnew"
        else
            chose_mirror
            pkg update -y -o Dpkg::Options::="--force-confnew"
            pkg upgrade -y -o Dpkg::Options::="--force-confnew"
        fi
    fi
}

function check_system_requirements() {
	local errors=0
	clear

	# Disable keyboard interruptions
    trap '' SIGINT SIGTSTP

	printf "%s############################################################\n" "$C"
	printf "%s#                                                          #\n" "$C"
	printf "%s#  ▀█▀ █▀▀ █▀█ █▀▄▀█ █ █ ▀▄▀   █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█  #\n" "$C"
	printf "%s#   █  ██▄ █▀▄ █   █ █▄█ █ █   █▄▀ ██▄ ▄█ █ █  █  █▄█ █▀▀  #\n" "$C"
	printf "%s#                                                          #\n" "$C"
	printf "%s################# System Compatibility Check ###############%s\n" "$C" "$W"
	echo " "
    sleep 0.3
    # Check if running on Android
	android_version=$(getprop ro.build.version.release | cut -d'.' -f1)

    if [[ "$(uname -o)" == "Android" ]]; then
		if [[ "$android_version" -ge 8 ]]; then
        	print_status "ok" "Running on: ${W}Android $android_version"
		else
			print_status "error" "Running on: ${W}Android $android_version is not recomended"
			((errors++))
		fi
    else
        print_status "error" "Not running on Android"
        ((errors++))
    fi
    sleep 0.2
	# Android device soc & model details
	model="$(getprop ro.product.brand) $(getprop ro.product.model)"
	print_status "ok" "Device: ${W}$model"
	sleep 0.2
	PROCESSOR_BRAND_NAME="$(getprop ro.soc.manufacturer)"
	PROCESSOR_NAME="$(getprop ro.soc.model)"
	print_status "ok" "SOC: ${W}$PROCESSOR_BRAND_NAME $PROCESSOR_NAME"
	sleep 0.2
	# Check GPU
	gpu_egl=$(getprop ro.hardware.egl)
    gpu_vulkan=$(getprop ro.hardware.vulkan)
    detected_gpu="$(echo -e "$gpu_egl\n$gpu_vulkan" | sort -u | tr '\n' ' ' | sed 's/ $//')"
	if echo "$detected_gpu" | grep -iq "adreno"; then
		gpu_name="adreno"
	elif echo "$detected_gpu" | grep -iq "mali"; then
		gpu_name="mali"
	elif echo "$detected_gpu" | grep -iq "xclipse"; then
		gpu_name="xclipse"
	else
		gpu_name="unknown"
	fi

	if [[ "$gpu_name" == "adreno" ]] ||  [[ "$gpu_name" == "mali" ]] || [[ "$gpu_name" == "xclipse" ]]; then
        print_status "ok" "GPU: ${W}$gpu_name"
    else
        print_status "warn" "Unknown GPU: ${W}$detected_gpu"
    fi
	sleep 0.2
    # Check architecture
	app_arch=$(uname -m)
	supported_arch="$(getprop ro.product.cpu.abilist)"
	local archtype
	case "$app_arch" in
    aarch64) archtype="aarch64" ;;
    armv7*|arm) archtype="arm" ;;
	esac

    if [[ "$archtype" == "aarch64" ]] || [[ "$archtype" == "arm" ]]; then
        print_status "ok" "App architecture: ${W}$app_arch"
    else
        print_status "error" "Unsupported architecture: $app_arch, requires aarch64/arm/armv7*"
        ((errors++))
    fi
	sleep 0.2
    # Check for termux app requirements
    if [[ -d "$PREFIX" ]]; then
        print_status "ok" "Termux PREFIX: ${W}Directory found"
		sleep 0.2
		local latest_tag
		latest_tag=$(get_latest_release "termux" "termux-app")
		if [[ "$TERMUX_VERSION" == "$latest_tag" ]]; then
			print_status "ok" "Termux Version: ${W}$TERMUX_VERSION"
			sleep 0.2
			local termux_build
			termux_build=$(echo "$TERMUX_APK_RELEASE" | awk '{print tolower($0)}')
			if [[ "$termux_build" == "github" ]] || [[ "$termux_build" == "fdroid" ]]; then
				print_status "ok" "Termux Build: ${W}$TERMUX_APK_RELEASE"
				sleep 0.2
			else
        		print_status "error" "$TERMUX_APK_RELEASE build is not recomended"
				echo "${W}Update Termux:- https://github.com/termux/termux-app/releases ${W}"
				sleep 0.2
			fi
		else
			print_status "warn" "Termux Version: ${W}$TERMUX_VERSION (Not Recomended)"
			echo "${R}[${G}!${R}]${G} Update Termux:- https://github.com/termux/termux-app/releases ${W}"
			sleep 0.2
		fi
    else
        print_status "error" "Termux PREFIX: directory not found"
        ((errors++))
		sleep 0.2
    fi
    # Check available storage space
	free_space=$(df -h "$HOME" | awk 'NR==2 {print $4}')
    if [[ $(df "$HOME" | awk 'NR==2 {print $4}') -gt 4194304 ]]; then
        print_status "ok" "Available storage: ${W}$free_space"
    else
        print_status "warn" "Low storage space: ${W}$free_space (4GB recommended)"
    fi
	sleep 0.2
    # Check RAM
	total_ram=$(free -htm | awk '/Mem:/ {print $2}')
    if [[ $(free -m | awk 'NR==2 {print $2}') -gt 2048 ]]; then
        print_status "ok" "RAM: ${W}${total_ram}"
    else
        print_status "warn" "Low RAM: ${W}${total_ram} (2GB recommended)"
    fi
	sleep 0.2
    echo
    if [[ $errors -eq 0 ]]; then
        print_success "All system requirements met!"
		sleep 0.2
        return 0
    else
        print_failed "Found $errors error(s). System requirements not met."
		sleep 0.2
		echo
        confirmation_y_or_n "Do you want to continue anyway (Not Recomended)" continue_install_anyway
		if [[ "$continue_install_anyway" == "n" ]]; then
			trap - SIGINT SIGTSTP
			exit 1
		fi
    fi
}

function print_recomended_msg() {
check_system_requirements
echo
echo "${R}[${C}-${R}]${G}${BOLD} Please read this..."
echo -e "${W}
1. Ensure it's a clean installation.\n
2. Make sure you have at least 1 GB of internet data.\n
3. Use a reliable VPN to avoid any internet connection issues.\n
4. Long press on Termux and enable "Keep screen on".\n
5. Do not close Termux during the installation process.\n
6. Make sure to read all README files carefully."
if [[ "$android_version" -ge 12 ]]; then
echo -e "${W}
7. Make sure to disable Phantom Process Killer.
"
fi
# Re-enable keyboard interruptions
trap - SIGINT SIGTSTP
wait_for_keypress
}

function install_required_packages() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Installing required packages...${W}"
    echo

    if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        package_install_and_check "wget pv jq curl pulseaudio termux-am"
    else
        package_install_and_check "wget pv jq curl pulseaudio tar xz-utils gzip termux-am x11-repo tur-repo"
    fi
    update_sys
}

function install_desktop() {
    banner

    if [[ "$desktop_answer" == "1" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing Xfce4 Desktop${W}"
        echo
        package_install_and_check "xfce4 xfce4-goodies"
    elif [[ "$desktop_answer" == "2" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing Lxqt Desktop${W}"
        echo
        package_install_and_check "lxqt openbox gtk3 papirus-icon-theme xorg-xsetroot"
    elif [[ "$desktop_answer" == "3" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing Openbox WM${W}"
        echo
        package_install_and_check "openbox polybar xorg-xsetroot lxappearance wmctrl feh termux-api thunar firefox mpd rofi bmon xcompmgr xfce4-settings gtk3 gedit"
    elif [[ "$desktop_answer" == "4" ]]; then
        echo "${R}[${C}-${R}]${G}${BOLD} Installing MATE${W}"
        echo
        package_install_and_check "mate*"
        package_install_and_check "marco mousepad xfce4-taskmanager lximage-qt"
    fi
	package_install_and_check "kvantum xwayland file-roller pavucontrol gnome-font-viewer atril galculator gdk-pixbuf libwayland-protocols xorg-xrdb"
    # Uncomment if additional package installation is needed
    # if [[ "$distro_add_answer" == "y" ]]; then
    #     package_install_and_check "xdg-utils"
    # fi
}

#########################################################################
#
# Theme Installer
#
#########################################################################
function set_config_dir() {
	if [[ "$de_name" == "xfce" ]]; then
	config_dirs=(autostart cairo-dock dconf gtk-3.0 Mousepad pulse Thunar menu ristretto rofi xfce4)
	elif [[ "$de_name" == "lxqt" ]]; then
	config_dirs=(fontconfig gtk-3.0 lxqt pcmanfm-qt QtProject.conf glib-2.0 Kvantum openbox qterminal.org)
	elif [[ "$de_name" == "openbox" ]]; then
	config_dirs=(dconf gedit Kvantum openbox pulse rofi xfce4 enchant gtk-3.0 mimeapps.list polybar QtProject.conf Thunar)
	elif [[ "$de_name" == "mate" ]]; then
	config_dirs=(caja dconf galculator gtk-3.0 Kvantum lximage-qt menus Mousepad pavucontrol.ini xfce4)
    fi
}

function theme_installer() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Theme: ${C}${style_name}${W}"
    echo

    if [[ "$de_name" == "xfce" ]] || [[ "$de_name" == "openbox" ]]; then
        package_install_and_check "gnome-themes-extra"
    fi

    sleep 3
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Wallpapers...${W}"
    echo
    check_and_create_directory "$PREFIX/share/backgrounds"
    download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/wallpaper.tar.gz" "$PREFIX/share/backgrounds/"

    banner
    check_and_create_directory "$icons_folder"
    download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/icon.tar.gz" "$icons_folder"

    if [[ "$de_name" == "xfce" ]]; then
        local icons_themes_names
		icons_themes_names=$(ls "$icons_folder")
        local icons_theme
        for icons_theme in $icons_themes_names; do
            if [[ -d "$icons_folder/$icons_theme" ]]; then
                echo "${R}[${C}-${R}]${G} Creating icon cache...${W}"
                gtk-update-icon-cache -f -t "$icons_folder/$icons_theme"
            fi
        done
    fi

    local sys_icons_themes_names
	sys_icons_themes_names=$(ls "$sys_icons_folder")
    local sys_icons_theme
    for sys_icons_theme in $sys_icons_themes_names; do
        if [[ -d "$sys_icons_folder/$sys_icons_theme" ]]; then
            echo "${R}[${C}-${R}]${G} Creating icon cache...${W}"
            gtk-update-icon-cache -f -t "$sys_icons_folder/$sys_icons_theme"
        fi
    done

    echo "${R}[${C}-${R}]${G}${BOLD} Installing Theme...${W}"
    echo
    check_and_create_directory "$themes_folder"
    download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/theme.tar.gz" "$themes_folder"

    echo "${R}[${C}-${R}]${G} Making Additional Configuration...${W}"
    echo
    check_and_create_directory "$HOME/.config"
    set_config_dir

    for the_config_dir in "${config_dirs[@]}"; do
        check_and_delete "$HOME/.config/$the_config_dir"
    done

    if [[ "$de_name" == "openbox" ]]; then
        download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/config.tar.gz" "$HOME"
    else
        download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/config.tar.gz" "$HOME/.config/"
    fi
}

#########################################################################
#
# Install Additional Packages For Theme
#
#########################################################################

function additional_required_package_installler() {
    banner
	if [[ "$de_name" == "xfce" ]]; then
    echo "${R}[${C}-${R}]${G}${BOLD} Installing Additional Packages If Required...${W}"
	echo
	if [[ "$style_answer" == "2" ]] || [[ "$style_answer" == "5" ]] || [[ "$style_answer" == "6" ]]; then
	package_install_and_check "cairo-dock-core"
	elif [[ "$style_answer" == "2" ]] || [[ "$style_answer" == "6" ]]; then
	package_install_and_check "rofi"
	elif [[ "$style_answer" == "3" ]]; then
	package_install_and_check "fluent-icon-theme vala-panel-appmenu"
	elif [[ "$style_answer" == "4" ]]; then
    package_install_and_check "gtk2-engines-murrine"
	elif [[ "$style_answer" == "5" ]] || [[ "$style_answer" == "6" ]]; then
	cp "$HOME/.config/xpple_menu/applications/*" "$PREFIX/share/applications/"
	elif [[ "$style_answer" == "7" ]]; then
	install_font_for_style "7"
	else
	echo "${R}[${C}-${R}]${G} No Additional Packages Required For Theme: ${style_answer}${W}"
	sleep 1
	fi
	elif [[ "$de_name" == "openbox" ]]; then
	    if [[ "$style_answer" == "8" ]]; then
	    install_font_for_style "1"
		else
		echo "${R}[${C}-${R}]${G} No Additional Packages Required For Theme: ${style_answer}${W}"
	    sleep 1
	    fi
	fi
}

#########################################################################
#
# Setup Selected Style And Wallpapers
#
#########################################################################

function setup_config() {
	cd "$HOME" || return
	if [[ ${style_answer} =~ ^[1-9][0-9]*$ ]]; then
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Installing $de_name Style: ${C}${style_answer}${W}"
	theme_installer
	additional_required_package_installler
	fi
	if [[ "$ext_wall_answer" == "n" ]]; then
	echo "${R}[${C}-${R}]${C} Skipping Extra Wallpapers Setup...${W}"
	echo
	elif [[ "$ext_wall_answer" == "y" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Installing Some Extra Wallpapers...${W}"
	echo
	check_and_create_directory "$PREFIX/share/backgrounds"
	download_and_extract "https://archive.org/download/wallpaper-extra.tar/wallpaper-extra.tar.gz" "$PREFIX/share/backgrounds/"
	fi
}

function setup_folder() {
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Configuring Storage...${W}"
	echo
	while true; do
	termux-setup-storage
	sleep 4
    if [[ -d ~/storage ]]; then
	break
    else
	print_failed "Storage permission denied"
    fi
    sleep 3
	done
	cd "$HOME" || return
	termux-reload-settings
	directories=(Music Download Pictures Videos)
	for dir in "${directories[@]}"; do
	check_and_create_directory "$HOME/storage/shared/$dir"
	done
	check_and_create_directory "$HOME/Desktop"
	ln -s "$HOME/storage/shared/Music" "$HOME/"
	ln -s "$HOME/storage/shared/Download" "$HOME/Downloads"
	ln -s "$HOME/storage/shared/Pictures" "$HOME/"
	ln -s "$HOME/storage/shared/Videos" "$HOME/"
}

#########################################################################
#
# Hardware Acceleration Setup
#
#########################################################################

# setup hardware acceleration, check if the enable-hw-acceleration already exist then then first check if it different from github , then ask user if they want to replace it or not, if not then continue with the lacal enable-hw-acceleration file
function hw_config() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Hardware Acceleration${W}"
    echo

    if [[ -f ${current_path}/enable-hw-acceleration ]]; then
        local current_script_hash
        current_script_hash=$(curl -sL https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/enable-hw-acceleration | sha256sum | cut -d ' ' -f 1)
        local local_script_hash
        local_script_hash=$(sha256sum "${current_path}/enable-hw-acceleration" | cut -d ' ' -f 1)

        if [[ "$local_script_hash" != "$current_script_hash" ]]; then
            echo "${R}[${C}-${R}]${G} A different version of the hardware acceleration installer is detected.${W}"
            echo

            confirmation_y_or_n "Do you want to replace it with the latest version?" change_old_hw_installer

            if [[ "$change_old_hw_installer" == "y" ]]; then
                check_and_backup "${current_path}/enable-hw-acceleration"
                download_file "${current_path}/enable-hw-acceleration" https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/enable-hw-acceleration
				chmod +x "${current_path}/enable-hw-acceleration"
                . "${current_path}"/enable-hw-acceleration
            else
                echo "${R}[${C}-${R}]${G} Using the local hardware acceleration setup file.${W}"
                chmod +x "${current_path}/enable-hw-acceleration"
                . "${current_path}"/enable-hw-acceleration
            fi

            echo "change_old_hw_installer=\"$change_old_hw_installer\"" >> "$config_file"
        else
            echo "${R}[${C}-${R}]${G} Using the local hardware acceleration setup file.${W}"
            chmod +x "${current_path}/enable-hw-acceleration"
            . "${current_path}"/enable-hw-acceleration
        fi
    else
        download_file "${current_path}/enable-hw-acceleration" https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/enable-hw-acceleration
		chmod +x "${current_path}/enable-hw-acceleration"
        . "${current_path}"/enable-hw-acceleration
    fi

    check_and_delete "${current_path}/enable-hw-acceleration"
	print_log "$current_path $current_script_hash $local_script_hash"
}

#########################################################################
#
# Proot Distro Setup
#
#########################################################################

# same as the hardware acceleration setup but for distro-container-setup file
function distro_container_setup() {
    if [[ "$distro_add_answer" == "n" ]]; then
        banner
        echo "${R}[${C}-${R}]${C} Skipping Linux Distro Container Setup...${W}"
        echo
        hw_config
    else
        banner
        echo "${R}[${C}-${R}]${G}${BOLD} Configuring Linux Distro Container${W}"
        echo

        if [[ -f "${current_path}/distro-container-setup" ]]; then
            local current_script_hash
            current_script_hash=$(curl -sL https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/distro-container-setup | sha256sum | cut -d ' ' -f 1)
            local local_script_hash
            local_script_hash=$(basename "$(sha256sum "${current_path}/distro-container-setup" | cut -d ' ' -f 1)")

            if [[ "$local_script_hash" != "$current_script_hash" ]]; then
                echo "${R}[${C}-${R}]${G} It looks like you already have a different distro-container setup script in your current directory${W}"
                echo
                confirmation_y_or_n "Do you want to change it with the latest installer" change_old_distro_installer

                if [[ "$change_old_distro_installer" == "y" ]]; then
                    check_and_backup "${current_path}/distro-container-setup"
                    download_file "${current_path}/distro-container-setup" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/distro-container-setup"

                    chmod +x "${current_path}/distro-container-setup"
                    . "${current_path}/distro-container-setup"
                else
                    echo "${R}[${C}-${R}]${G} Using the local distro-container setup file${W}"
                    chmod +x "${current_path}/distro-container-setup"
                    . "${current_path}/distro-container-setup"
                fi

                echo "change_old_distro_installer=\"$change_old_distro_installer\"" >> "$config_file"
            else
                echo "${R}[${C}-${R}]${G} Using the local distro-container setup file${W}"
                chmod +x "${current_path}/distro-container-setup"
                . "${current_path}/distro-container-setup"
            fi
        else
            download_file "${current_path}/distro-container-setup" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/distro-container-setup"

            # Check if arguments are passed
            if [[ ("$1" == "--change" || "$1" == "-c") && ("$2" == "distro" || "$2" == "pd") ]]; then
                sed -i 's/\(call_from_change_d="\)[^"]*/\1y/' "${current_path}/distro-container-setup"
            fi

            chmod +x "${current_path}/distro-container-setup"
            . "${current_path}/distro-container-setup"
        fi
	check_and_delete "${current_path}/distro-container-setup"
    fi

    echo "distro_add_answer=\"$distro_add_answer\"" >> "$config_file"
	print_log "$current_path $distro_add_answer $local_script_hash"
}

#########################################################################
#
# Vnc | Termux:x11 | Launch Scripts
#
#########################################################################

function setup_vncstart_cmd() {
    check_and_delete "$PREFIX/bin/vncstart"

cat <<EOF > "$PREFIX/bin/vncstart"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-lock

vnc_server_pid=\$(pgrep -f "vncserver")
de_pid=\$(pgrep -f "$de_startup")
if [[ -n "\$de_pid" ]] || [[ -n "\$vnc_server_pid" ]]>/dev/null 2>&1; then
vncstop -f
fi

pulseaudio --start --exit-idle-time=-1

case \$1 in
--nogpu)
env XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe vncserver
;;
--help|-h)
echo "${C}vncstart ${G}to start vncserver with gpu acceleration${W}"
echo "${C}vncstart ---nogpu ${G}to start vncserver without gpu acceleration${W}"
;;
*)
export ${set_to_export}
${initialize_server_method} &
env XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg $hw_method vncserver
;;
esac
EOF
    chmod +x "$PREFIX/bin/vncstart"
}

function setup_vncstop_cmd() {
    check_and_delete "$PREFIX/bin/vncstop"
cat <<'EOF' > "$PREFIX/bin/vncstop"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-unlock

if [[ "$1" == "-f" ]]; then
pkill -9 Xtigervnc > /dev/null 2>&1
else
display_numbers=$(vncserver -list | awk '/^:[0-9]+/ {print $1}')

for display in $display_numbers; do
    vncserver -kill "$display"
done
fi
rm $HOME/.vnc/localhost:*.log > /dev/null 2>&1
rm $PREFIX/tmp/.X1-lock > /dev/null 2>&1
rm $PREFIX/tmp/.X11-unix/X1 > /dev/null 2>&1
EOF
    chmod +x "$PREFIX/bin/vncstop"
}

function setup_vnc() {
    banner
    echo "${R}[${C}-${R}]${G}${BOLD} Configuring Vnc...${W}"
    echo
    package_install_and_check "tigervnc"
    check_and_create_directory "$HOME/.vnc"
    check_and_delete "$HOME/.vnc/xstartup"
cat << EOF > "$HOME/.vnc/xstartup"
    $de_startup &
EOF
    chmod +x "$HOME/.vnc/xstartup"
	setup_vncstart_cmd
	setup_vncstop_cmd
}

function setup_tx11start_cmd() {
	check_and_delete "$PREFIX/bin/tx11start"
cat <<EOF > "$PREFIX/bin/tx11start"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-lock

termux_x11_pid=\$(pgrep -f /system/bin/app_process.*com.termux.x11.Loader)
de_pid=\$(pgrep -f "$de_startup")
if [ -n "\$termux_x11_pid" ] || [ -n "\$de_pid" ] >/dev/null 2>&1; then
pkill -f com.termux.x11 > /dev/null 2>&1
kill -9 \$de_pid > /dev/null 2>&1
fi

pulseaudio --start --exit-idle-time=-1

###########################################################
#                                                         #
#************************* Debug *************************#
#                                                         #
###########################################################

if [[ "\$1" == "--debug" ]]; then
case \$2 in
--nogpu)
    # Start Termux X11 without GPU acceleration
    XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe dbus-launch --exit-with-session $de_startup

    # Check if the second argument is --legacy
    if [[ "\$3" == "--legacy" ]]; then
        XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing &
        sleep 1
        am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
        sleep 1
        env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} dbus-launch --exit-with-session $de_startup
    fi
    ;;

--nodbus)
    # Start Termux X11 without dbus-launch
	export ${set_to_export}
	${initialize_server_method} &
    env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -xstartup $de_startup
    exit 0

    # Nested case to check for additional options
    case \$3 in
    --nogpu)
        env LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -xstartup $de_startup

        if [[ "\$4" == "--legacy" ]]; then
            env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup
        fi
        ;;
    --legacy)
	export ${set_to_export}
	${initialize_server_method} &
        env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup
        ;;
    *)
        echo -e "${C}--legacy ${G}to start termux:x11 with -legacy-drawing${W}"
        echo -e "${C}--nogpu ${G}to start termux:x11 without GPU acceleration${W}"
        exit 0
        ;;
    esac
    ;;

--legacy)
    # Start Termux X11 with legacy drawing mode
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} -legacy-drawing &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup
    ;;

*)
    # Default behavior: start Termux X11 with GPU acceleration and dbus
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} TERMUX_X11_DEBUG=1 termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup
    ;;
esac

elif [[ "\$1" == "--help" ]]; then

###########################################################
#                                                         #
#************************** Help *************************#
#                                                         #
###########################################################

    # Display help information
    echo -e "${C}tx11start ${G}to start termux:x11 with GPU acceleration${W}"
    echo -e "${C}tx11start --nogpu ${G}to start termux:x11 without GPU acceleration${W}"
    echo -e "${C}tx11start --nodbus ${G}to start termux:x11 without dbus${W}"
    echo -e "${C}tx11start --legacy ${G}to start termux:x11 with -legacy-drawing${W}"
	echo -e "${C}tx11start --debug ${G}at the start to see debug log${W}"
    exit 0
else

###########################################################
#                                                         #
#************************* Main **************************#
#                                                         #
###########################################################

case \$1 in
--nogpu)
    # Start Termux X11 without GPU acceleration
    XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &

    # Check if the second argument is --legacy
    if [[ "\$2" == "--legacy" ]]; then
        XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} -legacy-drawing &
        sleep 1
        am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
        sleep 1
        env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &
    fi
    ;;

--nodbus)
    # Start Termux X11 without dbus-launch
	export ${set_to_export}
	${initialize_server_method} &
    env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} termux-x11 :${display_number} -xstartup $de_startup > /dev/null 2>&1 &
    exit 0

    # Nested case to check for additional options
    case \$2 in
    --nogpu)
        env LIBGL_ALWAYS_SOFTWARE=1 MESA_LOADER_DRIVER_OVERRIDE=llvmpipe GALLIUM_DRIVER=llvmpipe XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} termux-x11 :${display_number} -xstartup $de_startup > /dev/null 2>&1 &

        if [[ "\$3" == "--legacy" ]]; then
            env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup > /dev/null 2>&1 &
        fi
        ;;
    --legacy)
	export ${set_to_export}
	${initialize_server_method} &
        env XDG_RUNTIME_DIR=\${TMPDIR} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} termux-x11 :${display_number} -legacy-drawing -xstartup $de_startup > /dev/null 2>&1 &
        ;;
    *)
        echo -e "${C}--legacy ${G}to start termux:x11 with -legacy-drawing${W}"
        echo -e "${C}--nogpu ${G}to start termux:x11 without GPU acceleration${W}"
        exit 0
        ;;
    esac
    ;;

--legacy)
    # Start Termux X11 with legacy drawing mode
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} -legacy-drawing &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &
    ;;
*)
    # Default behavior: start Termux X11 with GPU acceleration and dbus
	export ${set_to_export}
	${initialize_server_method} &
    sleep 1
    XDG_RUNTIME_DIR=\${TMPDIR} termux-x11 :${display_number} &
    sleep 1
    am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1 &
    sleep 1
    env DISPLAY=:${display_number} XDG_CONFIG_DIRS=/data/data/com.termux/files/usr/etc/xdg ${gpu_environment_variable} ${hw_method} dbus-launch --exit-with-session $de_startup > /dev/null 2>&1 &
    ;;
esac
fi
EOF

if [[ "$de_name" == "xfce" ]]; then
cat <<'EOF' >> "$PREFIX/bin/tx11start"
sleep 5
process_id=$(ps -aux | grep '[x]fce4-screensaver' | awk '{print $2}')
kill "$process_id" > /dev/null 2>&1
EOF
fi
chmod +x "$PREFIX/bin/tx11start"
}

function setup_tx11stop_cmd() {
	check_and_delete "$PREFIX/bin/tx11stop"
if [[ "$de_name" == "openbox" ]]; then
cat <<EOF > "$PREFIX/bin/tx11stop"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-unlock

termux_x11_pid=\$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
de_pid=\$(pgrep -f $de_startup)
if [[ -n "\$termux_x11_pid" ]] || [[ -n "\$de_pid" ]]; then
kill -9 "\$termux_x11_pid" > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 openbox* > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
pkill -f com.termux.x11 > /dev/null 2>&1
	if [[ ! -n "\$termux_x11_pid" ]] || [[ ! -n "\$de_pid" ]]; then
	echo -e "${G}Termux:X11 Stopped Successfully ${W}"
	fi
elif [[ "\$1" == "-f" ]]; then
pkill -f com.termux.x11 > /dev/null 2>&1
pkill -9 openbox* > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
echo -e "${G}Termux:X11 Successfully Force Stopped ${W}"
elif [[ "\$1" == "-h" ]]; then
echo -e "tx11stop       to stop termux:x11"
echo -e "tx11stop -f    to kill termux:x11"
fi
exec 2>/dev/null
EOF
else
cat <<EOF > "$PREFIX/bin/tx11stop"
#!/data/data/com.termux/files/usr/bin/bash

termux-wake-unlock

termux_x11_pid=\$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
de_pid=\$(pgrep -f $de_startup)
if [[ -n "\$termux_x11_pid" ]] || [[ -n "\$de_pid" ]]; then
kill -9 "\$termux_x11_pid" > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 $de_name-* > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
pkill -f com.termux.x11 > /dev/null 2>&1
	if [[ ! -n "\$termux_x11_pid" ]] || [[ ! -n "\$de_pid" ]]; then
	echo -e "${G}Termux:X11 Stopped Successfully ${W}"
	fi
elif [[ "\$1" == "-f" ]]; then
pkill -f com.termux.x11 > /dev/null 2>&1
pkill -9 $de_name-* > /dev/null 2>&1
killall virgl_test_server > /dev/null 2>&1
pkill -9 pulseaudio > /dev/null 2>&1
pkill -9 dbus-* > /dev/null 2>&1
echo -e "${G}Termux:X11 Successfully Force Stopped ${W}"
elif [[ "\$1" == "-h" ]]; then
echo -e "tx11stop       to stop termux:x11"
echo -e "tx11stop -f    to kill termux:x11"
fi
exec 2>/dev/null
EOF
fi
chmod +x "$PREFIX/bin/tx11stop"
}

function setup_termux_x11() {
	banner
        echo "${R}[${C}-${R}]${G}${BOLD} Configuring Termux:X11 ${W}"
        echo
        package_install_and_check "termux-x11-nightly"
		local repo_owner="termux"
		local repo_name="termux-x11"
		local latest_tag
		latest_tag=$(get_latest_release "$repo_owner" "$repo_name")
		local termux_x11_url="https://github.com/$repo_owner/$repo_name/releases/download/v$latest_tag/"
		local assets
		assets=$(curl -s "https://api.github.com/repos/$repo_owner/$repo_name/releases/latest" | grep -oP '(?<="name": ")[^"]*')
		deb_assets=$(echo "$assets" | grep "termux-x11.*all.deb")
		download_file "$current_path/termux-x11.deb" "$termux_x11_url/$deb_assets"
		apt install "$current_path/termux-x11.deb" -y
		rm "$current_path/termux-x11.deb"
		# "sed -i '12s/^#//' "$HOME/.termux/termux.properties"
		setup_tx11start_cmd
		setup_tx11stop_cmd
}

function gui_termux_x11() {
cat << EOF > "$PREFIX/bin/gui"
#!/data/data/com.termux/files/usr/bin/bash
case \$1 in
--start|-l)
tx11start
;;
--stop|-s)
tx11stop
;;
--kill|-k|-kill)
tx11stop -f
;;
--help|-h)
echo -e "${G} Use ${C}gui --start / gui -l ${G}to start termux:x11\n Use ${C}gui --stop / gui -s ${G}to stop termux:x11${W}"
;;
*)
echo "${R}Invalid choise${W}"
gui -h
;;
esac
EOF
}

function gui_both() {
cat << EOF > "$PREFIX/bin/gui"
#!/data/data/com.termux/files/usr/bin/bash
case \$1 in
    --start|-l)
        case \$2 in
            tx11)
                tx11start
                ;;
            vnc)
                vncstart
                ;;
            *)
                echo -e "${R}Invalid choise. Use ${C}tx11${R} or ${C}vnc ${G}with it${W}"
                ;;
        esac
        ;;
	--kill|-k|-kill)
	vncstop -f > /dev/null 2>&1
	tx11stop -f > /dev/null 2>&1
	echo -e "${G}Gui services killed successfully ${W}"
	;;
    --stop|-s)
        case \$2 in
            tx11)
                tx11stop
                ;;
            vnc)
                vncstop
                ;;
            *)
                echo -e "${R}Invalid choise. Use ${C}tx11${R} or ${C}vnc ${G}with it${W}"
                ;;
        esac
        ;;
    --help|-h)
        echo -e "${G}Use ${C}gui --start tx11/vnc${G} or ${C}gui -l tx11/vnc${G} to start a gui"
        echo -e "Use ${C}gui --stop tx11/vnc${G} or ${C}gui -s tx11/vnc${G} to stop a gui${W}"
		echo -e "Use ${C}gui --kill ${G} To kill both at once${W}"
        ;;
    *)
        echo -e "${R}Invalid choice${W}"
        gui -h
        ;;
esac
EOF
}

function gui_launcher() {
	check_and_delete "$PREFIX/bin/gui"
	package_install_and_check "xorg-xhost"
	if [[ "$gui_mode" == "termux_x11" ]]; then
	setup_termux_x11
	echo "gui_mode=\"termux_x11\"" >> "$config_file"
	gui_termux_x11
	elif [[ "$gui_mode" == "both" ]]; then
	setup_termux_x11
	setup_vnc
	echo "gui_mode=\"both\"" >> "$config_file"
	gui_both
	else
	setup_termux_x11
	echo "gui_mode=\"termux_x11\"" >> "$config_file"
	gui_termux_x11
	fi
	chmod +x "$PREFIX/bin/gui"
	check_and_create_directory "$PREFIX/share/applications/"
cat <<EOF > "$PREFIX/share/applications/killgui.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Stop Desktop
Comment=Kill or stop termux desktop
Exec=gui --kill
Icon=system-shutdown
Categories=System;
Path=
Terminal=false
StartupNotify=false
EOF
	chmod 644 "$PREFIX/share/applications/killgui.desktop"
	cp "$PREFIX/share/applications/killgui.desktop" "$HOME/Desktop/"
}

function check_desktop_process() {
	banner
	echo "${R}[${C}-${R}]${G} Checking Termux:X11 and $de_name setup or not... ${W}"
	echo
    sleep 0.5
	# check tx11start file and run it to ckeck termux x11 process
	if [[ -f "${PREFIX}/bin/tx11start" ]]; then
        print_status "ok" "Found tx11start file."
		echo "${R}[${C}-${R}]${G} Starting Termux:X11 for checkup...${W}"
		tax11start
		print_log "$(cat $PREFIX/bin/tx11start)"
		termux_x11_pid=$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
		if [[ -n "$termux_x11_pid" ]]; then
        	print_status "ok" "Termux:X11 Working"
		else
			print_status "error" "No Termux:X11 process found."
		fi
	fi

	# check for the desktop environment related process
	case "$de_name" in
	    xfce)
	        de_pid="$(pgrep xfce4)"
	        ;;
	    lxqt|openbox|mate)
	        de_pid="$(pgrep $de_name)"
	        ;;
	    *)
	        print_status "error" "Unknown desktop environment: $de_name"
	        sleep 0.2
	        ;;
	esac

	if [[ -n "$de_pid" ]]; then
	    print_status "ok" "$de_name is running fine"
		sleep 0.2
	else
	    print_status "error" "No $de_name process found"
		sleep 0.2
	fi

	# check tx11stop file and run it to ckeck if there any termux x11 process exist or not
	if [[ -f "${PREFIX}/bin/tx11stop" ]]; then
		print_status "ok" "Found tx11stop file."
		tx11stop
		print_log "$(cat $PREFIX/bin/tx11stop)"
		termux_x11_pid=$(pgrep -f "/system/bin/app_process / com.termux.x11.Loader :1.0")
		if [[ -z "$termux_x11_pid" ]]; then
        	print_status "ok" "Tx11stop command working"
		else
			print_status "error" "Tx11stop command not working"
		fi
	fi
}

#########################################################################
#
# Install Browser
#
#########################################################################

function browser_installer() {
	banner
	if [[ ${browser_answer} == "3" ]]; then
	package_install_and_check "firefox"
	echo "installed_browser=\"firefox\"" >> "$config_file"
	elif [[ ${browser_answer} == "2" ]]; then
	package_install_and_check "chromium"
	echo "installed_browser=\"chromium\"" >> "$config_file"
	elif [[ ${browser_answer} == "1" ]]; then
	package_install_and_check "firefox chromium"
	echo "installed_browser=\"both\"" >> "$config_file"
	elif [[ ${browser_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Browser Installation...${W}"
	echo "installed_browser=\"skip\"" >> "$config_file"
	echo
	sleep 2
	else
	package_install_and_check "firefox"
	echo "installed_browser=\"firefox\"" >> "$config_file"
	fi
}

#########################################################################
#
# Install Ide
#
#########################################################################

function ide_installer() {
	banner
	if [[ ${ide_answer} == "3" ]]; then
		package_install_and_check "code-oss code-is-code-oss"
	echo "installed_ide=\"code\"" >> "$config_file"
	elif [[ ${ide_answer} == "2" ]]; then
		package_install_and_check "geany"
	echo "installed_ide=\"geany\"" >> "$config_file"
	elif [[ ${ide_answer} == "1" ]]; then
		package_install_and_check "code-oss code-is-code-oss geany"
	echo "installed_ide=\"both\"" >> "$config_file"
	elif [[ ${ide_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Ide Installation...${W}"
	echo
	echo "installed_ide=\"skip\"" >> "$config_file"
	sleep 2
	else
		package_install_and_check "code-oss code-is-code-oss"
	echo "installed_ide=\"code\"" >> "$config_file"
	fi
}

#########################################################################
#
# Install Media Player
#
#########################################################################

function media_player_installer() {
	banner
	if [[ ${player_answer} == "3" ]]; then
		package_install_and_check "vlc-qt-static"
	echo "installed_media_player=\"vlc\"" >> "$config_file"
	elif [[ ${player_answer} == "2" ]]; then
		package_install_and_check "audacious"
	echo "installed_media_player=\"audacious\"" >> "$config_file"
	elif [[ ${player_answer} == "1" ]]; then
		package_install_and_check "vlc-qt-static audacious"
	echo "installed_media_player=\"both\"" >> "$config_file"
	elif [[ ${player_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Media Player Installation...${W}"
	echo
	sleep 2
	echo "installed_media_player=\"skip\"" >> "$config_file"
	else
		package_install_and_check "vlc-qt-static"
	echo "installed_media_player=\"vlc\"" >> "$config_file"
	fi
}

#########################################################################
#
# Install Photo Editor
#
#########################################################################

function photo_editor_installer() {
	banner
	if [[ ${photo_editor_answer} == "3" ]]; then
		package_install_and_check "gimp"
	echo "installed_photo_editor=\"gimp\"" >> "$config_file"
	elif [[ ${photo_editor_answer} == "2" ]]; then
		package_install_and_check "inkscape"
	echo "installed_photo_editor=\"inkscape\"" >> "$config_file"
	elif [[ ${photo_editor_answer} == "1" ]]; then
		package_install_and_check "gimp inkscape"
	echo "installed_photo_editor=\"both\"" >> "$config_file"
	elif [[ ${photo_editor_answer} == "4" ]]; then
    echo "${R}[${C}-${R}]${C} Skipping Photo Editor Installation...${W}"
	echo
	sleep 2
	echo "installed_photo_editor=\"skip\"" >> "$config_file"
	else
		package_install_and_check "gimp"
	echo "installed_photo_editor=\"gimp\"" >> "$config_file"
	fi

}

#########################################################################
#
# Install Software Manager
#
#########################################################################

function setup_synaptic() {
	banner
    if [[ "$synaptic_answer" == "n" ]]; then
	banner
    echo "${R}[${C}-${R}]${C} Skipping Synaptic Setup..${W}"
	echo
    sleep 1.5
	else
	echo "${R}[${C}-${R}]${G} Installing Synaptic Graphical Package Manager...${W}"
	echo
	package_install_and_check "synaptic"
	fi
	echo "install_synaptic=\"$synaptic_answer\"" >> "$config_file"
}

#########################################################################
#
# Install Extra Apps
#
#########################################################################

function install_extra_apps() {
	if [[ "$extra_app_suite" == "y" ]]; then
		banner
    	echo "${R}[${C}-${R}]${C} Installing The Extra App Suite...${W}"
		echo
		package_install_and_check "gedit rhythmbox xpdf thunderbird transmission-gtk "
		if [[ "$distro_add_answer" == "y" ]]; then
			echo "${R}[${C}-${R}]${G} Installing Libreoffice ${W}"
			echo
			if [[ "$selected_distro" == "archlinux" ]]; then
				$selected_distro install libreoffice-fresh -y
			else
				$selected_distro install libreoffice -y
			fi
		fi
	fi

}

#########################################################################
#
# Setup Zsh And Terminal and File Manager Utility
#
#########################################################################

function get_shellrc_path() {
	if [[ "$shell_name" == "bash" ]]; then
	shell_rc_file="/data/data/com.termux/files/usr/etc/bash.bashrc"
	elif [[ "$shell_name" == "zsh" ]]; then
	shell_rc_file="$HOME/.zshrc"
	fi
}

function setup_zsh() {
	banner
    if [[ "$zsh_answer" == "n" ]]; then
	echo "${R}[${C}-${R}]${C} Canceling Zsh Setup...${W}"
    sleep 1.5
	shell_name="bash"
	else
	shell_name="zsh"
	echo "${R}[${C}-${R}]${G}${BOLD} Configuring Zsh..${W}"
	echo
	package_install_and_check "zsh git"
	wget --tries=5 --retry-connrefused https://raw.githubusercontent.com/sabamdarif/simple-linux-scripts/main/install-zsh.sh
	if [[ "$distro_add_answer" == "y" ]]; then
	bash install-zsh.sh -u "$user_name"
	else
	bash install-zsh.sh
	fi
	check_and_delete "install-zsh.sh"
	clear
	fi
	get_shellrc_path
	echo "zsh_answer=\"$zsh_answer\"" >> "$config_file"
}

function terminal_utility_setup() {
	if [[ "$terminal_utility_setup_answer" == "n" ]]; then
    banner
	echo "${R}[${C}-${R}]${C} Skipping Terminal Utility Setup...${W}"
	echo
	else
	banner
	echo "${R}[${C}-${R}]${C}${BOLD} Configuring Terminal Utility For Termux...${W}"
	echo
	package_install_and_check "bat eza zoxide fastfetch openssh fzf"
	check_and_backup "$PREFIX/etc/motd"
	check_and_backup "$PREFIX/etc/motd-playstore"
    check_and_backup "$PREFIX/etc/motd.sh"
	download_file "$PREFIX/etc/motd.sh" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/motd.sh"
	if grep -q "motd.sh$" "$PREFIX/etc/termux-login.sh"; then
	sed -i "s|.*motd\.sh$|bash $PREFIX/etc/motd.sh|" "$PREFIX/etc/termux-login.sh"
    else
	echo "bash $PREFIX/etc/motd.sh" >> "$PREFIX/etc/termux-login.sh"
    fi
	check_and_create_directory "$HOME/.termux"
	check_and_backup "$HOME/.termux/colors.properties $HOME/.termux/termux.properties $HOME/.aliases"

	check_and_create_directory "$HOME/.config/fastfetch"
	download_file "$HOME/.config/fastfetch/config.jsonc" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/config.jsonc" 
	download_file "$HOME/.termux/termux.properties" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/termux.properties"
	download_file "$HOME/.aliases" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/.aliases"
	download_file "$HOME/.termux/colors.properties" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/colors.properties"
	download_file "$PREFIX/bin/termux-ssh" "https://raw.githubusercontent.com/sabamdarif/simple-linux-scripts/main/termux-ssh" && chmod +x "$PREFIX/bin/termux-ssh"
	cp "$shell_rc_file" "${shell_rc_file}-2"
	check_and_backup "$shell_rc_file"
	mv "${shell_rc_file}-2" "${shell_rc_file}"
cat <<'EOF' >> "$shell_rc_file"
#######################################################
# SPECIAL FUNCTIONS
#######################################################
# Extracts any archive(s)
extract() {
	for archive in "$@"; do
    if [[ ! -f "$archive" ]]; then
        echo "Error: '$archive' does not exist!"
        continue
    fi

    total_size=$(stat -c '%s' "$archive")

    case "$archive" in
        *.tar.gz|*.tgz)
            pv -s "$total_size" "$archive" | tar xzf -
            ;;
        *.tar.xz)
            pv -s "$total_size" "$archive" | tar xJf -
            ;;
        *.tar.bz2|*.tbz2)
            pv -s "$total_size" "$archive" | tar xjf -
            ;;
        *.tar)
            pv -s "$total_size" "$archive" | tar xf -
            ;;
        *.bz2)
            pv -s "$total_size" "$archive" | bunzip2 > "${archive%.bz2}"
            ;;
        *.gz)
            pv -s "$total_size" "$archive" | gunzip > "${archive%.gz}"
            ;;
        *.7z)
            pv -s "$total_size" "$archive" | 7z x -si -y > /dev/null
            ;;
        *.rar)
            pv -s "$total_size" "$archive" | unrar x -
            ;;
        *.zip)
            pv -s "$total_size" "$archive" | unzip -
            ;;
        *.Z)
            pv -s "$total_size" "$archive" | uncompress -
            ;;
        *)
            echo "Unsupported archive format: $archive"
            ;;
    esac
	done
}
# Searches for text in all files in the current folder
ftext() {
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}
# Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}
# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}
# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}
EOF
cat <<EOF >> "$shell_rc_file"
# set zoxide as cd
eval "\$(zoxide init --cmd cd ${shell_name})"
source $HOME/.aliases
EOF
	fi
cat <<EOF >> "$shell_rc_file"
# print your current termux-desktop configuration
alias 'tdconfig'='cat "$config_file"'
EOF
if [[ "$distro_add_answer" == "y" ]]; then
cat <<EOF >> "$shell_rc_file"
# open the folder where all the apps added by proot-distro are located
alias 'pdapps'='cd /data/data/com.termux/files/usr/share/applications/pd_added && ls'
EOF
fi
echo "terminal_utility_setup_answer=\"$terminal_utility_setup_answer\"" >> "$config_file"
}

function install_fm_tools() {
	if [[ "$fm_tools" == "y" ]]; then
		banner
		echo "${R}[${C}-${R}]${G}${BOLD} Installing File Manager Tools...${W}"
		check_and_backup "nautilus-scripts"
		git clone https://github.com/sabamdarif/nautilus-scripts
		cd nautilus-scripts
    	wget --tries=5 --retry-connrefused https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/setup-termux.sh
		bash setup-termux.sh
		cd ..
		check_and_delete "nautilus-scripts"
	fi
}

#########################################################################
#
# Install Fonts
#
#########################################################################

function setup_fonts() {
	if [[ "$terminal_utility_setup_answer" == "y" ]]; then
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Installing Fonts...${W}"
	package_install_and_check "nerdfix fontconfig-utils"
	check_and_create_directory "$HOME/.termux"
	check_and_create_directory "$HOME/.fonts"
	check_and_backup "$HOME/.termux/font.ttf"
	download_and_extract "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip" "$HOME/.fonts"
	clear
	check_and_delete "$HOME/.fonts/README.md $HOME/.fonts/LICENSE"
	cp "$HOME/.fonts/0xProtoNerdFont-Regular.ttf" "$HOME/.termux/font.ttf"
	fc-cache -f
	fi
}

#########################################################################
#
# Install Wine
#
#########################################################################

function run_wine_shortcut_script() {
	download_file "${current_path}/add-wine-shortcut" https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/other/add-wine-shortcut
	chmod +x "${current_path}/add-wine-shortcut"
    . "${current_path}"/add-wine-shortcut
	check_and_delete "add-wine-shortcut"
}

function setup_wine() {
	banner
    if [[ "$wine_answer" == "1" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Installing Wine Natively In Termux${W}"
	echo
	package_install_and_check "wine-stable winetricks"
	run_wine_shortcut_script
	echo "setup_wine=\"default-wine\"" >> "$config_file"
	elif [[ "$wine_answer" == "2" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Addind Mobox Launch Option To Termux${W}"
	echo
	echo "${R}[${C}-${R}]${C}${BOLD} After the installation finishes, make sure to install Mobox using their official instructions${W}"
	echo
	echo "${R}[${C}-${R}]${G}${BOLD} Mobox:- ${C}https://github.com/olegos2/mobox${W}"
	echo
	sleep 4
	download_file "$PREFIX/bin/wine" "https://raw.githubusercontent.com/LinuxDroidMaster/Termux-Desktops/main/scripts/termux_native/mobox_run.sh"
	chmod +x "$PREFIX/bin/wine"
	run_wine_shortcut_script
	cp "$PREFIX/share/applications/wine-explorer.desktop" "$HOME/Desktop/MoboxExplorer.desktop"
	echo "setup_wine=\"mobox\"" >> "$config_file"
	elif [[ "$wine_answer" == "3" ]]; then
	package_install_and_check "hangover hangover-wine winetricks"
	run_wine_shortcut_script
	echo "setup_wine=\"hangover-wine\"" >> "$config_file"
	elif [[ "$wine_answer" == "4" ]]; then
	echo "${R}[${C}-${R}]${C} Skipping wine Installation...${W}"
	echo "setup_wine=\"skip\"" >> "$config_file"
	else
    echo "${R}[${C}-${R}]${G} Installing Wine Natively In Termux${W}"
	echo
	package_install_and_check "wine-stable winetricks"
	run_wine_shortcut_script
	echo "setup_wine=\"default-wine\"" >> "$config_file"
	fi
}

#########################################################################
#
# Add Autostart
#
#########################################################################

function add_vnc_autostart() {
	echo "${R}[${C}-${R}]${G}${BOLD} Adding vnc to autostart${W}"
	if grep -q "^vncstart" "$shell_rc_file"; then
	echo "${R}[${C}-${R}]${G} Termux:X11 start already exist${W}"
	else
cat << EOF >> "$shell_rc_file"
# Start Vnc
if ! pgrep Xvnc > /dev/null; then
echo "${G}Starting Vnc...${W}"
vncstart
fi
EOF
	fi
}

function add_tx11_autostart() {
	echo "${R}[${C}-${R}]${G}${BOLD} Adding Termux:x11 to autostart${W}"
	if grep -q "^tx11start" "$shell_rc_file"; then
	echo "${R}[${C}-${R}]${G} Termux:X11 start already exist${W}"
	else
cat << EOF >> "$shell_rc_file"
# Start Termux:X11
termux_x11_pid=\$(pgrep -f "app_process -Xnoimage-dex2oat / com.termux.x11.Loader :1")
if [ -z "\$termux_x11_pid" ]; then
echo "${G}Starting Termux:x11...${W}"
tx11start
fi
EOF
	fi
}

function add_to_autostart() {
	if [[ "$de_on_startup" == "y" ]]; then
		if [[ "$gui_mode" == "vnc" ]] || [[ "$autostart_gui_mode" == "vnc" ]]; then
			add_vnc_autostart
		elif [[ "$gui_mode" == "termux_x11" ]] || [[ "$autostart_gui_mode" == "termux_x11" ]]; then
			add_tx11_autostart
		fi
	fi
	echo "de_on_startup=\"$de_on_startup\"" >> "$config_file"
}


#########################################################################
#
# Finish | Notes
#
#########################################################################
function cleanup_cache() {
	banner
	echo "${R}[${C}-${R}]${G} Cleaning up the cache...${W}"
	if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
	pacman -Scc
	else
	apt clean all
	fi
}

function add_common_function() {
	check_and_delete "$PREFIX/etc/termux-desktop/common_functions"
cat <<'EOF' > "$PREFIX/etc/termux-desktop/common_functions"
#!/data/data/com.termux/files/usr/bin/bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[0m')"
BOLD="$(printf '\033[1m')"

cd "$HOME" || exit
termux_desktop_path="$PREFIX/etc/termux-desktop"
config_file="$termux_desktop_path/configuration.conf"
log_file="$HOME/termux-desktop.log"
EOF
typeset -f check_termux print_log print_success print_failed wait_for_keypress check_and_create_directory check_and_delete check_and_backup download_file check_and_restore detact_package_manager package_install_and_check package_check_and_remove get_file_name_number extract_zip_with_progress extract_archive download_and_extract count_subfolders confirmation_y_or_n get_latest_release install_font_for_style select_an_option preprocess_conf read_conf >> "$PREFIX/etc/termux-desktop/common_functions"
chmod +x "$PREFIX/etc/termux-desktop/common_functions"
}

function delete_installer_file() {
	current_script_path="$(realpath "$0")"
	if [[ "$current_script_path" != */bin* ]]; then
	    if [[ -f "${current_path}/setup-termux-desktop" ]]; then
		(exec rm -- "${current_path}/setup-termux-desktop") &
		else
		print_failed "Installer file not found"
		fi
	fi
}

function notes() {
	banner
	echo "${R}[${C}-${R}]${G}${BOLD} Installation Successfull...${W}"
	echo
	sleep 2
	echo "${R}[${C}-${R}]${C}${BOLD} Now Restart Termux ${G}(Must)${W}"
	echo
	echo "${R}[${C}-${R}]${C}${BOLD} See Uses Section in github to know how to use it${W}"
	echo
	echo "${R}[${C}-${R}]${C} URL:- ${B}https://github.com/sabamdarif/termux-desktop/blob/main/README.md#uses${W}"
	echo
	if [[ "$distro_add_answer" == "y" ]]; then
	echo "${R}[${C}-${R}]${C}${BOLD} See how to use Linux distro container${W}"
	echo
	echo "${R}[${C}-${R}]${C} URL:- ${B}https://github.com/sabamdarif/termux-desktop/blob/main/proot-caontainer.md${W}"
	fi
}

#########################################################################
#
# Remove
#
#########################################################################

function remove_termux_desktop() {
	if [[ ! -e "$config_file" ]]; then
	echo "${R}[${C}-${R}]${C}${BOLD} Please Install Termux Desktop First${W}"
	exit 0
	else
	banner
	echo "${R}[${C}-${R}]${R}${BOLD} Remove Termux Desktop${W}"
	echo ""
	confirmation_y_or_n "Are You Sure You Want To Remove Termux Desktop Completely" ask_remove
	if [[ "$ask_remove" == "n" ]]; then
	echo "${R}[${C}-${R}]${G}${BOLD} Canceling...${W}"
	exit 0
	else
	echo "${R}[${C}-${R}]${R}${BOLD} Removeing Termux Desktop${W}"
	sleep 3
	read_conf
	#remove basic packages
	package_check_and_remove "pulseaudio x11-repo tur-repo"
	#remove desktop related packages
	if [[ "$de_name" == "xfce" ]]; then
	package_check_and_remove "xfce4 xfce4-goodies xwayland kvantum"
	elif [[ "$de_name" == "lxqt" ]]; then
	package_check_and_remove "lxqt xorg-xsetroot papirus-icon-theme xwayland kvantum"
	elif [[ "$de_name" == "openbox" ]]; then
	package_check_and_remove "openbox polybar xorg-xsetroot lxappearance wmctrl feh xwayland kvantum thunar firefox mpd rofi bmon xcompmgr xfce4-settings gedit"
	fi
	#remove zsh
	if [[ "$zsh_answer" == "y" ]]; then
	package_check_and_remove "zsh"
	check_and_delete ".oh-my-zsh .zsh_history .zshrc"
	fi
	#remove terminal utility
	if [[ "$terminal_utility_setup_answer" == "y" ]]; then
	check_and_delete "$PREFIX/etc/motd.sh $HOME/.termux $HOME/.fonts/font.ttf $HOME/.termux/colors.properties"
	check_and_restore "$PREFIX/etc/motd"
	check_and_restore "$PREFIX/etc/motd-playstore"
	check_and_restore "$PREFIX/etc/motd.sh"
	check_and_restore "$HOME/.termux/colors.properties"
	if grep -q "motd.sh$" "$PREFIX/etc/termux-login.sh"; then
	sed -i "s|.*motd\.sh$|# |" "$PREFIX/etc/termux-login.sh"
	fi
	package_check_and_remove "nerdfix fontconfig-utils bat eza"
	fi
	#remove browser
	if [[ "$installed_browser" == "firefox" ]]; then
	package_check_and_remove "firefox"
	elif [[ "$installed_browser" == "chromium" ]]; then
	package_check_and_remove "chromium"
	elif [[ "$installed_browser" == "both" ]]; then
	package_check_and_remove "firefox chromium"
	fi
	#remove ide
	if [[ "$installed_ide" == "code" ]]; then
	package_check_and_remove "code-oss code-is-code-oss"
	elif [[ "$installed_ide" == "geany" ]]; then
	package_check_and_remove "geany"
	elif [[ "$installed_ide" == "both" ]]; then
	package_check_and_remove "code-oss code-is-code-oss geany"
	fi
	#remove media player
	if [[ "$installed_media_player" == "vlc" ]]; then
	package_check_and_remove "vlc-qt-static"
	elif [[ "$installed_media_player" == "audacious" ]]; then
	package_check_and_remove "audacious"
	elif [[ "$installed_media_player" == "both" ]]; then
	package_check_and_remove "vlc-qt-static audacious"
	fi
	#remove photo editor
	if [[ "$installed_photo_editor" == "gimp" ]]; then
	package_check_and_remove "gimp"
	elif [[ "$installed_photo_editor" == "audacious" ]]; then
	package_check_and_remove "audacious"
	elif [[ "$installed_photo_editor" == "both" ]]; then
	package_check_and_remove "gimp audacious"
	fi
	#remove synaptic
	if [[ "$install_synaptic" == "y" ]]; then
	package_check_and_remove "synaptic"
	fi
	#remove wine
	if [[ "$setup_wine" == "default-wine" ]]; then
	package_check_and_remove "wine winetricks"
	elif [[ "$setup_wine" == "mobox" ]]; then
	echo "${R}[${C}-${R}]${C}${BOLD} Make Sure To Uninstall Mobox Using Their Instruction${W}"
	check_and_delete "$HOME/Desktop/MoboxExplorer.desktop"
	sleep 4
	elif [[ "$setup_wine" == "hangover-wine" ]]; then
	package_check_and_remove "hangover-wine winetricks"
	fi
	check_and_delete "$PREFIX/bin/wine $PREFIX/share/applications/wine-*"
	#remove styles
	if [[ "$style_name" == "Modern Style" ]] || [[ "$style_name" == "MacOS Inspired-1 Style" ]] || [[ "$style_name" == "MacOS Inspired-2 Style" ]]; then
	package_check_and_remove "cairo-dock-core"
	elif [[ "$style_name" == "Modern Style" ]] || [[ "$style_name" == "MacOS Inspired-2 Style" ]]; then
	package_check_and_remove "rofi"
	elif [[ "$style_name" == "Modern Style" ]]; then
	package_check_and_remove "fluent-icon-theme vala-panel-appmenu"
	elif [[ "$style_name" == "Windows10 Style" ]]; then
	package_check_and_remove "gtk2-engines-murrine"
	fi
	#Remove folders and other files
	check_and_delete "$PREFIX/share/backgrounds $themes_folder $icons_folder $PREFIX/etc/termux-desktop"
	check_and_delete "$HOME/.config/$the_config_dir"
	check_and_delete "$HOME/Desktop $HOME/Downloads $HOME/Videos $HOME/Pictures $HOME/Music"
	#remove hw packages
	package_check_and_remove "mesa-zink virglrenderer-mesa-zink vulkan-loader-android angle-android virglrenderer-android mesa-vulkan-icd-freedreno mesa-vulkan-icd-wrapper mesa-zink"
	#remove distro container
	if [[ "$distro_add_answer" == "y" ]]; then
	proot-distro remove "$selected_distro"
	proot-distro clear-cache
	package_check_and_remove "proot-distro"
	check_and_delete "$PREFIX/bin/$selected_distro $PREFIX/bin/pdrun"
	fi
	#remove vnc and termux x11
	check_and_delete "$PREFIX/bin/gui"
	if [[ "$gui_mode" == "termux_x11" ]]; then
	package_check_and_remove "termux-x11-nightly xorg-xhost"
	check_and_delete "$PREFIX/bin/tx11start $PREFIX/bin/tx11stop"
	elif [[ "$gui_mode" == "vnc" ]]; then
	package_check_and_remove "tigervnc xorg-xhost"
	check_and_delete "$HOME/.vnc/xstartup $PREFIX/bin/vncstart $PREFIX/bin/vncstop $PREFIX/bin/gui $PREFIX/bin/tx11start $PREFIX/bin/tx11stop"
	elif [[ "$gui_mode" == "both" ]]; then
	package_check_and_remove "termux-x11-nightly tigervnc xorg-xhost"
	check_and_delete "$PREFIX/bin/tx11start $PREFIX/bin/tx11stop $HOME/.vnc/xstartup $PREFIX/bin/vncstart $PREFIX/bin/vncstop $PREFIX/bin/gui $PREFIX/bin/tx11start $PREFIX/bin/tx11stop"
	fi
	check_and_delete "$PREFIX/etc/termux-desktop $PREFIX/bin/setup-termux-desktop"
	clear
	echo "${R}[${C}-${R}]${G}${BOLD} Everything remove successfully${W}"
	fi
	fi
}

#########################################################################
#
# Change Style
#
#########################################################################

function gui_check_up() {
termux_x11_pid=$(pgrep -f /system/bin/app_process.*com.termux.x11.Loader)
vnc_server_pid=$(pgrep -f "vncserver")
de_pid=$(pgrep -f "$de_startup")
if [[ -n "$termux_x11_pid" ]] || [[ -n "$de_pid" ]] || [[ -n "$vnc_server_pid" ]]>/dev/null 2>&1; then
echo "${G}Please Stop The Gui Desktop Server First${W}"
exit 0
fi
}

function change_style() {
	if [[ ! -e "$config_file" ]]; then
	echo -e "${C} It look like you haven't install the desktop yet\n Please install the desktop first${W}"
	exit 0
	else
	read_conf
	gui_check_up
	banner
	echo "${R}[${C}-${R}]${G} Your currently installed style is ${C}${BOLD}$style_name ${W}"
	echo
	sleep 2
	questions_theme_select
	rm -rf ~/.cache/sessions/x*
	setup_config
	banner
	echo "${R}[${C}-${R}]${G} Style changed successfully${W}"
	echo
	read_conf
	echo "${R}[${C}-${R}]${G} Your currently installed style is ${C}${BOLD}$style_name ${W}"
	fi
}

#########################################################################
#
# Change Hardware Acceleration
#
#########################################################################

function change_hw() {
	# Check if the configuration file exists
	if [[ ! -e "$config_file" ]]; then
	    echo -e "${C} It looks like you haven't installed the desktop yet\n Please install the desktop first${W}"
	    exit 0
	else
	    read_conf
	    banner
	    echo "${R}[${C}-${R}]${G} Your current hardware acceleration method for Termux is: ${C}${BOLD}${termux_hw_answer}${W}"
	    echo
	    echo "${R}[${C}-${R}]${G} Changing drivers might break the desktop environment sometimes${W}"
	    confirmation_y_or_n "Do you want to continue" confirmation_break_de
	    if [[ "$confirmation_break_de" == "y" ]]; then
	        package_check_and_remove "mesa-zink vulkan-loader-android virglrenderer-android angle-android mesa-vulkan-icd-freedreno-dri3"
	    else
	        exit 0
	    fi
	    echo "${R}[${C}-${R}]${R}${BOLD} This process might break your desktop environment${W}"
	    echo "${R}[${C}-${R}]${G}${BOLD} Make your new choice${W}"
	    echo
	    hw_questions
	    hw_config
	    if [[ "$gui_mode" == "termux_x11" ]]; then
	        setup_tx11start_cmd
	    elif [[ "$gui_mode" == "vnc" ]]; then
	        setup_vncstart_cmd
	    elif [[ "$gui_mode" == "both" ]]; then
	        setup_tx11start_cmd
	        setup_vncstart_cmd
	    fi
	    if [[ "$distro_add_answer" == "y" ]]; then
	        sed -i "s|selected_pd_hw_method=\"[^\"]*\"|selected_pd_hw_method=\"$pd_hw_method\"|" "$PREFIX/bin/pdrun"
	    fi
	    clear
	    print_success "${BOLD}Hardware acceleration method changed successfully"
	fi
}

#########################################################################
#
# Change Distro
#
#########################################################################

function change_distro() {
	if [[ ! -e "$config_file" ]]; then
	echo -e "${C} It look like you haven't install the desktop yet\n Please install the desktop first${W}"
	exit 0
	else
	read_conf
	banner
	if [[ "$distro_add_answer" == "y" ]]; then
		call_from_change_pd="y"
	    if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/$selected_distro" ]] ;then
		echo "${R}[${C}-${R}]${G} Your currently installed distro is :${C}${BOLD}${selected_distro}${W}"
		echo
		echo "${R}[${C}-${R}]${R} Changing distro will delete all the data from your previous distro${W}"
		echo
		confirmation_y_or_n "Do you want to continue" distro_change_confirmation
		    if [[ "$distro_change_confirmation" == "y" ]]; then
			choose_distro
			echo "${R}[${C}-${R}]${G} Removing $selected_distro and it's data${W}"
			pd remove $selected_distro
			check_and_delete "$PREFIX/share/applications/pd_added"
			check_and_delete "$PREFIX/bin/$selected_distro"
			pd_hw_method=$(grep 'selected_pd_hw_method=' "$PREFIX/bin/pdrun" | sed -e 's/.*selected_pd_hw_method="\([^"]*\)".*/\1/')
			if [[ "$pd_audio_config_answer" == "y" ]]; then
			rm "$HOME/.${selected_distro}-sound-access"
			fi
			echo
			distro_container_setup "$1" "$2"
			else
			echo "${R}[${C}-${R}]${C} Canceling distro change process...${W}"
			sleep 2
			exit 0
			fi
	     fi
	else
		echo "${R}[${C}-${R}]${G} It look like you haven't install any distro yet${W}"
		echo
		echo "${R}[${C}-${R}]${G}${BOLD} Do you want to add a Linux distro container (proot distro)${W}"
		echo
		echo "${R}[${C}-${R}]${G} It will help you to install those app which are not avilable in termux${W}"
		echo
		echo "${R}[${C}-${R}]${G} You can launch those installed apps from termux like other apps${W}"
		echo
		confirmation_y_or_n "Do you want to continue" distro_add_answer
		echo "distro_add_answer=\"$distro_add_answer\"" >> "$config_file"
			distro_questions
			distro_hw_questions
			distro_container_setup "$1" "$2"
	fi
	fi
}

#########################################################################
#
# Change Autostart
#
#########################################################################

function change_autostart() {
    read_conf

    if [[ $SHELL = *zsh ]]; then
        current_shell="zsh"
        shell_rc_file="$HOME/.zshrc"
    elif [[ $SHELL = *bash ]]; then
        current_shell="bash"
        shell_rc_file="/data/data/com.termux/files/usr/etc/bash.bashrc"
    fi

    if [[ "$zsh_answer" == "y" && "$current_shell" == "bash" ]] || [[ "$zsh_answer" == "n" && "$current_shell" == "zsh" ]]; then
        print_failed "It looks like you have changed your shell after the installation"
        exit 0
    fi

    if [[ "$de_on_startup" == "y" ]]; then
        if grep -q "^vncstart" "$shell_rc_file"; then
            sed -i '/# Start Vnc/,/fi/d' "$shell_rc_file"
			echo "de_on_startup=\"n\"" >> "$config_file"
		fi
        if grep -q "^tx11start" "$shell_rc_file"; then
            sed -i '/# Start Termux:X11/,/fi/d' "$shell_rc_file"
			echo "de_on_startup=\"n\"" >> "$config_file"
        fi
	elif [[ "$de_on_startup" == "n" ]]; then
	    if [[ "$de_on_startup" == "y" && "$gui_mode" == "both" ]]; then
		echo "${R}[${C}-${R}]${G} You chose both vnc and termux:x11 to access gui mode${W}"
		echo
		echo "${R}[${C}-${R}]${G} Which will be your default${W}"
		echo
		echo "${Y}1. Termux:x11${W}"
		echo
		echo "${Y}2. Vnc${W}"
		echo
		select_an_option 2 1 autostart_gui_mode_num
			if [[ "$autostart_gui_mode_num" == "1" ]]; then
				autostart_gui_mode="termux_x11"
			elif [[ "$autostart_gui_mode_num" == "2" ]]; then
				autostart_gui_mode="vnc"
			fi
		fi
		add_to_autostart
    fi
}

#########################################################################
#
# Change Display Port
#
#########################################################################

# change the Display Port/Display Number where it will show the output
function change_display() {
	read_conf
	gui_check_up
	if [[ "$gui_mode" == "termux_x11" ]] || [[ "$gui_mode" == "both" ]]; then
		echo "${R}[${C}-${R}]${G}${BOLD} Your Current Display Port: ${display_number}${W}"
		echo
		confirmation_y_or_n "Do you want to change the display port" change_display_port
		if [[ "$change_display_port" == "y" ]]; then
			while true; do
        	read -r -p "${R}[${C}-${R}]${Y}${BOLD} Type the Display Port number: ${W}" display_number
				if [[ "$display_number" =~ ^[0-9]+$ ]]; then
					break
				else
					echo "${R}[${C}-${R}]${R} Please enter a valid number between 0-9 ${W}"
				fi
    		done
			setup_tx11start_cmd
			echo "display_number=\"$display_number\"" >> "$config_file"
			sed -i "s|DISPLAY=:[0-9]*|DISPLAY=:$display_number|" "${PREFIX}/bin/pdrun"
			sed -i "s|DISPLAY=:[0-9]*|DISPLAY=:$display_number|" "${PREFIX}/bin/$selected_distro"
			print_log "Type the Display Port number: $display_number"
		fi
	else
	echo "${R}[${C}-${R}]${G} Changing display port only supported in Termux:x11${W}"
	fi
}


#########################################################################
#
# Reinstall themes
#
#########################################################################

function reinstall_themes() {
	read_conf
	gui_check_up
	tmp_themes_folder="$PREFIX/tmp/themes"
	check_and_create_directory "$tmp_themes_folder"
	echo "${R}[${C}-${R}]${G} Reinstalling Themes...${W}"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/theme.tar.gz" "$tmp_themes_folder"
	local theme_names
	theme_names=$(ls "$tmp_themes_folder")
	local theme_name
	for theme_name in $theme_names; do
	check_and_delete "$themes_folder/$theme_name"
	mv "$tmp_themes_folder/$theme_name" "$themes_folder/"
	done
	echo "${R}[${C}-${R}]${G}${BOLD} Themes reinstall successfully${W}"
}

#########################################################################
#
# Reinstall icons
#
#########################################################################

function reinstall_icons() {
	read_conf
	gui_check_up
	tmp_icons_folder="$PREFIX/tmp/icons"
	check_and_create_directory "$tmp_icons_folder"
	package_install_and_check "gdk-pixbuf"
	if [[ "$style_answer" == "2" ]]; then
	package_install_and_check "fluent-icon-theme"
	else
	echo "${R}[${C}-${R}]${G} Reinstalling Icons...${W}"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/icon.tar.gz" "$tmp_icons_folder"
	local icon_themes_names
	icon_themes_names=$(ls "$tmp_icons_folder")
	local icon_theme
	for icon_theme in $icon_themes_names; do
	check_and_delete "$icons_folder/$icon_theme"
	mv "$tmp_icons_folder/$icon_theme" "$icons_folder/"
	echo "${R}[${C}-${R}]${G} Creating icon cache...${W}"
	if [[ "$de_name" == "xfce" ]]; then
	gtk-update-icon-cache -f -t "$icons_folder/$icons_theme"
	fi
	gtk-update-icon-cache -f -t "$PREFIX/share/icons/$icons_theme"
	done
	echo "${R}[${C}-${R}]${G}${BOLD} Icons reinstall successfully${W}"
	fi
}

#########################################################################
#
# Reinstall config
#
#########################################################################

function reinstall_config() {
	read_conf
	gui_check_up
	tmp_config_folder="$PREFIX/tmp/config"
	check_and_create_directory "$tmp_config_folder"
	echo "${R}[${C}-${R}]${G} Reinstalling Config...${W}"
	download_and_extract "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-files/${de_name}/look_${style_answer}/config.tar.gz" "$tmp_config_folder"
	local config_file_names
	config_file_names=$(ls "$tmp_config_folder")
	local config_file
	for config_file in $config_file_names; do
	check_and_delete "$HOME/.config/$config_file"
	mv "$tmp_config_folder/$config_file" "$HOME/.config/"
	done
	echo "${R}[${C}-${R}]${G}${BOLD} Config reinstall successfully${W}"
}

#########################################################################
#
# Some Fixes | Basic Task
#
#########################################################################

function disable_vblank_mode() {
	if [[ "$de_name" == "xfce" ]]; then
		sed -i 's|<property name="vblank_mode" type="string" value="auto"/>|<property name="vblank_mode" type="string" value="off"/>|' "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml"
	fi
}

function some_fixes() {

	# samsung oneui-6 audio fixes
	local device_brand_name
	device_brand_name=$(getprop ro.product.brand | cut -d ' ' -f 1)
	if [[ $device_brand_name == samsung* && $android_version -ge 14 ]]; then
    grep -q "LD_PRELOAD=/system/lib64/libskcodec.so" "$shell_rc_file" || echo "LD_PRELOAD=/system/lib64/libskcodec.so" >> "$shell_rc_file"
	fi

	# tx11start and vncstart
	if [[ $termux_hw_answer == "freedreno" ]] || [[ $termux_hw_answer == "zink_with_mesa" ]] || [[ $termux_hw_answer == "zink_with_mesa_zink" ]]; then
	sed -i 's/^[[:space:]]*&[[:space:]]*$/ /' "$PREFIX/bin/tx11start"
	sed -i 's/^[[:space:]]*&[[:space:]]*$/ /' "$PREFIX/bin/vncstart"
	disable_vblank_mode
	fi

	if [[ "$confirmation_mesa_vulkan_icd_wrapper" == "y" ]]; then
		disable_vblank_mode
		if [[ "$device_gpu_model" == "1" ]]; then
		sed -i 's/^[[:space:]]*initialize_server="\s*"/ /' "$PREFIX/bin/pdrun"
		fi

		if [[ "$browser_answer" == "2" ]] || [[ "$browser_answer" == "3" ]]; then
		sed -i 's|Exec=/data/data/com.termux/files/usr/bin/chromium-browser %U|Exec=/data/data/com.termux/files/usr/bin/chromium-browser --enable-features=Vulkan %U|' /data/data/com.termux/files/usr/share/applications/chromium.desktop
		fi

		if [[ "$ide_answer" == "2" ]] || [[ "$ide_answer" == "3" ]]; then
		sed -i 's|/data/data/com.termux/files/usr/bin/code-oss|/data/data/com.termux/files/usr/bin/code-oss --enable-features=Vulkan|g' /data/data/com.termux/files/usr/share/applications/code-oss*
		fi
	fi
}

# add the basic details into a config file
function print_basic_details() {
	local net_condition
	local country
	net_condition="$(getprop gsm.network.type)"
	country="$(getprop gsm.sim.operator.iso-country)"
cat <<EOF > "$config_file"
####################################
########## Termux Desktop ##########
####################################

########################
#  -:Device Details:-  #
########################
#
# Termux Version: ${TERMUX_VERSION}-${TERMUX_APK_RELEASE}
# Device Model: $model
# Android Version: $android_version
# Free Space: $free_space
# Total Ram: $total_ram
# Architecture: $app_arch
# System CPU Architecture: $supported_arch
# Processor: $PROCESSOR_BRAND_NAME $PROCESSOR_NAME
# GPU: $detected_gpu
# Network Condition: $net_condition (On first run)
# Country: $country
#
########################

##### Please don't modify this file otherwise some functions won't work #####

EOF
}

function add_installer() {
	if [[ ! -e "$PREFIX/bin/setup-termux-desktop" ]]; then
		echo "${R}[${C}-${R}]${G} Adding setup-termux-desktop installer to bin${W}"
    	download_file "$PREFIX/bin/setup-termux-desktop" "https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-termux-desktop"
    	chmod +x "$PREFIX/bin/setup-termux-desktop"
	fi
}

# check for the changes in the installer file
function check_for_update_and_update_installer() {
    if [[ -e "$PREFIX/bin/setup-termux-desktop" ]]; then
        echo "${R}[${C}-${R}]${G} Checking for update...${W}"
        echo

        check_and_create_directory "$termux_desktop_path"
        local current_script_hash
		current_script_hash=$(curl -sL https://raw.githubusercontent.com/sabamdarif/termux-desktop/main/setup-termux-desktop | sha256sum | cut -d ' ' -f 1)
        local local_script_hash
		local_script_hash=$(basename "$(sha256sum "$PREFIX/bin/setup-termux-desktop" | cut -d ' ' -f 1)")

        if [[ "$local_script_hash" != "$current_script_hash" ]]; then
            confirmation_y_or_n "You are using an old installer. Do you want to update it to the latest version" update_installer

            if [[ "$update_installer" == "y" ]]; then
				check_and_create_directory "$PREFIX/etc/termux-desktop"
                mv "$PREFIX/bin/setup-termux-desktop" "$PREFIX/etc/termux-desktop/"
                check_and_backup "$PREFIX/etc/termux-desktop/setup-termux-desktop"
                add_installer
                add_common_function
				unset local_script_hash
                local new_local_script_hash
				new_local_script_hash=$(basename "$(sha256sum "$PREFIX/bin/setup-termux-desktop" | cut -d ' ' -f 1)")
                if [[ "$new_local_script_hash" == "$current_script_hash" ]]; then
                    echo "${R}[${C}-${R}]${G} Installer updated successfully${W}"
                    check_and_delete "$termux_desktop_path/skip_update_checkup"
                    exit 0
                else
                    echo "${R}[${C}-${R}]${G} Failed to update the installer${W}"
                    exit 0
                fi
            elif [[ "$update_installer" == "n" ]]; then
            	echo "${R}[${C}-${R}]${G} Keeping the old installer${W}"
            	check_and_create_directory "$termux_desktop_path"
            	touch "$termux_desktop_path/skip_update_checkup"
            	exit 0
            fi
        else
            echo -e "${R}[${C}-${R}]${G}${BOLD} Good job, you are using the latest installer${W}"
        fi
    fi
}

function check_installer_status() {
    if [[ -e "$PREFIX/bin/setup-termux-desktop" ]]; then
        if [[ ! -e "$termux_desktop_path/skip_update_checkup" ]]; then
            check_for_update_and_update_installer
        else
            echo "${R}[${C}-${R}]${G}${BOLD} Update check skipped${W}"
            echo "${R}[${C}-${R}]${G}${BOLD} Use ${C}--update ${G}to force update check${W}"
        fi
    fi
}

#########################################################################
#
# Reset Changes
#
#########################################################################

function reset_changes() {
    if [[ ! -e "$config_file" ]]; then
        echo -e "${C} It looks like you haven't installed the desktop yet.\n Please install the desktop first.${W}"
        exit 0
    else
        read_conf
        banner
        echo "${R}[${C}-${R}]${G} Removing $de_name Config...${W}"
        set_config_dir
		check_and_delete "${config_dirs}"
		shell_name=$(basename "$SHELL")
        get_shellrc_path
		if [[ "$distro_add_answer" == "y" ]]; then
            confirmation_y_or_n "Do you want to reset the Linux distro container as well?" conf_distro_reset
            if [[ "$conf_distro_reset" == "y" ]]; then
                check_and_restore "$save_path/.${pd_shell_name}rc"
            fi
        fi

        if [[ "$terminal_utility_setup_answer" == "y" ]]; then
            check_and_delete "$PREFIX/etc/motd.sh $HOME/.termux $HOME/.fonts/font.ttf $HOME/.termux/colors.properties" ; termux-reload-settings
            check_and_restore "$PREFIX/etc/motd" ; termux-reload-settings
            check_and_restore "$PREFIX/etc/motd-playstore"
            check_and_restore "$PREFIX/etc/motd.sh" ; termux-reload-settings
            check_and_restore "$HOME/.termux/colors.properties"
            if grep -q "motd.sh$" "$PREFIX/etc/termux-login.sh"; then
                sed -i "s|.*motd\.sh$|# |" "$PREFIX/etc/termux-login.sh" ; termux-reload-settings
            fi
            rm "$PREFIX/share/applications/wine-*.desktop" >/dev/null 2>&1
            check_and_delete "$termux_desktop_path"
            check_and_delete "$PREFIX/bin/tx11start $PREFIX/bin/tx11stop $PREFIX/bin/vncstop $PREFIX/bin/vncstart $PREFIX/bin/gui $PREFIX/bin/pdrun"
        fi

        check_and_delete "$HOME/Music"
        check_and_delete "$HOME/Downloads"
        check_and_delete "$HOME/Desktop"
        check_and_delete "$HOME/Pictures"
        check_and_delete "$HOME/Videos"

        if [[ "$shell_name" == "zsh" ]]; then
            chsh -s bash
            rm -rf "$HOME/.oh-my-zsh"
        fi

        check_and_delete "$shell_rc_file"
        check_and_restore "$shell_rc_file"
		check_and_backup "$config_file"
        touch "$config_file"
        print_basic_details

        echo -e "${R}[${C}-${R}]${G}${BOLD} Reset successful.\n Now restart Termux.${W}"
    fi
}

#########################################################################
#
# Call Functions
#
#########################################################################
check_termux
if [[ -z "$1" ]] || [[ "$1" == "--install" ]] || [[ "$1" == "-i" ]]; then
check_installer_status "$1"
fi
current_path=$(pwd)
function install_termux_desktop() {
print_recomended_msg
cleanup_cache
detact_package_manager
update_sys
sleep 2
termux-wake-lock
sleep 2
check_and_create_directory "$PREFIX/etc/termux-desktop"
touch "$config_file"
print_basic_details
add_common_function
install_required_packages
questions
if [[ "$distro_add_answer" == "y" ]]; then
distro_questions
fi
banner
hw_questions
setup_folder
setup_zsh
setup_fonts
install_desktop
browser_installer
ide_installer
media_player_installer
photo_editor_installer
setup_synaptic
setup_wine
if [[ "$style_answer" == "0" ]]; then
banner
echo "${R}[${C}-${R}]${G}${BOLD} Configuring Stock $de_name Style...${W}"
echo
echo "style_name=\"Stock\"" >> "$config_file"
else
setup_config
fi
banner
call_from_change_pd="n"
distro_container_setup
gui_launcher
check_desktop_process
install_extra_apps
terminal_utility_setup
if [[ "$de_name" != "mate" ]]; then
install_fm_tools
fi
add_to_autostart
some_fixes
preprocess_conf
cleanup_cache
termux-wake-unlock
add_installer
notes
print_log "$(cat $config_file)"
delete_installer_file
}

function show_help() {
echo -e "
--debug           to create a log file
-i,--install      to start installation
-r,--remove       to remove termux desktop
-c,--change       to change some previous configuration
-ri,--reinstall   to reinstall some previously install stuff
--reset           to reset all changes made by this script without uninstalling any package
-h,--help         to show help
"
}

function show_change_help() {
echo "options you can use with --change"
echo -e "
style      to change installed style
pd,distro  to change installed linux distro container
hw,hwa     to change hardware acceleration method
autostart  to change autostart behaviour
display    to change termux:x11 display port
h,help     to show help

example uses : --change style
"
}

function show_reinstall_help() {
echo -e "
options you can use with --reinstall

icons      to reinstall icons pack
themes     to reinstall themes pack
config     to reinstall config
h,help     to show help

example uses : --reinstall icons
example uses : --reinstall icons,themes...etc to reinstall them at once
"
}

if [[ $1 == "--debug" ]]; then
    debug
    shift
fi

case $1 in
    --remove|-r)
        remove_termux_desktop
        ;;
    --install|-i)
        install_termux_desktop
        ;;
    --change|-c)
        case $2 in
            style)
                change_style
                ;;
			distro|pd)
                change_distro "$1" "$2"
                ;;
			hw|hwa)
                change_hw
                ;;
			autostart)
                change_autostart
                ;;
			display)
                change_display
                ;;
			h|help|-h|--help)
			    show_change_help
                ;;
            *)
                print_failed "${BOLD} Invalid option: ${C}$2"
				echo "${R}[${C}-${R}]${G} Use --change help to show help${W}"
                ;;
        esac
        ;;
		--reinstall|-ri)
        IFS=',' read -ra OPTIONS <<< "$2"
        for option in "${OPTIONS[@]}"; do
            case $option in
                icons)
                    reinstall_icons
                    ;;
                themes)
                    reinstall_themes
                    ;;
                config)
                    reinstall_config
                    ;;
                h|help|-h|--help)
				    show_reinstall_help
                    exit
                    ;;
                *)
                    print_failed "${BOLD} Invalid option: ${C}$option"
					echo "${R}[${C}-${R}]${G} Use --reinstall help to show help${W}"
                    ;;
            esac
        done
        ;;
	--update)
	check_for_update_and_update_installer "$1"
	;;
    --help|-h)
        show_help
        ;;
	--reset)
	    reset_changes
		;;
    *)
        install_termux_desktop
        ;;
esac
else
   sleep 10
 notcon
  fi
}
banner



read -p "${BOLD}${Y}Press Enter to continue...${W}"

termux-open https://youtube.com/@anonymousacademy404

echo -e "${BOLD}${Y}Select an option (default: 1):${W}"
echo -e "${BOLD}${Y}1) Automatic installation${W}"
echo -e "${BOLD}${Y}2) Manual installation ${W}"
echo -e "${BOLD}${Y}3) Exit ${W}"

read -p "${BOLD}${Y}Enter your choice (1/2): ${W}" choice

if [ -z "$choice" ]; then
  choice=1
fi

if [ $choice -eq 1 ]; then
  auto_install 
elif [ $choice -eq 2 ]; then
download_and_install
elif [ $choice -eq 3 ]; then
echo -e "${BOLD}${G}OK  Bye !${W}"
else
  echo -e "${BOLD}${R}Invalid choice!${W}"
fi
