import 'dart:convert';

import 'package:http/http.dart';

import 'respon_wrapper.dart';

class NetWorkCaller {
  // get
  static Future<ResponseObject> getRequest(String url) async {
    try {
      final Response response = await get(Uri.parse(url));
      // log(response.statusCode.toString());
      // log(response.body.toString());
      if (response.statusCode == 200) {
        final ResponsDecoden = jsonDecode(response.body);
        return ResponseObject(
          statuscode: 200,
          responsebody: ResponsDecoden,
          isusccess: true,
        );
      } else {
        return ResponseObject(
          statuscode: response.statusCode,
          responsebody: '',
          isusccess: false,
        );
      }
    } catch (e) {
      return ResponseObject(
          isusccess: false,
          statuscode: -1,
          responsebody: '',
          errorMessage: e.toString());
    }
  }

// post
  static Future<ResponseObject> postRequest(String url,
      Map<String, dynamic> body) async {
    try {
      final Response response =
      await post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
      });
      // log(response.statusCode.toString());
      // log(response.body.toString());
      if (response.statusCode == 200) {
        final ResponsDecoden = jsonDecode(response.body);
        return ResponseObject(
          statuscode: 200,
          responsebody: ResponsDecoden,
          isusccess: true,
        );
      } else if (response.statusCode == 401) {
        return ResponseObject(isusccess: false,
            statuscode: response.statusCode,
            responsebody: '',
        errorMessage: 'UnAuthroized'
        );
      }


      else {
        return ResponseObject(
          statuscode: response.statusCode,
          responsebody: '',
          isusccess: false,
        );
      }
    } catch (e) {
      return ResponseObject(
          isusccess: false,
          statuscode: -1,
          responsebody: '',
          errorMessage: e.toString());
    }
  }
}
