<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\designation;

class DocumentWorkflow extends Model
{
    use HasFactory;

    public function designation(){
		return $this->hasMany(designation::class, 'id', 'approver_2nd');
	}
}
