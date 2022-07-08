import 'package:flutter/material.dart';
import 'package:sama/Screens/home.dart';
import 'package:sama/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  late AppTheme appTheme;
  bool change=true;
  @override
  initState(){
    appTheme= AppTheme();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    Future.delayed(const Duration(seconds: 4),(){
      setState((){
        change=false;
      });
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    });
    
    return change?Scaffold(
      body: Container(
        color: appTheme.white,
        child: Center(
          child: Image.asset('assets/images/splash.gif',height: 300.0,width: 300.0,),
        ),
      ),
    ):const Home();
  }
}
