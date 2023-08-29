class CourseModel {
  String? id;
  String? title;
 
  CourseModel({
    this.id,
    this.title,
    
  });

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      
    };
  }
}
