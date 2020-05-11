#!/bin/bash

# ; => run the command no matter what the exit status of the previous command is
git_name=`git config user.name`;
git_email=`git config user.email`;

read -p "Author name ($git_name): " author_name
author_name=${author_name:-$git_name} # $git_name => default

read -p "Author email ($git_email): " author_email
author_email=${author_email:-$git_email}

# replace all blanks to ''
# blank => [:blank:]
# username_guess=${author_name//[[:blank:]]/}
# read -p "Author username (pkboom): " author_username
# author_username=${author_username:-$username_guess}

current_directory=`pwd -P`
current_directory=`basename $current_directory`

read -p "Package name ($current_directory): " package_name
package_name=${package_name:-$current_directory}

read -p "Package description: " package_description

# <<<: https://unix.stackexchange.com/questions/76402/command-line-instead-of
# make first letter uppercase
current_directory=$(tr "[:lower:]" "[:upper:]" <<< ${current_directory:0:1})${current_directory:1}

# \u: turn the next character to uppercase
# http://www.gnu.org/software/sed/manual/html_node/The-_0022s_0022-Command.html#The-_0022s_0022-Command
# -r: use regex
current_directory=$(echo $current_directory | sed -r 's/([a-z0-9])-([a-z0-9])/\1\u\2/g')

# remove Laravel from namespace
current_directory=$(echo $current_directory | sed s/Laravel// )
read -p "Package namespace ($current_directory): " package_namespace
package_namespace=${package_namespace:-$current_directory}

read -p "Package description: " package_description

echo
echo -e "Author: $author_name ($author_email)"
echo -e "Package: $package_name"

echo
echo "This script will replace the above values in all files in the project directory and reset the git repository."
read -p "Are you sure you wish to continue? (n/y) " -n 1 -r
# character num: 1, not allowing \ to act as an escape

echo
# =~ => regex comparison
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    # $0 == filename
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo

rm -rf .git
git init

echo
# find every file in and below current directory
# i: no backup file, just replace
# e: combine multiple commands
# {}: filenames from find
find . -type f -exec sed -i '' -e "s/:author_name/$author_name/" {} \;
find . -type f -exec sed -i '' -e "s/:author_email/$author_email/" {} \;
# without /g, it will only replace one time in a line.
find . -type f -exec sed -i '' -e "s/:package_name/$package_name/g" {} \;
find . -type f -exec sed -i '' -e "s/:PackageName/$package_namespace/g" {} \;
find . -type f -exec sed -i '' -e "s/:package_description/$package_description/" {} \;
# !: exclude files
find . -type f ! -name '*.sh' -exec sed -i '' -e "s/Skeleton/$package_namespace/g" {} \;

sed -i '' -e "/^\*\*Note:\*\* Replace/d" readme.md

echo "Replaced all values and reset git directory, self destructing in 3... 2... 1..."

# -- => end of command options, after --, it is usually file names.
rm -- "$0"

mv config/skeleton.php config/"${package_namespace}.php"
mv src/SkeletonServiceProvider.php src/"${package_namespace}ServiceProvider.php"
mv src/Skeleton.php src/"${package_namespace}.php"
mv src/SkeletonController.php src/"${package_namespace}Controller.php"
mv src/Facade/Skeleton.php src/Facade/"${package_namespace}.php"
mv src/Middleware/Skeleton.php src/Middleware/"${package_namespace}.php"
mv src/Commands/Skeleton.php src/Commands/"${package_namespace}Command.php"