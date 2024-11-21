import 'dart:convert';

import 'package:http/http.dart';
import 'package:tik_fest/Data/models/network_response.dart';


class NetworkCaller{
  Future<NetworkResponse>getRequest({required String url})async{
    try{
      Uri uri = Uri.parse(url);
      final Response response = await get(uri, headers: {
        'token': '',
      });

      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);

        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    }catch(e){
      return NetworkResponse(
          statusCode: -1,
          isSuccess: false,
          errorMessage: e.toString()
      );

    }

  }


}

