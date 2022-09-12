<template>
  <div id="words">
  <h1 class="headline">ששת סודות הצוות המיטבי</h1>
  <input class="input" placeholder="הכנס את הצירוף המתקבל" v-model="assayAnswer">
  <img class="submitBtn" @click="answerSubmitted" src="../assets/media/submitBtn.svg">
  <div v-if="showTryAgain" class="wordsTryAgain">נסו שוב</div>
  </div>
</template>
 
<script>

export default {
  name: "words",
  data() {
    return {
      assayAnswer: "",
      showTryAgain: false
    }
  },
  methods: {
    answerSubmitted() {
      if (this.assayAnswer === "עבודת צוות") {
        this.$emit("words-finished");
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

.whiteDiv {
  position: absolute;
  width: 85vw;
  height: 75vh;
  background-color: white;
  border-radius: 10%;
  left: 8vw;
  top: 8vh;
}

.assay {
  font-family: "rubik";
  direction: rtl;
  font-size: 2vmax;
  text-align: center;
  position: absolute;
  top: 1vh;
  width: 75vw;
  left: 5vw;
}

.input {
  width: 70vw;
  height: 5vh;
  background-color: white;
  position: absolute;
  color: black;
  text-align: center;
  font-family: "rubik";
  font-size: 3vmax;
  top: 40vh;
  left: 15vw;
}

.headline {
  font-family: "rubik-black";
  color: white;
  font-size: 4vmax;
  position: absolute;
  text-align: center;
  left: 6vw;
  top: 27vh;
  z-index: 3;
  width: 90vw;
}

.submitBtn {
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

.wordsTryAgain {
  width: 100vw;
  height: 15vh;
  position: absolute;
  background-color: rgba(255, 255, 255, 0.8);
  font-family: "rubik";
  font-size: 6vmax;
  text-align: center;
  top: 40vh;
  padding-top: 3vh;

}

</style>