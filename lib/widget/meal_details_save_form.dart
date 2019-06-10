import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/screens/take_picture_screen.dart';
import 'dart:io';
import 'package:camera/camera.dart';

class MealDetailsSaveForm extends StatelessWidget {
  final Meal item;
  final Function addMeal;
  final Function updateMeal;
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

  MealDetailsSaveForm({this.item, this.updateMeal, this.addMeal});

  Widget _buildNameTextField() {
    return Container(
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        //focusNode: _nameFocusNode,
        decoration: InputDecoration(labelText: 'Nome'),
        initialValue: item == null ? '' : item.name,
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
        initialValue: item == null ? '' : item.type,
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
    var timeNow =  item == null ? '' : item.time;
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
        initialValue: item == null ? '' : item.description,
        maxLines: 4,
        onSaved: (String value) { _formData['description'] = value;},
      ),
    );
  }

  Future<void> _pickPhoto(BuildContext context) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(context,
      MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera)),
    );
  }

  Widget _buildButtom(BuildContext context) {
    return Container(
      height: 150.0,
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        Text(
          'Pick an Image',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: Text('Use Camera'),
          onPressed: () {
            print('onPressed');
            _pickPhoto(context);
          },
        ),
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: Text('Use Gallery'),
          onPressed: () {
            print('onPressed');
            _pickPhoto(context);
          },
        )
      ]),
    );
  }

  Widget _buildImageField(String imagePath) {
    return Container(
      child: Image.file(File(imagePath)),
    );
  }

  void _submitForm() {

    if (!_formKey.currentState.validate()) {
      print('[Invalid]');
      print(_formData);
      return;
    }
    _formKey.currentState.save();
    if (item == null) {
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