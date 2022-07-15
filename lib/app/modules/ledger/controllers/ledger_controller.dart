import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/ledger/ledger_model.dart';
import 'package:leacc_pos/app/modules/ledger/providers/ledger_provider.dart';

class LedgerController extends GetxController {
  //TODO: Implement LedgerController

  RxList<Ledger> ledgerList = <Ledger>[].obs;
  RxBool isLoading = false.obs;

  var customer=''.obs;

  @override
  void onInit() {
    super.onInit();
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
    getLedgerList(fromDate: '2022-05-25', toDate: '2022-07-14', customer: customer.value);
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
