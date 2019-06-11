import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/screens/take_picture_screen.dart';
import 'package:camera/camera.dart';
import 'dart:typed_data';
import 'dart:convert';

class MealDetailsSaveForm extends StatelessWidget {
  final Meal meal;
  final Function addMeal;
  final Function updateMeal;
  final Function setMealPhoto;

  final Map<String, dynamic> _formData = {
    'id': null,
    'name': null,
    'time': null,
    'description': null,
    'recipe_link': null,
    'type': null,
    'price': null,
    'isDone': null,
    'image': null,
  };
  static final _nameFocusNode = FocusNode();
  static final _typeFocusNode = FocusNode();
  static final _descriptionFocusNode = FocusNode();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MealDetailsSaveForm({this.meal, this.updateMeal, this.addMeal, this.setMealPhoto});

  Widget _buildNameTextField() {
    return Container(
      child: TextFormField(
        // autofocus: true,
        keyboardType: TextInputType.text,
        //focusNode: _nameFocusNode,
        decoration: InputDecoration(labelText: 'Nome'),
        initialValue: meal == null ? '' : meal.name,
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Nome é obrigatório e deve ter no mínimo 3 caracteres.';
          }
        },
        onSaved: (String value) { _formData['name'] = value;},
      ),
    );
  }

  Widget _buildTypeTextField() {
    return Container(
      child: TextFormField(
        //focusNode: _typeFocusNode,
        decoration: InputDecoration(labelText: 'Tipo de refeição'),
        initialValue: meal == null ? '' : meal.type,
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Tipo é obrigatório e deve ter no mínimo 3 caracteres.';
          }
        },
        onSaved: (String value) { _formData['name'] = value;},
      ),
    );
  }

  Widget _buildTimeTextField() {
    var timeNow =  meal == null ? '' : meal.time;
    return Container(
      child: Text('Horário: '+ timeNow.toString() +  ' h',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return Container(
      child: TextFormField(
        //focusNode: _descriptionFocusNode,
        decoration: InputDecoration(
            labelText: 'Descrição/Obs.',
            // icon: Icon(Icons.description)
        ),
        initialValue: meal == null ? '' : meal.description,
        maxLines: 4,
        onSaved: (String value) { _formData['description'] = value;},
      ),
    );
  }

  Widget _buildButtom(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        Text(
          'Photo da refeição',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.0,
        ),
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: Text('Use Camera'),
          onPressed: () {
            _pickPhoto(context);
          },
        ),
      ]),
    );
  }

  Widget _buildImageField() {
    if(meal == null || meal.photo == null || meal.photo.length == 0) {
      return Container();
    } else {
      Uint8List bytes = base64.decode(meal.photo);
      Uint8List ints = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      return Container(
        child: Image.memory(ints, fit: BoxFit.fitWidth),
      );
    }
  }

  void _submitForm() {

    if (!_formKey.currentState.validate()) {
      print('[Invalid]');
      print(_formData);
      return;
    }
    _formKey.currentState.save();
    if (meal == null) {
      // widget.addMeal(_formData);
    } else {
      // widget.updateMealt(widget.mealIndex, _formData);
    }

    print('[Valide]');
    print(_formData);

    print('Saved');
    // TODO saveDetails
    // Navigator.pushReplacementNamed(context, '/home');
  }

  Future<void> _pickPhoto(BuildContext context) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera)),
    );

    setMealPhoto(result);
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container (
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildNameTextField(),
              _buildTypeTextField(),
              _buildTimeTextField(),
              _buildDescriptionTextField(),
              _buildButtom(context),
              _buildImageField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.red,
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(5.0),
                  child: Text('SALVAR'),
                ),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }
}