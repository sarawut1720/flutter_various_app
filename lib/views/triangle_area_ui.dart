import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TriangleAreaUI extends StatefulWidget {
  const TriangleAreaUI({Key? key}) : super(key: key);

  @override
  State<TriangleAreaUI> createState() => _TriangleAreaUIState();
}

class _TriangleAreaUIState extends State<TriangleAreaUI> {
    //ตัวแปรเก็บผลลัพธ์เพื่อใช้แสดงผล
    String result = '0.00';

    //ออปเจ็กต์ควบคุม TextField
    TextEditingController baseCtrl = TextEditingController(text: '');
    TextEditingController highCtrl = TextEditingController(text: '');
  
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
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Triangle Area',
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
                  FontAwesomeIcons.exclamationTriangle,
                  size: 120.0,
                  color: Colors.pinkAccent,
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
                    //controller: temCtrl,
                    controller: baseCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'ฐาน',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'ป้อนฐาน',
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
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    //controller: temCtrl,
                    controller: highCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'สูง',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'ป้อนสูง',
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
                  height: 50.0,              
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        //Algorithm+Logic
                        //if(baseCtrl.text.lengh == '') { หรือ
                        if(baseCtrl.text.isEmpty) {
                          showWarningDialog(context, 'ป้อนฐานด้วย');
                        // }else if(highCtrl.text.lengh == '') { หรือ
                        }else if(highCtrl.text.isEmpty) {
                          showWarningDialog(context, 'ป้อนสูงด้วย');
                        }else{
                          //คำนวณ
                          double b = double.parse(baseCtrl.text);
                          double h = double.parse(highCtrl.text);
                          double area = b * h / 2;
                          setState(() {
                            result = area.toStringAsFixed(2);
                          });
                        }
                      },
                      child: Text(
                        'คำนวณ',
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.3, //กว้าง
                          50.0, //สูง
                        ),
                        primary: Colors.pinkAccent,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                ),             
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          baseCtrl.text = '';
                          highCtrl.text = '';
                          result = '0.00';
                        });
                      },
                      child: Text(
                        'ยกเลิก',
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.3, //กว้าง
                          50.0, //สูง
                        ),
                        primary: Colors.lightGreen,
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  result,
                  style: TextStyle(
                    color: Colors.pinkAccent,
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
