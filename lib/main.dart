import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/core/global_variables.dart';
import 'package:fullstackfranz_flutter_app/routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    GlobalVariables.screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
