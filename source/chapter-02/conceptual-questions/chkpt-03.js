/* */

// select all elements
const cb1 = document.getElementById("cb1");
const cb2 = document.getElementById("cb2");
const cb3 = document.getElementById("cb3");
const sb = document.getElementById("submit");
const fb1 = document.getElementById("fb-cb1");
const fb2 = document.getElementById("fb-cb2");
const fb3 = document.getElementById("fb-cb3");

const ans = [true,false,true];

//set event listener for checkbox buttons
$(".button").click(checkAnswer);

function checkAnswer(){
    if( cb1.checked != ans[0] ){
        if(ans[0]){
            fb1.innerHTML = "&#10008; Un-select Incorrect. Give some feedback."
        }else{
            fb1.innerHTML = "&#10008; Select Incorrect. Give some feedback."
        }
        fb1.style = "font-size: 12pt; color:red"
    }else{
        fb1.innerHTML = "&#10004; Correct! Give some feedback."
        fb1.style = "font-size: 12pt; color:green"
    } 
    if( cb2.checked != ans[1] ){
        if(ans[1]){
            fb2.innerHTML = "&#10008; Un-select Incorrect. Give some feedback."
        }else{
            fb2.innerHTML = "&#10008; Select Incorrect. Give some feedback."
        }
        fb2.style = "font-size: 12pt; color:red"
    }else{
        fb2.innerHTML = "&#10004; Correct! Give some feedback."
        fb2.style = "font-size: 12pt; color:green"
    } 
    if( cb3.checked != ans[2]  ){
        if(ans[2]){
            fb3.innerHTML = "&#10008; Un-select Incorrect. Give some feedback."
        }else{
            fb3.innerHTML = "&#10008; Select Incorrect. Give some feedback."
        }
        fb3.style = "font-size: 12pt; color:red"
    }else{
        fb3.innerHTML = "&#10004; Correct! Give some feedback."
        fb3.style = "font-size: 12pt; color:green"
    } 
    
}
