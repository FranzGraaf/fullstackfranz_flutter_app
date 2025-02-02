import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/core/global_variables.dart';
import 'package:fullstackfranz_flutter_app/core/widgets/back_header_1.dart';

class ParallaxEffectPage extends StatefulWidget {
  static const route = "/parallaxeffectpage";
  const ParallaxEffectPage({super.key});

  @override
  State<ParallaxEffectPage> createState() => _ParallaxEffectPageState();
}

class _ParallaxEffectPageState extends State<ParallaxEffectPage> {
  final ScrollController scrollController = ScrollController();

  final List<String> imagePaths = [
    'assets/images/p1.png',
    'assets/images/p2.png',
    'assets/images/p3.png',
    'assets/images/p4.png',
  ];
  final double imageHeight = 450;
  final double imageInitOffset = 300;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BackHeader1(),
          Expanded(
              child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // parallax part
                SizedBox(
                  height:
                      (imagePaths.length - 1) * imageInitOffset + imageHeight,
                  child: Stack(
                    children: [
                      for (int i = 0; i < imagePaths.length; i++)
                        ParallaxListItem(
                          initTopOffset: i * imageInitOffset,
                          height: imageHeight,
                          scrollController: scrollController,
                          imagePath: imagePaths[i],
                          index: i,
                          maxIndex: imagePaths.length - 1,
                        ),
                    ],
                  ),
                ),
                // normal list part
                Container(
                  height: 600,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      "continue with normal list",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class ParallaxListItem extends StatelessWidget {
  final double initTopOffset;
  final double height;
  final ScrollController scrollController;
  final String imagePath;
  final int index;
  final int maxIndex;

  const ParallaxListItem({
    super.key,
    required this.initTopOffset,
    required this.height,
    required this.scrollController,
    required this.imagePath,
    required this.index,
    required this.maxIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: initTopOffset,
      child: AnimatedBuilder(
        animation: scrollController,
        builder: (context, child) {
          double parallaxOffset =
              scrollController.offset * 0.2 * (maxIndex - index);
          return Transform.translate(
            offset: Offset(0, parallaxOffset),
            child: Image.asset(
              imagePath,
              height: height,
              width: GlobalVariables.screenSize.width,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
