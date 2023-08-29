
abstract class UserStates {}

class UserInitialState extends UserStates {}

class UserLoadingState extends UserStates {}

class UserSuccessState extends UserStates {

  // final EmailLogin emailLogin;
  // final PassLogin passLogin;
  UserSuccessState( );
}

class UserErrorState extends UserStates {}

class CreateUserLoadingState extends UserStates {}

class CreateUserSuccessState extends UserStates {}

class CreateUserErrorState extends UserStates {}

class GetUserLoadingState extends UserStates {}

class GetUserSuccessState extends UserStates {}

class GetUserErrorState extends UserStates {}
