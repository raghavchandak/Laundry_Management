import 'package:dartz/dartz.dart';
import 'package:nih_laundro/core/failure.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_total_summary.dart';

abstract class LaundryRepository
{
  Future<void> setClothes(LaundryClothDetails clothDetails);
  Future<Either<Failure,LaundryTotalSummary>> getClothes();
}