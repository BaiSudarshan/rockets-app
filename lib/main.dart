import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocketx/constants/routes.dart';
import 'package:rocketx/providers/rocket_list_provider.dart';
import 'package:rocketx/view/screens/rocket_detail_screen.dart';
import 'package:rocketx/view/screens/rocket_list_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => RocketListProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX Rockets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: RocketListScreen(),
      initialRoute: AppRoutes.rocketList,
      routes: {
        AppRoutes.rocketList: (context) => const RocketListScreen(), // Define the route for the list screen
        AppRoutes.rocketDetails: (context) => RocketDetailScreen(), // Define the route for the detail screen
      },
    );
  }
}
