import 'package:flutter/material.dart';

class H1Roboto extends StatelessWidget {

  final String label;

  const H1Roboto({
    Key? key,
    required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      label,

      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
      )

    );
  }
}
