import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/common/views/item_card.dart';
import 'package:leacc_pos/app/modules/sales/controllers/sales_controller.dart';
import 'package:leacc_pos/app/modules/sales/model/sales_model.dart';
import 'package:leacc_pos/app/modules/sales/views/sales_payment_view.dart';

import '../../common/views/action_button.dart';
import '../../common/views/button.dart';
import '../../common/views/input_field_widget.dart';

class AddSalesItem extends GetView<SalesItemController> {
  AddSalesItem({Key? key}) : super(key: key);
  SalesInvoice salesInvoice = Get.arguments as SalesInvoice;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SalesItemController());

    print('Arguments -->' + salesInvoice.customer);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add items sales'),
      ),
      body: Column(children: [
        FrappeTextField('Search Products...', const Icon(Icons.abc)),
        Row(
          children: [
            FrappeButtonField(buttonText: 'Clear',buttonTextColor:  const TextStyle(color: Colors.red),onPressed:()=>controller.clear(),),
            Obx(() => Text(controller.total.value.toString()))
          ],
        ),
        Expanded(
          child: Obx(
            () => GridView.builder(
              itemCount: controller.itemList.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  child: FrappeItemCard(item: controller.itemList[index]),
                  onTap: () {
                    controller.itemList[index].selectedQuantity++;
                    controller.addToCart(controller.itemList[index]);
                  },
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? 2
                      : 3),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FrappeActionButton(
                buttonText: 'Back',
                onPressed: () {},
                buttonIcons: const Icon(Icons.arrow_back),
                iconDirectionForButton: TextDirection.ltr),
            const SizedBox(
              width: 80,
            ),
            FrappeActionButton(
                buttonText: 'Validate',
                onPressed: () {
                  salesInvoice.items = controller.selectedItems.toList();
                  Get.to(()=>SalesPaymentView(),arguments: salesInvoice);
                },
                buttonIcons: const Icon(Icons.arrow_back),
                iconDirectionForButton: TextDirection.rtl),
          ],
        ),
      ]),
    );
  }
}
