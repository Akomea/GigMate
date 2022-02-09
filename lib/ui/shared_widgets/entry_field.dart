import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  const EntryField({
    Key key,
    this.label,
    this.hint,
  }) : super(key: key);

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
    );
  }
}
