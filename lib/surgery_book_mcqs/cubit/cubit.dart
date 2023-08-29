import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/surgery_book_mcqs/cubit/states.dart';

import '../../models/Pdf_model.dart';

class SurgeryBookMcqsCubit extends Cubit<SurgeryBookMcqsStates> {
  SurgeryBookMcqsCubit() : super(SurgeryBookMcqsInitialState());

  static SurgeryBookMcqsCubit get(context) => BlocProvider.of(context);
// List SurgeryBookMcqs
  List<PdfModel> surgeryBookMcqs = [];

//Get Data SurgeryBookMcqs
  Future<void> getSurgeryBookMcqs() async {
    surgeryBookMcqs = [];
    emit(SurgeryBookMcqsLoadingState());
    await FirebaseFirestore.instance
        .collection('SurgeryBookPdf')
        .get()
        .then((value) {
      for (var e in value.docs) {
        surgeryBookMcqs.add(PdfModel.fromJson(e.data()));
        // print(e.data());
      }
      emit(SurgeryBookMcqsSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(SurgeryBookMcqsErrorState());
    });
  }
}
