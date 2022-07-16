import 'package:get/get.dart';
import 'package:leacc_pos/app/modules/customer/customer_model_model.dart';
import 'package:leacc_pos/app/modules/customer/providers/customer_provider.dart';

class CustomerController extends GetxController{
  //TODO: Implement CustomerController

  RxList<Customer> customerList = <Customer>[].obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> endOfReults = false.obs;
  @override
  void onInit() async{
    super.onInit();
   getCustomers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void refresh(){
    customerList.clear();
    getCustomers();

  }

  void getCustomers({int start=0, int length=10}) async{
   try{
     isLoading(true);
     List<Customer> customers = await CustomerProvider().getCustomerList(start,length);
     endOfReults(customers.isEmpty);
     customerList.addAll(customers);
   }finally{
     isLoading(false);
   }
  }
}
