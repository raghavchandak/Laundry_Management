import 'package:flutter_test/flutter_test.dart';
import 'package:nih_laundro/features/laundry/data/datamodels/laundry_cloth_details_model.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';

void main() {
  final tLaundryClothDetailsModel =
      LaundryClothDetailsModel(clothname: 'Any', price: 1, quantity: 1);

  test(
    'should be a subclass of entity',
    () async {
      // assert
      expect(tLaundryClothDetailsModel, isA<LaundryClothDetails>());
    },
  );
}
