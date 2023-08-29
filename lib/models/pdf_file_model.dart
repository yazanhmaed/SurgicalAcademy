class PdfFileModel {
  String? id;
  String? title;
 
  PdfFileModel({
    this.id,
    this.title,
    
  });

  PdfFileModel.fromJson(Map<String, dynamic> json) {
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
