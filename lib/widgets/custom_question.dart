import 'package:flutter/material.dart';

class CustomQuestion extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  CustomQuestion({this.title, this.controller});

  String get question => this.title;
  String get answer => this.controller.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.black12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.title),
          Container(
            child: TextField(
              controller: this.controller,
            ),
          ),
        ],
      ),
    );
  }
}
