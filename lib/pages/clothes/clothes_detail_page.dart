import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_ui/main.dart';
import 'package:do_an_ui/models/item.dart';
import 'package:do_an_ui/pages/clothes/clothes_components.dart';
import 'package:do_an_ui/pages/clothes/select_item_dialog.dart';
import 'package:do_an_ui/routes/router.gr.dart';
import 'package:do_an_ui/services/clothes_collection_service.dart';
import 'package:do_an_ui/services/item_service.dart';
import 'package:do_an_ui/services/local_item_service.dart';
import 'package:do_an_ui/shared/clothes_bottom_navigation.dart';
import 'package:do_an_ui/shared/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class ClothesDetailPage extends StatefulWidget {
  final String userId;

  ClothesDetailPage({
    Key key,
    @required this.userId
  }): super(key: key);

  @override
  _ClothesDetailPageState createState() => _ClothesDetailPageState();
}

class _ClothesDetailPageState extends State<ClothesDetailPage> {
  Offset hatOffset = Offset(150, 75);
  bool showItemPanel = false;

  List<MovableItem> itemList = [];
  List<Item> allItems = [];
  List<Item> displayedItems = [];

  ScreenshotController screenshotController = ScreenshotController();

  FirebaseStorage storage = FirebaseStorage.instance;

  final List<String> bgUrls = [

  ];

  @override
  void initState() {
    super.initState();
    itemService.readAllLive().listen((items) {
      setState(() {
        allItems = items;
      });
    });

    setItemList();
  }

  void onItemPress(String _type) {

    List<Item> _displayedItems = [];
    allItems.forEach((item) {
      if (item.type == _type)
        _displayedItems.add(item);
    });

    SelectItemDialogHelper.show(context, _displayedItems, _type);
  }

  void onItemMovePress(MovableItem caller) {
    setState(() {
      itemList.remove(caller);
      itemList.add(caller);
    });
  }

  void reNewAllItems() {
    localItemService.forEach((key, value) {
      value.clear();
    });
  }

  void saveCollection() {
    String randomId = Timestamp.now().nanoseconds.toString();
    String uid = FirebaseAuth.instance.currentUser.uid;

    screenshotController.capture().then((file) {
      storage.ref('QuanAo/$randomId.png').putFile(file).then((snapshot) async {
        String imageUrl = await snapshot.ref.getDownloadURL().then((value) => value);

        log('upload file success, url: $imageUrl');

        clothesCollectionService.create(uid, imageUrl);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Wardrobe!'),
        actions: [
          IconButton(icon: Icon(MyApp.ic_renew), onPressed: reNewAllItems),
          IconButton(icon: Icon(Icons.save), onPressed: saveCollection),
        ],
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Screenshot(
          controller: screenshotController,
          child: Stack(
            children: [
              // Positioned(
              //   child: Image.asset('images/bg/bg-1.jpg',
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,),
              //   left: 0, top: 0,),

              ...itemList,
              // Positioned(
              //   child: ItemToChooseList(
              //     data: displayedItems,
              //   ),
              //   left: 0,
              //   top: 0,
              // ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        onPressed: () {},
      ),
      bottomNavigationBar: ClothesBottomNavigation(index: CLOTHES_DETAIL_PAGE,),
    );
  }

  void setItemList() {
    itemList.add(MovableItem(
      key: GlobalKey(),
      type: HAT,
      width: 50,
      height: 50,
      onPress: onItemPress,
      onPositionPress: onItemMovePress,
      imageUrl: 'images/icon_clothes_hat.png',
    ));

    itemList.add(MovableItem(
      key: GlobalKey(),
      type: SHIRT,
      width: 125,
      height: 125,
      onPress: onItemPress,
      onPositionPress: onItemMovePress,
      imageUrl: 'images/icon_clothes_shirt.png',
    ));

    itemList.add(MovableItem(
      key: GlobalKey(),
      type: PANTS,
      width: 150,
      height: 150,
      onPress: onItemPress,
      onPositionPress: onItemMovePress,
      imageUrl: 'images/icon_clothes_pants.png',
    ));
    itemList.add(MovableItem(
      key: GlobalKey(),
      type: SHOES,
      width: 50,
      height: 50,
      onPress: onItemPress,
      onPositionPress: onItemMovePress,
      imageUrl: 'images/icon_clothes_shoes.png',
    ));
    itemList.add(MovableItem(
      key: GlobalKey(),
      type: BACKPACK,
      width: 75,
      height: 75,
      onPress: onItemPress,
      onPositionPress: onItemMovePress,
      imageUrl: 'images/icon_clothes_backpack.png',
    )); //Backpack
  }
}
