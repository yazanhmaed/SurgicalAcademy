// ignore_for_file: file_names

class PdfModel {
  String? linkPdf;
  String? title;
  String? id;

  PdfModel({
    this.linkPdf,
    this.title,
    this.id,
  });

  PdfModel.fromJson(Map<String, dynamic> json) {
    linkPdf = json['linkPdf'];
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'linkPdf': linkPdf,
      'title': title,
      'id': id,
    };
  }
}
