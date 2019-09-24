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