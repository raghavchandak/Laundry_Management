import 'package:equatable/equatable.dart';

class LaundryTotalSummary extends Equatable
{
  final List clothList;
  final int total;

  LaundryTotalSummary({this.clothList, this.total});

  @override
  List<Object> get props => [clothList,total];
}