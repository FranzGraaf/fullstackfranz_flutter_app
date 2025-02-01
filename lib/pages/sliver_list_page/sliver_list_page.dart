import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/core/global_variables.dart';
import 'package:fullstackfranz_flutter_app/core/widgets/back_header_1.dart';

class SliverListPage extends StatelessWidget {
  static const route = "/sliverlistpage";
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BackHeader1(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: GlobalVariables.screenSize.height - 100,
                  pinned: true,
                  snap: false,
                  floating: false,
                  automaticallyImplyLeading: false,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: Container(
                      color: Colors.amberAccent,
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text("HEADER"),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      height: GlobalVariables.screenSize.height,
                      color: Colors.greenAccent,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text("TITLE"),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: [
                          Container(
                            height: 300,
                            color: Colors.blueAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 1"),
                          ),
                          Container(
                            height: 300,
                            color: Colors.redAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 2"),
                          ),
                          Container(
                            height: 300,
                            color: Colors.purpleAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 3"),
                          ),
                          Container(
                            height: 300,
                            color: Colors.orangeAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 4"),
                          ),
                          Container(
                            height: 300,
                            color: Colors.blueAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 5"),
                          ),
                          Container(
                            height: 300,
                            color: Colors.redAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 6"),
                          ),
                          Container(
                            height: 300,
                            color: Colors.purpleAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 7"),
                          ),
                          Container(
                            height: 300,
                            color: Colors.orangeAccent.withOpacity(0.3),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text("ELEMENT 8"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
