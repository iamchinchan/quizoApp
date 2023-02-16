import 'package:flutter/material.dart';
import 'question_brain.dart';
import 'question_bar.dart';
import 'answer_selection.dart';
import 'score_keeper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  QuestionBrain myQuiz = QuestionBrain('myQuiz');
  List<Widget> scoreSheet = [];
  void restartQuiz() {
    setState(() {
      myQuiz.restartQuiz();
      scoreSheet = [];
    });
  }

  void resetAlert(int score) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(color: Color(0xFF757575)),
      descTextAlign: TextAlign.start,
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      alertAlignment: Alignment.center,
    );
    Alert(
      context: context,
      style: alertStyle,
      // type: AlertType.success,
      title: 'Finished!',
      desc: 'You have reached the end of the quiz!',
      content: Text(
        'Score: $score',
        style: TextStyle(color: Colors.purple.shade300),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            restartQuiz();
          },
          color: Colors.purple.shade300,
          width: 180,
          child: const Text(
            "Restart Quiz",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  void answerReceived(bool userAnswer) {
    setState(() {
      bool result = myQuiz.checkAnswer(userAnswer);
      if (result == true) {
        scoreSheet.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreSheet.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (myQuiz.isOver() == true) {
        int score = myQuiz.getScore();
        resetAlert(score);
      } else {
        myQuiz.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        QuestionBar(
          questionText: myQuiz.getQuestionText(),
        ),
        AnswerSelection(provideAnswer: answerReceived),
        ScoreKeeper(scoreSheet: scoreSheet),
      ],
    );
  }
}
