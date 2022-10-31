import 'package:ecom_admin_08/pages/add_product_page.dart';
import 'package:ecom_admin_08/pages/category_page.dart';
import 'package:ecom_admin_08/pages/dashboard_page.dart';
import 'package:ecom_admin_08/pages/launcher_page.dart';
import 'package:ecom_admin_08/pages/login_page.dart';
import 'package:ecom_admin_08/pages/order_page.dart';
import 'package:ecom_admin_08/pages/product_details_page.dart';
import 'package:ecom_admin_08/pages/product_repurchase_page.dart';
import 'package:ecom_admin_08/pages/report_page.dart';
import 'package:ecom_admin_08/pages/settings_page.dart';
import 'package:ecom_admin_08/pages/user_list_page.dart';
import 'package:ecom_admin_08/pages/view_product_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName:(_)=> const LauncherPage(),
        LoginPage.routeName:(_)=> const LoginPage(),
        DashboardPage.routeName:(_)=> const DashboardPage(),
        AddProductPage.routeName:(_)=> const AddProductPage(),
        ViewProduct.routeName:(_)=> const ViewProduct(),
        ProductDetails.routeName:(_)=> const ProductDetails(),
        CategoryPage.routeName:(_)=> const CategoryPage(),
        OrderPage.routeName:(_)=> const OrderPage(),
        ReportPage.routeName:(_)=> const ReportPage(),
        Settings.routeName:(_)=> const Settings(),
        ProductRepurchase.routeName:(_)=> const ProductRepurchase(),
        UserList.routeName:(_)=> const UserList(),


      },
    );
  }
}


