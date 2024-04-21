import 'package:flutter/material.dart';
import 'package:vivek_flutter/views/home_view.dart';

class Myapp extends StatelessWidget {
  const Myapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vivek flutter',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomeView(),
    );
  }
}
