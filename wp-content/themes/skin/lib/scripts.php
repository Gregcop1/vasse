<?php

/**
   * Proper way to enqueue scripts and styles
   */
  function inouit_ors_scripts() {
    wp_deregister_script('jquery'); 
    wp_register_script('jquery', get_template_directory_uri() . '/js/components/jquery.min.js', false, '1.6.2'); 
    wp_enqueue_script('jquery');
    wp_register_script('jquery-ui', get_template_directory_uri() . '/js/components/jquery-ui.min.js', array()); 
    wp_enqueue_script( 'skin-base', get_template_directory_uri() . '/js/base.js', array(), '1.0.0', true );
    wp_enqueue_script( 'skin-main', get_template_directory_uri() . '/js/main.js', array('skin-base'), '1.0.0', true );

    if(is_home()) {
      wp_enqueue_script( 'underscore', get_template_directory_uri() . '/js/components/underscore-min.js', array(''), '', true );
      wp_enqueue_script( 'sliceManager', get_template_directory_uri() . '/js/components/sliceManager/slice-manager.js', array('jquery', 'underscore'), '1.0.0', true );
      wp_enqueue_script( 'hammer', get_template_directory_uri() . '/js/components/hammer.min.js', array(), '', true );
      wp_enqueue_script( 'jquery-hammer', get_template_directory_uri() . '/js/components/jquery.hammer.js', array('hammer'), '', true );
    }

  }

  
  /**
   * detect local configuration to handle browserSync or not
   * @return void
   */
  function get_local_footer() {
    if(preg_match('/local\.com/', $_SERVER['HTTP_HOST'])) {
      echo '<script type="text/javascript" id="__bs_script__"> document.write("<script async src=\'//HOST:3000/browser-sync/browser-sync-client.1.9.0.js\'><\/script>".replace(/HOST/g, location.hostname).replace(/PORT/g, location.port)); </script> ';
    }
  }

  add_action( 'wp_enqueue_scripts', 'inouit_ors_scripts' );