Navbar = {
    scroll_animate: function(selector, offset, miliseconds, element){
        // scroll element till selector top + offset
        // element defaults to body
        if (typeof(element) == 'undefined'){
            element = $("html, body");
        }
        var selector_offset = $(selector).offset();
        if (typeof(selector_offset) == 'undefined'){ return false; }

        element.animate({
            scrollTop: selector_offset.top + offset
        }, miliseconds);
    },
    uncollapse: function(){
        var width = window.innerWidth;
        if (width <= 1200) {
            return;
        }

        var nav = document.getElementsByClassName("md-nav");
        for(var i = 0; i < nav.length; i++) {
            if (typeof nav.item(i).style === "undefined") {
                continue;
            }

            if (nav.item(i).getAttribute("data-md-level") && nav.item(i).getAttribute("data-md-component")) {
                nav.item(i).style.display = 'block';
                nav.item(i).style.overflow = 'visible';
            }
        }

        var nav = document.getElementsByClassName("md-nav__toggle");
        for(var i = 0; i < nav.length; i++) {
           nav.item(i).checked = true;
        }
    },
}


$(function(){
    Navbar.uncollapse();
    Navbar.scroll_animate(
        "a.md-nav__link--active",
        $(".md-sidebar__scrollwrap").offset().top * -1 - 50,
        0,
        $(".md-sidebar__scrollwrap")
    );
});
