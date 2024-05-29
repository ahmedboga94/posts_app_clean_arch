import 'package:flutter/material.dart';

class CutomTxtFormField extends StatelessWidget {
  final String vaildTxt, label;
  final String? intialVal;
  final int? maxlines;
  final Function(String) onChanged;
  const CutomTxtFormField(
      {super.key,
      required this.vaildTxt,
      required this.label,
      this.intialVal,
      this.maxlines = 1,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: intialVal,
        onChanged: onChanged,
        validator: (value) => value!.isEmpty ? vaildTxt : null,
        decoration: InputDecoration(
          label: Text(label),
        ),
        maxLines: maxlines);
  }
}
