<?php
use Tygh\Registry;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

}
$params = $_REQUEST;
if ($mode == 'manage') {

    $orders = fn_second_addon_get(Registry::get('settings.Appearance.admin_elements_per_page'));
    $search = $orders;
    Tygh::$app['view']->assign('orders', $orders);
    Tygh::$app['view']->assign('search', $search);
}