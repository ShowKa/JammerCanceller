document.addEventListener("DOMContentLoaded", function(event) {
    if (window.top === window) {
        safari.self.addEventListener("message", handleMessage);
        safari.extension.dispatchMessage("execute?");
    }
});

function handleMessage(event) {
    var name = event.name;
    var param = event.message;
    switch (name) {
        case "DoIt":
            doIt(param.message);
            break;
        default:
            break;
    }
}

function doIt(message) {
    // doit
    // alert(message);
}