<template>
  <div id="app">
  <doors v-show="showDoors" @doors-finished="nextTask"></doors>
  <words v-if="this.cardsFinished === 1 && showWords" @words-finished="nextTask"></words>
  <domino  v-if="this.cardsFinished === 2 && showDomino" @domino-finished="nextTask"></domino>
  <questions v-if="this.cardsFinished === 3 && showQuestions" @questions-finished="theEnd" ></questions>
  <img src="../src/assets/media/tillLogo.svg" class="tillLogo">
  <img src="../src/assets/media/bahad7logo.png" class="bahad7logo"> 
  <end v-if="showFinish"></end>
  </div>
</template>
 
<script>
import doors from "./components/doors"
import words from "./components/words"
import domino from "./components/domino"
import questions from "./components/questions"
import end from "./components/end"

export default {
  components: {
    doors,
    words,
    domino,
    questions,
    end  
  },
  data() {
    return {
      showDoors: true,
      cardsFinished: 0,
      showWords: false,
      showDomino: false,
      showQuestions: false,
      showFinish: false
     
    }
  },
  methods: {
    openCard(event) {
      if (event.target.id === "wordsCard") {
        this.showWords = true;
        this.showDoors = false;
      } else if (event.target.id === "dominoCard") {
        this.showDomino = true;
        this.showWords = false;
      } else if (event.target.id === "questionsCard") {
        this.showDomino = false;
        this.showQuestions = true;
      }
    },
    nextTask() {
      this.cardsFinished++;
      if (this.cardsFinished === 1) {
        this.showDoors = false;
        this.showWords = true;
      } else if (this.cardsFinished === 2) {
        this.showWords = false;
        this.showDomino = true;
      } else if (this.cardsFinished === 3) {
        this.showDomino = false;
        this.showQuestions = true;
      }
    },
    theEnd() {
      this.showQuestions = false;
      this.showFinish = true;
    }
    
  }
}
</script>

<style> 
@font-face {
  font-family: "rubik-black";
  src: url("./assets/font/Rubik-Black.ttf");
}

@font-face {
  font-family: "rubik";
  src: url("./assets/font/Rubik-Regular.ttf");
}

#app {
  background-image: url("./assets/media/background.svg");
  width: 100vw;
  height: 100vh;
  margin: 0;
  top: -0.5vh;
  left: -0.3vw;
  overflow: hidden;
  background-size: 140% 140%;
  position: absolute;
}

h1 {
  font-family: "rubik-black";
  color: white;
  font-size: 6vmax;
  position: absolute;
  text-align: center;
  top: 5vh;
  left: 18vw;
}

.cards {
  background-color: white;
  width: 38vw;
  height: 27vh;
  border-radius: 20%;
  font-family: "rubik";
  
}

.cardWords {
  text-align: center;
  font-size: 4vmax;
  top: 50vh;
  padding-top: 5vh;
  pointer-events: none;
}

#doorCard {
  position: absolute;
  left: 53vw;
  top: 20vh;
}

#wordsCard {
  position: absolute;
  left: 10vw;
  top: 20vh;
}

#dominoCard {
  position: absolute;
  left: 53vw;
  top: 50vh;
}

#questionsCard {
  position: absolute;
  left: 10vw;
  top: 50vh;
} 

.disabledCard {
  background-color: rgb(220, 220, 220);
  color: gray;
}

.littleSquers {
  width: 5vw;
  height: 3vh;
  border: 1px black solid;
  position: absolute;
  z-index: 3;
}

#littleSquer1 {
  left: 82vw;
  top: 21vh;
}

#littleSquer2 {
  left: 38vw;
  top: 21vh;
}

#littleSquer3 {
  left: 82vw;
  top: 51vh;
}

#littleSquer4 {
  left: 38vw;
  top: 51vh;
}

.doorsChecked {
  position: absolute;
  width: 7vw;
  height: 4vh;
  left: 82vw;
  top: 20vh;
  z-index: 3;
}

.wordsChecked {
  position: absolute;
  width: 7vw;
  height: 4vh;
  left: 38vw;
  top: 20vh;
  z-index: 3;
}

.dominoChecked {
  position: absolute;
  width: 7vw;
  height: 4vh;
  left: 82vw;
  top: 50vh;
  z-index: 3;
}

.tillLogo {
  position: absolute;
  width: 15vw;
  left: 5vw;
  top: 2vh;
}

.bahad7logo {
  position: absolute;
  width: 16vw;
  top: 1vh;
  left: 82vw;
}
</style>