// When the user scrolls the page, execute myFunction
window.onscroll = function() {stickyFilters()};

// Get the filters
var vf = document.getElementById("viewFilters");

// Get the offset position of the navbar
var sticky = vf ? vf.offsetTop : null;

// Get body
var b = document.getElementById("credcatalog")

// Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
function stickyFilters() {
	if (!vf) return;
  if (window.pageYOffset > sticky) {
	vf.classList.add("sticky");
	b.classList.add("filters-top");
  } else {
	vf.classList.remove("sticky");
	b.classList.add("filters-top");
  }
}

(function() {
  $(document).ready(function() {

		// Tooltips for spectra
		tippy('button.theory', {
			animation: 'shift-away',
			theme: 'theory-border',
		});

		tippy('button.practice', {
			animation: 'shift-away',
			theme: 'practice-border',
		});

		tippy('button.content', {
			animation: 'shift-away',
			theme: 'content-border',
		});

		tippy('button.infrastructure', {
			animation: 'shift-away',
			theme: 'infrastructure-border',
		});

		$('a.image-link').magnificPopup({
			type:'image',
			closeOnContentClick: true,
			image: {

		  markup: '<div class="mfp-figure">'+
		            '<div class="mfp-close"></div>'+
		            '<div class="mfp-img"></div>'+
		            '<div class="mfp-bottom-bar">'+
		              '<div class="mfp-title"></div>'+
		              '<div class="mfp-counter"></div>'+
		            '</div>'+
		          '</div>', // Popup HTML markup. `.mfp-img` div will be replaced with img tag, `.mfp-close` by close button

		  cursor: 'mfp-zoom-out-cur', // Class that adds zoom cursor, will be added to body. Set to null to disable zoom out cursor.

		  titleSrc: 'alt', // Attribute of the target element that contains caption for the slide.
		  // Or the function that should return the title. For example:
		  // titleSrc: function(item) {
		  //   return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
		  // }

		  verticalFit: true, // Fits image in area vertically

		  tError: '<a href="%url%">The image</a> could not be loaded.' // Error message
		}

		});

  });
})();