import 'package:auto_route/auto_route.dart' as route;
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:do_an_ui/routes/router.gr.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String userId = '';

  @override
  void initState() {
    super.initState();

    auth.authStateChanges().listen((user) {
      if (user == null)
        ExtendedNavigator.root.pop();
      else
        setState(() {
          userId = user.uid;
        });
    });
  }

  void goToNewsList() {
    route.ExtendedNavigator.root.replace(Routes.newsListPage);
  }

  void goToClothesDetails() {
    ExtendedNavigator.root.replace(Routes.clothesDetailPage,
        arguments: ClothesDetailPageArguments(userId: userId));
  }

  void goToClothesList() {
    ExtendedNavigator.root.replace(Routes.clothesListPage,
        arguments: ClothesListPageArguments(userId: userId));
  }

  void goToOrderList() {
    ExtendedNavigator.root.replace(Routes.orderListPage,
        arguments: OrderListPageArguments(userId: userId));
  }

  void goToMessageList() {
    ExtendedNavigator.root.replace(Routes.messageListPage,
        arguments: MessageListPageArguments(userId: userId));
  }

  void goToCreateMessage() {
    ExtendedNavigator.root.push(Routes.createMessagePage,
        arguments: CreateMessagePageArguments(userId: userId));
  }

  void logOut() {
    auth.signOut().then((value) {

      route.ExtendedNavigator.root.popUntilPath(Routes.loginPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ), child: null,
          ),
          ListTile(
            leading: Icon(FontAwesome.newspaper_o),
            title: Text('Checkout the news!'),
            onTap: goToNewsList
          ),
          Divider(),
          ListTile(
            leading: Icon(Ionicons.ios_shirt),
            title: Text('Customize your costume :)'),
            onTap: goToClothesDetails
          ),
          ListTile(
              leading: Icon(MaterialCommunityIcons.wardrobe),
              title: Text('See your wardrobe :p'),
              onTap: goToClothesList
          ),
          Divider(),
          ListTile(
              leading: Icon(Feather.package),
              title: Text('What have you ordered ?'),
              onTap: goToOrderList
          ),
          Divider(),
          ListTile(
              leading: Icon(MaterialIcons.question_answer),
              title: Text('Have a problem with what you ordered ?\nSend a message'),
              onTap: goToCreateMessage
          ),
          ListTile(
              leading: Icon(Feather.mail),
              title: Text('View all of your messages here.'),
              onTap: goToMessageList
          ),
          Divider(),
          ListTile(
              leading: Icon(AntDesign.logout),
              title: Text('Feel tired? log out.'),
              onTap: logOut
          ),
        ],
      ),
    );
  }
}
