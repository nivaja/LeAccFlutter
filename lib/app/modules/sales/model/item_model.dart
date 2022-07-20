
class Item {
  Item({
    required this.itemCode,
    required this.qty,
    required this.rate,
  });
  late final String itemCode;
  late final double qty;
  late final double rate;



  Item.fromJson(Map<String, dynamic> json){
    itemCode = json['item_code'];
    qty = json['qty'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item_code'] = itemCode;
    _data['qty'] = qty;
    _data['rate'] = rate;
    return _data;
  }
}