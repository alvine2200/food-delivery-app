import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget(
      {required this.icon,
      required this.text,
      required this.iconColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
