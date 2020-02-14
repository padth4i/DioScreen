import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget {
  final string;
  const ResponsePage({@required this.string});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(string),
      ),
    );
  }
}
