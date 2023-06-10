import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
      ),
    );
  }
}
