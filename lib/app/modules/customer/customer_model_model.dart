class Customer {
  int? docstatus;
  String? pan;
  String? name;
  String? customerName;
  String? customerType;
  String? customerGroup;
  int? phoneNumber;
  String? territory;
  String? email;

  Customer(
      {this.docstatus,
      this.pan,
      this.name,
      this.customerName,
      this.customerType,
      this.customerGroup,
      this.phoneNumber,
      this.territory,
      this.email});

  Customer.fromJson(Map<String, dynamic> json) {
    docstatus = json['docstatus'];
    pan = json['pan'];
    name = json['name'];
    customerName = json['customer_name'];
    customerType = json['customer_type'];
    customerGroup = json['customer_group'];
    phoneNumber = json['mobile_no'];
    territory = json['territory'];
    email = json['email_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['docstatus'] = docstatus;
    data['pan'] = pan;
    data['name'] = name;
    data['customer_name'] = customerName;
    data['customer_type'] = customerType;
    data['customer_group'] = customerGroup;
    data['mobile_no'] = phoneNumber;
    data['territory'] = territory;
    data['email_id'] = email;
    return data;
  }
}
