import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:hive/hive.dart';
import 'package:showcaseview/showcaseview.dart';
import '../boxes.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);
  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _onFormSubmit();
      //print("Form Validated");
    } else {
      //print("Form not validated");
      return;
    }
  }

  late String movietitle;
  late String directorname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Movie'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(labelText: 'Movie Title'),
                  onChanged: (value) {
                    movietitle = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(labelText: 'Director Name'),
                  onChanged: (value) {
                    directorname = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        validated();
                      },
                      child: const Text('Add Movie')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onFormSubmit() {
    Box<Movie> moviesBox = Hive.box<Movie>(HiveBoxes.movie);
    moviesBox.add(Movie(directorname: directorname, movietitle: movietitle));
    Navigator.of(context).pop();
    //print(moviesBox);
  }
}
