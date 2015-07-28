//console.log('This would be the main JS file.');

$(document).ready(function () {
  $('body').scrollspy({ target: '#TableOfContent' });
  $('[data-toggle="offcanvas"]').click(function () {
	  console.log('clicked');
    $('.row-offcanvas').toggleClass('active');
  });
  $('nav a').click(function (){
    $('.row-offcanvas').removeClass('active');
  });
});