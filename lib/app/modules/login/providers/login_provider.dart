import 'package:leacc_pos/app/modules/http/dio.dart';

import '../../http/http.dart';

class LoginProvider{
  post({required String server, required String usr, required String pwd}) async{
    var data = {
      'usr':usr,
      'pwd':pwd
    };
    await DioClient().post('$server/api/method/login',data: data);
    await setBaseUrl(server);
  }
}
