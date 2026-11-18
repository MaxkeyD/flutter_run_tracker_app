// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_run_tracker_app/views/show_all_run_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // หน่วงเวลาหน้าจอ 3 วินาทีแล้วเปิดไป Show_all_run_ui แบบย้อนกลับไม่ได้
    Future.delayed(
      // เวลาที่หน่วง
      Duration(seconds: 3),
      // ส่วนที่จะทำงานหลังจากหน่วงเวลา
      (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=> ShowAllRunUi(),
          ),
        );
      } 
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 72, 131),
      body: Stack(
        children:[
          // ชั้นที่ 1 ภาพโลโก้และชื่อแอป progress indicator
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.cover,
                  
                ),
                SizedBox(height: 5,),
                Text(
                  'Run Tracker',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                ),


              ],

            ),
          ),
          // ชั้นที่ 2 ข้อความด้านล่าง Coppyright, Created by
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '© 2026 RUN TRACKER. All rights reserved',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Created by: NinniN SAU TEAM',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                

              ],
            ),
          ),

        ],
      ),
    );
  }
}