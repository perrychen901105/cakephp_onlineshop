<?php
    class UserInfosController extends AppController {
		public $helpers = array("Html", 'Form', 'Session');
		public $components = array('Session');

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
		
		public function getProductDetail() {
			$product_id = $this->request['url']['productId'];
			$queryStr = 'SELECT * from onlineshop.products as Product where Product.id = ' .$product_id . ';';
			$res = $this -> Product -> query($queryStr);
			;
			
			$this->returnJson(0,"success", $res[0]);
		}
		
		public function login() {
			$userPhone = $_POST['phone'];
			$pwd = $_POST['password'];
			
			$queryUser = 'SELECT * from onlineshop.user_infos as User where User.phone_number =' .$userPhone .' and password = ' .$pwd;
			$res = $this->UserInfo->query($queryUser);
			if ($res != null) {
				$this->returnJson(0, "success", $res[0]);
			} else {
				echo "login again";
			}
			
			die;
		}
		
		public function register() {			
			// $queryStr = "INSERT INTO user_infos (phone_number, password) VALUES ('13711111211', '111111');";
			$whatever = array("phone_number" => $_POST['phone'],
			"password" => $_POST['password'],
			"user_name" => $_POST['username']);
			// $result = $this->UserInfo->query($queryStr);
			$result = $this->UserInfo->save($whatever);
			$newID = $this->UserInfo->getLastInsertId();
			$queryStr = 'SELECT * from onlineshop.user_infos as User where User.id = ' .$newID . ';';
			$userModel = $this->UserInfo->query($queryStr);// array("userId" => $newID,"user_name" => $_POST['username'], "phone" => $_POST['phone']);
			$returnArr = array("User" => $userModel);
			$this->returnJson(0, "success", $userModel[0]);
			die;
		}
		
		// users can access the logic there by requesting www.example.com/posts/index
		public function index() {
			// $products = $this->Product->find("all");
			// echo $products;
			$userid = $this->request['url']['phone'];
			$queryStr = 'SELECT * from onlineshop.user_infos WHERE phone_number =  ' .$userid .';';
			$this->returnJson(0, "success", $this->UserInfo->query($queryStr));
			die;
		}
		
		
		public function add() {
			$this->loadModel('Category');
			$this->loadModel('categories_product');
			$this->set('cates', $this->Category->find("list"));
			if ($this->request->is('post')) {	// check the request method
				$this->Product->create();
				$this->categories_product->create();		
				$this->Product->query("UPDATE `categories_products` SET `category_id`='4' WHERE `id`='3';");
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