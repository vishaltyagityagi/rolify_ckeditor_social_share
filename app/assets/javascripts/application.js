// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require social-share-button
//= require ckeditor/init
//= require login


$(document).ajaxStart(function() {
  $(".ajax-loading").show();
});

$(document).ajaxStop(function() {
	addClassActive();
  $(".ajax-loading").hide();
});

$(function(){
	addClassActive();
});

function addClassActive() {
	if (window.location.href.indexOf("?facility") == -1) {
		$("li").removeClass("activeIcon");
		var page_url = window.location.href.substr(window.location.href.lastIndexOf("/")+1);
		if(page_url == "") {
			$("li").removeClass("activeIcon");
			$('a[href="/"]').parents("li").addClass("activeIcon");
		}
		if (window.location.href.indexOf("dashboard") != -1) {
			$("li").removeClass("activeIcon");
	    $("li.i1").addClass("activeIcon");
		}
		if (window.location.href.indexOf("projects/new") != -1) {
			$("li").removeClass("activeIcon");
	    $("li.i2").addClass("activeIcon");
		}
		if (window.location.href.indexOf("projects") != -1) {
			$("li").removeClass("activeIcon");
	    $("li.i2").addClass("activeIcon");
		}
		if (window.location.href.indexOf("tunnel_projects") != -1) {
			$("li").removeClass("activeIcon");
	    $("li.i3").addClass("activeIcon");
		}
		if (window.location.href.indexOf("/users/edit") != -1) {
			$("li").removeClass("activeIcon");
	    $("li.i4").addClass("activeIcon");
		}
		if (window.location.href.indexOf("/credits") != -1) {
			$("li").removeClass("activeIcon");
	    $("li.i4").addClass("activeIcon");
		}
	}
	if (window.location.href.indexOf("Building") != -1) {
    $("li").removeClass("activeIcon");
    $("li.i2").addClass("activeIcon");
	}
	if (window.location.href.indexOf("Tunnel") != -1) {
		$("li").removeClass("activeIcon");
    $("li.i3").addClass("activeIcon");
	}
	if (window.location.href.indexOf("pricing") != -1) {
		$("li").removeClass("activeIcon");
    $("li.i4").addClass("activeIcon");
	}
}
