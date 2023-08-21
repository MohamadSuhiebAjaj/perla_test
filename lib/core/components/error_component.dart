import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent(this.errorMessage, {super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Theme.of(context).textTheme.displayLarge,
        textAlign: TextAlign.center,
        maxLines: 4,
      ),
    );
  }
}
