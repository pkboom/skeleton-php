cd a_package && ./configure-skeleton.sh

Inside Laravel 
        "psr-4": {
            "Pkboom\\:PackageName": "a_packages/src",
            "App\\": "app/"
        }

        Pkboom\:PackageName\:PackageNameServiceProvider::class,

cd .. && composer dump-autoload


Outside Laravel 
mv packages ..

composer-link ../packages/pkboom/{package}

composer require pkboom/{package}

