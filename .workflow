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

move to laravel application root, not package
cd ..

composer-link ../packages/{package}

composer require pkboom/{package}

test

from package
wip
git remote add origin git@github.com:pkboom/{{your-package}}
git push -u origin master -f

create README.md

delete a_package

when deleting a_package, it will only delete link
when deleting files, it will actually files in the package folder

