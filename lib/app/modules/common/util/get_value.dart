import 'package:dio/dio.dart';
import 'package:leacc_pos/app/modules/http/dio.dart';

class FrappeGet {
  static Future<String> value(String docType) async {
    var queryParams = {"doctype": docType, "fieldname": "name"};
    Response? response = await DioClient()
        .get('/method/frappe.client.get_value', queryParameters: queryParams);
    return response?.data['message']['name'];
  }
}
