import 'package:chaipoint/screens/home/settings_form.dart';
import 'package:chaipoint/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:chaipoint/services/database.dart';
import 'package:provider/provider.dart';
import 'package:chaipoint/screens/home/chai_list.dart';
import 'package:chaipoint/models/chai.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Chai>>.value(
      value: DatabaseService().chai,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Chai Point'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                  await _auth.signOut();
              },
             ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
            child: ChaiList()
        ),
      ),
    );
  }
}
