<?php

namespace Pkboom\:PackageName;

use Illuminate\Support\ServiceProvider;

class :PackageNameServiceProvider extends ServiceProvider
{
    /**
     * Register the application services.
     */
    public function register()
    {
        app()->singleton(':package_name', function () {
            return new :PackageName();
        });

        // $this->mergeConfigFrom(__DIR__.'/../config/config.php', ':package_name');
    }
    
    /**
     * Bootstrap the application services.
     */
    public function boot()
    {
        // if ($this->app->runningInConsole()) {
        //     $this->commands([
        //         FooCommand::class,
        //     ]);
        // }
        // $this->loadViewsFrom(__DIR__.'/path/to/views', 'courier');
        // $this->loadRoutesFrom(__DIR__.'/web.php');
        // $this->publishes([
            // __DIR__.'/../config/:package_name.php' => config_path(':package_name.php'),
        // Blade::directive('some', function () {
        //     return '<style>'. $this->app->make('some')->styles() .'</style>';
        // });
        // ]);
    }
}
