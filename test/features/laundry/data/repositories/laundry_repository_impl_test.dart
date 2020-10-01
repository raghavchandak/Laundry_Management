import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nih_laundro/features/laundry/data/datamodels/laundry_total_summary_model.dart';
import 'package:nih_laundro/features/laundry/data/datasources/laundry_datasource.dart';
import 'package:nih_laundro/features/laundry/data/repository/laundry_repository_impl.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_cloth_details.dart';

class MockLaundryDataSource extends Mock implements LaundryDataSource {}

void main() {
  MockLaundryDataSource mockLaundryDataSource;
  LaundryRepositoryImpl repository;

  setUp(() {
    mockLaundryDataSource = MockLaundryDataSource();
    repository = LaundryRepositoryImpl(datasource: mockLaundryDataSource);
  });

  group('setClothes', () {
    final tLaundryClothDetails =
        LaundryClothDetails(clothname: 'Any', price: 1, quantity: 1);

    test(
      'should store clothes in database',
      () async {
        // act
        repository.setClothes(tLaundryClothDetails);
        // assert
        verify(mockLaundryDataSource.setClothes(tLaundryClothDetails));
      },
    );
  });

  group('getClothes', () {
    final tLaundryTotalSummaryModel =
        LaundryTotalSummaryModel(clothList: ['Shirt', 'Pant'], total: 100);

    test(
      'should return total summary',
      () async {
        // arrange
        when(mockLaundryDataSource.getClothes())
            .thenAnswer((_) async => tLaundryTotalSummaryModel);
        // act
        final result = await repository.getClothes();
        // assert
        expect(result, Right(tLaundryTotalSummaryModel));
      },
    );
  });
}
