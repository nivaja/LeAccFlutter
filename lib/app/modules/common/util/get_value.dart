
import 'package:dio/dio.dart';
import 'package:leacc_pos/app/modules/http/dio.dart';

class FrappeGet {
  static Future<String> value({required String docType, String fieldName="name", Map<String,dynamic>? filters}) async {
    Map<String,dynamic> queryParams;
    if (filters==null){
      queryParams = {"doctype": docType, "fieldname": fieldName};
    }else{
      queryParams ={"doctype": docType, "fieldname": fieldName,"filters":filters};
    }
        Response? response = await DioClient()
        .get('/method/frappe.client.get_value', queryParameters: queryParams);
    return response?.data['message'][fieldName];
  }
}
