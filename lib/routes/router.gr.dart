// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';
import '../models/order.dart';
import '../pages/clothes/clothes_detail_page.dart';
import '../pages/clothes/clothes_list_page.dart';
import '../pages/customer/setting_page.dart';
import '../pages/dashboard_page.dart';
import '../pages/login_page.dart';
import '../pages/messages/create_message_page.dart';
import '../pages/messages/message_detail_page.dart';
import '../pages/messages/message_list_page.dart';
import '../pages/news/news_detail_page.dart';
import '../pages/news/news_list_page.dart';
import '../pages/order/create_order_page.dart';
import '../pages/order/order_detail_page.dart';
import '../pages/order/order_list_page.dart';
import '../pages/register_page.dart';

class Routes {
  static const String loginPage = '/';
  static const String registerPage = '/register-page';
  static const String dashboardPage = '/dashboard-page';
  static const String newsListPage = '/news-list-page';
  static const String newsDetailPage = '/news-detail-page';
  static const String clothesDetailPage = '/clothes-detail-page';
  static const String clothesListPage = '/clothes-list-page';
  static const String createOrderPage = '/create-order-page';
  static const String orderDetailPage = '/order-detail-page';
  static const String orderListPage = '/order-list-page';
  static const String createMessagePage = '/create-message-page';
  static const String settingPage = '/setting-page';
  static const String messageDetailPage = '/message-detail-page';
  static const String messageListPage = '/message-list-page';
  static const all = <String>{
    loginPage,
    registerPage,
    dashboardPage,
    newsListPage,
    newsDetailPage,
    clothesDetailPage,
    clothesListPage,
    createOrderPage,
    orderDetailPage,
    orderListPage,
    createMessagePage,
    settingPage,
    messageDetailPage,
    messageListPage,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.registerPage, page: RegisterPage),
    RouteDef(Routes.dashboardPage, page: DashboardPage),
    RouteDef(Routes.newsListPage, page: NewsListPage),
    RouteDef(Routes.newsDetailPage, page: NewsDetailPage),
    RouteDef(Routes.clothesDetailPage, page: ClothesDetailPage),
    RouteDef(Routes.clothesListPage, page: ClothesListPage),
    RouteDef(Routes.createOrderPage, page: CreateOrderPage),
    RouteDef(Routes.orderDetailPage, page: OrderDetailPage),
    RouteDef(Routes.orderListPage, page: OrderListPage),
    RouteDef(Routes.createMessagePage, page: CreateMessagePage),
    RouteDef(Routes.settingPage, page: SettingPage),
    RouteDef(Routes.messageDetailPage, page: MessageDetailPage),
    RouteDef(Routes.messageListPage, page: MessageListPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    RegisterPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterPage(),
        settings: data,
      );
    },
    DashboardPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardPage(),
        settings: data,
      );
    },
    NewsListPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => NewsListPage(),
        settings: data,
      );
    },
    NewsDetailPage: (data) {
      final args = data.getArgs<NewsDetailPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewsDetailPage(
          key: args.key,
          title: args.title,
          url: args.url,
        ),
        settings: data,
      );
    },
    ClothesDetailPage: (data) {
      final args = data.getArgs<ClothesDetailPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ClothesDetailPage(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
    ClothesListPage: (data) {
      final args = data.getArgs<ClothesListPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ClothesListPage(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
    CreateOrderPage: (data) {
      final args = data.getArgs<CreateOrderPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CreateOrderPage(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
    OrderDetailPage: (data) {
      final args = data.getArgs<OrderDetailPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => OrderDetailPage(
          key: args.key,
          order: args.order,
        ),
        settings: data,
      );
    },
    OrderListPage: (data) {
      final args = data.getArgs<OrderListPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => OrderListPage(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
    CreateMessagePage: (data) {
      final args = data.getArgs<CreateMessagePageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CreateMessagePage(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
    SettingPage: (data) {
      final args = data.getArgs<SettingPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SettingPage(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
    MessageDetailPage: (data) {
      final args = data.getArgs<MessageDetailPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => MessageDetailPage(
          key: args.key,
          userId: args.userId,
          message: args.message,
        ),
        settings: data,
      );
    },
    MessageListPage: (data) {
      final args = data.getArgs<MessageListPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MessageListPage(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NewsDetailPage arguments holder class
class NewsDetailPageArguments {
  final Key key;
  final String title;
  final String url;
  NewsDetailPageArguments({this.key, @required this.title, @required this.url});
}

/// ClothesDetailPage arguments holder class
class ClothesDetailPageArguments {
  final Key key;
  final String userId;
  ClothesDetailPageArguments({this.key, @required this.userId});
}

/// ClothesListPage arguments holder class
class ClothesListPageArguments {
  final Key key;
  final String userId;
  ClothesListPageArguments({this.key, @required this.userId});
}

/// CreateOrderPage arguments holder class
class CreateOrderPageArguments {
  final Key key;
  final String userId;
  CreateOrderPageArguments({this.key, @required this.userId});
}

/// OrderDetailPage arguments holder class
class OrderDetailPageArguments {
  final Key key;
  final Order order;
  OrderDetailPageArguments({this.key, @required this.order});
}

/// OrderListPage arguments holder class
class OrderListPageArguments {
  final Key key;
  final String userId;
  OrderListPageArguments({this.key, @required this.userId});
}

/// CreateMessagePage arguments holder class
class CreateMessagePageArguments {
  final Key key;
  final String userId;
  CreateMessagePageArguments({this.key, @required this.userId});
}

/// SettingPage arguments holder class
class SettingPageArguments {
  final Key key;
  final String userId;
  SettingPageArguments({this.key, @required this.userId});
}

/// MessageDetailPage arguments holder class
class MessageDetailPageArguments {
  final Key key;
  final String userId;
  final Message message;
  MessageDetailPageArguments(
      {this.key, @required this.userId, @required this.message});
}

/// MessageListPage arguments holder class
class MessageListPageArguments {
  final Key key;
  final String userId;
  MessageListPageArguments({this.key, @required this.userId});
}
