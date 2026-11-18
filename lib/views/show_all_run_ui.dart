// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_run_tracker_app/views/add_run_ui.dart';

class ShowAllRunUi extends StatefulWidget {
  const ShowAllRunUi({super.key});

  @override
  State<ShowAllRunUi> createState() => _ShowAllRunUiState();
}

class _ShowAllRunUiState extends State<ShowAllRunUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Run Tracker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ floatingActionBuuton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // เปิดไปหน้า AddrubUI แบบย้อนกลับได้
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRunUi(),
            ),
          );
        },
        child: Icon(Icons.add,
        color: Colors.white,
        ),
      backgroundColor: Colors.blue[200],  
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}