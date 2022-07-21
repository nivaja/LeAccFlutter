import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/http/http.dart';
import 'app/routes/app_pages.dart';

void main() async{

  await GetStorage.init('Config');
  await initApiConfig();
  runApp(
    GetMaterialApp(
      supportedLocales: const [
        Locale('en'),
      ],
      localizationsDelegates: const [
         GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      builder: EasyLoading.init(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );

}
