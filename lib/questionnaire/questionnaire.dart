import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/score_cubit.dart';

import 'package:my_app/questionnaire/presentation/progress/progress.dart';
import 'package:my_app/questionnaire/presentation/questions/questions.dart';

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
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => QuestionCubit()),
            BlocProvider(create: (context) => ScoreCubit())
          ],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [Progress(), QuestionsView()],
          )),
    );
  }
}
