import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../local_storage/local_storage.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          InkWell(
              onTap: () {
                LocalStorage().removeData(key: 'userId');
                Get.offAll(const LoginScreen());
              },
              child: const Text('Logout')),
        ],
      ),
    );
  }
}
