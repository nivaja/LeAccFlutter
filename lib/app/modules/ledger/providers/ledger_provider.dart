import 'package:leacc_pos/app/modules/http/dio.dart';
import 'package:leacc_pos/app/modules/ledger/ledger_model.dart';

class LedgerProvider {
  getLedgerList({
    required String fromDate,
    required String toDate,
    required String customer,
  }) async {
    var requestParameters = {
      "report_name": "General Ledger",
      "filters": {
        "company": "Pachali Bhairav Pani Prasodhan Udhyog",
        "from_date": fromDate,
        "to_date": toDate,
        "party_type": "Customer",
        "party": [customer],
        "group_by": "Group by Voucher (Consolidated)"
      }
    };
    var ledger = await DioClient()
        .post('/method/frappe.desk.query_report.run', data: requestParameters);
    return List.from(ledger?.data['message']['result'])
        .map((e) => Ledger.fromJson(e))
        .toList();
  }
}
