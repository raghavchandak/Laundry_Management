import 'package:dartz/dartz.dart';
import 'package:nih_laundro/core/failure.dart';
import 'package:nih_laundro/features/laundry/data/datasources/laundry_datasource.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_total_summary.dart';
import 'package:nih_laundro/features/laundry/domain/repository/laundry_repository.dart';

class LaundryRepositoryImpl implements LaundryRepository
{
  final LaundryDataSource datasource;

  LaundryRepositoryImpl({this.datasource});

  @override
  Future<void> setClothes(LaundryClothDetails clothDetails) async {
    await datasource.setClothes(clothDetails);
  }

  @override
  Future<Either<Failure, LaundryTotalSummary>> getClothes() async{
    return Right(await datasource.getClothes());
  }
}