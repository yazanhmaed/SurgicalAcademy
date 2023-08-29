import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/course_screen/cubit/states.dart';

import '../../models/course_model.dart';
import '../../models/item_courese_model.dart';

class CourseCubit extends Cubit<CourseStates> {
  CourseCubit() : super(CourseInitialState());

  static CourseCubit get(context) => BlocProvider.of(context);
// List Course
  List<CourseModel> course = [];

//Get Data Course
  Future<void> getCourse() async {
    course = [];
    emit(CourseLoadingState());
    await FirebaseFirestore.instance.collection('Courses').get().then((value) {
      for (var e in value.docs) {
        course.add(CourseModel.fromJson(e.data()));
        print(e.data());
      }
      emit(CourseSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(CourseErrorState());
    });
  }

//List Item Course
  List<ItemCourseModel> itemCourse = [];

//Get Data Item Course
  Future<void> getItemCourse({
    required String id,
  }) async {
    itemCourse = [];
    emit(CourseItemLoadingState());
    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(id)
        .collection('Video')
        .get()
        .then((value) {
      for (var e in value.docs) {
        itemCourse.add(ItemCourseModel.fromJson(e.data()));
        print(e.data());
      }
      emit(CourseItemSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(CourseItemErrorState());
    });
  }
}
