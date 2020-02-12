<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $test= db_get_field("SELECT status FROM ?:orders WHERE order_id = ?i",$_REQUEST['id']);
    if ($mode == 'update_status') {
        $user_data = array(
            'order_id' => $_REQUEST['id'],
            'old_status' => $test,
            'new_status' => $_REQUEST['status'],
            'user_id' => $auth['user_id'],
            'timestamp'=>time()
        );
        db_query('INSERT INTO ?:status_history ?e', $user_data);
        }
    }