<h1>Category posts</h1>
<?php echo $this->Html->link(
	'Add Post',
	array('controller' => 'categories', 'action' => 'add')
);
?>
<table>
	<tr>
		<th>Id</th>
		<th>Title</th>
		<th>Action</th>
		<th>Order</th>
	</tr>
	<!-- loop the posts array -->
	<?php foreach ($categories as $category): ?>
	<tr>
		<td><?php echo $category['Category']['id']; ?></td>
		<td><?php echo $this->Html->link($category['Category']['name'], array('controller' => 'categories', 'action' => 'view', $category['Category']['id'])); ?></td>
		<td>
			<?php 
				echo $this->Form->postLink(
					'Delete',
					array('action' => 'delete', $category['Category']['id']),
					array('confirm' => 'Are you sure?')
				); ?>
			<?php 
				echo $this->Html->link(
					'Edit', array('action' => 'edit', $category['Category']['id'])
				); 
			?>
		</td>
		<td><?php echo $category['Category']['order']; ?></td>
	</tr>
	<?php endforeach; ?>
	<!-- <?php unset($post); ?> -->
</table>