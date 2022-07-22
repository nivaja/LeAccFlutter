

import 'package:dio/dio.dart';
import 'package:leacc_pos/app/modules/http/dio.dart';
import 'package:leacc_pos/app/modules/sales/model/sales_item_model.dart';
import 'package:leacc_pos/app/modules/sales/model/sales_model.dart';

import '../../common/util/get_value.dart';

class SalesProvider {
  Future<List<SalesItem>> getSalesItems() async{
    String POSProfile=await FrappeGet.value(docType: 'POS Profile');
    var queryParam = {
      "start": 0,
      "page_length": 40,
      "price_list": await FrappeGet.value(docType: 'POS Profile',fieldName: 'selling_price_list',filters: null ),
      "item_group": await FrappeGet.value(docType: 'Item Group',filters: {'is_group':1}),
      "search_term": "",
      "pos_profile": POSProfile
    };
    Response? response = await DioClient().get('/method/erpnext.selling.page.point_of_sale.point_of_sale.get_items',queryParameters: queryParam);
    return List.from(response?.data['message']['items']).map((item) => SalesItem.fromJson(item)).toList();
  }
  
   saveSales(SalesInvoice salesInvoice) async{

   Response? response = await DioClient().post('/resource/Sales Invoice',data:salesInvoice.toJson());
  }
}
