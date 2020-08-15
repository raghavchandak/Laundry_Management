import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';

class LaundryClothDetailsModel extends LaundryClothDetails
{
  final String clothname;
  final int price;
  final int quantity;

  LaundryClothDetailsModel({this.clothname, this.price, this.quantity});
}