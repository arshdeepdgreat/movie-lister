import 'package:flutter/material.dart';

class AddMovie extends StatefulWidget {
  AddMovie({Key? key}) : super(key: key);

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Form Validated");
    } else {
      print("Form not validated");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Movie'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(labelText: 'Movie Title'),
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(labelText: 'Director Name'),
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
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
                      child: Text('Add Movie')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
