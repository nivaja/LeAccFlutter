
import 'package:dio/dio.dart';
import 'package:leacc_pos/app/modules/http/dio.dart';
import 'package:leacc_pos/app/modules/sales/model/sales_item_model.dart';

import '../../common/util/get_value.dart';

class SalesProvider {
  Future<List<SalesItem>> getSalesItems() async{
    var queryParam = {
      "start": 0,
      "page_length": 40,
      "price_list": await FrappeGet.value('Price List'),
      "item_group": "All Item Groups", //await FrappeGet.value('Item Group'),
      "search_term": "",
      "pos_profile": await FrappeGet.value('POS Profile')
    };
    Response? response = await DioClient().get('/method/erpnext.selling.page.point_of_sale.point_of_sale.get_items',queryParameters: queryParam);
    return List.from(response?.data['message']['items']).map((item) => SalesItem.fromJson(item)).toList();
  }
}
