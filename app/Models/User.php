<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\UserResolver;
use Illuminate\Support\Facades\Auth;


class User extends Authenticatable implements Auditable, UserResolver
{
    use Notifiable;
    use HasRoles;
    use \OwenIt\Auditing\Auditable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','api_token','image','is_super_admin','is_online','las_login','manager_id','team_leader_id',
        'is_manager','is_team_leader'
    ];

    protected $appends = [
        'image'
    ];


    public function getImageAttribute(){
        if (!empty($this->attributes['image'])) {
            if (file_exists(public_path().$this->attributes['image'])) {
                return $this->attributes['image'];
            }
        }
        return '/dashboard/images/profile_default.png';
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function notifications()
    {
        return $this->belongsToMany(Notification::class, 'notification_users');
    }

    public function leads()
    {
      return  Lead::join('responsables', 'leads.id', '=', 'responsables.model_id')->where('responsables.model_type', '=','App\Models\Lead')->where("responsables.employee_id",$this->id)->get();
     //   return $this->hasMany(Lead::class, 'employee_id');
     //return $this->belongsToMany('App\Models\Lead')->using('App\Models\Responsable');
       // return $this->morphedByMany(Lead::class,'responsables','model_id');
    }

    public function operations()
    {
        return $this->hasMany(LeadOperation::class, 'user_id');
    }


    public static function resolve()
    {
        return Auth::check() ? Auth::user() : null;
    }


    public function responsables(){
        return  Responsable::where('model_type', '=','App\Models\User')->where("model_id",$this->id)->pluck("employee_id")->toArray();

     }

    public function scopeSearch($query)
    {

        if (request()->has('search_query') && !empty(request()->search_query)) {
            $query = $query->where('name', 'like', '%' . request()->search_query . '%')
                ->orWhere('email', 'like', '%' . request()->search_query . '%');

        }

        return $query;
    }
}
