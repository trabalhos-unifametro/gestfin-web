import 'package:gestfin_web/services/config.dart';
import 'package:gestfin_web/services/constants.dart';

class AuthenticationService {
  final api = Api();

  Future<Response> login(String email, String password) async {
    return await api.post(routeLogin, { "email": email, "password": password }).then((dynamic res){
      return res;
    });
  }
}