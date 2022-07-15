import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:leacc_pos/app/modules/customer/controllers/customer_controller.dart';

import '../../common/util/search_delegate.dart';

class CustomerListView extends GetView<CustomerController> {
  const CustomerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CustomerController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('CustomerListView'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context,
                    delegate: FrappeSearchDelegate(docType: 'Customer')),
                icon: const Icon(Icons.search))
          ],
        ),
        body: Obx(
          () => LazyLoadScrollView(
            onEndOfPage: () => controller.endOfReults.value
                ? Get.snackbar('End of Results', '')
                : controller.getCustomers(
                    start: controller.customerList.length, length: 10),
            child: RefreshIndicator(
              onRefresh: () async => controller.refresh(),
              child: ListView.builder(
                  itemCount: controller.customerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return true
                        ? Card(
                            child: ListTile(
                            title: Text(
                                controller.customerList[index].customerName ??
                                    ''),
                            subtitle: Text(
                              controller.customerList[index].territory ?? '',
                            ),
                          ))
                        : const Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Center(child: CircularProgressIndicator()),
                          );
                  }),
              //  const CircularProgressIndicator()
            ),
          ),
        ));
  }
}
