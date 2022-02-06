import 'package:flutter/material.dart';

class Movielist extends StatefulWidget {
  final String title;
  Movielist({Key? key, required this.title}) : super(key: key);

  @override
  State<Movielist> createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              // ignore: prefer_const_constructors
              return ListTile(
                  title: const Text('Movie title'),
                  subtitle: const Text('description'));
            }),
      ),
    );
  }
}
