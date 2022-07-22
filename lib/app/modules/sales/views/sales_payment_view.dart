
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/sales/controllers/sales_controller.dart';
import 'package:leacc_pos/app/modules/sales/model/sales_model.dart';



class SalesPaymentView extends GetView<SalesItemController> {
  SalesPaymentView({Key? key}) : super(key: key);
  SalesInvoice salesInvoice = Get.arguments as SalesInvoice;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SalesItemController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
        ),
        body: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Row(
                children: [
                  Column(
                    children: [Text('Total: '), Text('Paid Amount:')],
                  ),

                  Column(
                    children: [Text('Remaining: '), Text('Change:')],
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 250,
            //     child: Row(
            //       children: [
            //       Column(
            //         children: [
            //           FormBuilderDropdown(name: 'mode_of_payment', items: ['Cash','Bank'].map((e) => DropdownMenuItem(child:Text(e),value: e,)).toList()),
            //         ],
            //       ),
            //         Column(
            //           children:[
            //             FormBuilderTextField(name: 'amount'),
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),

          ],
        ));
  }
}
