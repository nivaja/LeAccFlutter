import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ledger_controller.dart';

class LedgerView extends GetView<LedgerController> {
  const LedgerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LedgerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LedgerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
