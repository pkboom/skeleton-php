cd a_package && ./configure-skeleton.sh

Inside Laravel 
        "psr-4": {
            "Pkboom\\:PackageName\\": "a_package/src/",
            "App\\": "app/"
        }

        Pkboom\:PackageName\:PackageNameServiceProvider::class,

cd .. && composer dump-autoload

set up package service provider

move files

fix namespaces if necessary

run tests from laravel application, not from package

delete namespace from laravel-application composer.json
"Pkboom\\{package_namespace}\\": "a_package/src/",

delete a_package

composer-link ../packages/{package}

composer require pkboom/{package}


permanently deleted
when deleting a_package, it will only delete link
when deleting files, it will actually files in the package folder