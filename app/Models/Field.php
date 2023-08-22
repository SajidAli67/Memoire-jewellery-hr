<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Employee;
use App\Models\Attendance;

class Field extends Model
{
    protected $fillable = [
		'employee_id','a_id','location', 'clock_in', 'clock_out', 'date', 'clock_in_out','img'
	];

	public function employee(){
		return $this->belongsTo(Employee::class,'employee_id' ,'id');

	}

	public function attendances(){
		return $this->belongsTo(Attendance::class, 'a_id', 'id');
	}
}
