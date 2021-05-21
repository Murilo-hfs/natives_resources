import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recursos_nativos/providers/great_places.dart';
import 'package:recursos_nativos/widgets/image_input.dart';
import 'package:recursos_nativos/widgets/location_input.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  // ignore: unused_field
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Form'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Título',
                      ),
                      controller: _titleController,
                    ),
                    Container(height: 20),
                    ImageInput(this._selectImage),
                    Container(height: 20),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.black,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            label: Text('Submit'),
            icon: Icon(Icons.add),
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }
}
