import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/pages/page2.dart';

class Page1 extends StatelessWidget {
  static const route = "/page1";
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Page 1",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Page2.route);
          },
          child: const Text("Go to Page 2"),
        ),
      ],
    );
  }
}
