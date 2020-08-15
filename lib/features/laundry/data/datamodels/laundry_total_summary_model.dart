import 'package:nih_laundro/features/laundry/domain/entities/laundry_total_summary.dart';

class LaundryTotalSummaryModel extends LaundryTotalSummary
{
  final List clothList;
  final int total;

  LaundryTotalSummaryModel({this.clothList, this.total});
}