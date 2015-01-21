<!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
	
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	
	<script type="text/javascript" src="<?php bloginfo('stylesheet_directory'); ?>/js/components/modernizr.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

	<?php wp_head(); ?>
	<link rel="stylesheet" type="text/css" href="<?php bloginfo('stylesheet_directory'); ?>/css/main.css">
	<!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="<?php bloginfo('stylesheet_directory'); ?>/css/ie8.css" media="screen" /><![endif]-->
</head>

<body <?php body_class(); ?>>
	<header id="header" class="header" role="banner">
		<nav id="mainMenu" class="mainMenu">
			<?php wp_nav_menu('mainMenu'); ?>
		</nav>
	</header><!-- .site-header -->

	<div id="content" class="content">
