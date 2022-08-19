import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionState {
  int _current = 0;
  int _previous = -1;

  void incrementQuestion() {
    _current += 1;
    _previous += 1;
  }

  int get current => _current;
  int get previous => _previous;
}

class QuestionNumberCubit extends Cubit<QuestionState> {
  QuestionNumberCubit() : super(QuestionState());

  void increment() {
    state.incrementQuestion();
    emit(state);
  }
}
