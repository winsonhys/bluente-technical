import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/questionnaire/presentation/bloc/answer_selection_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/question_number_cubit.dart';
import 'package:my_app/questionnaire/presentation/bloc/score_cubit.dart';
import 'package:my_app/questionnaire/questionnaire.dart';
import 'package:my_app/result/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(const TextTheme(
            bodyText1: TextStyle(fontSize: 18, color: Color(0xff154c79)),
            headline5: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 1, 2)),
            headline4: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xff154c79)))),
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
            name: '/',
            page: () => Scaffold(
                body: Container(
                    padding: const EdgeInsetsDirectional.only(top: 30),
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => QuestionCubit()),
                        BlocProvider(create: (context) => ScoreCubit()),
                        BlocProvider(
                            create: (context) => AnswerSelectionCubit())
                      ],
                      child: const SafeArea(
                          child:
                              QuestionnaireScreen()), // Because we do not use app bar, it is better to wrap this in SafeArea.
                    )))),
        GetPage(
            name: "/result",
            page: () => const Scaffold(
                  body: SafeArea(
                      child:
                          Result()), // Because we do not use app bar, it is better to wrap this in SafeArea.
                ))
      ],
    );
  }
}
