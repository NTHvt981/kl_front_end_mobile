const ID = 'Ma';
const ORDER_ID = 'MaDonHang';
const ITEM_ID = 'MaPhuKien';

const NAME = 'Ten';
const IMAGE_URL = 'Hinh';
const PRICE = 'Gia';

class OrderDetail {
  String id;
  String orderId;
  String itemId;
  String imageUrl;

  String name;
  int price;

  OrderDetail();

  Map<String, dynamic> toMap() => {
    ID: id,
    ORDER_ID: orderId,
    ITEM_ID: itemId,
    IMAGE_URL: imageUrl,
    NAME: name,
    PRICE: price
  };

  OrderDetail.fromMap(Map<String, dynamic> map):
        assert(map[ID] != null),
        id = map[ID],
        orderId = map[ORDER_ID],
        itemId = map[ITEM_ID],
        imageUrl = map[IMAGE_URL],
        name = map[NAME],
        price = map[PRICE];
}