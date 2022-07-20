
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/common/util/search_delegate.dart';
import 'package:leacc_pos/app/modules/common/views/action_button.dart';
import 'package:leacc_pos/app/modules/sales/model/sales_model.dart';
import 'package:leacc_pos/app/modules/sales/views/items_screen.dart';

import '../controllers/sales_controller.dart';

class SalesView extends GetView<SalesItemController> {
  const SalesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalesInvoice salesInvoice =  SalesInvoice();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Sales'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FormBuilderDateTimePicker(name: 'posting_date', initialValue: DateTime.now(), onChanged: (value)=>salesInvoice.postingDate=value.toString() ,),
          FormBuilderTextField(name: 'customer',onTap: () async {
            salesInvoice.customer = await showSearch(
                delegate: FrappeSearchDelegate(docType: 'Customer',referenceDoctype: 'Sales Invoice'),
                context: context);
          }),
          FrappeActionButton(buttonText: 'Add Items',onPressed: ()=> Get.to(()=> AddSalesItem(),arguments: salesInvoice))
        ],
      )
    );
  }
}
