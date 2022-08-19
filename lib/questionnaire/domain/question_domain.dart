import 'package:my_app/questionnaire/data/question_data.dart';

class _Answer {
  String value = "";
  String assetPath = "";

  _Answer(String value) {
    this.value = value;
    assetPath = _getAssetPath(value);
  }

  _getAssetPath(String answerValue) {
    return answerValue == "Mercury"
        ? "assets/$answerValue.jpg"
        : "assets/$answerValue.png";
  }
}

class Question {
  int number;
  String text = "";
  List<_Answer> answers = [];
  String explanation = "";

  Question(this.number) {
    text = questionText[number];
    answers = questionOptions[number].map((option) => _Answer(option)).toList();
    explanation = questionExplanation[number];
  }
}

class QuestionData {}
