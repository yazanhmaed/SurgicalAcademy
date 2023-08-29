import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/surgery_lecture/cubit/states.dart';

import '../../models/Pdf_model.dart';

class SurgeryLectureCubit extends Cubit<SurgeryLectureStates> {
  SurgeryLectureCubit() : super(SurgeryLectureInitialState());

  static SurgeryLectureCubit get(context) => BlocProvider.of(context);
// List SurgeryLecture
  List<PdfModel> surgeryLecture = [];

//Get Data SurgeryLecture
  Future<void> getSurgeryLecture() async {
    surgeryLecture = [];
    emit(SurgeryLectureLoadingState());
    await FirebaseFirestore.instance
        .collection('SurgeryLecturePdf')
        .get()
        .then((value) {
      for (var e in value.docs) {
        surgeryLecture.add(PdfModel.fromJson(e.data()));
        // print(e.data());
      }
      emit(SurgeryLectureSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(SurgeryLectureErrorState());
    });
  }
}
