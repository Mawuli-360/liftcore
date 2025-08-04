import 'package:flutter/material.dart';

typedef OnboardingStep = ({
  AssetImage image,
  String title,
  String description,
});


typedef InsightProgressData = ({
  AssetImage image,
  String title,
  String value,
  String unit,
  Color color
});