<template>
  <div id="doors">
  <video v-show="showVideo" src="@/assets/media/video.mp4" controls></video>
    <img v-show="!showVideo && !isFirstDoor" class="door" src="../assets/media/greenDoor.svg"  id="door1" @click="doorClicked">
    <img v-show="!showVideo && !isSecondDoor" class="door" src="../assets/media/purpleDoor.svg"  id="door2" @click="doorClicked">
    <img v-show="!showVideo && !isThirdDoor" class="door" src="../assets/media/blueDoor.svg"  id="door3" @click="doorClicked">
    <div class="questionBackground" v-if="openQuestion && !showVideo"><p class="doorQuestions">{{questionArr[questionNum].question}}</p>
    <div class="optionsContainer" id="removeListeners">
    <img src="../assets/media/close.png" class="X" @click="closeQuestion">
    <div class="options" id="option1" @click="checkAnswer">{{questionArr[questionNum].option1}}</div>
    <div class="options" id="option2" @click="checkAnswer">{{questionArr[questionNum].option2}}</div>
    <div class="options" id="option3" @click="checkAnswer">{{questionArr[questionNum].option3}}</div>
    </div>
    </div>
    <div id="tryAgain">נסה שוב</div>
    <p class="underDoor1" v-if="!hideNumbers">16</p>
    <p class="underDoor2" v-if="!hideNumbers">4</p>
    <p class="underDoor3" v-if="!hideNumbers">3</p>
    <img v-if="doorsRevealed < 3" id="btn" @click="handleVideo" class="backToVideo" :src="buttonType">
    <img v-if="doorsRevealed === 3 && !hideNumbers" id="btn" @click="finish" class="backToVideo" src="../assets/media/continueBtn.svg">
  </div>
</template>
 
<script>
export default {
  name: "doors",
  components: {

  },
  data() {
    return {
      openQuestion: false,
      questionNum: 0,
      questionArr: [{question: "כמה סרטנים התאחדו כדי לעזור לסרטן היחיד?", option1: "32", option2: "16", option3: "18", correctAns: "option2", doorNum: 1}, {question: "כמה ידיים יש לנמלה?", option1: "5", option2: "3", option3: "4", correctAns: "option3", doorNum: 2}, {question: "כמה קרחונים יש בסרטון?", option1: "1", option2: "2", option3: "3", correctAns: "option3", doorNum: 3}],
      showVideo: true,
      videoButton: "סגור סרטון",
      doorsRevealed: 0,
      hideNumbers: false,
      isFirstDoor: false,
      isSecondDoor: false,
      isThirdDoor: false,
      buttonType: require('../assets/media/closeVideoBtn.svg')
    }
  },
  methods: {
    doorClicked() {
      this.openQuestion = true;
      this.questionNum = event.target.id.charAt(event.target.id.length - 1) - 1;
    },
    checkAnswer(event) {
      document.getElementById("removeListeners").style.pointerEvents = "none";
      let currAns = event.target.id;
      document.getElementById("option1").removeEventListener("click", this.checkAnswer);
      if (currAns === this.questionArr[this.questionNum].correctAns) {
        document.getElementById(currAns).classList.add("correctAnswer");
          setTimeout(() => {
        document.getElementById(`door${this.questionNum + 1}`).classList.add("doorAnimation");
         if (this.questionArr[this.questionNum].doorNum === 1) {
               setTimeout(() => {
          this.isFirstDoor = true;
        }, 3000);
        } else if (this.questionArr[this.questionNum].doorNum === 2) {
              setTimeout(() => {
          this.isSecondDoor = true;
        }, 3000);
        } else if (this.questionArr[this.questionNum].doorNum === 3) {
              setTimeout(() => {
          this.isThirdDoor = true;
        }, 3000);
        }
        this.closeQuestion();
        this.doorsRevealed++;
        if (this.doorsRevealed === 3) {
          this.videoButton = 'המשך';
        }
       }, 500);
      } else {
        document.getElementById(currAns).classList.add("wrongAnswer");
        document.getElementById("tryAgain").classList.add("tryAgainAnimation");
          setTimeout(() => {
          if(this.openQuestion) {
          document.querySelector(`#${currAns}`).classList.remove("wrongAnswer");
          document.getElementById("tryAgain").classList.remove("tryAgainAnimation");
          document.getElementById("removeListeners").style.pointerEvents = "all";
          }
        }, 4000);

      }
    },
    closeQuestion() {
      this.openQuestion = false;
    },
   handleVideo() {
     this.showVideo = !this.showVideo;
        if (this.showVideo) {
          this.buttonType = require('../assets/media/closeVideoBtn.svg');
          this.hideNumbers = true;
        } else {
          this.buttonType = require('../assets/media/backToVideoBtn.svg');
          this.hideNumbers = false;
        } 
    },
    finish() {
      this.$emit("doors-finished");
      this.hideNumbers = true;
    }  
  }
}
</script>

