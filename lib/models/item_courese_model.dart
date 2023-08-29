class ItemCourseModel {
  String? link;
  String? description;

  ItemCourseModel({
    this.link,
    this.description,
  });

  ItemCourseModel.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    description = json['description'];
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'description': description,
    };
  }
}
