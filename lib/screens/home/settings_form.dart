import 'package:flutter/material.dart';
import 'package:chaipoint/shared/constants.dart';

class SettingsForm  extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm > {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            onChanged: (val){
              setState(() => _currentSugars = val);
            },
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                child: Text('$sugar sugars'),
                value: sugars,
              );
            }).toList(),
          ),
          //slider
          RaisedButton(
            color: Colors.blue[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
          )
        ],
      ),
    );
  }
}
