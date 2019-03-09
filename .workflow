cd a_package && ./configure-skeleton.sh

Inside Laravel 
        "psr-4": {
            "Pkboom\\:PackageName\\": "a_package/src/",
            "App\\": "app/"
        }

        Pkboom\:PackageName\:PackageNameServiceProvider::class,

composer install
cp phpunit.xml.dist phpunit.xml
cd .. && composer dump-autoload

set up package service provider

move files

fix namespaces if necessary

run tests from laravel application, not from package

delete namespace from laravel-application composer.json
"Pkboom\\{package_namespace}\\": "a_package/src/",

delete from config/app.php 
Pkboom\Calm\{{Your package}}ServiceProvider::class,

delete a_package

composer-link ../packages/{package}

composer require pkboom/{package}

when deleting a_package, it will only delete link
when deleting files, it will actually files in the package folder

git remote remove origin

from package
git remote add origin git@github.com:pkboom/{{your-package}}
wip
git push -u origin master -f

create README.md

