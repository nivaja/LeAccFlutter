import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leacc_pos/app/modules/sales/model/sales_item_model.dart';

class FrappeItemCard extends StatelessWidget {
  final SalesItem item;

  const FrappeItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
      child: Badge(
        showBadge: item.selectedQuantity > 0,
        badgeContent: Text(
          item.selectedQuantity.toString(),
          style: TextStyle(fontSize: 10, color: Colors.white),
        ),
        child: Container(
          width: double.infinity,
          child: Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: item.itemImage != null
                        ? Image.network(
                            '${GetStorage('Config').read('baseUrl')}${item.itemImage}',
                            height: 110,
                            width: 160,
                            fit: BoxFit.cover,
                          )
                        : Initicon(
                            text: item.itemName,
                            borderRadius: BorderRadius.zero,
                            backgroundColor: Colors.grey.shade200,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.itemCode,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[600],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '${item.currency} ${item.priceListRate}',
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
