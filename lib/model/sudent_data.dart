class StudentData {

  String student_grid;
  String student_name;
  String student_standard;
  String student_image;

  StudentData({
    required this.student_grid,
    required this.student_name,
    required this.student_standard,
    required this.student_image,
  });

  factory StudentData.fromMap({required Map<String, dynamic> data}) {
    return StudentData(student_grid: data['student_grid'],
        student_name: data['student_name'],
        student_standard: data['student_standard'], student_image: data['student_image'],);
  }

}
