/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// use to set hide and show question // can't = 1 because use loop - 1 => null
var loop = 2;
// function to check show or hide question
function showquestion(maxList) {
    
    if (loop <= maxList) {
        document.getElementById("test" + loop).classList.remove("hideQuestion");
        //  show number question
        document.getElementById("question_now").innerHTML = loop;

        document.getElementById("test" + (loop - 1)).classList.add("hideQuestion");
        loop++;
    } else {
        document.getElementById("test" + (loop - 1)).classList.add("hideQuestion");
        //when number max => set number = 1
        document.getElementById("question_now").innerHTML = "1";
        document.getElementById("test1").classList.remove("hideQuestion");
        loop = 2;
    }
}
var minutesLabel;
var secondsLabel;
var totalSeconds;
var check;
// function to preapare for count time
function startQuiz() {

    minutesLabel = document.getElementById("minutes");
    secondsLabel = document.getElementById("seconds");

    secondTimeLose = document.getElementById("secondTimeLose");
    timeQuestion = document.getElementById("timeQuestion");
    
    totalSeconds = document.getElementById("number_ques").textContent * timeQuestion.value - secondTimeLose.value;

    // set total when start first if don't use  10 -> 9s no show 10s
    secondsLabel.innerHTML = pad(totalSeconds % 60);
    minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
    // first start show question 1
    document.getElementById("test1").classList.remove("hideQuestion");
    
    check = setInterval(setTime, 1000);
}
// check if return 1 = >> return 01
function pad(val) {
    var valString = val + "";
    if (valString.length < 2) {
        return "0" + valString;
    } else {
        return valString;
    }
}
// count time and autosubmit
function setTime() {
    --totalSeconds;
    if (totalSeconds == 0) {
        clearInterval(check);
        // must use click because submitResult must different null => point calculation
        // if we just use submit not run to function point calculation (submitResult == null)
        document.getElementById("submitform").submitResult.click();
        //document.getElementById("submitform").submit();
    }
    secondsLabel.innerHTML = pad(totalSeconds % 60);
    minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
    console.log(totalSeconds);

}
