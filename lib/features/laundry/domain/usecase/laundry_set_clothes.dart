import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';
import 'package:nih_laundro/features/laundry/domain/repository/laundry_repository.dart';

class LaundrySetClothes
{
  final LaundryRepository repository;

  LaundrySetClothes({this.repository});

  void setClothes(LaundryClothDetails clothDetails)
  {
    repository.setClothes(clothDetails);
  }
}