<h1>Edit Post</h1>
<?php
echo $this->Form->create('Category');
echo $this->Form->input('name');
echo $this->Form->input('id', array('type' => 'hidden'));
echo $this->Form->end('Save Post');
?>