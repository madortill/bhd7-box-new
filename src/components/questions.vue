<template>
  <div id="questions">
  <h1 class="headlineQuestions">סימולציות פיקודיות</h1>
  <img class="submitBtnQuestions" @click="checkQuestion" src="../assets/media/submitBtn.svg">
  <div class="questionDiv">
  <p class="questions">{{this.questionsArr[questionNum].question}}</p>
  <div class="answersDiv">
  <p class="sentences">{{this.questionsArr[questionNum].answer1}}</p>
  <p class="sentences">{{this.questionsArr[questionNum].answer2}}</p>
  <p class="sentences">{{this.questionsArr[questionNum].answer3}}</p>
  <p class="sentences">{{this.questionsArr[questionNum].answer4}}</p>
  </div>
  <div id="answer1" @click="answerClicked"></div>
  <div id="answer2" @click="answerClicked"></div>
  <div id="answer3" @click="answerClicked"></div>
  <div id="answer4" @click="answerClicked"></div>
  </div>
  <img src="../assets/media/V.png" v-if="showRight" class="feedback">
  <img src="../assets/media/X.png" v-if="showWrong" class="feedback">
  </div>
</template>
 
<script>

export default {
  name: "domino",
  data() {
    return {
      questionsArr: [{question: "חניך מרגיש שהוא מנסה ללמוד את החומר ולא מצליח והמוטיבציה שלו קטנה בעקבות זה. מה אעשה בתור מפקד?", answer1: "אתן לו להתמודד לבד ואז ככה יוכל להבין בעצמו איך להתגבר על קשייו", answer2: "אנסה לעזור לו ללמוד ואקח אותו באופן פרטני כדי לגרום לו להצלחה", answer3: 'אפנה אותו למ"מ מפני שקושי לימודי הוא באחריות המ"מ', answer4: "אדיח אותו מהקורס על אי התקדמות לימודית, מפני שיש פער לימודי", correctAnswer: "answer2"},
      {question: "חניך ניגש אליך ומודיע לך שהוא מרגיש שיש לו מצוקה נפשית ואינו בטוח בעצמו וחושב שיפגע בעצמו. מה אעשה בתור מפקד?", answer1: "אתן לו להמשיך את שגרת יומו, במערכת הצבאית קשה לכולם והוא יתגבר", answer2: "אתקשר לאמבולנס על מנת שיפנו אותו בהקדם למיון פסיכיאטרי", answer3: "אקח אותו לשיחה בשביל לפתור את קשייו", answer4: 'אקח אותו לשיחה ואדווח ישר למ"מ', correctAnswer: "answer4"},
      {question: "חניך מרגיש שאינו מצליח להשתלב חברתית בקורס והנך רואה את זה מהצד. מה תעשה בתור מפקד?", answer1: "אתן לו תפקיד או משהו בכדי להעצים אותו בהכשרה, כדי שיבלוט", answer2: "לא אתערב בהתנהלות החברתית של החניכים על מנת לא ליצור מצב לא נעים", answer3: 'אדבר עם המ"מ והסגל ונמצא יחד מגוון פתרונות בכדי לעזור למצב הקיים', answer4: "תשובות א + ג נכונות", correctAnswer: "answer4"},
      {question: "חניך מחליט שהוא רוצה לצאת הביתה ובשום פנים ואופן לא מוכן להישאר בקורס ומתחיל להתקדם לכיוון הש.ג, מה תעשה?", answer1: 'נותן לו לצאת אבל מנסה לשוחח איתו כדי למנוע זאת ומסביר לו על כלל ההשלכות הקיימות ובמקביל מדווח למ"מ', answer2: "עוצר אותו באופן פיזי", answer3: 'משוחח איתו ומנסה להסביר לו למה הוא לא יכול לצאת ואיזה בעיות זה יגרום לו ולשירות הצבאי שלו ובזמן הזה מקפיץ את כלל החמ"ל בבסיס', answer4: 'מתקשר לחמ"ל ואומר להם לא לתת לחייל לצאת בש.ג', correctAnswer: 'answer1'}],
      questionNum: 0,
      currAnswer: "",
      showRight: false,
      showWrong: false
    }
  },
  methods: {
    answerClicked(event) {
      document.getElementById(`answer1`).style.backgroundColor = "white";
      document.getElementById(`answer2`).style.backgroundColor = "white";
      document.getElementById(`answer3`).style.backgroundColor = "white";
      document.getElementById(`answer4`).style.backgroundColor = "white";
      
      document.getElementById(event.target.id).style.backgroundColor = "lightblue";
      this.currAnswer = event.target.id;
    },
    checkQuestion(event) {
      if (this.currAnswer === this.questionsArr[this.questionNum].correctAnswer) {
        this.showRight = true;
        setTimeout( () => {
          this.showRight = false;
          this.questionNum++;
          document.getElementById(this.currAnswer).style.backgroundColor = "white";
        }, 1000);
        if (this.questionNum === 3) {
          this.$emit("questions-finished");
        }
      } else {
        this.showWrong = true;
        setTimeout( () => {
          this.showWrong = false;
          document.getElementById(this.currAnswer).style.backgroundColor = "white";
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

.headlineQuestions {
  font-family: "rubik-black";
  color: white;
  font-size: 5vmax;
  position: absolute;
  text-align: center;
  left: 12vw;
  top: 11vh;
  z-index: 3;
}

.submitBtnQuestions {
  font-family: "rubik";
  font-size: 3vmax;
  text-align: center;
  width: 35vw;
  border-radius: 30%;
  padding: 0.5vh;
  position: absolute;
  top: 86vh;
  left: 30vw;
}

.questionDiv {
  position: absolute;
  width: 85vw;
  height: 60vh;
  background-color: white;
  border-radius: 10%;
  left: 8vw;
  top: 23vh;
}

.questions {
  font-family: "rubik";
  direction: rtl;
  width: 78vw;
  position: absolute;
  top: 3vh;
  text-align: center;
  left: 4vw;
}

.answers {
  font-family: "rubik";
  top: 45vh;
  direction: rtl;
  text-align: right;
}

#answer1 {
  position: absolute;
  border: 1px solid black;
  border-radius: 100%;
  width: 4vw;
  height: 2vh;
  left: 70vw;
  top: 23.5vh;
}

#answer2 {
  position: absolute;
  border: 1px solid black;
  border-radius: 100%;
  width: 4vw;
  height: 2vh;
  left: 70vw;
  top: 34vh;
}

#answer3 {
  position: absolute;
  border: 1px solid black;
  border-radius: 100%;
  width: 4vw;
  height: 2vh;
  left: 70vw;
  top: 44vh;
}

#answer4 {
  position: absolute;
  border: 1px solid black;
  border-radius: 100%;
  width: 4vw;
  height: 2vh;
  left: 70vw;
  top: 52vh;
} 

.sentences {
  font-family: "rubik";
  text-align: right;
  font-size: 2vmax;
  width: 60vw;
}

.answersDiv {
  position: absolute;
  top: 16.5vh;
  left: 4vw;
  margin-top: 2vh;
  margin-bottom: 1vh;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  height: 40vh;
}

.feedback {
  position: absolute;
  width: 20vw;
  top: 84vh;
  left: 11vw;
}

</style>