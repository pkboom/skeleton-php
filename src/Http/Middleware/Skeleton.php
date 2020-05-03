<?php

namespace Pkboom\:PackageName\Http\Middleware;

use Closure;

class RecordRoutes
{
    public function handle($request, Closure $next)
    {
        return $next($request);
    }

}
