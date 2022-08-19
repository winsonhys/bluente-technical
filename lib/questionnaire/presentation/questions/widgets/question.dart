import 'package:flutter/material.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Question extends StatelessWidget {
  const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final question = context.watch<QuestionCubit>().state;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        question.text,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    );
  }
}
