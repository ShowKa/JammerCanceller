document.addEventListener("DOMContentLoaded", function(event) {
    if (window.top === window) {
        safari.self.addEventListener("message", handleMessage);
        safari.extension.dispatchMessage("execute?");
    }
});

function handleMessage(event) {
    var message = event.name;
    switch (message) {
        case "DoIt":
            doIt();
            break;
        default:
            break;
    }
}

function doIt() {
	// doit
}
