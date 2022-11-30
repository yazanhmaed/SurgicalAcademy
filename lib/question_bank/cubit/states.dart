abstract class QuestionBankStates {}

class QuestionBankInitialState extends QuestionBankStates {}

// QuestionBank
class QuestionBankLoadingState extends QuestionBankStates {}

class QuestionBankSuccessState extends QuestionBankStates {}

class QuestionBankErrorState extends QuestionBankStates {}

//Item QuestionBank
class QuestionBankItemLoadingState extends QuestionBankStates {}

class QuestionBankItemSuccessState extends QuestionBankStates {}

class QuestionBankItemErrorState extends QuestionBankStates {}
