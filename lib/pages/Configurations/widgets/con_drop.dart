// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ConDrop extends StatefulWidget {
  String val;
  List<String> items;
  ConDrop({super.key, required this.val, required this.items});

  @override
  State<ConDrop> createState() => _ConDropState();
}

class _ConDropState extends State<ConDrop> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.val,
      items: widget.items.map(
        (String result) {
          return DropdownMenuItem<String>(value: result, child: Text(result));
        },
      ).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.val = newValue!;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.2),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
