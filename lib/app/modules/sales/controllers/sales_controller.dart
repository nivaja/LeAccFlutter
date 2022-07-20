import 'package:get/get.dart';

import 'package:leacc_pos/app/modules/sales/model/sales_item_model.dart';
import 'package:leacc_pos/app/modules/sales/providers/sales_provider.dart';

class SalesItemController extends GetxController {
  //TODO: Implement SalesController

  var itemList = <SalesItem>[].obs;
  var selectedItems = <SalesItem>{}.obs;

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
    // int index = selectedItems
    //     .indexWhere((salesItem) => salesItem.itemCode == selectedItem.itemCode);
    // if (index != -1) {
    //   selectedItems[index].selectedQuantity=selectedItem.selectedQuantity;
    //
    // } else {
    //
    //   selectedItems.add(selectedItem);
    // }
    itemList.refresh();
    selectedItems.forEach((element) {
      print({
        "item":element.itemCode,
        "quantity":element.selectedQuantity
      });
    });
  }
}
