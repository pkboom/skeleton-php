<?php

namespace Tests;

use Orchestra\Testbench\TestCase as Orchestra;
use Pkboom\:PackageName\:PackageNameServiceProvider;

abstract class TestCase extends Orchestra
{
    public function setUp(): void
    {
        parent::setUp();
    }

    protected function getPackageProviders($app)
    {
        return [
            :PackageNameServiceProvider::class,
        ];
    }
}
