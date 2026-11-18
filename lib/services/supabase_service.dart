// ไฟล์ประเภท sevice ใช้สำหรับคำสั่งการทำงาน
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_run_tracker_app/models/run.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService{
  // ****สำคัญต้องสร้่าง instance / obect/ ตัวแทนเพื่อที่จะใช้ทำงานกับ Supabase
final supabase = Supabase.instance.client;

  // ------- ต่อจากนี้ไป ก็จะเป็นเมธอดคำสั่งการทำงานต่างๆ กับ Supabse เช่น เพิ่ม ลบ แก้ไข ดูข้อมูลใน table ใน
// คำสั่ง upload ไฟล์ไปยัง bucket ใน storage
Future<String> uploadFile(XFile xfile) async {
  // ก่อนอัพโหลดเปลี่ยนชื่อไฟล์จะได้ไม่ซ้ำ
  final newFileName = '${DateTime.now().millisecondsSinceEpoch}_${xfile.name}';
  // upload ไฟล์
  await supabase.storage.from('run_bk').uploadBinary(
    newFileName,
    await xfile.readAsBytes(),
    fileOptions: FileOptions(contentType: xfile.mimeType),
  );

  // หลังจากอัปโหลดเสร็จ ให้ดึงที่อยู่ของไฟล์ที่อัพโหลดไปกลับมาใช้งาน
  return supabase.storage.from('run_bk').getPublicUrl(newFileName);
}

// ------คำสั่ง บันทึกข้อมูลลง table ใน database
Future<void> insertRun(Run run) async {
  await supabase.from('run_tb').insert(run.toJson());
  
  
}
//---------คำสั่งดึงข้อมลทั้งหมดจาก table ใน database

// ------คำสั่งบันทึกแก้ไขข้อมูล table ใน DB


// ------คำสั่งลบข้อมูล table ใน DB

}