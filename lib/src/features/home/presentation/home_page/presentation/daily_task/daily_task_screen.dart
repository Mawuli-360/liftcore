import 'package:flutter/material.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/exercise_card.dart';

class DailyTaskScreen extends StatelessWidget {
  const DailyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(title: "Daily Task"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...List.generate(
              3,
              (index) => const ExerciseCard(),
            )
          ],
        ),
      ),
    );
  }
}
