import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_listing_app/boxes.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/screens/add_movie.dart';
import 'package:showcaseview/showcaseview.dart';

class Movielist extends StatefulWidget {
  final String title;
  const Movielist({Key? key, required this.title}) : super(key: key);

  @override
  State<Movielist> createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  final _key1=GlobalKey();

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:(){
            setState(() {
              ShowCaseWidget.of(context)!.startShowCase([_key1]);
            });
          } ,
          icon: const Icon (Icons.help_rounded),
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Movie>(HiveBoxes.movie).listenable(),
        builder: (context, Box<Movie> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text("No movies Added"),
            );
          }
          return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                Movie? res = box.getAt(index);
                return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete,
                          semanticLabel: "Swipe to Delete Movie"),
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      res!.delete();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('An movie has been deleted')));
                    },
                    child: ListTile(
                      title: Text(res!.movietitle),
                      subtitle: Text(res.directorname),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                res.delete();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('An movie has been deleted')));
                              }),
                        ],
                      ),
                    ));
              });
        },
      ),
      floatingActionButton:FloatingActionButton(
          tooltip: "Add movie",
          child: Showcase(
            key: _key1,
              description: "Click here to add a new movie",
              shapeBorder: const CircleBorder(),
              showcaseBackgroundColor: Colors.indigo,
              descTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              child: const Icon(Icons.add),
              overlayPadding: const EdgeInsets.all(8),
              contentPadding: const EdgeInsets.all(8)
          ),

      onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddMovie()))
          },
        ),
    );
  }
}
