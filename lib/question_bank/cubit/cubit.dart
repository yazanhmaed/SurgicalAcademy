import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/question_bank/cubit/states.dart';

import '../../models/Pdf_model.dart';

class QuestionBankCubit extends Cubit<QuestionBankStates> {
  QuestionBankCubit() : super(QuestionBankInitialState());

  static QuestionBankCubit get(context) => BlocProvider.of(context);
// List QuestionBank
  List<PdfModel> questionBank = [];

//Get Data QuestionBank
  Future<void> getQuestionBank() async {
    questionBank = [];
    emit(QuestionBankLoadingState());
    await FirebaseFirestore.instance
        .collection('QuestionBankPdf')
        .get()
        .then((value) {
      for (var e in value.docs) {
        questionBank.add(PdfModel.fromJson(e.data()));
        // print(e.data());
      }
      emit(QuestionBankSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(QuestionBankErrorState());
    });
  }
}
