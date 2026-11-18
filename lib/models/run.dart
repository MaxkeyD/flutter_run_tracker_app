//ไฟล์ประเภทโมเดล จะใช้สำหรับแมปข้อมูลต่างๆ ที่จะทำงานด้วยซึ่งจะล้อกับ  Colum ใน Table ใน DB
// รวมถึงคำสั่งแปลง JSON เป็น Object(ข้อมูลที่ใช้ใน Project)และ Object(ข้อมูลที่ใช้ใน Project) เป็น JSON
// ignore_for_file: non_constant_identifier_names

class Run {
  // ตัวแปรที่ล้อกับคอลัมน์ในตาราง
  String? id;
  String? created_at;
  String? runWhere;
  String? runPerson;
  int? runDistance;
  String? runImageUrl;

  // Constructor (เอาไว้แพ็คข้อมูล)
  Run({
    this.id,
    this.created_at,
    this.runWhere,
    this.runPerson,
    this.runDistance,
    this.runImageUrl,
    
  });
  
  //คำสั่งแปลง JSON เป็น Object เรียก FromJson
  factory Run.fromJson(Map<String, dynamic> json) => Run(
        id: json["id"]as String?,
        created_at: json["created_at"]as String?,
        runWhere: json["runWhere"]as String?,
        runPerson: json["runPerson"]as String?,
        runDistance: json["runDistance"]as int?,
        runImageUrl: json["runImageUrl"]as String?,
      );

      // คำสั่งแปลง Object เป็น JSON เรียก toJson
  Map<String, dynamic> toJson() => {
       
        "runWhere": runWhere,
        "runPerson": runPerson,
        "runDistance": runDistance,
        "runImageUrl": runImageUrl,
      };


}