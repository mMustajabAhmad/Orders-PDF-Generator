function number_pages() {
    var vars = {};
    var x = document.location.search.substring(1).split('&');
    for (var i in x) {
      var z = x[i].split('=', 2);
      vars[z[0]] = unescape(z[1]);
    }
    var elements = ['frompage', 'topage', 'page', 'webpage', 'section', 'subsection', 'subsubsection'];
    for (var i in elements) {
      var y = document.getElementsByClassName(elements[i]);
      for (var j = 0; j < y.length; ++j) {
        y[j].textContent = vars[elements[i]];
      }
    }
  };
