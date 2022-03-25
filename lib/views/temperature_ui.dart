import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureUI extends StatefulWidget {
  const TemperatureUI({Key? key}) : super(key: key);

  @override
  State<TemperatureUI> createState() => _TemperatureUIState();
}

class _TemperatureUIState extends State<TemperatureUI> {
  //สร้างตัวแปรเพื่อใช้กับ Radio
  int tempValue = 1;

  //สร้างตัวแปรเก็บผลลัพธ์เพื่อใช้แสดงผล
  String showValue = '0.00';

  //สร้างตัวคอนโทลเลอร์ของ TextField
  TextEditingController temCtrl = TextEditingController(text: '');

  //เมธอดแสดง WarningDialog เตือน
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Temperature',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                Icon(
                  FontAwesomeIcons.temperatureHigh,
                  size: 120.0,
                  color: Colors.lightBlueAccent,
                ),
                SizedBox(
                  height: 60.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    controller: temCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'อุณหภูมิ',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'ป้อนอุณหภูมิ',
                      labelStyle: TextStyle(
                        color: Colors.lightBlueAccent,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey[350],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          tempValue = int.parse(value.toString());
                        });
                      },
                      value: 1,
                      groupValue: tempValue,
                      activeColor: Colors.lightBlueAccent,
                    ),
                    Text(
                      'แปลง Celcius เป็น Fahrenhite',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      onChanged: (value) {
                        //โค้ดอะไรก็ตามที่มีผลต่อการแสดงต้องอยู่ภายใต้คำสั่ง setState
                        // .toString คือคำสั่งแปลงเป็น String
                        // int.parse() คือแปลง String เป็น int
                        setState(() {
                          tempValue = int.parse(value.toString());
                        });
                      },
                      value: 2,
                      groupValue: tempValue,
                      activeColor: Colors.lightBlueAccent,
                    ),
                    Text(
                      'แปลง Fahrenhite เป็น Celcius',
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // LOGIC : ตรวจสอบก่อนว่าป้อนอุณหภูมิหรือยัง แล้ว
                    //ตรวจสอบว่าเลือกคำนวณแบบไหน แล้ว
                    //คำนวณสูตรตามที่เลือกและแสดงผล
                    // .length คือ นับจำนวนตัวอักษรด้วย String
                    if (temCtrl.text.length == 0) {
                      showWarningDialog(context, 'ป้อนอุณหภูมิด้วย');
                    } else {
                      if (tempValue == 1) {
                        //แปลง Cel to Fah
                        //สูตร F = 9 / 5 * c + 32
                        double c = double.parse(temCtrl.text);
                        double f = (9 / 5 * c) + 32;
                        setState(() {
                          showValue = f.toStringAsFixed(2);
                        });
                      } else {
                        //แปลง Fah to Cel
                        //สูตร C = (F-32) * 5 / 9
                        double f = double.parse(temCtrl.text);
                        double c = (f - 32) * 9 / 5;
                        setState(() {
                          showValue = c.toStringAsFixed(2);
                        });
                      }
                    }
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.5, //กว้าง
                      50.0, //สูง
                    ),
                    primary: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  showValue,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 70.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
