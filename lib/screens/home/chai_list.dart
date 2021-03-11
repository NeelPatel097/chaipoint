import 'package:chaipoint/models/chai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chaipoint/screens/home/chai_tile.dart';

class ChaiList extends StatefulWidget {
  @override
  _ChaiListState createState() => _ChaiListState();
}

class _ChaiListState extends State<ChaiList> {
  @override
  Widget build(BuildContext context) {
    
    final chai = Provider.of<List<Chai>>(context);

    
    return ListView.builder(
      itemCount: chai.length,
      itemBuilder: (contex, index) {
        return ChaiTile(chai: chai[index]);
      },
    );
  }
}
