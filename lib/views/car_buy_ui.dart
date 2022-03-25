import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarBuyUI extends StatefulWidget {
  const CarBuyUI({Key? key}) : super(key: key);

  @override
  State<CarBuyUI> createState() => _CarBuyUIState();
}

class _CarBuyUIState extends State<CarBuyUI> {
  //ตัวแปร GroupRadio ใช้เพื่ออ้างอิงไปยัง Radio ที่สัมพันธ์กัน
  int downGroup = 1;

  //การใช้ DropDownButton
  //ตัวแปรเก็บรายการที่จะแสดงใน DropDownButton
  List items = [
    '1 ปี (12 งวด)',
    '2 ปี (24 งวด)',
    '3 ปี (36 งวด)',
    '4 ปี (48 งวด)',
    '5 ปี (60 งวด)',
    '6 ปี (72 งวด)',
    '7 ปี (84 งวด)',
  ];
  //ตัวแปรที่เก็บรายการแรกที่จะแสดงให้ผู้ใช้เลือก ***
  String itemSelected = '1 ปี (12 งวด)';

  //ออปเจ็กต์ควบคุม TextField
  TextEditingController carPriceCtrl = TextEditingController(text: '');
  TextEditingController carInterestCtrl = TextEditingController(text: '');

  //ตัวแปร แสดงผลลัพธ์
  String downMoney = '0.00';
  String financeMoney = '0.00';
  String payMoneyPerMonth = '0.00';

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
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Car Buy',
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
        onTap: () {
          //hide keyboard เวลา tab ที่ตรงไหนก็ได้บนหน้าจอ
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'คำนวณค่างวดรถ',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Icon(
                  FontAwesomeIcons.car,
                  size: 120.0,
                  color: Colors.grey[700],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 3.0,
                  width: MediaQuery.of(context).size.width - 80.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'ข้อมูลรถ',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ราคารถ (บาท) ',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: carPriceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'จำนวนเงินดาวน์ %',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: Colors.lightGreen,
                        onChanged: (value) {
                          setState(() {
                            downGroup = int.parse(value.toString());
                          });
                        },
                        value: 1,
                        groupValue: downGroup,
                      ),
                      Text(
                        '10%',
                      ),
                      Radio(
                        activeColor: Colors.lightGreen,
                        onChanged: (value) {
                          setState(() {
                            downGroup = int.parse(value.toString());
                          });
                        },
                        value: 2,
                        groupValue: downGroup,
                      ),
                      Text(
                        '20%',
                      ),
                      Radio(
                        activeColor: Colors.lightGreen,
                        onChanged: (value) {
                          setState(() {
                            downGroup = int.parse(value.toString());
                          });
                        },
                        value: 3,
                        groupValue: downGroup,
                      ),
                      Text(
                        '30%',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'จำนวนปีที่ผ่อน',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: itemSelected,
                    items: items
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        itemSelected = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ดอกเบี้ย (%) ต่อปี',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: carInterestCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 80.0,
                  height: 3,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'ผลลัพธ์',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.lightGreen,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            //Algorithm+Logic
                            if( carPriceCtrl.text.isEmpty ){
                              showWarningDialog(context, 'ป้อนราคารถด้วย');
                            }else if(carInterestCtrl.text.isEmpty){
                              showWarningDialog(context, 'ป้อนดอกเบี้ยด้วย');
                            }else {
                              //พร้อมคำนวณ
                              double carPrice = double.parse(carPriceCtrl.text);
                              double carInterest = double.parse(carInterestCtrl.text);
                              //คำนวณเงินดาวน์
                              double downMoneyPay = 0;
                              if(downGroup == 1){
                                downMoneyPay = carPrice * 10 / 100;
                              }else if(downGroup == 2){
                                downMoneyPay = carPrice * 20 / 100;
                              }else {
                                downMoneyPay = carPrice * 30 / 100;
                              }
                              setState(() {
                                downMoney = downMoneyPay.toStringAsFixed(2);
                              });
                              //คำนวณยอดจัดไฟแนนซ์
                              double financeMoneyPay = 0;
                              financeMoneyPay = carPrice - downMoneyPay;
                              setState(() {
                                financeMoney = financeMoneyPay.toStringAsFixed(2);
                              });
                              //คำนวณค่างวดต่อเดือน
                              double payMoneyPerMonthPay = 0; //เก็บค่างวดต่อเดือน
                              double interesPay = 0; //เก็บค่าดอกเบี้ย
                              if( itemSelected == '1 ปี (12 งวด)'){
                                //ดอกเบี้ยทั้งหมด = (ยอดจัด + อัตราดอกเบี้ยต่อปี / 100) * จำนวนปี
                                interesPay = (financeMoneyPay * carInterest / 100) * 1;
                                //ค่างวดต่อเดือน = (ยอดจัด + ดอกเบี้ยทั้งหมด ) / จำนวนเดือนที่ผ่อน
                                payMoneyPerMonthPay = (financeMoneyPay + interesPay) / 12;
                              }else if(itemSelected == '2 ปี (24 งวด)') {                               
                                interesPay = (financeMoneyPay * carInterest / 100) * 2;                               
                                payMoneyPerMonthPay = (financeMoneyPay + interesPay) / 24;
                              }else if(itemSelected == '3 ปี (36 งวด)'){                               
                                interesPay = (financeMoneyPay * carInterest / 100) * 3;                                
                                payMoneyPerMonthPay = (financeMoneyPay + interesPay) / 36;
                              }else if(itemSelected == '4 ปี (48 งวด)'){                               
                                interesPay = (financeMoneyPay * carInterest / 100) * 4;                               
                                payMoneyPerMonthPay = (financeMoneyPay + interesPay) / 48;
                              }else if(itemSelected == '5 ปี (60 งวด)'){                               
                                interesPay = (financeMoneyPay * carInterest / 100) * 5;                               
                                payMoneyPerMonthPay = (financeMoneyPay + interesPay) / 60;
                              }else if(itemSelected == '6 ปี (72 งวด)'){                               
                                interesPay = (financeMoneyPay * carInterest / 100) * 6;                               
                                payMoneyPerMonthPay = (financeMoneyPay + interesPay) / 72;
                              }else {                               
                                interesPay = (financeMoneyPay * carInterest / 100) * 7;                               
                                payMoneyPerMonthPay = (financeMoneyPay + interesPay) / 8448;
                              }
                              setState(() {
                                payMoneyPerMonth = payMoneyPerMonthPay.toStringAsFixed(2);
                              });
                            }
                          },
                          child: Text(
                            'คำนวณ',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              carPriceCtrl.text = '';
                              downGroup = 1;
                              itemSelected = '1 ปี (12 งวด)';
                              carInterestCtrl.text = '';
                              downMoney = '0.00';
                              financeMoney = '0.00';
                              payMoneyPerMonth = '0.00';
                            });
                          },
                          child: Text(
                            'รีเซ็ต',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'เงินดาวน์ (บาท)',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        downMoney,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ยอดจัดไฟแนนซ์ (บาท)',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        financeMoney,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ค่างวดต่อเดือน (บาท)',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        payMoneyPerMonth,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
