// ignore: unused_local_variable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_acadmey_app/application/application.dart';
import '../course_screen/course_screen.dart';
import '../osce/osce.dart';
import '../pdf_screen/pdf_file.dart';
import '../question_bank/question_bank.dart';
import '../surgery_book_mcqs/surgery_book_mcqs.dart';
import '../surgery_lecture/surgery_lecture.dart';
import '../surgery_mcqs_vedio/surgery_mcqs_vedio.dart';

List<IconData> icon = [
  FontAwesomeIcons.youtube,
  FontAwesomeIcons.youtube,
  FontAwesomeIcons.solidFilePdf,
  FontAwesomeIcons.solidFilePdf,
  FontAwesomeIcons.solidFilePdf,
  FontAwesomeIcons.solidFilePdf,
  FontAwesomeIcons.solidFilePdf,
  FontAwesomeIcons.googlePlay,
];
List<String> name = [
  'Courses',
  'Surgery Mcqs Vedio',
  'PDF',
  'Question Bank',
  'Surgery Lecture',
  'Surgery Book Mcqs',
  'Osce',
  'self test & application',
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
  const Application(),
];
