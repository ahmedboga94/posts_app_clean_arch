import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';

class ErrorMsgWidget extends StatelessWidget {
  final String msg;
  const ErrorMsgWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(msg, style: context.textTheme.titleLarge),
        ),
      ),
    );
  }
}
