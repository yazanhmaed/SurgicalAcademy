class AddAppModel {
  String? link;
  String? title;
 
  
  AddAppModel({
 this.link,
    this.title,
    
   
  });

  AddAppModel.fromJson(Map<String, dynamic> json) {
   link = json['link'];
    title = json['title'];
 
  
  }

  Map<String, dynamic> toMap() {
    return {
      'link':link,
      'title': title,
      
     
    };
  }
}
