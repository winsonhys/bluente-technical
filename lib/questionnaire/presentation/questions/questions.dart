import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/questionnaire/presentation/bloc/answer_selection_cubit.dart';
import 'package:my_app/questionnaire/presentation/questions/widgets/answer.dart';
import 'package:my_app/questionnaire/presentation/questions/widgets/question.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnswerSelectionCubit(),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Question(),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: const [
                Answer(answerIndex: 0),
                Answer(answerIndex: 1),
                Answer(answerIndex: 2),
                Answer(answerIndex: 3)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
