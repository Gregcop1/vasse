<?php
/**
 * The template for displaying the header
 *
 * Displays all of the head element and everything up until the "site-content" div.
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content=" width=device-width, initial-scale=1">
	
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	
	<script type="text/javascript" src="<?php bloginfo('stylesheet_directory'); ?>/js/components/modernizr.js"></script>

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
