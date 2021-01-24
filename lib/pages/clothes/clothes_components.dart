import 'package:do_an_ui/models/item.dart';
import 'package:do_an_ui/pages/constraints.dart';
import 'package:do_an_ui/services/local_item_service.dart';
import 'package:flutter/material.dart';

///Movable item
class MovableItem extends StatefulWidget {
  final double width;
  final double height;
  final String type;
  final String imageUrl;
  final Function(String _type) onPress;
  final Function(MovableItem _this) onPositionPress;
  
  MovableItem({
    Key key,
    @required this.width,
    @required this.height,
    @required this.type,
    @required this.imageUrl,
    @required this.onPress,
    @required this.onPositionPress
}): super(key: key);

  @override
  _MovableItemState createState() => _MovableItemState(type);
}

class _MovableItemState extends State<MovableItem> {
  Offset hatOffset = Offset(0, 0);
  LocalItemService service;
  Item item;
  
  _MovableItemState(String _type) {
    service = localItemService[_type];

    switch (_type)
    {
      case HAT:
        hatOffset = Offset(150, 75);
        break;
      case SHIRT:
        hatOffset = Offset(110, 130);
        break;
      case PANTS:
        hatOffset = Offset(100, 260);
        break;

      case SHOES:
        hatOffset = Offset(150, 400);
        break;
      case BACKPACK:
        hatOffset = Offset(250, 200);
        break;
    }

    service.getStream().listen((_) {
      if (mounted)
        setState(() {
          item = _;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    var image = (item == null)
        ? Image.asset(widget.imageUrl, width: widget.width, height: widget.height,)
        : Image.network(item.imageUrl, width: widget.width, height: widget.height,);

    return Positioned(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTapDown: (details) {
              widget.onPositionPress(widget);
            },
            onPanUpdate: (details) {
              setState(() {
                hatOffset = Offset(hatOffset.dx + details.delta.dx, hatOffset.dy + details.delta.dy);
              });
            },
            child: Icon(Icons.highlight_remove_outlined, size: 25,)
          ),
          GestureDetector(
            onTapDown: (details) {
              widget.onPress(widget.type);
            },
            child: image
          ),
        ],
      ),
      left: hatOffset.dx,
      top: hatOffset.dy,
    );
  }
}

class ItemToChooseList extends StatelessWidget {
  final List<Item> data;

  ItemToChooseList({
    Key key,
    @required this.data
}): super(key: key);

  chooseItem(int pos) {
    String type = data[pos].type;
    localItemService[type].set(data[pos]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 300,
      child: ListView.separated(
        itemBuilder: (context, position) {
          return Column(
            children: [ListTile(
              leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: Image.network(data[position].imageUrl),
              ),
              onTap: () {
                chooseItem(position);
              },),
              Text( formatMoney(data[position].price))
            ]
          );
        },
        itemCount: data.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}