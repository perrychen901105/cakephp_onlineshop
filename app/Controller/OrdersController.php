<?php
class OrdersController extends AppController {
		public $helpers = array("Html", 'Form', 'Session');
		public $components = array('Session');
		
		public function saveOrder() {
			$price = $_GET['price'];
			$userId = $_GET['userId'];
			$proIds = $_GET['proId'];
			$addressId = $_GET['addressId'];
			$curDate = strtotime('now');
			$this->loadModel("Product");
			$insertStr = "INSERT INTO `onlineshop`.`orders` (`user_id`, `total_price`, `order_time`, `address_id`) VALUES ('".$userId."','".$price."','".$curDate."','".$addressId."');";
			$mes = $this->Product->query($insertStr);
			$queryStr = "SELECT id FROM onlineshop.orders order by id desc limit 1;";
			$newID = $this->Product->query($queryStr);
			$ids = split("\_", $proIds);
			$strArr = array();
			foreach ($ids as &$value) {
				$str = "('".$newID[0]['orders']['id']."','".$value."')";
				array_push($strArr, $str);
			}
			$valueStr = implode(',',$strArr);
			$insertToInfoStr = "INSERT INTO `onlineshop`.`order_infos` (`order_id`, `product_id`) VALUES ".$valueStr.";";
			$suc = $this->Product->query($insertToInfoStr);
			$this->returnJson(0,"success",$suc);
			die;
		}
		
		public function getAllOrder() {
			$this->loadModel("Product");
			$queryStr = "select * from `onlineshop`.`orders`;";
			$allOrder = $this->Product->query($queryStr);
			$allArr = array();
			foreach ($allOrder as $value) {
				$oid = $value['orders']['id'];
				$queryAddress = "SELECT * FROM onlineshop.order_addresses as address where address.id = ".$oid.";";
				$add = $this->Product->query($queryAddress);
				$simpleOrder = array('Order' => $value['orders'], 'Address' => $add['address'] );
				array_push($allArr, $simpleOrder);
			}
			// $queryAddress = "SELECT * FROM onlineshop.order_addresses where id = 1;";
			// $add = $this->Product->query($queryAddress);
			// $returnValue = array('Order' => $value, 'Address' => $add);
			$this->returnJson(0,"success",$allArr);
			die;
		}
		
		public function getOrderDetail() {
			$this->loadModel("Product");
			$orderId = $_GET['orderID'];
			$queryStr = "select * from onlineshop.order_infos where order_id = ".$orderId.";";
			$arr = $this->Product->query($queryStr);
			$products = array();
			foreach ($arr as $value) {
				$productID = $value['order_infos']['product_id'];
				$getProductStr = "SELECT id,name,original_price,imgUrl FROM onlineshop.products where id = ".$productID.";";
				$product = $this->Product->query($getProductStr);
				array_push($products, $product[0]);
			}
			$this->returnJson(0,"success",$products);
			die;
		}
		
		public function addAddress() {
			$this->loadModel("Product");
			$insertStr = "INSERT INTO `onlineshop`.`order_addresses` (`user_id`, `full_address`, `phone_number`) VALUES ('93', '苏州市', '13962141961');";
			$value = $this->Product->query($insertStr);
			$this->returnJson(0, "success", $value);
		}
		
		public function getAllAddress() {
			$this->loadModel("Product");
			$queryStr = "SELECT * FROM onlineshop.order_addresses where user_id = 93;";
			$value = $this->Product->query($queryStr);
			$this->returnJson(0, "success", $value);
		}
		
		public function removeAddress() {
			$this->loadModel("Product");
			$removeStr = "DELETE FROM `onlineshop`.`order_addresses` WHERE `id`='2';";
			$value = $this->Product->query($removeStr);
			$this->returnJson(0, "success", $value);
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