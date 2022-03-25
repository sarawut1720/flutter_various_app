import 'package:flutter/material.dart';
import 'package:flutter_various_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({ Key? key }) : super(key: key);

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {

  @override //เมธอดนี้ทำก่อนทุกครั้งที่หน้าจอนี้ถูกโหลดขึ้นมา
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(
        seconds: 4,
      ),
      ()=>Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),   
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/banner.png',
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'SAU APP VARIOUS',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            CircularProgressIndicator(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}