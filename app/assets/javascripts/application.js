// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootsy

//= require bootstrap-sprockets
//= require turbolinks


//= require_tree .



$(document).ready(function() {
    $('.has-tooltip').tooltip();
    $('.has-popover').popover({
        //trigger: 'hover'
    });
});

$('.close').click(function () {
	$('#stop-vid').hide();
	$('#stop-vid iframe').attr("src", jQuery("#stop-vid iframe").attr("src"));
});

// *** bootsy parser
$('#page_body_html').wysihtml5('deepExtend', {
  parserRules: {
    classes: {
      "responsive": 1
    },
    tags: {
      strong: {},
      em: {}
    }
  }
});
