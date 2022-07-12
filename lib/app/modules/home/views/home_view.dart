import 'package:flutter/material.dart';
import 'package:leacc_pos/app/modules/customer/views/customer_view.dart';
import 'package:leacc_pos/app/modules/ledger/views/ledger_view.dart';
import 'package:leacc_pos/app/modules/payment/views/payment_view.dart';
import 'package:leacc_pos/app/modules/sales_order/views/sales_order_view.dart';

import '../../login/views/login_view.dart';
import '../../sales/views/sales_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    LoginView(),
    CustomerView(),
    SalesOrderView(),
    PaymentView(),
   // HomeView(),
    SalesView(),
    LedgerView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: currentIndex,
        children: widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // selectedIconTheme:IconThemeData(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Customer'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_calendar), label: 'Sales Order'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Payment'),
       //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Sales'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: 'Ledger')
        ],
      ),
    );
  }
}
