import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storma_task/utils/Strings.dart';
class Api {
  static networkRequest (String service )async{
    http.Response response =await  http.get(BASE_URL+ service);
      var responseDecoded =await jsonDecode(response.body);
      return responseDecoded;
  }
}