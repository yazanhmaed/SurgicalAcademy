import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/application/cubit/states.dart';

import '../../models/add_app_model.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
// List App
  List<AddAppModel> App = [];

//Get Data App
  Future<void> getApp() async {
    App = [];
    emit(AppLoadingState());
    await FirebaseFirestore.instance
        .collection('AddApp')
        .get()
        .then((value) {
      for (var e in value.docs) {
        App.add(AddAppModel.fromJson(e.data()));
        // print(e.data());
      }
      emit(AppSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(AppErrorState());
    });
  }
}
