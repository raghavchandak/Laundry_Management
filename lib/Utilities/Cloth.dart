class Cloth {
  int price;
  String type;
  int count;

  Cloth({this.price,this.type,this.count = 0}) ;

  static List<Cloth> CLOTH_LIST = [
    Cloth(price: 14, type: 'Shirt'),
    Cloth(price: 12, type: 'T-Shirt'),
    Cloth(price: 15, type: 'Jeans'),
    Cloth(price: 11, type: 'Shorts'),
    Cloth(price: 15, type: 'Tracks'),
    Cloth(price: 30, type: 'Bedsheet'),
    Cloth(price: 4, type: 'Hanky'),
    Cloth(price: 10, type: 'Vest'),
    Cloth(price: 10, type: 'Underwear'),
    Cloth(price: 15, type: 'Towel'),
    Cloth(price: 8, type: 'Socks'),
    Cloth(price: 80, type: 'Shoes'),
    Cloth(price: 0, type: 'Misc')
  ];

  static int getTotal()
  {
    int total = 0;
    for(Cloth cloth in CLOTH_LIST)
      total +=  cloth.price * cloth.count;
    return total;
  }

}
