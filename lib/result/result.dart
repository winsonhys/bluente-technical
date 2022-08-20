import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Total Score",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 40),
              child: Text(Get.arguments ?? "NaN",
                  style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontWeight: FontWeight.normal)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/");
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                ),
                child: Text(
                  "Restart",
                  style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          )
        ], // It's actually better to have a central-ish place for route argument types, but since this mvp is simple, I kept it like this.
      ),
    );
  }
}
