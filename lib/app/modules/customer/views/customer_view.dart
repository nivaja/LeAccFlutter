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
        child: Expanded(
            child: ListView(shrinkWrap: true, children: [
          FrappeTextField('Customer Id', Icon(Icons.perm_contact_cal)),
          FrappeTextField('Customer Name', Icon(Icons.perm_identity)),
          FrappeTextField('Phone 1', Icon(Icons.phone)),
          FrappeTextField('Phone 2 (Optional)', Icon(Icons.phone_android)),
          FrappeTextField('Email (Optional)', Icon(Icons.email)),
          FrappeTextField('Address', Icon(Icons.home)),
          FrappeTextField('Pan/VAT Number', Icon(Icons.app_registration)),
          FrappeTextField('Geo Location', Icon(Icons.location_on)),
          FrappeDropdownField(
            dropdownFieldIcons: Icon(Icons.person),
            dropdownList: ['Wholesale', 'Retail'],
            hint: 'Select Customer',
          ),
          Padding(padding: EdgeInsets.all(14)),
          FrappeNavigationButton(
            buttonText: 'Save',
            onPressed: () {},
          ),
        ])),
      ),
    );
  }
}
