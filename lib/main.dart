import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jala_verification/app/utils/theme.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      GetMaterialApp(
        title: "Jala Verification",
        theme: AppTheme.appTheme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
