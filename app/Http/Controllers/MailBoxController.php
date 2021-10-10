<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Webklex\IMAP\Client;


class MailBoxController extends Controller
{
    public function index(){


    	$oClient = new Client([
		    'host'          => 'mail.tanzem.qtsdemos.website',
		    'port'          => 143,
		    'encryption'    => 'null',
		    'validate_cert' => false,
		    'username'      => 'test.mail@tanzem.qtsdemos.website',
		    'password'      => 'mQ+5O[bW+G-h',
		    'protocol'      => 'imap'
		]);
		/* Alternative by using the Facade
		$oClient = Webklex\IMAP\Facades\Client::account('default');
		*/

		//Connect to the IMAP Server
		$oClient->connect();

		//Get all Mailboxes
		/** @var \Webklex\IMAP\Support\FolderCollection $aFolder */
		$aFolder = $oClient->getFolders();

		//Loop through every Mailbox
		/** @var \Webklex\IMAP\Folder $oFolder */
		foreach($aFolder as $oFolder){
            // var_dump($oFolder->getName());
		    //Get all Messages of the current Mailbox $oFolder
		    /** @var \Webklex\IMAP\Support\MessageCollection $aMessage */
		    $aMessage = $oFolder->messages()->all()->get();
		    
		    /** @var \Webklex\IMAP\Message $oMessage */
		    echo '<table>';
		    foreach($aMessage as $oMessage){
		        echo '<tr>';
		            echo '<td>';
		                foreach($oMessage->getFrom() as $person){
		                    echo $person->mail;
		                }
		                
		            echo '</td>';
		            echo '</tr>';
		        echo $oMessage->mail.'<br />';
		        
		        
		        echo $oMessage->getSubject().'<br />';
		        
		        echo $oMessage->getHTMLBody(true);
		        
		        //Move the current Message to 'INBOX.read'
		      //  if($oMessage->moveToFolder('INBOX.read') == true){
		      //      echo 'Message has been moved';
		      //  }else{
		      //      echo 'Message could not be moved';
		      //  }
		    }
		    
		    echo '</table>';
		}
		
	    return 'welcome to your mail box ';
    }

}
