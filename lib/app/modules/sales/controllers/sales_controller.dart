import 'package:get/get.dart';

import 'package:leacc_pos/app/modules/sales/model/sales_item_model.dart';
import 'package:leacc_pos/app/modules/sales/providers/sales_provider.dart';

class SalesItemController extends GetxController {
  //TODO: Implement SalesController

  var itemList = <SalesItem>[].obs;
  var selectedItems = <SalesItem>{}.obs;
  var total=0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getSalesItem();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSalesItem() async {
    List<SalesItem> salesItems = await SalesProvider().getSalesItems();
    itemList.assignAll(salesItems);
  }

  void addToCart(SalesItem selectedItem) {
    selectedItems.add(selectedItem);
    itemList.refresh();
    getTotalAmount();
  }

  void getTotalAmount(){
     total.value = selectedItems.fold(0.0, (previousValue, element){
      return previousValue + (element.selectedQuantity * element.priceListRate!);
    });
    update();
  }

  void clear(){
    selectedItems.clear();
    total.value=0;
    itemList.forEach((element)=>element.selectedQuantity=0);
    itemList.refresh();
  }
}
