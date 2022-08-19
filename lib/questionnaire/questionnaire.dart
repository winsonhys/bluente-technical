import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/score_cubit.dart';
import 'package:my_app/questionnaire/presentation/explanation/explanation_card.dart';

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

class _QuestionnaireView extends HookWidget {
  const _QuestionnaireView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    late final Animation<Offset> cardAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: cardAnimationController,
      curve: Curves.easeIn,
    ));
    cardAnimationController.forward();

    return Container(
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => QuestionCubit()),
            BlocProvider(create: (context) => ScoreCubit())
          ],
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Progress(),
                      QuestionsView(),
                    ],
                  )),
              SlideTransition(
                  position: cardAnimation,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const ExplanationCard(),
                  ))
            ],
          )),
    );
  }
}
