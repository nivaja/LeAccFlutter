import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/common/util/search_delegate.dart';
import 'package:leacc_pos/app/modules/common/views/list_tile.dart';
import 'package:leacc_pos/app/modules/common/views/text_container.dart';
import 'package:leacc_pos/app/modules/ledger/ledger_model.dart';

import '../controllers/ledger_controller.dart';

class LedgerView extends GetView<LedgerController> {
  const LedgerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LedgerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('LedgerView'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                controller.customer.value = await showSearch(
                    context: context,
                    delegate: FrappeSearchDelegate(docType: 'Customer')
                );
              })
        ],
      ),
      body: Obx(()=>
          RefreshIndicator(
            onRefresh: () async =>  controller.refresh(),
            child: Column(
        children: [
          FormBuilderDateRangePicker(
              name: 'date_range',
              firstDate: DateTime.parse('2000-01-01'),
              lastDate: DateTime.now(),
              initialValue: controller.dateRange.value,
              onChanged: (value) => controller.dateRange.value=value!),
          Expanded(
            child:  Column(
                children: [
                  controller.ledgerList.isEmpty? const SizedBox.shrink() : BalanceRow(controller.ledgerList.first, controller.ledgerList.last),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.ledgerList.length,
                      itemBuilder:(BuildContext context, int index){
                    return index > 0 && index < controller.ledgerList.length-2?  Card(
                      child: FrappeListTile(
                        date:  controller.ledgerList[index].postingDate,
                        title: controller.ledgerList[index].voucherType??'',
                        subtitle: controller.ledgerList[index].voucherNo.toString(),
                        trailingText: getDebitCredit(controller.ledgerList[index]),
                      ),
                    ) : const SizedBox.shrink();
                  }),
                ],
              ),
            ),

    ]
      )),
      )

    );
  }

  Widget BalanceRow(Ledger opening,Ledger closing){
    return Row(
     children: [
       TextContainer(title: 'Opening',subtitle: opening.balance.toString()),
       TextContainer(title: 'Debit',subtitle: closing.debit.toString()),
       TextContainer(title: 'Credit',subtitle: closing.credit.toString()),
       TextContainer(title: 'Balance',subtitle: closing.balance.toString()),
     ],

    );
  }

  String getDebitCredit(Ledger entry){
    if(entry.voucherType == "Sales Invoice"){
      return entry.debit.toString();
    }
    return entry.credit.toString();
  }
}
