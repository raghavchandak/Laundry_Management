import 'package:dartz/dartz.dart';
import 'package:nih_laundro/core/failure.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_total_summary.dart';
import 'package:nih_laundro/features/laundry/domain/repository/laundry_repository.dart';

class LaundryGetClothes
{
  final LaundryRepository repository;

  LaundryGetClothes({this.repository});

  Future<Either<Failure,LaundryTotalSummary>> getClothes() async
  {
    return await repository.getClothes();
  }
}