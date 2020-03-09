import 'package:shared_preferences/shared_preferences.dart';


class StorageService
{
  SharedPreferences prefs;
  List<String> clothes;
  List<int> clothCount;
  int total;

  StorageService({this.clothes,this.clothCount,this.total}){
    initialize();
  }

  void initialize() async
  {
    prefs = await SharedPreferences.getInstance();
  }

  Future saveClothes() async {
    await prefs.setStringList("clothes", clothes);
    List<String> stringCountList = clothCount.map((e) => e.toString()).toList();
    await prefs.setStringList("clothCount", stringCountList);
    await prefs.setInt('Total', total);
    print('Saved');
  }

  Future<List<String>> getClothesList() async => prefs.getStringList("clothes");

  Future<List<String>> getClothCountList() async => prefs.getStringList("clothCount");

  Future<int> getTotal() async => prefs.getInt('total');
}

