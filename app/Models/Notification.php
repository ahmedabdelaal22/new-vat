<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Notification extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $table='notifications';
    protected $fillable = [
        'basic_title', 'basic_body', 'model_type', 'model_id', 'action'
    ];

    protected $appends = [
        'title','body','seen','is_my_model','date','link'
    ];

    public function model(){

        return $this->morphTo();

    }
    public function scopeSearch($query){

        return $query;
    }

    public static function createNotification($notificatioData,$users = array(),$modelOwner= null){
        if (empty($notificatioData)) {
            return false;
        }
        $notification = self::create($notificatioData);
        $usersIDS = [] ;
        if ($notification) {
            foreach ($users  as $user) {
                array_push($usersIDS,$user['user_id']);
                if (!NotificationUser::where('notification_id',$notification->id)->where('user_id',$user['user_id'])->first()) {
                    NotificationUser::updateOrCreate([
                        'notification_id' => $notification->id,
                        'user_id' => $user['user_id'],
                        'seen'=>0,

                    ]);
                }

            }
        }


           // Artisan::call('run_now_notfy:notify');



        return true;
    }


    public function getSeenAttribute(){

        $user = '';

        $webUser = Auth()->user();

        if ($webUser) {
            $user = $webUser;
        }

        if ($user && $user != '') {
            $notificationUser = NotificationUser::where('user_id',$user->id)
            ->where('notification_id',$this->id)
            ->where('seen',1)
            ->first();

            if ($notificationUser) {
                return 1;
            }
        }

        return 0;
    }

    public function getLinkAttribute(){

            $link = (!empty($this->notificationData()))  ? @$this->notificationData()['link'] : url('notfications').'/'.$this->id;


        return $link;

    }
    public function getTitleAttribute(){

        $title = '';
        $title = (!empty($this->notificationData()))  ? $this->notificationData()['title'] : '' ;


    return $title;

}
    public function getBodyAttribute(){

        return (!empty($this->notificationData()))  ? $this->notificationData()['body'] : '' ;

    }

    private function notificationData(){

        $data = [];

        switch ($this->model_type) {
            case 'App\Models\Lead':
                $data = $this->leadModelActions($this->action);
                break;
            case 'App\Models\UserRequest':
                $data = $this->requestModelActions($this->action);
                break;
            case 'App\Models\Poll':
                $data = $this->pollModelActions($this->action);
                break;
            default:
                $data = $this->messageModelActions();
                break;
        }

        return $data;
    }

    private function messageModelActions(){
        $data = [
            'title'=>(!empty($this->basic_title) && $this->basic_title != null ) ? $this->basic_title : '' ,
            'body'=>(!empty($this->basic_body) && $this->basic_body != null ) ? $this->basic_body : ''
        ];
        return $data;
    }
    private function leadModelActions($action){

        $title = '';
        $body = '';
        $link = '';
        switch ($action) {

            case 'new_Lead':
                $title .= '';
                $body .= trans('main.a_new_procedure_has_been_added_entitled').optional($this->model)->details;
                $link = url('leads').'/'.$this->model_id;
                break;
            case 'new_Lead_operation':
                $title .= '';
                $body  .= trans('main.a_new_process_has_been_added').optional($this->model)->title;
                $link = url('leads').'/'.$this->model_id;
                break;
            case 'updated_Lead':
                $title .= '';
                $body  .=  trans('main.the_procedure_has_been_modified').optional($this->model)->title;
                $link = url('leads').'/'.$this->model_id;
                break;
            case 'updated_Lead_operation':
                $title .= '';
                $body .= trans('main.the_process_has_been_modified_within_the_procedure').optional($this->model)->title;
                $link = url('leads').'/'.$this->model_id;
                break;
            case 'new_lead_comment':
                $title .= '';
                $body .= trans('main.a_new_comment_has_been_added_to_the_procedure').optional($this->model)->title;
                $link = url('leads').'/'.$this->model_id;
                break;
            case 'updated_lead_comment':
                $title .= '';
                $body .= trans('main.the_comment_has_been_modified_to_follow_the_procedure').optional($this->model)->title;
                $link = url('leads').'/'.$this->model_id;
                break;

            default:
                $title .= '';
                $body .= ' المهمة '.optional($this->model)->title;
                break;
        }

       return array('title' =>$title , 'body'=>$body , 'link'=>$link );

    }




}
