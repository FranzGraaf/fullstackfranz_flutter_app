import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/pages/page1.dart';

class Page2 extends StatelessWidget {
  static const route = "/page2";
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Page 2",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Page1.route);
          },
          child: const Text("Go to Page 1"),
        ),
      ],
    );
  }
}
