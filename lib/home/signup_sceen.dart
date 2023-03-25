import 'package:firebase_test_1/Firebase/firebse_auth.dart';
import 'package:firebase_test_1/components/custome_button.dart';
import 'package:firebase_test_1/controller/auth_concroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final auth = FirebaseAuthentication();
    final con = Get.put(AuthController());
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    //const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.1)),
                ]),
                child: TextFormField(
                  controller: con.rigesterEmail,
                  onChanged: (value) {
                    //Do something wi
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: accentColor,
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.1)),
                ]),
                child: TextFormField(
                  controller: con.rigesterPassE,
                  onChanged: (value) {
                    //Do something wi
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: accentColor,
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBotton(
                    title: 'Sign In',
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomBotton(
                    onTap: () {
                      debugPrint('----Create Account------');
                      if (formKey.currentState!.validate()) {
                        auth.createAccountWithEmail(
                            email: con.rigesterEmail.value.text,
                            password: con.rigesterPassE.value.text);
                      }
                    },
                    title: 'Sign Up',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
