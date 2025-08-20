/* */

// select all elements
const t = document.getElementById("true");
const f = document.getElementById("false");
const fb = document.getElementById("fb-radio");

//set event listener for radio buttons
$(".radio").click(checkAnswer);

function checkAnswer(){
    if( t.checked ){
        fb.innerHTML = "&#10008; Incorrect. Give some feedback."
        fb.style = "font-size: 12pt; color:red"
    }else if( f.checked ){
        fb.innerHTML = "&#10004; Correct! Give some feedback."
        fb.style = "font-size: 12pt; color:green"
    }
}
