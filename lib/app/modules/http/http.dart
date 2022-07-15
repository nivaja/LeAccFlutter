import 'package:get_storage/get_storage.dart';
import 'package:leacc_pos/app/modules/http/dio.dart';

initApiConfig() async{
  var baseUrl = await GetStorage('Config').read('baseUrl');
  if (!["", null].contains(baseUrl)) {
    await DioClient.init(baseUrl);
    await DioClient.getCookies();
  }
}

setBaseUrl(String baseUrl) async{
  await GetStorage('Config').write('baseUrl', '$baseUrl/api');
  await DioClient.init('$baseUrl/api');
}