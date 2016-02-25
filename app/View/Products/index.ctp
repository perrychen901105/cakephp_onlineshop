<h1>Product list</h1>
<?php echo $this->Html->link(
	'Add Post',
	array('controller' => 'products', 'action' => 'add')
);
?>
<table>
	<tr>
		<th>Id</th>
		<th>Title</th>
		<th>Action</th>
		<th>Category</th>
	</tr>
	<!-- loop the posts array -->
	<?php foreach ($products as $product): ?>
	<tr>
		<td><?php echo $product['Product']['id']; ?></td>
		<td><?php echo $this->Html->link($product['Product']['name'], array('controller' => 'products', 'action' => 'view', $product['Product']['id'])); ?></td>
		<td>
			<?php 
				echo $this->Form->postLink(
					'Delete',
					array('action' => 'delete', $product['Product']['id']),
					array('confirm' => 'Are you sure?')
				); ?>
			<?php 
				echo $this->Html->link(
					'Edit', array('action' => 'edit', $product['Product']['id'])
				); 
			?>
		</td>
		<td>
			<?php echo $product['Product']['description']; ?>
		</td>
	</tr>
	<?php endforeach; ?>
</table>