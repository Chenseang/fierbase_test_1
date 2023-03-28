import 'package:firebase_test_1/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Firebase/auth_service.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var data = LocalStorage().getStringData(key: 'userId');
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (data.isEmpty) {
          Get.offAll(() => const LoginScreen());
        } else {
          Get.offAll(() => const HomeScreen());
        }
        
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(
        alignment: Alignment.center,
        child: const Text('Splash Screen'),
      ),
    );
  }
}
