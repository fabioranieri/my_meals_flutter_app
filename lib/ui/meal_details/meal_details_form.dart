import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_flutter_app/ui/shared_widget/custom_button.dart';
import 'package:my_meals_flutter_app/model/meal.dart';
import 'package:my_meals_flutter_app/ui/shared_widget/take_picture.dart';
import 'package:camera/camera.dart';
import 'package:my_meals_flutter_app/ui/meal_details/meal_photo.dart';

class MealDetailsSaveForm extends StatelessWidget {
  MealDetailsSaveForm({
    this.meal,
    this.updateMeal,
    this.addMeal,
    this.setMealPhoto,
  });

  final Meal meal;
  final Function addMeal;
  final Function updateMeal;
  final Function setMealPhoto;
  final Meal _formData = Meal();

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameTextField() {
    return Container(
      child: TextFormField(
        // autofocus: true,
        // focusNode: _nameFocusNode,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Nome'),
        initialValue: meal == null ? '' : meal.name,
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Nome é obrigatório e deve ter no mínimo 3 caracteres.';
          }
          return null;
        },
        onSaved: (String value) { _formData.name = value;},
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
          return null;
        },
        onSaved: (String value) { _formData.type = value;},
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return Container(
      child: Platform.isIOS ?
      CupertinoTextField(
        placeholder: 'Descrição/Obs.',
        maxLines: 4,
        onSubmitted: (String value) { _formData.description = value;},
      ) : TextFormField(
        decoration: InputDecoration(
          labelText: 'Descrição/Obs.',
        ),
        initialValue: meal == null ? '' : meal.description,
        maxLines: 4,
        onSaved: (String value) { _formData.description = value;},
      ),
    );
  }

  Widget _buildPhotoLabel(BuildContext context) {
    return Container(
      height: 70.0,
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Photo da refeição',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
      ]),
    );
  }

  Widget _buildPhotoButtom(BuildContext context) {
    return Container(
      height: 80.0,
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        SizedBox(
          height: 10.0,
        ),
        OutlineButton(
          textColor: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.photo_camera, color: Theme.of(context).primaryColor,),
              Text(' TIRAR PHOTO'),
            ],
          ),
          onPressed: () {
            _pickPhoto(context);
          },
        ),
      ]),
    );
  }

  Future<void> _pickPhoto(BuildContext context) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) =>
          TakePictureScreen(camera: firstCamera),),
    );
    setMealPhoto(result);
  }

  Widget _saveButton(BuildContext context) {
    return CustomButton(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(5.0),
        child: const Text('SALVAR REFEIÇÃO FEITA'),
      ),
      onPressed: _submitForm,
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formData.photo = meal.photo != null ? meal.photo : null;
    _formData.isDone = true;
    _formKey.currentState.save();
    addMeal(_formData);
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
              _buildPhotoLabel(context),
              MealPhoto(meal),
              _buildPhotoButtom(context),
              _buildDescriptionTextField(),
              SizedBox(
                height: 10.0,
              ),
              _saveButton(context),
            ],
          ),
        ),
      ),
    );
  }
}