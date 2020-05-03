<?php

namespace Pkboom\:PackageName\Models;

use Illuminate\Database\Eloquent\Model;

class RouteHistory extends Model
{
    protected $guarded = [];

    public $timestamps = false;

    protected $table = 'table_name';

    protected $casts = [
        'created_at' => 'datetime',
    ];
}
