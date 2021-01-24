import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_ui/bloc/create_order_bloc.dart';
import 'package:do_an_ui/models/order.dart';
import 'package:do_an_ui/models/order_detail.dart';
import 'package:do_an_ui/pages/constraints.dart';
import 'package:do_an_ui/pages/order/ordered_item_list.dart';
import 'package:do_an_ui/routes/router.gr.dart';
import 'package:do_an_ui/services/order_detail_service.dart';
import 'package:do_an_ui/services/order_service.dart';
import 'package:do_an_ui/shared/clothes_bottom_navigation.dart';
import 'package:do_an_ui/shared/drawer.dart';
import 'package:do_an_ui/models/item.dart';
import 'package:do_an_ui/services/local_item_service.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CreateOrderPage extends StatefulWidget {
  final String userId;

  CreateOrderPage({
    Key key,
    @required this.userId
}): super(key: key);

  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  List<Item> orderedItems = [];
  int totalCost = 0;

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  CreateOrderBloc bloc = CreateOrderBloc();

  @override
  void initState() {
    super.initState();

    localItemService.forEach((key, s) {
      Item item = s.itemBehavior.value;

      if (item != null)
        {
          orderedItems.add(item);
          totalCost += item.price;
        }
    });

    if (orderedItems.isEmpty) {
      // Toast.show('There are no item to purchase', context,
      //     duration: Toast.LENGTH_SHORT,
      //     gravity: Toast.BOTTOM);

      // ExtendedNavigator.root.replace(Routes.clothesDetailPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total cost: ' + formatMoney(totalCost)),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(child: OrderedItemList(data: orderedItems), flex: 1,),
          Divider(color: Colors.blue, thickness: 2,),
          Expanded(flex: 1, child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
            child: ListView(children: [
              StreamBuilder(
                stream: bloc.nameStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'What is your name?',
                      errorText: snapshot.hasError? snapshot.error: null
                    ),
                  );
                }
              ),
              StreamBuilder(
                stream: bloc.phoneStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'What is your phone number?',
                      errorText: snapshot.hasError? snapshot.error: null
                    ),
                  );
                }
              ),
              StreamBuilder(
                stream: bloc.addressStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: addressController,
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Where should we send you?',
                      errorText: snapshot.hasError? snapshot.error: null
                    ),
                  );
                }
              ),
              ],),
          ),),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: createOrder,
              child: Text('ORDER'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
            ),
          )
        ],),
      ),
      bottomNavigationBar: ClothesBottomNavigation(index: CREATE_ORDER_PAGE,),
    );
  }

  void createOrder() {
    if (bloc.isValidInfo(nameController.text, phoneController.text, addressController.text))
      {
        Order order = new Order();
        order.id = orderService.getId();
        order.userId = widget.userId;

        order.userName = nameController.text;
        order.phoneNumber = phoneController.text;
        order.address = addressController.text;

        order.createdTime = Timestamp.now();
        order.state = ORDER_STATE_INIT;
        order.total = totalCost;

        orderService.create(order).then((value) => {
          Toast.show('Order successfully!', context,
              duration: Toast.LENGTH_SHORT,
              gravity: Toast.BOTTOM)
        });

        orderedItems.forEach((item) {
          OrderDetail orderDetail = new OrderDetail();
          orderDetail.id = orderService.getId();
          orderDetail.orderId = order.id;
          orderDetail.itemId = item.id;

          orderDetail.imageUrl = item.imageUrl;
          orderDetail.name = item.name;
          orderDetail.price = item.price;

          orderDetailService.create(orderDetail);
        });
      }
  }
}


