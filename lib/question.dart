class Question {
  late String _questionText;

  String getQuestion() {
    return _questionText;
  }

  void setQuestion(String questionText) {
    _questionText = questionText;
  }

  late bool _correctAnswer;

  bool getAnswer() {
    return _correctAnswer;
  }

  void setAnswer(bool correctAnswer) {
    _correctAnswer = correctAnswer;
  }

  Question(String question, bool answer) {
    _correctAnswer = answer;
    _questionText = question;
  }
}
