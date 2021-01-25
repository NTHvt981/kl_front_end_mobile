import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:do_an_ui/pages/clothes/clothes_list_page.dart';
import 'package:do_an_ui/pages/clothes/clothes_detail_page.dart';
import 'package:do_an_ui/pages/customer/setting_page.dart';
import 'package:do_an_ui/pages/dashboard_page.dart';
import 'package:do_an_ui/pages/login_page.dart';
import 'package:do_an_ui/pages/messages/create_message_page.dart';
import 'package:do_an_ui/pages/messages/message_detail_page.dart';
import 'package:do_an_ui/pages/messages/message_list_page.dart';
import 'package:do_an_ui/pages/news/news_detail_page.dart';
import 'package:do_an_ui/pages/news/news_list_page.dart';
import 'package:do_an_ui/pages/order/create_order_page.dart';
import 'package:do_an_ui/pages/order/order_detail_page.dart';
import 'package:do_an_ui/pages/order/order_list_page.dart';
import 'package:do_an_ui/pages/register_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: LoginPage, initial: true),

  MaterialRoute(
      page: RegisterPage
  ),
  MaterialRoute(page: DashboardPage),

  CustomRoute(
      page: NewsListPage,
      transitionsBuilder: null
  ),
  MaterialRoute(page: NewsDetailPage),

  CustomRoute(
      page: ClothesDetailPage,
      transitionsBuilder: null
  ),
  CustomRoute(
      page: ClothesListPage,
      transitionsBuilder: null
  ),

  CustomRoute(
      page: CreateOrderPage,
      transitionsBuilder: null
  ),
  MaterialRoute(
      page: OrderDetailPage
  ),
  CustomRoute(
      page: OrderListPage,
      transitionsBuilder: null
  ),

  CustomRoute(
      page: CreateMessagePage,
      transitionsBuilder: null
  ),
  CustomRoute(
      page: SettingPage,
      transitionsBuilder: null
  ),
  MaterialRoute(
      page: MessageDetailPage
  ),
  CustomRoute(
      page: MessageListPage,
      transitionsBuilder: null
  ),
])
class $MyRouter {
}