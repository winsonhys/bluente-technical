import 'package:flutter/material.dart';
import 'package:my_app/questionnaire/presentation/bloc/answer_selection_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _PostSelectionColors {
  final bool _isCorrect;

  _PostSelectionColors(this._isCorrect);

  Color get textColor => Colors.white;
  // TODO: Replace with correct colors
  Color get checkContainerColor =>
      _isCorrect ? Colors.green.shade200 : Colors.red;
  Color get checkColor =>
      _isCorrect ? Colors.green.shade800 : Colors.red.shade900;
  Color? get fillColor =>
      _isCorrect ? Colors.green.shade300 : Colors.red.shade800;
}

class Answer extends StatefulWidget {
  final int answerIndex;

  const Answer({Key? key, required this.answerIndex}) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState(answerIndex);
}

class _AnswerState extends State<Answer> {
  bool _isSelected = false;
  final int _answerIndex;

  _AnswerState(this._answerIndex);

  @override
  Widget build(BuildContext context) {
    final answerData =
        context.watch<QuestionCubit>().state.answers[widget.answerIndex];
    final correctAnswerIndex =
        context.watch<QuestionCubit>().state.correctAnswerIndex;

    final int selectedAnswer = context.watch<AnswerSelectionCubit>().state;

    final bool isSomeAnswerSelected =
        context.read<AnswerSelectionCubit>().isSelected();

    final bool isCorrect = correctAnswerIndex == _answerIndex;

    final bool showPostSelection =
        _isSelected || (isCorrect && isSomeAnswerSelected);

    _PostSelectionColors selectionColors = _PostSelectionColors(isCorrect);
    return GestureDetector(
      onTap: () {
        if (isSomeAnswerSelected) {
          return;
        }
        context.read<AnswerSelectionCubit>().select(widget.answerIndex);
        _isSelected = true;
      },
      child: Container(
          decoration: BoxDecoration(
              color: showPostSelection ? selectionColors.fillColor : null,
              borderRadius: BorderRadius.circular(15)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Text(
                    answerData.value,
                    style: Theme.of(context).textTheme.headline5?.merge(
                        _isSelected
                            ? TextStyle(color: selectionColors.textColor)
                            : const TextStyle()),
                  ),
                  Image.asset(answerData.assetPath)
                ],
              ),
              showPostSelection
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectionColors.checkContainerColor),
                          child: Icon(
                            Icons.check,
                            size: 40,
                            color: selectionColors.checkColor,
                          )),
                    )
                  : const SizedBox(height: 0)
            ],
          )),
    );
  }
}
