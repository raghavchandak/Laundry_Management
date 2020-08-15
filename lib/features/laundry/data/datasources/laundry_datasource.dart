import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_total_summary.dart';

abstract class LaundryDataSource
{
  Future<void> setClothes(LaundryClothDetails clothDetails);
  Future<LaundryTotalSummary> getClothes();
}