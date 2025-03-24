class AppExceptions implements Exception {
  String title;
  String message;
  AppExceptions({required this.message, required this.title});

  String toErrorMessage(){
    return "$title: $message";
  }
}

class FetchDataException extends AppExceptions{
  FetchDataException({required String errorMessage}) : super(title: "Network error : ", message: errorMessage);
}

class BadRequestException extends AppExceptions{
  BadRequestException({required String errorMessage}) : super(title: "Invalid request : ", message: errorMessage);
}

class UnAuthorisedException extends AppExceptions{
  UnAuthorisedException({required String errorMessage}) : super(title: "Unauthorised : ", message: errorMessage);
}

class InvalidException extends AppExceptions{
  InvalidException({required String errorMessage}) : super(title: "Invalid input : ", message: errorMessage);
}