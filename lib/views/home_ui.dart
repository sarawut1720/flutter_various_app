import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_various_app/views/car_buy_ui.dart';
import 'package:flutter_various_app/views/temperature_ui.dart';
import 'package:flutter_various_app/views/triangle_area_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Home',
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Various App',
              ),
              accountEmail: Text(
                'SAU : Southeast Asia University',
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              currentAccountPicture: Image.asset(
                'assets/images/banner.png',
              ),
              otherAccountsPictures: [
                Image.network(
                  'https://icons.iconarchive.com/icons/shwz/disney/512/mickey-mouse-icon.png',
                ),
                Image.network(
                  'https://icons.iconarchive.com/icons/shwz/disney/512/winnie-the-pooh-icon.png',
                ),
              ],
            ),
            ListTile(
              onTap: () {
                //คำสั่งยุบ drawer
                Navigator.pop(context);
                //เปิดไปยังหน้าจอ TemperatureUI
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemperatureUI(),
                  ),
                );
              },
              title: Text(
                'Temperature Convertor',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.temperatureHigh,
                color: Colors.lightBlue,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TriangleAreaUI(),
                  ),
                );
              },
              title: Text(
                'Trangle Area',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.exclamationTriangle,
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarBuyUI(),
                  ),
                );
              },
              title: Text(
                'Car Buy',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.car,
                color: Colors.lightGreen,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                //คำสั่งปิดแอปพลิเคชั่น
                exit(0);
              },
              title: Text(
                'ออกจากแอปพลิเคชั่น',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.doorClosed,
                color: Colors.orangeAccent,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                //เปิดไปหน้า TemperatorUI
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemperatureUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.temperatureHigh,
              ),
              label: Text(
                'Go to Temperature Convertor',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80.0,
                  50.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                //เปิดไปหน้า TemperatorUI
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TriangleAreaUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.exclamationTriangle,
              ),
              label: Text(
                'Go to Triangle Area',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80.0,
                  50.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                //เปิดไปหน้า TemperatorUI
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarBuyUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.car,
              ),
              label: Text(
                'Go to Car Buy',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80.0,
                  50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
