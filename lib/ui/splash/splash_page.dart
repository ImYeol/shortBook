import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Short Book",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
