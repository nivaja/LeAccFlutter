import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/common/util/search_delegate.dart';

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
        child: ListView.builder(
          itemCount: controller.ledgerList.length,

            itemBuilder:(BuildContext context, int index){
          return Card(
            child: ListTile(
              title: Text(controller.ledgerList[index].party??''),
              subtitle: Text(controller.ledgerList[index].balance.toString()),
            ),
          );
        }),
      )
      )
    );
  }
}
