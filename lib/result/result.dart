import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text("Total Score"),
          Text(Get.arguments ?? "NaN"),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/");
              },
              child: const Text("Restart"))
        ], // It's actually better to have a central-ish place for route argument types, but since this mvp is simple, I kept it like this.
      ),
    );
  }
}
