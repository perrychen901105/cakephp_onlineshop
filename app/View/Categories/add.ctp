<h1>Add Post</h1>
<?php
echo $this->Form->create('Category');
echo $this->Form->input('name');
echo $this->Form->end('Save Post');
?>