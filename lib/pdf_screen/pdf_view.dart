import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

/// Represents PdfView for Navigation
class PdfView extends StatefulWidget {
  const PdfView({super.key, required this.link, required this.title});
  final String link;
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _PdfView createState() => _PdfView();
}

class _PdfView extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  _launchURL() async {
    // ignore: deprecated_member_use
    if (await canLaunch(widget.link)) {
      // ignore: deprecated_member_use
      await launch(widget.link);
      print('sucssrs');
    } else {
      print('error');
      throw 'Could not launch ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdbe9f6),
        centerTitle: true,
        title: Text(
          widget.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: ColorManager.primary,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.link,
        key: _pdfViewerKey,
        onDocumentLoadFailed: (v) => _launchURL(),
      ),
    );
  }
}
