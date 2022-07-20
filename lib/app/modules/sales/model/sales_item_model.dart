class SalesItem {
  SalesItem({
    required this.itemCode,
    required this.itemName,
    required this.description,
    required this.stockUom,
    this.itemImage,
  this.priceListRate,
   this.currency,
    required this.actualQty,
  });

  late final String itemCode;
  late final String itemName;
  late final String description;
  late final String stockUom;
   double selectedQuantity =0;
  String? itemImage;
    double? priceListRate;
    String? currency;
  late final double actualQty;

  SalesItem.fromJson(Map<String, dynamic> json) {
    itemCode = json['item_code'];
    itemName = json['item_name'];
    description = json['description'];
    stockUom = json['stock_uom'];
    itemImage = json['item_image'];
    priceListRate = double.tryParse(json['price_list_rate'].toString());
    currency = json['currency'];
    actualQty = double.tryParse(json['actual_qty'].toString())??0.0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item_code'] = itemCode;
    _data['rate'] = priceListRate;
    _data['qty'] = selectedQuantity;
    return _data;
  }
}
