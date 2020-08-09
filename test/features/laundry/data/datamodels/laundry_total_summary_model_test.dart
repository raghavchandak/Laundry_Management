import 'package:flutter_test/flutter_test.dart';
import 'package:nih_laundro/features/laundry/data/datamodels/laundry_total_summary_model.dart';
import 'package:nih_laundro/features/laundry/domain/entities/laundry_total_summary.dart';

void main() {
  final tLaundryTotalSummaryModel =
      LaundryTotalSummaryModel(clothList: ['Shirt', 'Pant'], total: 100);

  test('should be a subclass of entity', () {
    () async {
      // assert
      expect(tLaundryTotalSummaryModel, isA<LaundryTotalSummary>());
    };
  });
}
