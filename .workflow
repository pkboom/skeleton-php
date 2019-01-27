Inside Laravel Test
        "psr-4": {
            "Pkboom\\:Package_Name": "packages/pkboom/:package_name/src/",
            "App\\": "app/"
        }

        Pkboom\:Package_Name\:Package_NameServiceProvider::class,
 
cd a_package && ./configure-skeleton.sh

cd .. && composer dump-autoload


Outside Laravel Test
mv packages ..

composer-link ../packages/pkboom/{package}

composer require pkboom/{package}

