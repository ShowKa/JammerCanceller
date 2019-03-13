var Overlay = function(id) {
    E.apply(this, arguments);
    this.addClass("jc-overlay");
};

Overlay.prototype = E.prototype;
Overlay.prototype.constructor = Overlay;

Overlay.prototype.toggleVisibility = function() {
    var el = this.e;
    el.style.visibility = (el.style.visibility == "visible") ? "hidden" :
        "visible";
};