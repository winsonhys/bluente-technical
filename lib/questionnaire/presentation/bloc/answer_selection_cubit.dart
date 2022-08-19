import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerSelectionCubit extends Cubit<int> {
  AnswerSelectionCubit() : super(-1);

  void select(int answer) => emit(answer);
  void reset() => emit(-1);
  bool isSelected() => (state != -1);
}
