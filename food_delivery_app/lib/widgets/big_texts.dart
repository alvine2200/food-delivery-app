import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText(
      {this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 20,
      this.overFlow = TextOverflow.ellipsis,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
