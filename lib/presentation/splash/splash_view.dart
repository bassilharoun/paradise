import 'dart:async';
import 'dart:ui';

import 'package:avanced_course/presentation/resources/assets_manager.dart';
import 'package:avanced_course/presentation/resources/color_manager.dart';
import 'package:avanced_course/presentation/resources/constant_manager.dart';
import 'package:avanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkPrimary,
      body: Center(
          child: Container(
        width: double.infinity,
        child: const Image(
          image: AssetImage(ImageAssets.splashLogo),
          fit: BoxFit.cover,
        ),
      )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
