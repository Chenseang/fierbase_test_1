import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test_1/Firebase/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        actions: [
          InkWell(
              onTap: () {
                AuthService().signOut();
                //  Get.offAll(const LoginScreen());
              },
              child: const Center(child: Text('Logout'))),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.tealAccent,
                      width: 4,
                      strokeAlign: BorderSide.strokeAlignOutside),
                  image: DecorationImage(
                      image: NetworkImage(auth.currentUser?.photoURL ??
                          'https://i.pinimg.com/474x/e2/08/e3/e208e3e312210f1fb1d5dbd403c7b4e2.jpg}'))),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Name : ${auth.currentUser?.displayName ?? 'No Name'}"),
            Text("Email : ${auth.currentUser?.email?? 'No Id'}")
          ],
        ),
      ),
    );
  }
}
