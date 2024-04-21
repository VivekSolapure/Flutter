import 'package:flutter/material.dart';
import 'package:vivek_flutter/views/home_view.dart';

class Myapp extends StatelessWidget {
  const Myapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Vivek flutter',
        home: HomeView( )
    );
  }
}
