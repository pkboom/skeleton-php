#!/bin/bash

# ; => run the command no matter what the exit status of the previous command is
git_name=`git config user.name`;
git_email=`git config user.email`;

read -p "Author name ($git_name): " author_name
author_name=${author_name:-$git_name} # $git_name => default

read -p "Author email ($git_email): " author_email
author_email=${author_email:-$git_email}

# replace all => blanks to ''
# blank => [:blank:]
username_guess=${author_name//[[:blank:]]/}
read -p "Author username ($username_guess): " author_username
author_username=${author_username:-$username_guess}

current_directory=`pwd -P`
current_directory=`basename $current_directory`
read -p "Package name ($current_directory): " package_name
package_name=${package_name:-$current_directory}

read -p "Package description: " package_description

read -p "Package namespace ($package_name): " package_namespace
package_namespace=${package_namespace:-$package_name}

echo
echo -e "Author: $author_name ($author_username, $author_email)"
echo -e "Package: $package_name <$package_description>"

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
# sed no backup, replace more than once, {} filenames from find
find . -type f -exec sed -i '' -e "s/:author_name/$author_name/" {} \;
find . -type f -exec sed -i '' -e "s/:author_username/$author_username/" {} \;
find . -type f -exec sed -i '' -e "s/:author_email/$author_email/" {} \;
find . -type f -exec sed -i '' -e "s/:package_name/$package_name/" {} \;
find . -type f -exec sed -i '' -e "s/:PackageName/$package_namespace/g" {} \;
find . -type f -exec sed -i '' -e "s/:package_description/$package_description/" {} \;

find ./a_package -type f -exec sed -i '' -e "s/Skeleton/$package_namespace/" {} \;

sed -i '' -e "/^\*\*Note:\*\* Replace/d" README.md

echo "Replaced all values and reset git directory, self destructing in 3... 2... 1..."

# -- => end of command options
rm -- "$0"

mv src/SkeletonServiceProvider.php src/"${package_namespace}ServiceProvider.php"
mv src/SkeletonClass.php src/"${package_namespace}Class.php"
mv src/SkeletonFacade.php src/"${package_namespace}Facade.php"