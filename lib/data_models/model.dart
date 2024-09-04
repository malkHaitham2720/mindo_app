class QuizInformation {
  QuizInformation({
    required this.quizName,
    required this.numbersOfQuestions,
    required this.points,
    required this.quizesQuestions,
  });

  final String quizName;
  final int numbersOfQuestions;
  final int points;
  final List<QuestionInformations> quizesQuestions;
}

class QuestionInformations {
  QuestionInformations({
    required this.question,
    required this.choices,
    required this.rightAnswer,
    required this.ganedPoints,
  });

  final String question;
  final List<String> choices;
  final String rightAnswer;
  final int ganedPoints;
}
