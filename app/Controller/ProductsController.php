<?php
class ProductsController extends AppController {
		public $helpers = array("Html", 'Form', 'Session');
		public $components = array('Session');

		
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
		
		// users can access the logic there by requesting www.example.com/posts/index
		public function index() {
			// $products = $this->Product->find("all");
			// echo $products;
			$cate_id = $this->request['url']['categoryId'];
			$products['Products'] = $this -> Product -> query('SELECT id,name from onlineshop.products as Product where Product.id in (select categories_products.product_id from onlineshop.categories_products where categories_products.category_id = '.$cate_id.' );');

			$this->returnJson(0,"success",$products);
			
			die;
			
			if (!$link = mysql_connect('127.0.0.1:3306', 'root', 'root')) {
   				echo 'Could not connect to mysql';
    			exit;
			}

			if (!mysql_select_db('onlineshop', $link)) {
    			echo 'Could not select database';
    			exit;
			}

			mysql_query("SET NAMES UTF8"); 
			$cate_id = $this->request['url']['categoryId'];
			
			$sql    = 'SELECT * from onlineshop.products where products.id in (select categories_products.product_id from categories_products where categories_products.category_id = '.$cate_id.' );';
			$result = mysql_query($sql, $link);

			if (!$result) {
   				 echo "DB Error, could not query the database\n";
    			echo 'MySQL Error: ' . mysql_error();
  	  			exit;
			}
			$products = array();
			while ($row = mysql_fetch_assoc($result)) {
				$item = array('id' => $row['id'],
				'name' => $row['name'] );
				$Product = array('Product' => $item);
    			$products[] = $Product;
			}

			mysql_free_result($result);
			$value = array("products" => $products);
			echo $this->returnJson(0, "success", $value);
			
			// $products = $this->query("SELECT * from onlineshop.products where products.id in (select categories_products.product_id from onlineshop.categories_products where categories_products.category_id = 1);");
			// $value = array("products" => $products);
			// echo $this->returnJson(0, "success", $value);
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