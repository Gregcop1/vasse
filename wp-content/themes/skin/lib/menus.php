<?php
  function registers_menus() {
    register_nav_menu('mainMenu', 'Menu principal');
  }
  add_action('init', 'registers_menus');