import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waka_app/models/base_res_model.dart';
import 'package:waka_app/screens/helpers/constants.dart';
import 'package:waka_app/screens/helpers/logger.dart';
import 'package:waka_app/screens/helpers/shared_prefs.dart';

class BaseService {
  Future<BaseResponse> baseGet({required String urlPath, Map<String, dynamic>? queryParams, String? proposedUrl}) async {
    var url = Uri.https(proposedUrl ?? baseUrl, urlPath, queryParams);
    try {
      var response = await http.get(url, headers: {'accept': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return this.apiSuccess(
          message: jsonDecode(response.body)['message'] ?? "",
          data: jsonDecode(response.body),
        );
      } else {
        return this.apiError(
          message: jsonDecode(response.body)['message'] ?? "",
          data: jsonDecode(response.body),
        );
      }
    } catch (error) {
      logError("$urlPath Error: $error");
      return this.apiServerError();
    }
  }

  Future<BaseResponse> basePost({
    required Map<String, dynamic> data,
    required String urlPath,
    String? proposedUrl,
    Map<String, String>? paymentHeaders,
    bool? isSimpleHeaders,
  }) async {
    var url = Uri.https(
      proposedUrl ?? baseUrl,
      urlPath,
    );
    var token = await getToken();
    try {
      var response = await http.post(
        url,
        headers: isSimpleHeaders == true
            ? {'accept': 'application/json'}
            : paymentHeaders == null
                ? {'accept': 'application/json', 'authorization': "Bearer ${token}"}
                : paymentHeaders,
        body: data,
      );
      print("basePost 2 : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return this.apiSuccess(
          message: jsonDecode(response.body)['message'] ?? "",
          data: jsonDecode(response.body),
        );
      } else {
        // logI("basePost Res: ${jsonDecode(response.body)}");

        return this.apiError(
          message: jsonDecode(response.body)['message'],
          data: jsonDecode(response.body),
        );
      }
    } catch (error) {
      logError("$urlPath Error: $error");
      return this.apiServerError();
    }
  }

  BaseResponse apiSuccess({required String message, required Map<String, dynamic> data}) {
    return BaseResponse(statusCode: 200, message: message, data: data);
  }

  BaseResponse apiError({required String message, required Map<String, dynamic> data}) {
    return BaseResponse(statusCode: 400, message: message, data: data);
  }

  BaseResponse apiServerError() {
    return BaseResponse(
      statusCode: 500,
      message: "There was an error processing the request. Please verify your internet connection and try again",
      data: {},
    );
  }

  Map<String, String> headers() {
    return {
      'Authorization': 'Basic ${this.getEncode("payunit_vqNdGFDZk:f017526f-5a2e-4ea6-a4ab-5a71aa33d15d")}',
      'Accept': 'application/json',
      'X-API-KEY': "sand_u5nvhFYqkU2v700yHGsh2Ga9twM5NL",
      'mode': 'test',
    };
  }

  String getEncode(String apiUserNameAndPassWord) {
    String credentials = apiUserNameAndPassWord;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    return encoded;
  }
}
