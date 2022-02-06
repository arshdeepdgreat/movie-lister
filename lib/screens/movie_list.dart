// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_listing_app/boxes.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/screens/add_movie.dart';

class Movielist extends StatefulWidget {
  final String title;
  const Movielist({Key? key, required this.title}) : super(key: key);

  @override
  State<Movielist> createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

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
              return Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete,
                        semanticLabel: "Swipe to Delete Movie"),
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {},
                  child: ListTile(
                      title: Text('Movie title'),
                      subtitle: Text('Director Name')));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add movie",
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMovie()))
        },
      ),
    );
  }
}
