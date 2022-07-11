import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex =0;
    // TODO: implement initState
    super.initState();
  }



  static const List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',

    ),
    Text(
      'Index 1: Business',

    ),
    Text(
      'Index 3: School',

    ),
    Text(
      'Index 4: School',

    ),
    Text(
      'Index 5: School',

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:  IndexedStack(
        index: currentIndex,
        children: widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
       // selectedIconTheme:IconThemeData(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => setState(()=>currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Customer'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Payment'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Sales'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Ledger'
          )
        ],

      ),

    );
  }
}


