// ignore: unused_local_variable
import 'package:flutter/material.dart';
import '../course_screen/course_screen.dart';
import '../osce/osce.dart';
import '../pdf_screen/pdf_file.dart';
import '../question_bank/question_bank.dart';
import '../surgery_book_mcqs/surgery_book_mcqs.dart';
import '../surgery_lecture/surgery_lecture.dart';
import '../surgery_mcqs_vedio/surgery_mcqs_vedio.dart';

List<IconData> icon = [
  Icons.menu_book_sharp,
  Icons.video_collection_outlined,
  Icons.picture_as_pdf,
  Icons.picture_as_pdf,
  Icons.picture_as_pdf,
  Icons.picture_as_pdf,
  Icons.picture_as_pdf,
];
List<String> name = [
  'Courses',
  'Surgery Mcqs Vedio',
  'PDF',
  'Question Bank',
  'Surgery Lecture',
  'Surgery Book Mcqs',
  'Osce',
];

// ignore: unused_local_variable
List<Widget> screens = [
  const CourseScreen(),
  const SurgeryMcqsVedio(),
  const PdfFileScreen(),
  const QuestionBank(),
  const SurgeryLecture(),
  const SurgeryBookMcqs(),
  const Osce(),
];
