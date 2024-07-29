import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_pref_task2_adlike_view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String countKey = 'count';
  int num = 0;
  SharedPreferences ?prefs;

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  void nextPage()async{
    prefs = await SharedPreferences.getInstance();
    num = (prefs!.getInt(countKey)??0)+1;
    prefs!.setInt(countKey, num);
    setState(() {

    });
    Timer(Duration(milliseconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: FlutterLogo(size: 100,)),
              SizedBox(height: 10,),
              Text("$num"),
            ],
          ),
        ),
      ),
    );
  }
}