<style> 
@font-face {
  font-family: "rubik-black";
  src: url("/assets/font/Rubik-Black.ttf");
}

@font-face {
  font-family: "rubik";
  src: url("/assets/font/Rubik-Regular.ttf");
}

.door {
  width: 25vw;
  height: 50vh;
  z-index: 1;
}

#door1 {
  position: absolute;
  left: 68vw;
  top: 15vh;
}

#door2 {
  position: absolute;
  left: 38vw;
  top: 15vh;
}

#door3 {
  position: absolute;
  left: 6vw;
  top: 15vh;
}

.questionBackground {
  background-color: white;
  width: 80vw;
  height: 40vh;
  border-radius: 20%;
  position: absolute;
  z-index: 2;
  left: 10vw;
  top: 20vh;
}

.doorQuestions {
  font-family: "rubik";
  text-align: center;
  font-size: 3vmax;
  position: relative;
  top: 6vh;
  direction: rtl;
}

.options {
  width: 22vw;
  height: 7vh;
  background-color:  #D0E9EC;
  border-radius: 10%;
  position: relative;
  margin: 2vw;
  top: 7vh;
  left: 1vw;
  font-family: "rubik-black";
  text-align: center;
  padding-top: 3vh;
}

.optionsContainer {
  display: flex;
  height: 40vh;
}

.correctAnswer {
  background-color: lightgreen;
}

.wrongAnswer {
  background-color: red; 
}

.X {
  width: 6vw;
  height: 3.5vh;
  position: absolute;
  left: 65vw;
  bottom: 34vh;
}

@keyframes tryAgain {
  0% {top: -10vh}
  50%  {top: 3vh;}
  100%  {top: -14vh;}
}

@keyframes doorDisappear {
  100%  {opacity: 0%;}
}

#tryAgain {
  width: 70vw;
  height: 6vh;
  background-color:  rgba(255, 255, 255, 0.9);
  position: absolute;
  left: 15vw;
  font-family: "rubik";
  text-align: center;
  padding-top: 2vh;
  font-size: 4vmax;
  z-index: 4;
  top: -12vh;
}

.tryAgainAnimation {
  animation: tryAgain 5s forwards ease;
}

.doorAnimation {
  animation: doorDisappear 3s ease forwards;
}

.underDoor1 {
  font-family: "rubik-black";
  font-size: 6vmax;
  position: absolute;
  left: 74vw;
  top: 32vh;
  color: white;
}

.underDoor2 {
  font-family: "rubik-black";
  font-size: 6vmax;
  position: absolute;
  left: 47vw;
  top: 32vh;
  color: white;
}

.underDoor3 {
  font-family: "rubik-black";
  font-size: 6vmax;
  position: absolute;
  left: 16vw;
  top: 32vh;
  color: white;
}

.backToVideo {
  font-family: "rubik";
  font-size: 3vmax;
  text-align: center;
  width: 45vw;
  border-radius: 30%;
  padding: 1vh;
  position: absolute;
  top: 70vh;
  left: 25vw;
}

video {
  position: absolute;
  width: 80vw;
  height: 25vh;
  z-index: 4;
  top: 30vh;
  left: 10vw;
}

</style>