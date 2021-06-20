(function () {
  var HOME_PAGE = "Home"
    , _404 = "NotFound";
  var shared = localStorage.getItem("shared")
    ? JSON.parse(localStorage.getItem("shared"))
    : { user: { name: "Aaa" }, lastPageName: HOME_PAGE };
  var currentPage = "";

  
  function processHash(url) {
    if (url.hash == "") {
      init(HOME_PAGE);
    } else if (Elm[url.hash.substring(1)]) {
      init(url.hash.substring(1));
    } else {
      init(_404);
    }
  }

  processHash(new URL(window.location.href));

  var app;
  function init(pageName) {
    app = Elm[pageName].init({ 
      node: document.body,
      flags: shared 
    });
    
    // Shared ports
    // Developer note: 
    // You should always check the shared ports using 
    // if (app.ports.your_port_name) {
    //   app.ports.your_port_name.subscribe(function (a) {
    //   });
    // }
    
    // For more information on ports visit: 
    // https://guide.elm-lang.org/interop/ports.html
    
    // This is used to allow the pages to share data between themselves
    app.ports.sendShared.subscribe(function (newShared) {
      shared = newShared;
      // Useful for navigating to last page when redirected to _404
      shared.lastPageName = pageName;
      localStorage.setItem("shared", JSON.stringify(shared));
    })
        
    // This is used to check the hash when navigating pages
    currentPage = pageName;
  }

  // This is the navigation handler, it's useful when changing pages
  window.addEventListener('hashchange', function (e) {
    var url = new URL(window.location.href);
    if ("#" + currentPage != url.hash) {
      // This is used to allow the pages to share data between themselves
      // I trust Elm's performance to allow this to happen without the need for setTimeout
      app.ports.requestShared.send(null);
      processHash(url);
    }
  })
})();
