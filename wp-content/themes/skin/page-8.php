<?php
/**
 * The template for displaying pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages and that
 * other "pages" on your WordPress site will use a different template.
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>

<main id="main" role="main" class="main page content-page-<?php echo get_the_ID(); ?>">
  <div class="columns columns-25-50-25">
    <div class="column column-25">
      <div class="columnContent"><img src="<?php bloginfo('template_directory'); ?>/img/vase-sample.png" width="300" height="352" alt=""/></div>
    </div><!--
    --><div class="column column-50">
      <div class="columnContent">
        <?php
        // Start the loop.
        while ( have_posts() ) : the_post();

          // Include the page content template.
          get_template_part( 'content', 'page' );


        // End the loop.
        endwhile;
        ?>
      </div>
    </div><!--
    --><div class="column column-25">
      <div class="columnContent"><img src="<?php bloginfo('template_directory'); ?>/img/vase-sample.png" width="300" height="352" alt=""/></div>
    </div>
  </div>
</main>

<?php get_footer(); ?>
