<template>
  <div id="domino">
  <h1 class="headlineDomino">דומינו</h1>
  <input placeholder="הכנס את הצירוף המתקבל" v-model="dominoAnswer">
  <img class="submitBtnDomino" @click="answerSubmitted" src="../assets/media/submitBtn.svg">
  <div v-if="showTryAgain" class="wordsTryAgain">נסו שוב</div>
  </div>
</template>
 
<script>

export default {
  name: "domino",
  data() {
    return {
      dominoAnswer: "",
      newString: "",
      showTryAgain: false
    }
  },
  methods: {
    answerSubmitted() {
      this.newString = this.dominoAnswer.replace(/\"/g, "").replace(/\;/g, "").replace(/\./g,"").replace(/\,/g,"");
      if (this.newString === "להתאחד זו התחלה להישאר מאוחדים זו התקדמות לעבוד יחד זו הצלחה") {
        this.$emit("domino-finished");
      } else {
        this.showTryAgain = true;
        setTimeout(() => {
          this.showTryAgain = false;
        }, 1000); 
      }
    }
}
}
</script>

<style> 
@font-face {
  font-family: "rubik-black";
  src: url("../assets/font/Rubik-Black.ttf");
}

@font-face {
  font-family: "rubik";
  src: url("../assets/font/Rubik-Regular.ttf");
}

input {
  width: 70vw;
  height: 5vh;
  background-color: white;
  position: absolute;
  color: black;
  text-align: center;
  font-family: "rubik";
  font-size: 2vmax;
  top: 40vh;
  left: 15vw;
  direction: rtl;
}

.headlineDomino {
  font-family: "rubik-black";
  color: white;
  font-size: 6vmax;
  position: absolute;
  text-align: center;
  left: 35vw;
  top: 27vh;
  z-index: 3;
}

.submitBtnDomino {
  font-family: "rubik";
  font-size: 3vmax;
  text-align: center;
  width: 45vw;
  border-radius: 30%;
  padding: 0.5vh;
  position: absolute;
  top: 55vh;
  left: 25vw;
}

@keyframes tryAgainDomino {
    0% {top: -10vh}
    50%  {top: 3vh;}
    100%  {top: -14vh;}
}

.tryAgain {
  width: 70vw;
  height: 6vh;
  background-color:  rgba(255, 255, 255, 0.582);
  position: absolute;
  left: 15vw;
  font-family: "rubik";
  text-align: center;
  padding-top: 2vh;
  font-size: 4vmax;
  z-index: 4;
  top: 20vh;
}

.tryAgainAnimation {
  animation: tryAgainDomino 5s forwards ease;
}

</style>