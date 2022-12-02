import '../../models/login_model.dart';

abstract class UserStates {}

class UserInitialState extends UserStates {}

class UserLoadingState extends UserStates {}

class UserSuccessState extends UserStates {
  final TokenLogin tokenLogin;
  UserSuccessState(this.tokenLogin);
}

class UserErrorState extends UserStates {}

class CreateUserLoadingState extends UserStates {}

class CreateUserSuccessState extends UserStates {}

class CreateUserErrorState extends UserStates {}

class GetUserLoadingState extends UserStates {}

class GetUserSuccessState extends UserStates {}

class GetUserErrorState extends UserStates {}
