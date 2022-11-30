import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/surgery_mcqs_vedio/cubit/states.dart';

import '../../models/item_courese_model.dart';

class SurgeryMcqsVedioCubit extends Cubit<SurgeryMcqsVedioStates> {
  SurgeryMcqsVedioCubit() : super(SurgeryMcqsVedioInitialState());

  static SurgeryMcqsVedioCubit get(context) => BlocProvider.of(context);
// List SurgeryMcqsVedio
  List<ItemCourseModel> surgeryMcqsVedio = [];

//Get Data SurgeryMcqsVedio
  Future<void> getSurgeryMcqsVedio() async {
    surgeryMcqsVedio = [];
    emit(SurgeryMcqsVedioLoadingState());
    await FirebaseFirestore.instance
        .collection('SurgeryMcqsVedio')
        .get()
        .then((value) {
      for (var e in value.docs) {
        surgeryMcqsVedio.add(ItemCourseModel.fromJson(e.data()));
        // print(e.data());
      }
      emit(SurgeryMcqsVedioSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(SurgeryMcqsVedioErrorState());
    });
  }
}
