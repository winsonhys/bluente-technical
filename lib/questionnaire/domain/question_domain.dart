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
  int get totalNumberOfQuestions => questionText.length;
  final int _index;

  QuestionData(this._index);

  int get index => _index;
  String get text => questionText[_index];
  List<_Answer> get answers =>
      questionOptions[_index].map((option) => _Answer(option)).toList();

  String get explanation => questionExplanation[_index];

  int get correctAnswerIndex => questionCorrectAnswerIndex[_index];
}
