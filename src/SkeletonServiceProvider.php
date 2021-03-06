<?php

namespace Pkboom\:PackageName;

use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Support\ServiceProvider;

class :PackageNameServiceProvider extends ServiceProvider implements DeferrableProvider
{
    public function register()
    {
        app()->singleton(':config_name', function () {
            return new :PackageName();
        });

        $this->mergeConfigFrom(__DIR__.'/../config/:config_name.php', ':config_name');
    }
    
    public function boot()
    {
        $this->publishes([
            __DIR__.'/../config/:config_name.php' => config_path(':config_name.php'),
        ]); 

        $this->loadViewsFrom(__DIR__.'/path/to/views', 'courier');

        $this->loadRoutesFrom(__DIR__.'/../routes/web.php');

        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');
     
        if ($this->app->runningInConsole()) {
            $this->commands([
                :PackageNameCommand::class,
            ]);
        }  
    }

    public function provides()
    {
        return [':config_name'];
    }
}
