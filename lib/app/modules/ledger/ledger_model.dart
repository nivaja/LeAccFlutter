class Ledger {
  Ledger({
    this.postingDate,
    this.party,
    this.voucherType,
    this.voucherNo,
    this.againstVoucher,
    required this.debit,
    required this.credit,
    required this.balance,
  });
  String? postingDate;
  String? party;
  String? voucherType;
  String? voucherNo;
  String? againstVoucher;
  late final double debit;
  late final double credit;
  late final double balance;

  Ledger.fromJson(Map<String, dynamic> json){
    postingDate = json['posting_date'];
    party = json['party'];
    voucherType = json['voucher_type'];
    voucherNo = json['voucher_no'];
    againstVoucher = json['against_voucher'];
    debit = json['debit'];
    credit = json['credit'];
    balance = json['balance'];
  }
}