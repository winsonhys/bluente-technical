import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/questionnaire/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/bloc/score_cubit.dart';

class Progress extends HookWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionState = context.watch<QuestionNumberCubit>().state;
    final score = context.watch<ScoreCubit>().state;

    final animationController = useAnimationController(
        duration: const Duration(microseconds: 200),
        lowerBound: questionState.previous.toDouble() / 4,
        upperBound: questionState.current.toDouble() / 4);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: 3,
            child: Container(
                padding: const EdgeInsets.only(right: 20),
                child:
                    LinearProgressIndicator(value: animationController.value))),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text("Score"), Text(score.toString())],
        )
      ],
    );
  }
}
