cd a_package && ./configure-skeleton.sh

composer install
cd .. && composer dump-autoload

if needed
cd a_package
composer require orchestra/testbench

move files

fix namespaces if necessary

set up package service provider(migrations, views)

clean up composer.json

cd ..
composer-link :package_name
composer require pkboom/:package_name

test if the new package works.

cd a_package
wip
git remote add origin git@github.com:pkboom/{{your-package}}
git push -u origin master -f

create README.md

delete a_package
delete .workflow
deleting a_package will only a link
deleting files will delete files in the package folder

