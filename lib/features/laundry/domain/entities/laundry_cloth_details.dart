import 'package:equatable/equatable.dart';

class LaundryClothDetails extends Equatable
{
  final String clothname;
  final int price;
  final int quantity;

  LaundryClothDetails({this.clothname, this.price, this.quantity});

  @override
  List<Object> get props => [clothname, price,quantity];
}