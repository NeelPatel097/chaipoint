import 'package:chaipoint/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chaipoint/models/user_new.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<NewUser>(context);

    // return home or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
