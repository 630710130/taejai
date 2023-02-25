class Project {
  final String title; // ชื่อโครงการขอรับบริจาค
  final String description; // คำอธิบายเกี่ยวกับโครงการ
  final int targetAmount; // ยอดเงินขอรับบริจาคที่ต้องการ
  final int duration; // ระยะเวลาโครงการ
  final int receiveAmount; // จำนวนเงินที่ได้รับบริจาคมาแล้ว
  final int donateCount;
  final String imageUrl; // จำนวนครั้งที่บริจาคเข้ามา
  final String dayDuration;
  final String place;

  Project({
    required this.title,
    required this.description,
    required this.targetAmount,
    required this.duration,
    required this.receiveAmount,
    required this.donateCount, required this.imageUrl,
    required this.dayDuration,
    required this.place,
  });
}