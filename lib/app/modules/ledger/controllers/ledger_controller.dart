import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/ledger/ledger_model.dart';
import 'package:leacc_pos/app/modules/ledger/providers/ledger_provider.dart';

class LedgerController extends GetxController {
  //TODO: Implement LedgerController

  RxList<Ledger> ledgerList = <Ledger>[].obs;
  RxBool isLoading = false.obs;
  late Rx<DateTimeRange> dateRange = DateTimeRange(end: DateTime.now(), start: DateTime(DateTime.now().year,DateTime.now().month-1,DateTime.now().day)).obs;

  var customer=''.obs;
    late String _startDate;
   late String _endDate;


  @override
  void onInit() {
    super.onInit();
    _startDate = dateRange.value.start.toString();
    _endDate = dateRange.value.end.toString();
    ever(dateRange, (callback) {
      _startDate = dateRange.value.start.toString();
      _endDate = dateRange.value.end.toString();
      refresh();
    });
    ever(customer, (callback) => refresh());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void refresh() async{
    ledgerList.clear();
    getLedgerList(fromDate: _startDate, toDate: _endDate, customer: customer.value);
  }

  void getLedgerList({
    required String fromDate,
    required String toDate,
    required String customer,
  }) async {
    try {
      isLoading(true);
      List<Ledger> Ledgers = await LedgerProvider().getLedgerList(
          customer: customer, fromDate: fromDate, toDate: toDate);
      ledgerList.addAll(Ledgers);
      //  return Ledgers;
    } finally {
      isLoading(false);
    }
  }
}
