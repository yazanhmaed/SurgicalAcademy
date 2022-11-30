abstract class PdfStates {}

class PdfInitialState extends PdfStates {}

// Pdf
class PdfLoadingState extends PdfStates {}

class PdfSuccessState extends PdfStates {}

class PdfErrorState extends PdfStates {}

//Item Pdf
class PdfItemLoadingState extends PdfStates {}

class PdfItemSuccessState extends PdfStates {}

class PdfItemErrorState extends PdfStates {}
