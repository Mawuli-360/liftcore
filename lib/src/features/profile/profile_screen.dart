import 'package:flutter/material.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(
        title: "Profile",
        isBackButton: false,
        centerTitle: false,
      ),
    );
  }
}
