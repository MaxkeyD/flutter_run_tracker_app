// ignore_for_file: sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_run_tracker_app/models/run.dart';
import 'package:flutter_run_tracker_app/services/supabase_service.dart';
import 'dart:typed_data';
class AddRunUi extends StatefulWidget {
  const AddRunUi({super.key});

  @override
  State<AddRunUi> createState() => _AddRunUiState();
}

class _AddRunUiState extends State<AddRunUi> {

// ------------ โค้ดคำสั่งที่เกี่ยวกับการเปิดกล้อง หรือแกลอรี่--------
Uint8List? imageByte; //เอาไว้เก็บรูปที่จะแสดง
XFile? imageFile; //เอาไว้เก็บรูปที่จะ upload ไปที่ supabase

// เมธอดเปิดกล้องเพื่อถ่าย
Future<void> openCameraAndTakePhoto() async {
  // เปิดกล้องและถ่าย
  imageFile =await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 80);
  // แปลงรูปที่ถ่ายเป็น byte เพื่อแสดงที่ UI บนหน้าจอ แต่ต้องตรวจสอบก่อนว่าเค้าได้ถ่ายไหม
  if(imageFile !=null){
    final byte =await imageFile!.readAsBytes();
    setState(() {
imageByte = byte;
      
    });
  }
  
}
// เมธอดเปิดแกลอรี่เพื่อเลือกรูปแต่ต้องตรวจสอบก่อนว่าได้เลือกไหม

Future<void> openGalleryAndSelectPhoto() async {
  // เปิดกล้องและถ่าย
  imageFile =await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 80);
  // แปลงรูปที่ถ่ายเป็น byte เพื่อแสดงที่ UI บนหน้าจอ แต่ต้องตรวจสอบก่อนว่าเค้าได้ถ่ายไหม
  if(imageFile !=null){
    final byte =await imageFile!.readAsBytes();
    setState(() {
imageByte = byte;
      
    });
  }
  
  
  
}
// -------------------------------------------------------
// สร้างตัวแปลควบคุม TextField
TextEditingController runWhereCtrl = TextEditingController();
TextEditingController runPersonCtrl = TextEditingController();
TextEditingController runDistanceCtrl = TextEditingController();

// ตัวแปรเก็บที่อยู่รูปกรณีมีการอัปโลหดไฟล์
String? imageUrlFromUpload = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Run Tracker (เพิ่ม)',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
      ),
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 35,
            right: 35,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
                ),
                //จะใช้ Ternary Operator _____ ? _____ : _____
                imageByte == null
                ? InkWell( //หรือใช้ GestureDetector
                  onTap: (){
                    //เปิดกล้องเพื่อถ่ายรูป หรือเปิดแกลอรี่เพื่อเลือกรูป
                    openGalleryAndSelectPhoto();
                  },
                  child: FaIcon(
                    FontAwesomeIcons.cameraRetro,
                    size: MediaQuery.of(context).size.width * 0.35,
                    color: Colors.grey[400],
                  ),
                )
                : InkWell( //หรือใช้ GestureDetector
                  onTap: (){
                    //เปิดกล้องเพื่อถ่ายรูป หรือเปิดแกลอรี่เพื่อเลือกรูป
                    openGalleryAndSelectPhoto();
                  },
                  child: Image.memory(
                    imageByte!,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.width * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.050,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'วิ่งที่ไหน',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                TextField(
                  controller: runWhereCtrl,
                  decoration: InputDecoration(
                    hintText: 'เช่น สวนสาธารณะ, สนามกีฬา หรือ อื่นๆ',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'วิ่งกับใคร',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                TextField(
                  controller: runPersonCtrl,
                  decoration: InputDecoration(
                    hintText: 'เช่น เพื่อน 3 คน, แฟน หรือ อื่นๆ',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ระยะทาง',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                TextField(
                  controller: runDistanceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'เช่น 1, 5, 11 หรือ อื่นๆ',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // ควรจะต้อง Validate UI ก่อนว่าป้อนครบหรือยัง (รูปไม่ถ่ายหรือเลือกก็ได้)
                    if( runWhereCtrl.text.isEmpty || runPersonCtrl.text.isEmpty || runDistanceCtrl.text.isEmpty ){
                      //แสดง SnackBar เตือน
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
         
                      return;
                    }
         
                    // Upload File ไปยัง Storage และบันทึกข้อมูลไปยัง DB
                    // เริ่มจาก Upload File โดยต้องตรวจสอบก่อนว่าผู้ใช้ได้ถ่ายหรือเลือกรูปหรือไม่
                    if(imageFile != null){ //หรือตรวจสอบจาก imageByte
                      // หากไม่เท่ากับ null แปลว่ามีการ upload
                      imageUrlFromUpload = await SupabaseService().uploadFile(imageFile!);
                    }
         
                    // เพิ่มข้อมูลลงใน table ใน DB
                    // แพ็คข้อมูล
                    Run run = Run(
                      runWhere: runWhereCtrl.text,
                      runPerson: runPersonCtrl.text,
                      runDistance: int.parse(runDistanceCtrl.text),
                      runImageUrl: imageUrlFromUpload,            
                    );
                    // ส่งข้อมูลที่แพ็คไปบันทึก
                    await SupabaseService().insertRun( run );
         
                    //บันทึกเสร็จเรียบร้อยแสดงข้อแจ้งผลการทำงาน
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('บันทึกข้อมูลเรียบร้อยแล้ว'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
         
                    //ย้อนกลับไปหน้าก่อนหน้า
                    Navigator.pop(context);
                  },
                  child: Text(
                    'บันทึกข้อมูล',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(
                      double.infinity,
                      MediaQuery.of(context).size.height * 0.065,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    // เคลียร์ข้อมูลหน้าจอ
                    setState(() {
                      imageByte =null;
                      imageFile=null;
                      imageUrlFromUpload = "";
                      runWhereCtrl.clear();
                      runPersonCtrl.clear();
                      runDistanceCtrl.clear();
                      
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(
                      double.infinity,
                      MediaQuery.of(context).size.height * 0.065,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
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