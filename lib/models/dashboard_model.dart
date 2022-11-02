

import 'package:ecom_admin_08/pages/add_product_page.dart';
import 'package:ecom_admin_08/pages/category_page.dart';
import 'package:ecom_admin_08/pages/order_page.dart';
import 'package:ecom_admin_08/pages/report_page.dart';
import 'package:ecom_admin_08/pages/settings_page.dart';
import 'package:ecom_admin_08/pages/user_list_page.dart';
import 'package:ecom_admin_08/pages/view_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardModel{
  final String title;
  final IconData iconData;
  final String routeName;

  const DashboardModel({
    required this.title,
    required this.iconData,
    required this.routeName
  });
}
  const List<DashboardModel> dashboardModelList=[

    DashboardModel(title: "Add Product", iconData: Icons.add , routeName: AddProductPage.routeName),
    DashboardModel(title: "View Product", iconData: Icons.card_giftcard , routeName: ViewProductPage.routeName),
    DashboardModel(title: "Categories", iconData: Icons.category , routeName: CategoryPage.routeName),
    DashboardModel(title: "Orders", iconData: Icons.access_time_filled , routeName: OrderListPage.routeName),
    DashboardModel(title: "Users", iconData: Icons.person , routeName: UserList.routeName),
    DashboardModel(title: "Settings", iconData: Icons.settings , routeName: Settings.routeName),
    DashboardModel(title: "Report", iconData: Icons.report , routeName: ReportPage.routeName),

  ];

