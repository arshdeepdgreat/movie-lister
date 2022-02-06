import 'package:flutter/material.dart';
import 'package:movie_listing_app/screens/add_movie.dart';

class Movielist extends StatefulWidget {
  final String title;
  const Movielist({Key? key, required this.title}) : super(key: key);

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
            itemCount: 60,
            itemBuilder: (context, index) {
              // ignore: prefer_const_constructors
              return ListTile(
                  title: Text('Movie title'), subtitle: Text('Director Name'));
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
