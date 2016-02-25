<h1>Add Post</h1>
<?php
echo $this->Form->create('Product');
echo $this->Form->input('title');
echo $this->form->input('类别',array('type'=>'select','options'=>$cates));
echo $this->Form->end('Save Product');
?>