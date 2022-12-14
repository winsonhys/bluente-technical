import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/questionnaire/domain/question_domain.dart';

class QuestionCubit extends Cubit<QuestionData> {
  QuestionCubit() : super(QuestionData(0));

  int currentQuestionIndex = 0;
  void increment() {
    if (currentQuestionIndex < state.totalNumberOfQuestions - 1) {
      currentQuestionIndex++;
    } else {
      emit(QuestionData(currentQuestionIndex));
      return;
    }
    emit(QuestionData(currentQuestionIndex));
  }

  bool areQuestionsFinished() {
    return currentQuestionIndex >= state.totalNumberOfQuestions;
  }

  void reset() {
    currentQuestionIndex = 0;
    emit(QuestionData(currentQuestionIndex));
  }
}
