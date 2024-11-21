

class NetworkResponse{

  final int  statusCode;
  final bool isSuccess;
  dynamic responseData;
  String ? errorMessage;

  NetworkResponse({

    required this.statusCode,
    required this.isSuccess,
    this.errorMessage='Something went Wrong                          ',
    this.responseData
}

      );

}