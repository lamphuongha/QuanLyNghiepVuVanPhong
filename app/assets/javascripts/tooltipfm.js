// Show tooltip in form
function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
        window.onload = func;
    } else {
        window.onload = function () {
            oldonload();
            func();
        }
    }
}
function Hints() {

    var inputs = document.getElementsByTagName("input");
    for (var i = 0; i < inputs.length; i++) {
        // test to see if the hint span exists first
        if (inputs[i].parentNode.getElementsByTagName("span")[0]) {
            // the span exists!  on focus, show the hint
            inputs[i].onfocus = function () {
                this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
            }
            // when the cursor moves away from the field, hide the hint
            inputs[i].onblur = function () {
                this.parentNode.getElementsByTagName("span")[0].style.display = "none";

            }
        }
    }
    var selects = document.getElementsByTagName("select");
    for (var i = 0; i < inputs.length; i++) {
        // test to see if the hint span exists first
        if (selects[i].parentNode.getElementsByTagName("span")[0]) {
            // the span exists!  on focus, show the hint
            selects[i].onfocus = function () {
                this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
            }
            // when the cursor moves away from the field, hide the hint
            selects[i].onblur = function () {
                this.parentNode.getElementsByTagName("span")[0].style.display = "none";

            }
        }
    }
}
addLoadEvent(Hints);
    	