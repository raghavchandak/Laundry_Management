import 'package:flutter/foundation.dart';

//!Creating basic model of object

class Cloth {
  final String clothName;
  final int price;
  int count;

  Cloth({this.clothName, this.price, this.count = 0});

  Cloth copyWith({String clothName, int price, int count}) {
    return Cloth(
        clothName: clothName ?? this.clothName,
        price: price ?? this.price,
        count: count ?? this.count);
  }

  Cloth.fromJson(Map json)
      : clothName = json['clothName'],
        price = json['price'],
        count = json['count'];

  Map toJson() => {
        'clothName': clothName,
        'price': (price as int),
        'count': (count as int)
      };
}

//!Appstate holds the entire state of the app in a single object

class AppState {
  final List<Cloth> clothes; //State of the app is defined by a list of clothes

  AppState({@required this.clothes});

  AppState.initialState()
      : clothes = [
          Cloth(price: 14, clothName: 'Shirt'),
          Cloth(price: 12, clothName: 'T-Shirt'),
          Cloth(price: 15, clothName: 'Jeans'),
          Cloth(price: 11, clothName: 'Shorts'),
          Cloth(price: 15, clothName: 'Tracks'),
          Cloth(price: 30, clothName: 'Bedsheet'),
          Cloth(price: 4, clothName: 'Hanky'),
          Cloth(price: 10, clothName: 'Vest'),
          Cloth(price: 10, clothName: 'Underwear'),
          Cloth(price: 15, clothName: 'Towel'),
          Cloth(price: 8, clothName: 'Socks'),
          Cloth(price: 80, clothName: 'Shoes'),
          Cloth(price: 0, clothName: 'Misc')
        ];

  AppState.fromJson(Map json)
      : clothes = (json['clothes'] as List)
            .map((cloth) => Cloth.fromJson(cloth))
            .toList();

  Map toJson() => {
        ['clothes']: clothes
      };
}
