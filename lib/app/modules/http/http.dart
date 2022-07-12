import 'package:get_storage/get_storage.dart';
import 'package:leacc_pos/app/modules/http/dio.dart';

initApiConfig() async{
  var baseUrl = await GetStorage().read('baseUrl');
  if (["", null].contains(baseUrl)) {
    await DioClient.init(baseUrl);
  }
}

setBaseUrl(String baseUrl) async{
  await GetStorage().write('baseUrl', baseUrl);
  await DioClient.init(baseUrl);
}