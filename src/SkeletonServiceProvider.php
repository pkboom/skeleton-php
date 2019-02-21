<?php

namespace Pkboom\:PackageName;

use Illuminate\Support\ServiceProvider;

class :PackageNameServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     */
    public function boot()
    {
        if ($this->app->runningInConsole()) {
            /*
            $this->publishes([
                __DIR__.'/../config/:package_name.php' => config_path(':package_name.php'),
            ], 'config');

            $this->loadViewsFrom(__DIR__.'/../resources/views', ':package_name');

            $this->publishes([
                __DIR__.'/../resources/views' => resource_path('views/vendor/:package_name'),
            ], 'views');

            $this->loadViewsFrom(__DIR__.'/path/to/views', 'courier');

            */
        }
    }

    /**
     * Register the application services.
     */
    public function register()
    {
        // $this->mergeConfigFrom(__DIR__.'/../config/config.php', ':package_name');
    }
}
