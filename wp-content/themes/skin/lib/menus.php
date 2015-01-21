<?php
  function registers_menus() {
    register_nav_menu('mainMenu', 'Menu principal');
  }
  add_action('init', 'registers_menus');

  function special_nav_class($classes, $item){
    print_r($item);die;
    $classes[] = "special-class";
    return $classes;
  }
  add_filter('nav_menu_css_class' , 'special_nav_class');