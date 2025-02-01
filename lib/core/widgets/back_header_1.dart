import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/pages/landing_page.dart';

class BackHeader1 extends StatelessWidget {
  const BackHeader1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LandingPage.route);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
