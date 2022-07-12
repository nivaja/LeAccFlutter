import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/views/action_button.dart';
import '../../common/views/dropdown_field_widget.dart';
import '../../common/views/input_field_widget.dart';
import '../controllers/customer_controller.dart';

class CustomerView extends GetView<CustomerController> {
  const CustomerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),

        child:
        Expanded(
            child : ListView(
                shrinkWrap: true,
                children: [
                  FrappeTextField('Customer Id', Icon(Icons.perm_contact_cal)),
                  Padding(padding: EdgeInsets.all(8)),
                  FrappeTextField('Customer Name', Icon(Icons.perm_identity)),
                  Padding(padding: EdgeInsets.all(8)),
                  FrappeTextField('Phone 1', Icon(Icons.phone)),
                  Padding(padding: EdgeInsets.all(8)),
                  FrappeTextField('Phone 2 (Optional)', Icon(Icons.phone_android)),
                  Padding(padding: EdgeInsets.all(8)),
                  FrappeTextField('Email (Optional)', Icon(Icons.email)),
                  Padding(padding: EdgeInsets.all(8)),
                  FrappeTextField('Address', Icon(Icons.home)),
                  Padding(padding: EdgeInsets.all(8)),
                  FrappeTextField('Pan/VAT Number', Icon(Icons.app_registration)),
                  Padding(padding: EdgeInsets.all(8)),
                  FrappeTextField('Geo Location', Icon(Icons.location_on)),
                  Padding(padding: EdgeInsets.all(14)),

                  FrappeDropdownField(dropdownFieldIcons: Icon(Icons.person), dropdownList: ['Type Of Customer', 'Wholesale', 'Retail'], ),
                  Padding(padding: EdgeInsets.all(14)),

                  FrappeNavigationButton('Save'),
                ]
            )
        ),
      ),
    );
  }
}
