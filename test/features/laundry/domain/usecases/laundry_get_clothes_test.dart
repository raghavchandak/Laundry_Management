import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_total_summary.dart';
import 'package:nih_laundro/features/laundry/domain/repository/laundry_repository.dart';
import 'package:nih_laundro/features/laundry/domain/usecase/laundry_get_clothes.dart';

class MockLaundryRepository extends Mock implements LaundryRepository {}

void main() {
  MockLaundryRepository mockLaundryRepository;
  LaundryGetClothes getClothes;

  setUp(() {
    mockLaundryRepository = MockLaundryRepository();
    getClothes = LaundryGetClothes(repository: mockLaundryRepository);
  });

  final tLaundryTotalSummary = LaundryTotalSummary(
    clothList: ['shirt', 'pant'],
    total: 100,
  );

  test(
    'should return LaundryTotalSummary from repository',
    () async {
      // arrange
      when(mockLaundryRepository.getClothes())
          .thenAnswer((_) async => Right(tLaundryTotalSummary));
      // act
      final result = await getClothes.getClothes();
      // assert
      verify(mockLaundryRepository.getClothes());
      expect(result, Right(tLaundryTotalSummary));
    },
  );
}
