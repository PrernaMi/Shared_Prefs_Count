import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color mColor = Colors.primaries[Random().nextInt(Colors.primaries.length-1)];
  bool flag = false;
  int res = 0;

  @override
  void initState() {
    getValue();
    super.initState();
  }

  void getValue()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    res = prefs.getInt('count')??0;
    setState(() {
      flag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flag == true?(res%5 == 0?mColor:Colors.white):Colors.white,
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100,),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: ()async{
                   SharedPreferences prefs =await SharedPreferences.getInstance();
                  prefs.setInt('count', 0);
                },
                child: Text("Tap to reastart"))
          ],
        ),
      ),
    );
  }
}