import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';
import 'package:nih_laundro/features/laundry/domain/repository/laundry_repository.dart';
import 'package:nih_laundro/features/laundry/domain/usecase/laundry_set_clothes.dart';

class MockLaundryRepository extends Mock implements LaundryRepository{}

void main()
{
  LaundryRepository repository;
  LaundrySetClothes setClothes;

  setUp((){
    repository = MockLaundryRepository();
    setClothes = LaundrySetClothes(repository: repository);
  });

  final tLaundryClothDetails = LaundryClothDetails(clothname: 'Any',price: 1,quantity: 1);

  test(
    'should set clothes to the repository',
    ()async {
      // act
      setClothes.setClothes(tLaundryClothDetails);
      // assert
      verify(repository.setClothes(tLaundryClothDetails));
    },
  );
}