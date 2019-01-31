<?php

namespace Pkboom\:PackageName;

use Illuminate\Support\Facades\Facade;

/**
 * @see \Pkboom\:PackageName\:PackageNameClass
 */
class :PackageNameFacade extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return ':package_name';
    }
}
