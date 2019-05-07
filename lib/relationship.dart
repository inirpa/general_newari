import 'package:flutter/material.dart';


class Relationship extends StatefulWidget {
  @override
  _RelationshipState createState() => _RelationshipState();
}

class _RelationshipState extends State<Relationship> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Relationship"),
      ),
    );
  }
}