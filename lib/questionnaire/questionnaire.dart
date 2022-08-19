import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/questionnaire/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/bloc/score_cubit.dart';
import 'package:my_app/questionnaire/progress/progress.dart';

class QuestionnaireScreen extends StatelessWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<ScoreCubit>(
        create: (context) => ScoreCubit(),
        child: const _QuestionnaireView(),
      ),
    );
  }
}

class _QuestionnaireView extends StatelessWidget {
  const _QuestionnaireView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => QuestionNumberCubit()),
        BlocProvider(create: (context) => ScoreCubit())
      ], child: const Progress()),
    );
  }
}
