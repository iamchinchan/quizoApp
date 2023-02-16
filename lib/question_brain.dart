import 'question_bank.dart';
import 'question.dart';

class QuestionBrain {
  // late String quizId;
  late int _scoreOfUser;
  late List<Question> _currentQuiz;
  late int _questionNumber;
  QuestionBrain(String quizId) {
    _questionNumber = 0;
    _scoreOfUser = 0;
    QuestionBank questions = QuestionBank();
    _currentQuiz = questions.getQuestions(quizId);
  }
  String getQuestionText() {
    return _currentQuiz[_questionNumber].getQuestion();
  }

  void nextQuestion() {
    _questionNumber++;
  }

  bool checkAnswer(bool userAnswer) {
    if (userAnswer == _currentQuiz[_questionNumber].getAnswer()) {
      _scoreOfUser++;
    }
    return (userAnswer == _currentQuiz[_questionNumber].getAnswer());
  }

  bool isOver() {
    return (_questionNumber == _currentQuiz.length - 1);
  }

  int getScore() {
    return _scoreOfUser;
  }

  void restartQuiz() {
    _scoreOfUser = 0;
    _questionNumber = 0;
  }
}
