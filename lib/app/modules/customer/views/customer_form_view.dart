import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:leacc_pos/app/modules/common/views/action_button.dart';
import 'package:leacc_pos/app/modules/customer/providers/customer_provider.dart';

class CustomerFormView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
   CustomerFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer')),
      body: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              FormBuilderTextField(name: 'customer_name', decoration: FrappeInputDecoration(label: 'Customer Name', fieldIcons: const Icon(Icons.perm_identity))),
              FormBuilderTextField(name: 'mobile_no', decoration: FrappeInputDecoration(label: 'Phone Number', fieldIcons: const Icon(Icons.phone))),
              FormBuilderTextField(name: 'email_id',validator: FormBuilderValidators.compose([FormBuilderValidators.email(), FormBuilderValidators.required()]), decoration: FrappeInputDecoration(label: 'Email', fieldIcons: const Icon(Icons.email))),
            //  FormBuilderTextField(name: 'customer_name', decoration: FrappeInputDecoration(label: 'Address', fieldIcons: const Icon(Icons.home))),
             // FormBuilderTextField(name: 'customer_name', decoration: FrappeInputDecoration(label: 'PAN/VAT', fieldIcons: const Icon(Icons.app_registration))),
             // FormBuilderTextField(name: 'customer_name', decoration: FrappeInputDecoration(label: 'Geo Location', fieldIcons: const Icon(Icons.location_on))),
              FormBuilderDropdown(name: 'customer_type', items: ['Individual', 'Company']
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text('$e'),
              ))
                  .toList(),
                  decoration: FrappeInputDecoration(label: 'Customer Type', fieldIcons: const Icon(Icons.perm_identity))),
              FormBuilderDropdown(name: 'customer_group',items:  ['All Customer Groups']
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text('$e'),
              ))
                  .toList(), decoration: FrappeInputDecoration(label: 'Customer Group', fieldIcons: const Icon(Icons.perm_identity))),
              FormBuilderDropdown(name: 'territory', items: ['All Territories']
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text('$e'),
              ))
                  .toList(), decoration: FrappeInputDecoration(label: 'Territory', fieldIcons: const Icon(Icons.perm_identity))),
              FrappeActionButton(
                buttonText: 'Save',
                onPressed: () {
                  _formKey.currentState!.saveAndValidate();
                  print(_formKey.currentState!.value);
                  if(_formKey.currentState!.isValid){CustomerProvider().saveCustomer(_formKey.currentState!.value);};
                },
              ),
            ],
          )),
    );
  }

  InputDecoration FrappeInputDecoration({required String label, required Icon fieldIcons}){
    return InputDecoration(

        fillColor: Colors.grey[100],
        filled: true,
        border: OutlineInputBorder(),
        icon: fieldIcons,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.blue[600],
        )
    );
  }
}
