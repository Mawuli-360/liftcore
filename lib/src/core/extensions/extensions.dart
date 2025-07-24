import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  // Screen size helpers
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Padding and insets
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  // Device pixel ratio
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  // Responsive width helpers
  double get width5 => screenWidth * 0.05;
  double get width10 => screenWidth * 0.1;
  double get width15 => screenWidth * 0.15;
  double get width20 => screenWidth * 0.2;
  double get width25 => screenWidth * 0.25;
  double get width30 => screenWidth * 0.3;
  double get width35 => screenWidth * 0.35;
  double get width40 => screenWidth * 0.4;
  double get width45 => screenWidth * 0.45;
  double get width50 => screenWidth * 0.5;
  double get width60 => screenWidth * 0.6;
  double get width70 => screenWidth * 0.7;
  double get width75 => screenWidth * 0.75;
  double get width80 => screenWidth * 0.8;
  double get width90 => screenWidth * 0.9;
  double get width100 => screenWidth;

  // Responsive height helpers
  double get height5 => screenHeight * 0.05;
  double get height10 => screenHeight * 0.1;
  double get height15 => screenHeight * 0.15;
  double get height20 => screenHeight * 0.2;
  double get height25 => screenHeight * 0.25;
  double get height30 => screenHeight * 0.3;
  double get height35 => screenHeight * 0.35;
  double get height40 => screenHeight * 0.4;
  double get height45 => screenHeight * 0.45;
  double get height50 => screenHeight * 0.5;
  double get height60 => screenHeight * 0.6;
  double get height70 => screenHeight * 0.7;
  double get height75 => screenHeight * 0.75;
  double get height80 => screenHeight * 0.8;
  double get height90 => screenHeight * 0.9;
  double get height100 => screenHeight;

  // Responsive padding helpers
  EdgeInsets get padding5 => EdgeInsets.all(width5);
  EdgeInsets get padding10 => EdgeInsets.all(width10);
  EdgeInsets get padding15 => EdgeInsets.all(width15);
  EdgeInsets get padding20 => EdgeInsets.all(width20);
  EdgeInsets get padding25 => EdgeInsets.all(width25);
  EdgeInsets get padding30 => EdgeInsets.all(width30);
  EdgeInsets get padding35 => EdgeInsets.all(width35);
  EdgeInsets get padding40 => EdgeInsets.all(width40);
  EdgeInsets get padding45 => EdgeInsets.all(width45);
  EdgeInsets get padding50 => EdgeInsets.all(width50);
  EdgeInsets get padding60 => EdgeInsets.all(width60);
  EdgeInsets get padding70 => EdgeInsets.all(width70);
  EdgeInsets get padding75 => EdgeInsets.all(width75);
  EdgeInsets get padding80 => EdgeInsets.all(width80);
  EdgeInsets get padding90 => EdgeInsets.all(width90);
  EdgeInsets get padding100 => EdgeInsets.all(width100);

  // Responsive margin helpers
  EdgeInsets get margin5 => EdgeInsets.all(width5);
  EdgeInsets get margin10 => EdgeInsets.all(width10);
  EdgeInsets get margin15 => EdgeInsets.all(width15);
  EdgeInsets get margin20 => EdgeInsets.all(width20);
  EdgeInsets get margin25 => EdgeInsets.all(width25);
  EdgeInsets get margin30 => EdgeInsets.all(width30);
  EdgeInsets get margin35 => EdgeInsets.all(width35);
  EdgeInsets get margin40 => EdgeInsets.all(width40);
  EdgeInsets get margin45 => EdgeInsets.all(width45);
  EdgeInsets get margin50 => EdgeInsets.all(width50);
  EdgeInsets get margin60 => EdgeInsets.all(width60);
  EdgeInsets get margin70 => EdgeInsets.all(width70);
  EdgeInsets get margin75 => EdgeInsets.all(width75);
  EdgeInsets get margin80 => EdgeInsets.all(width80);
  EdgeInsets get margin90 => EdgeInsets.all(width90);
  EdgeInsets get margin100 => EdgeInsets.all(width100);

  
}
