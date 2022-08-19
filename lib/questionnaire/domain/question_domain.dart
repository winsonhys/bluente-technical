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

class QuestionData {
  final int _number;

  QuestionData(this._number);

  int get number => _number;
  String get text => questionText[_number];
  List<_Answer> get answers =>
      questionOptions[_number].map((option) => _Answer(option)).toList();

  String get explanation => questionExplanation[_number];

  int get correctAnswerIndex => questionCorrectAnswerIndex[_number];
}
