/* */

// select all elements
const t = document.getElementById("true");
const f = document.getElementById("false");
const fb_t = document.getElementById("fb-true");
const fb_f = document.getElementById("fb-false");

//set event listener for radio buttons
$(".radio").click(checkAnswer);

function checkAnswer(){
    if( t.checked ){
        //fb_f.innerHTML = ""
        fb_t.innerHTML = "&#10008; Incorrect. Give some feedback."
        fb_t.style = "font-size: 12pt; color:red"
    }else if( f.checked ){
        fb_t.innerHTML = "&#10004; Correct! Give some feedback."
        //fb_t.innerHTML = ""
        fb_f.style = "font-size: 12pt; color:green"
    }
}
