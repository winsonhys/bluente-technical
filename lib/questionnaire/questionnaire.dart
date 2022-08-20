import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/route_manager.dart';
import 'package:my_app/questionnaire/presentation/bloc/answer_selection_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/score_cubit.dart';
import 'package:my_app/questionnaire/presentation/explanation/explanation_card.dart';

import 'package:my_app/questionnaire/presentation/progress/progress.dart';
import 'package:my_app/questionnaire/presentation/questions/questions.dart';

class QuestionnaireScreen extends HookWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  gotoNextQuestion(BuildContext context) {
    BlocProvider.of<AnswerSelectionCubit>(context, listen: false).reset();
    BlocProvider.of<QuestionCubit>(context, listen: false).increment();
    BlocProvider.of<ScoreCubit>(context, listen: false).increment();
  }

  gotoResultPage(BuildContext context) {
    final score = BlocProvider.of<ScoreCubit>(context, listen: false).state;
    dispose(context);
    Get.toNamed("/result", arguments: score.toString());
  }

  dispose(BuildContext context) {
    BlocProvider.of<AnswerSelectionCubit>(context, listen: false).reset();
    BlocProvider.of<QuestionCubit>(context, listen: false).reset();
    BlocProvider.of<ScoreCubit>(context, listen: false).reset();
  }

  onFinishQuestion(BuildContext context) {
    final questionCubit =
        BlocProvider.of<QuestionCubit>(context, listen: false).state;
    if (questionCubit.totalNumberOfQuestions - 1 == questionCubit.index) {
      gotoResultPage(context);
    } else {
      gotoNextQuestion(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 300));

    late final Animation<Offset> cardAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: cardAnimationController,
      curve: Curves.easeIn,
    ));

    final selectedAnswerCubit = context.watch<AnswerSelectionCubit>();
    final questionCubit = context.watch<QuestionCubit>().state;
    final correctAnswer = questionCubit.correctAnswerIndex;

    if (selectedAnswerCubit.hasAnswerSelected()) {
      if (selectedAnswerCubit.state != correctAnswer) {
        cardAnimationController.forward();
      } else {
        Timer(const Duration(seconds: 1), () {
          onFinishQuestion(context);
        });
      }
    }

    return Container(
      child: Stack(
        children: [
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Progress(),
                      QuestionsView(),
                    ],
                  ))),
          BlocListener(
            listener: (context, state) {
              cardAnimationController.reset();
            },
            bloc: BlocProvider.of<QuestionCubit>(context, listen: false),
            child: SlideTransition(
                position: cardAnimation,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ExplanationCard(
                      onContinue:
                          onFinishQuestion), // Conscious decision to not wrap it in SafeArea so that the card can cover the bottom all the way.
                )),
          )
        ],
      ),
    );
  }
}
