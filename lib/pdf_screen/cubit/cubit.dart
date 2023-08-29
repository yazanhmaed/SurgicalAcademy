import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/Pdf_screen/cubit/states.dart';

import '../../models/Pdf_model.dart';
import '../../models/pdf_file_model.dart';

class PdfCubit extends Cubit<PdfStates> {
  PdfCubit() : super(PdfInitialState());

  static PdfCubit get(context) => BlocProvider.of(context);
// List Pdf
  List<PdfFileModel> pdf = [];

//Get Data Pdf
  Future<void> getPdf() async {
    pdf = [];
    emit(PdfLoadingState());
    await FirebaseFirestore.instance.collection('Pdf').get().then((value) {
      for (var e in value.docs) {
        pdf.add(PdfFileModel.fromJson(e.data()));
        // print(e.data());
      }
      emit(PdfSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(PdfErrorState());
    });
  }

  List<PdfModel> pdfItem = [];
  Future<void> getPdfItem({
    required String id,
  }) async {
    pdfItem = [];
    emit(PdfLoadingState());
    await FirebaseFirestore.instance
        .collection('Pdf')
        .doc(id)
        .collection('pdf')
        .get()
        .then((value) {
      for (var e in value.docs) {
        pdfItem.add(PdfModel.fromJson(e.data()));
        print(e.data());
      }
      emit(PdfSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(PdfErrorState());
    });
  }
}
