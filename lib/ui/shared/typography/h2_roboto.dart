import 'package:flutter/material.dart';

class H2Roboto extends StatelessWidget {

  final String label;

  const H2Roboto({
    Key? key,
    required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      label,

      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )

    );
  }
}
