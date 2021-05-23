import 'package:flutter/material.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/pages/product_detail_page.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
//    "/productDetail": (BuildContext context) =>
    Constants.ROUTE_PRODUCT_DETAIL: (BuildContext context) =>
        ProductDetailPage(),
  };
}
