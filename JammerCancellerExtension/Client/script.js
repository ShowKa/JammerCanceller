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
    initMessage(message);
    createOverlay();
}

function createOverlay() {
    // message
    var message = getMessage();
    // <p class="jc-message">Are you sure?</p>
    var eMessage = new E("<p>");
    eMessage.addClass("jc-message");
    eMessage.text(message);
    // input
    var eInput = new E("<input>");
    eInput.attr("type", "text");
    eInput.addClass("jc-input");
    eInput.attr("placeholder", "type a same message if you don't work.");
    eInput.on("input", messageInputHandler);
    // button
    var eButton = new E("<button>");
    eButton.text("DO");
    eButton.id("jc-button");
    eButton.hide();
    eButton.on("click", removeOverlay);
    // <div class="jc-content">
    var eContent = new E("<div>");
    eContent.addClass("jc-content");
    eContent.append(eMessage);
    eContent.append(eInput);
    eContent.append(eButton);
    // <div id="jc-overlay">
    var eOverlay = new Overlay("<div>");
    eOverlay.id("jc-overlay");
    eOverlay.append(eContent);
    // append
    var body = new E("body");
    body.append(eOverlay);
    // visible
    eOverlay.toggleVisibility();
}

function removeOverlay() {
    var eOverlay = new Overlay("#jc-overlay");
    eOverlay.remove();
}

function showButton() {
    var eButton = new E("#jc-button");
    eButton.show();
}

function hideButton() {
    var eButton = new E("#jc-button");
    eButton.hide();
}

var _message;
function getMessage() {
    return _message;
}

function initMessage(message) {
    _message = message;
}

function validateInputMessage(eInput) {
    var val = eInput.val();
    var message = getMessage();
    return val === message;
}

function messageInputHandler(event) {
    var eThis = new E(this);
    if (validateInputMessage(eThis)) {
        showButton();
    } else {
        hideButton();
    }
}
