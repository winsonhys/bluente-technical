import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/questionnaire/domain/question_domain.dart';

class QuestionCubit extends Cubit<QuestionData> {
  QuestionCubit() : super(QuestionData(0));

  int currentQuestion = 0;

  void increment() {
    currentQuestion++;
    emit(QuestionData(currentQuestion));
  }
}
