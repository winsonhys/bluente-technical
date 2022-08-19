import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/score_cubit.dart';

class Progress extends HookWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionState = context.watch<QuestionCubit>().state;
    final score = context.watch<ScoreCubit>().state;

    final animationController = useAnimationController(
        duration: const Duration(microseconds: 200),
        lowerBound: questionState.number - 1 / 3,
        upperBound: questionState.number.toDouble() / 3);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: LinearProgressIndicator(value: animationController.value),
            )),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text("Score"), Text(score.toString())],
        )
      ],
    );
  }
}
