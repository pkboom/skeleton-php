Inside Laravel Test
        "psr-4": {
            "Pkboom\\{Package}": "packages/pkboom/{package}/src/",
            "App\\": "app/"
        }

        Pkboom\{Package}\{Package}ServiceProvider::class,

composer dump-autoload


Outside Laravel Test
mv pkboom ..

composer-link ../pkboom/{package}

composer require pkboom/{package}

