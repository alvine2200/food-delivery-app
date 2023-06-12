import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_texts.dart';
import 'package:food_delivery_app/widgets/icons_and_text_widgets.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  int _currPageValue = 0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page! as int;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: Colors.blue,
            activeSize: const Size(13.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Popular',
                color: Colors.black87,
                size: 20,
              ),
              const SizedBox(width: 15),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: '.'),
              ),
              const SizedBox(width: 15),
              SmallText(
                text: 'Food Pairing',
                size: 16.0,
              ),
            ],
          ),
        ),
        Container(
          height: 900,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/crips.jpeg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/food.jpeg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Pizza pepperoni',
                      size: 24,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: Colors.amber[700],
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 10),
                        SmallText(text: "1287"),
                        const SizedBox(width: 10),
                        SmallText(text: "comments"),
                      ],
                    ),
                    const SizedBox(height: 9),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: Colors.amber,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: Colors.green,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
