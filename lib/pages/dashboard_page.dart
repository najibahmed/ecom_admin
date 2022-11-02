
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Auth/authservice.dart';
import '../customwidgets/dashboard_item_view.dart';
import '../models/dashboard_model.dart';
import '../providers/product_provider.dart';
import 'launcher_page.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName="/dashboard_page";
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context,listen: false).getAllCategory();
    return Scaffold(
      appBar: AppBar(
        title:const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: (){
              AuthService.logOut().then((value) =>
                  Navigator.pushReplacementNamed(context, LauncherPage.routeName),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: dashboardModelList.length,
        itemBuilder: (context,index)=>DashboardItemView(model: dashboardModelList[index]),
      ),
    );
  }
}
