import 'package:leacc_pos/app/modules/sales/model/sales_item_model.dart';



class SalesInvoice {
  // SalesInvoice({
  //   this.docstatus=0,
  //   required this.customer,
  //
  //   required this.postingDate,
  //   required this.postingTime,
  //   required this.dueDate,
  //   required this.isPos,
  //   required this.updateStock,
  //   required this.items,
  //   required this.payments,
  // });
  SalesInvoice();
  late final int? docstatus;
  late final String customer;
  late final String postingDate;
  late final String postingTime;
  late final String dueDate;
  late final String debitTo;
  late final String againstIncomeAccount;

  late final String posProfile;
  late final int isPos;
  late final int updateStock;
  late List<SalesItem> items;
  late final List<SalesPayment> payments;

  // SalesInvoice.fromJson(Map<String, dynamic> json){
  //   docstatus = json['data']['docstatus'];
  //   customer = json['data']['customer'];
  //   postingDate = json['data']['posting_date'];
  //   postingTime = json['data']['posting_time'];
  //   dueDate = json['data']['due_date'];
  //   debitTo = json['data']['debit_to'];
  //   againstIncomeAccount = json['data']['against_income_account'];
  //
  //   posProfile = json['data']['pos_profile'];
  //   isPos = json['data']['is_pos'];
  //   updateStock = json['data']['update_stock'];
  //   items = List.from(json['data']['items']).map((e)=>Item.fromJson(e)).toList();
  //   payments = List.from(json['data']['payments']).map((e)=>SalesPayment.fromJson(e)).toList();
  // }

  Map<String, dynamic> toJson() {
    final _salesInvoiceData = <String, dynamic>{};
    _salesInvoiceData['docstatus'] = docstatus;
    _salesInvoiceData['customer'] = customer;
    _salesInvoiceData['posting_date'] = postingDate;
    _salesInvoiceData['posting_time'] = postingTime;
    _salesInvoiceData['due_date'] = dueDate;
    _salesInvoiceData['debit_to'] = debitTo;
    _salesInvoiceData['against_income_account'] = againstIncomeAccount;

    _salesInvoiceData['pos_profile'] = posProfile;
    _salesInvoiceData['is_pos'] = isPos;
    _salesInvoiceData['update_stock'] = updateStock;
    _salesInvoiceData['items'] = items.map((e)=>e.toJson()).toList();
    _salesInvoiceData['payments'] = payments.map((e)=>e.toJson()).toList();

    final data = <String,dynamic>{
      'data':_salesInvoiceData
    };
    return data;
  }
}

class SalesPayment {
  SalesPayment({
    required this.modeOfPayment,
    required this.amount,
  });
  late final String modeOfPayment;
  late final double amount;

  SalesPayment.fromJson(Map<String, dynamic> json){
    modeOfPayment = json['mode_of_payment'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final _salesInvoiceData = <String, dynamic>{};
    _salesInvoiceData['mode_of_payment'] = modeOfPayment;
    _salesInvoiceData['amount'] = amount;
    return _salesInvoiceData;
  }
}