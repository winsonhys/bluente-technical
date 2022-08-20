import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';

class ExplanationCard extends StatelessWidget {
  void Function(BuildContext context) onContinue;

  ExplanationCard({Key? key, required this.onContinue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final explanation = context.watch<QuestionCubit>().state.explanation;
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue.shade900,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Explanation",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.merge(const TextStyle(color: Colors.white)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    explanation,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.merge(const TextStyle(color: Colors.white)),
                    softWrap: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    onContinue(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  child: Text(
                    "Continue",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
