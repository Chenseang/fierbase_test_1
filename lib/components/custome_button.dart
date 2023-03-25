import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, this.onTap, this.title});
  final GestureTapCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: primaryColor)),
        child: Text(
          "$title",
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w300, color: primaryColor),
        ),
      ),
    );
  }
}
