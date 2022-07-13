import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:leacc_pos/app/modules/customer/customer_model_model.dart';
import 'package:leacc_pos/app/modules/http/dio.dart';

class CustomerProvider {
  Future<List<Customer>> getCustomerList(int start, int length) async{
    var queryPatameters=
      {
        "limit_page_length":length,// returns 20 records at a time
        "limit_start":start, //Starting index of the record
       // "order_by":"name", //Orders records based on given field
        "fields":jsonEncode(["docstatus","name","customer_name","customer_group","phone_number","territory","email"]) // reuturns listed fields data
        //"filters":[["posting_date", "=", "2022-06-21"]] //returns data matching filter query
      };
    Response? response = await DioClient().get('/resource/Customer',queryParameters: queryPatameters);
    return List.from(response?.data["data"]).map((e) => Customer.fromJson(e)).toList();
  }
}
