<?php
class OrdersController extends AppController {
		public $helpers = array("Html", 'Form', 'Session');
		public $components = array('Session');
		
		public function saveOrder() {
			$price = $_GET['price'];
			$userId = $_GET['userId'];
			$curDate = strtotime('now');
			/**
			 * ,
			"order_time" => strtotime('now')
			 */
			// $order = new stdClass;
			// $order->user_id = $userId;
			// $order->order_time = $curDate;
			// $order->total_price = $price;
			// $whatever = array("user_id" => $_GET['userId'],
			// "total_price" => $_GET['price']);
			$this->loadModel("Product");
			$insertStr = "INSERT INTO `onlineshop`.`orders` (`user_id`, `total_price`, `order_time`) VALUES ('".$userId."','".$price."','".$curDate."');";
			// $mes = $this->Order->save($order);
			$mes = $this->Product->query($insertStr);
			// $returnID = $this->Order->getLastInsertId();
			$newID = $this->Product->getLastInsertId();
			
			$this->returnJson(0,$newID,$mes);
			die;
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
		
		// users can access the logic there by requesting www.example.com/posts/index
		public function index() {
			// $products = $this->Product->find("all");
			// echo $products;
			// $products = $this->query("SELECT * from onlineshop.products where products.id in (select categories_products.product_id from onlineshop.categories_products where categories_products.category_id = 1);");
			// $value = array("products" => $products);
			// echo $this->returnJson(0, "success", $value);
			$this->loadModel("Product");
			$this->Product->create();
			$insertStr = "INSERT INTO `onlineshop`.`orders` (`user_id`, `total_price`, `order_time`) VALUES ('".$userId."','".$price."','".$curDate."');";
			// $insertStr = "INSERT INTO `onlineshop`.`orders` (`user_id`, `total_price`) VALUES ('1', '35');";
			// $mes = $this->Order->save($order);
			echo $queryStr;
			$mes = $this->Product->query($insertStr);
			$newID = $this->UserInfo->getLastInsertId();
			echo "wahtaaaa ever";
			// $returnID = $this->Order->getLastInsertId();
			$this->returnJson(0,"success",$mes);
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