// Add body class when web fonts are loaded
(function(){
	var fontA = new FontFaceObserver("Neue Machina Ultrabold");
	var fontB = new FontFaceObserver("Neue Machina Regular");
	Promise.all([fontA.load(null, 10000), fontB.load()]).then(function () {
	  console.log('Family A & B have loaded');
	  document.documentElement.className += " fonts-loaded";
	  var fontLoaded = "fonts-loaded";
	  localStorage.setItem(fontLoaded, true);
	  })
}());


// This would be the IIFE that checks loacalStorage
(function () { 
  if (!window.localStorage.length) { console.log("No font stored!"); }
  for (var i = 0; i < localStorage.length; i++) {
    if ( localStorage.getItem([i]) == true  ) {
      alert("true");
      document.documentElement.className += " fonts-loaded";
    }
  }
}());