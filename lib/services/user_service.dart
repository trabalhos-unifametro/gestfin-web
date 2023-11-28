import 'package:gestfin_web/services/config.dart';
import 'package:gestfin_web/services/constants.dart';

class UserService {
  final api = Api();

  Future<Response> findMyData() async {
    return await api.get(routeUserMyData).then((dynamic res){
      return res;
    });
  }

  Future<Response> updateUserByColumn(String column, dynamic newValue) async {
    return await api.put(routeUserUpdateByColumn, { "new_value": newValue, "column": column }).then((dynamic res){
      return res;
    });
  }
}