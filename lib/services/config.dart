import 'dart:convert';
import 'package:gestfin_web/services/constants.dart';
import 'package:gestfin_web/services/session.dart';
import 'package:http/http.dart' as http;

enum TypeResponse {
  error,
  success
}

class Response {
  TypeResponse type;
  dynamic response;

  Response(this.type, this.response);
}

class Api {
  final JsonDecoder _decoder = const JsonDecoder();

  Future<Response> post(String route, dynamic body) async {
    String token = await Session.getToken();
    var url = Uri.parse(urlAPIs+route);
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    Response res;
    return await http.post(url, body: jsonEncode(body), headers: headers).then((http.Response response) {
      if (response.statusCode == 200) {
        res = Response(TypeResponse.success, _decoder.convert(response.body));
      } else {
        res = Response(TypeResponse.error, _decoder.convert(response.body));
      }
      return res;
    }).catchError((error) {
      print('ERROR[POST>${urlAPIs+route}]: $error');
      res = Response(TypeResponse.error, { 'error': 'Ocorreu um erro, por favor entre em contato com o suporte.' });
      return res;
    });
  }

  Future<Response> get(String route, {String? query, String? urlParams}) async {
    String token = await Session.getToken();
    var url = Uri.parse('$urlAPIs$route${urlParams ?? ''}${query ?? ''}');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    Response res;
    return await http.get(url, headers: headers).then((http.Response response) {
      if (response.statusCode == 200) {
        res = Response(TypeResponse.success, _decoder.convert(response.body));
      } else {
        res = Response(TypeResponse.error, _decoder.convert(response.body));
      }
      return res;
    }).catchError((error) {
      print('ERROR[GET>${urlAPIs+route}]: $error');
      res = Response(TypeResponse.error, { 'error': 'Ocorreu um erro, por favor entre em contato com o suporte.' });
      return res;
    });
  }
}