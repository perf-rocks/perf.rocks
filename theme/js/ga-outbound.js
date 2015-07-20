function _gaLt(event){
    var el = event.srcElement || event.target;

    /* Loop up the DOM tree through parent elements if clicked element is not a link (eg: an image inside a link) */
    while(el && (typeof el.tagName == 'undefined' || el.tagName.toLowerCase() != 'a' || !el.href)){
      el = el.parentNode;
    }

    if(el && el.href){
      /* link */
      var link = el.href;
      if(link.indexOf(location.host) == -1 && !link.match(/^javascript\:/i)){ /* external link */
        /* HitCallback function to either open link in either same or new window */
        var hitBack = function(link, target){
          if (event.metaKey || event.ctrlKey) {
            window.open(link, '_blank');
          } else {
            target ? window.open(link, target) : window.location.href = link;
          }
        };
        /* Is target set and not _(self|parent|top)? */
        var target = (el.target && !el.target.match(/^_(self|parent|top)$/i)) ? el.target : false;
        /* send event with callback */
        ga(
            "send", "event", "Outgoing Links", link,
            document.location.pathname + document.location.search,
            {"hitCallback": hitBack(link, target)}
          );
        /* Prevent standard click */
        event.preventDefault ? event.preventDefault() : event.returnValue = !1;
      }
    }
}

/* Attach the event to all clicks in the document after page has loaded */
var w = window;
w.addEventListener ? w.addEventListener("load",function(){document.body.addEventListener("click",_gaLt,!1)},!1)
: w.attachEvent && w.attachEvent("onload",function(){document.body.attachEvent("onclick",_gaLt)});
