<template>
  <div id="end">
    <h1 class="finishSentence">{{endHeadline}}</h1>
    <img v-if="!showOdot" src="../assets/media/notebook.svg" class="notebook">  
    <div class="headlineEnd">עכשיו יש לכם את כל הכלים לפתיחת מחלקה:</div>
    <img src="../assets/media/right.png" class="checkMarks" id="check2">
      <div id="checkList2">מהות המחלקה</div>
    <img src="../assets/media/right.png" class="checkMarks" id="check3">
      <div id="checkList3">הוצלא מחלקה</div>
    <img src="../assets/media/right.png" class="checkMarks" id="check4">
      <div id="checkList4">סימולציות פיקודיות</div>
    <img class="odotBtn" @click="openOdot" src="../assets/media/odotBtn.svg">
    <div class="odotDiv" v-if="showOdot">
    <br>מומחה תוכן: סג"מ עידן טחן
    <br><br>פיתוח: טוראי אגם סטרול
    <br><br>גרפיקה: 
    <br><br>רת"ח מו"פ: סמ"ר אופק בצון
    <br><br>רמ"ד טי"ל: רס"ב שלומי אוגרן<br><br>
    גרסה: אוגוסט 2022
    </div>
  </div>
</template>
 
<script>

export default {
  components: {
  },
  data() {
    return {
     showOdot: false,
     endHeadline: "כל הכבוד!!",
    }
  },
  methods: {
    openOdot() {
      this.showOdot = this.showOdot ? false : true;
    if (this.showOdot) {
      this.endHeadline = "אודות";
    } else {
      this.endHeadline = "כל הכבוד!!";
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

.finishSentence {
  font-family: "rubik-black";
  color: white;
  font-size: 6vmax;
  position: absolute;
  text-align: center;
  top: 10vh;
  left: 34vw;
  direction: rtl;
}

.notebook {
  position: absolute;
  width: 80vw;
  left: 12vw;
  top: 25vh;
}

.headlineEnd {
  position: absolute;
  font-family: "rubik";
  color: black;
  font-size: 3vmax;
  position: absolute;
  text-align: center;
  direction: rtl;
  top: 28vh;
  left: 14vw;
  width: 70vw;
}

.checkMarks {
  position: absolute;
  width: 8vw;
  left: 70vw;
}


#check2 {
  top: 40vh;
}

#check3 {
  top: 50vh;
}

#check4 {
  top: 60vh;
}

.odotBtn {
  font-family: "rubik";
  font-size: 3vmax;
  text-align: center;
  width: 12vw;
  border-radius: 30%;
  padding: 1vh;
  position: absolute;
  top: 85vh;
  left: 7vw;
}

.odotDiv {
  background-color: white;
  width: 80vw;
  height: 50vh;
  border-radius: 20%;
  position: absolute;
  z-index: 2;
  left: 10vw;
  top: 22vh;
  font-family: "rubik";
  color: black;
  font-size: 3vmax;
  position: absolute;
  text-align: center;
  direction: rtl;
}

#checkList2 {
  color: Black;
  font-family: "rubik-black";
  font-size: 3vmax;
  text-align: right;
  position: absolute;
  right: 34vw;
  top: 40vh;
}

#checkList3 {
  color: Black;
  font-family: "rubik-black";
  font-size: 3vmax;
  text-align: right;
  position: absolute;
  right: 34vw;
  top: 50vh;
}

#checkList4 {
  color: Black;
  font-family: "rubik-black";
  font-size: 3vmax;
  text-align: right;
  position: absolute;
  right: 34vw;
  top: 60vh;
}
</style>