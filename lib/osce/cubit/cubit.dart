import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/osce/cubit/states.dart';

import '../../models/Pdf_model.dart';

class OsceCubit extends Cubit<OsceStates> {
  OsceCubit() : super(OsceInitialState());

  static OsceCubit get(context) => BlocProvider.of(context);
// List Osce
  List<PdfModel> osce = [];

//Get Data Osce
  Future<void> getOsce() async {
    osce = [];
    emit(OsceLoadingState());
    await FirebaseFirestore.instance.collection('OscePdf').get().then((value) {
      for (var e in value.docs) {
        osce.add(PdfModel.fromJson(e.data()));
        // print(e.data());
      }
      emit(OsceSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(OsceErrorState());
    });
  }
}
