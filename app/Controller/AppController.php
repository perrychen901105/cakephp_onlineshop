<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
App::import('Vendor', 'FormHelper');
App::import('Vendor', 'SessionComponent');
App::import('Vendor', 'SessionHelper');
App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
	function connectTheDB() {
		
	}
	
	function returnJson($index = 0,$message = null,$data = array()){
			// if(!empty($data)){
				// $result = array('success' => $index,'message' => $message,'data'=>array($data));
			// }else{
				// $result = array('success' => $index,'message' => $message,'data'=>$data);
			// }
        $result = array('success' => $index,'message' => $message,'data'=>$data);
       		if(!empty($_REQUEST['callback'])){
            	echo $_REQUEST['callback'].'('.json_encode($result).')';
       	 	}else{
        		echo json_encode($result);
        	}
			die;
    	}
}
