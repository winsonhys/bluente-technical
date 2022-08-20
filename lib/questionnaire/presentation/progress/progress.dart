import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/score_cubit.dart';

class Progress extends StatefulHookWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    final questionCubit = context.watch<QuestionCubit>();
    final score = context.watch<ScoreCubit>().state;

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    late final animation = Tween<double>(
            begin: (questionCubit.state.index - 1) /
                questionCubit.state.totalNumberOfQuestions,
            end: questionCubit.state.index /
                questionCubit.state.totalNumberOfQuestions)
        .animate(animationController);

    questionCubit.stream.listen((event) {
      animationController.reset();
      animationController.forward();
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: 3,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  // margin: const EdgeInsets.only(right: 10),
                  child: LinearProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.green.shade300),
                      backgroundColor: Colors.grey.shade300,
                      value: animation.value,
                      minHeight: 14),
                ))),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Score",
                  style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      fontWeight: FontWeight.bold)),
              Text(score.toString(),
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        )
      ],
    );
  }
}
