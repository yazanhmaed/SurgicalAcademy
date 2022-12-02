import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/login_screen/cubit/states.dart';

import '../../models/login_model.dart';
import '../../models/user_model.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());
  static UserCubit get(context) => BlocProvider.of(context);

  userLogin({
    required String email,
    required String password,
  }) {
    emit(UserLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      var tokenLogin = TokenLogin(uid: value.user!.uid);
      emit(UserSuccessState(tokenLogin));
    }).catchError((onError) {
      emit(UserErrorState());
    });
  }

  List<UserModel> user = [];

  void getUser() async {
    user = [];
    emit(GetUserLoadingState());
    await FirebaseFirestore.instance.collection('Users/').get().then((value) {
      for (var e in value.docs) {
        user.add(UserModel.fromJson(e.data()));
        print(e.data());
      }
      emit(GetUserSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(GetUserErrorState());
    });
  }
}
