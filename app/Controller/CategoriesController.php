<?php
class CategoriesController extends AppController {
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
			$this->set('categories', $this->Category->find("all"));
		}
		
		public function add() {
			if ($this->request->is('post')) {	// check the request method
				$this->Category->create();
				if ($this->Category->save($this->request->data)) {
					$this->Session->setFlash(__('Your post has been saved.'));
					return $this->redirect(array('action' => 'index'));
				}
				$this->Session->setFlash(__('Unable to add your post.'));
			}
		}

		public function edit($id = null) {
			if (!$id) {
				throw new NotFoundException(__('Invalid post'));
			}
			$post = $this->Category->findById($id);
			if (!$post) {
				throw new NotFoundException(__('Invalid post'));
			}
			
			if ($this->request->is(array('post', 'put'))) {
				$this->Category->id = $id;
				if ($this->Category->save($this->request->data)) {
					$this->Session->setFlash(__('Your post has been updated.'));
					return $this->redirect(array('action' => 'index'));
				}
				$this->Session->setFlash(__('Unable to update your post.'));
			}
			
			if (!$this->request->data) {
				$this->request->data = $post;
			}
		}
		
		public function view($id = null) {
			if (!$id) {
				throw new NotFoundException(__('Invalid post'));
			}
			
			$categories = $this->Category->findById($id);
			if (!$categories) {
				throw new NotFoundException(__('Invalid post'));
			}
			$this->returnJson(0,"success",$categories);
			die;
		}
		
		public function delete($id) {
			if ($this->request->is('get')) {
				throw new MethodNotAllowedException();
			}
			if ($this->Category->delete($id)) {
				$this->Session->setFlash(
					__('The post with id: %s has been deleted.', h($id))
				);
				return $this->redirect(array('action' => 'index'));
			}
		}
		
	}
?>