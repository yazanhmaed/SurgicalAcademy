abstract class CourseStates {}

class CourseInitialState extends CourseStates {}

// Course
class CourseLoadingState extends CourseStates {}

class CourseSuccessState extends CourseStates {}

class CourseErrorState extends CourseStates {}

//Item Course
class CourseItemLoadingState extends CourseStates {}

class CourseItemSuccessState extends CourseStates {}

class CourseItemErrorState extends CourseStates {}
