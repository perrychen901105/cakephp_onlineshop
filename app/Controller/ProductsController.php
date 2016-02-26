<?php
class ProductsController extends AppController {
		public $helpers = array("Html", 'Form', 'Session');
		public $components = array('Session');

		
		function returnJson($index = 0,$message = null,$data = array()){
			if(!empty($data)){
				$result = array('success' => $index,'message' => $message,'data'=>array($data));
			}else{
				$result = array('success' => $index,'message' => $message,'data'=>$data);
			}
        
       		if(!empty($_REQUEST['callback'])){
            	echo $_REQUEST['callback'].'('.json_encode($result).')';
       	 	}else{
        		echo json_encode($result);
        	}
			die;
    	}
		
		private function saveCategory() {
			$cate = new stdClass;
			$cate->name = $this->request['url']['name'];
			$mes = $this->Category->save($cate);
			$this->returnJson(0,$mes,"");
		}
		
		private function getAllCategory() {
			$categories = $this->Category->find("all");
			$this->returnJson(0,"success",$categories);
			die;
		}
		
		// users can access the logic there by requesting www.example.com/posts/index
		public function index() {
			$this->set('products', $this->Product->find("all"));
			
		}
		
		public function add() {
			$this->loadModel('Category');
			$this->loadModel('cat_pro');
			$this->set('cates', $this->Category->find("list"));
			if ($this->request->is('post')) {	// check the request method
				$this->Product->create();
				$this->cat_pro->create();		
				echo($this->request->data);	
				die;
				if ($this->Product->save($this->request->data)) {
					$this->Session->setFlash(__('Your post has been saved.'));
					return $this->redirect(array('action' => 'index'));
				}
				$this->Session->setFlash(__('Unable to add your post.'));
			}
		}
		
		public function view($id = null) {
			if (!$id) {
				throw new NotFoundException(__('Invalid post'));
			}
			
			$post = $this->Product->findById($id);
			if (!$post) {
				throw new NotFoundException(__('Invalid post'));
			}
			$this->set('post', $post);
			$this->returnJson(0,"success",$post);
		}
		
	}
?>