
import 'package:flutter/material.dart';

class CubitErrorWidget extends StatelessWidget {
  final String error;
  final void Function() tryAgainFunc;

  const CubitErrorWidget(
      {super.key, required this.error, required this.tryAgainFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(error),
        ElevatedButton(
          onPressed: () {
            tryAgainFunc();
          },
          child: const Text('Try again'),
        ),
      ],
    );
  }
}
