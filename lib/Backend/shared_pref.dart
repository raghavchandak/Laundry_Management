import 'package:shared_preferences/shared_preferences.dart';
import 'package:nih_laundro/Utilities/Cloth.dart';

class StorageService
{
  SharedPreferences prefs;

  Future saveClothes(int total) async {
    prefs = await SharedPreferences.getInstance();
    List<String> stringCountList = Cloth.CLOTH_LIST.map((e) => e.count.toString()).toList();
    await prefs.setStringList("clothCount", stringCountList);
    await prefs.setInt('Total', total);
    print('Saved in Shared Preferences : Count = $stringCountList and total = $total');
  }

  Future<List<String>> getClothCountList() async{
    prefs = await SharedPreferences.getInstance();
    List<String> clothcount = prefs.getStringList("clothCount");
    print('Cloth count list from sp : $clothcount');
    return clothcount;
  } 

  Future<int> getTotal() async {
    prefs = await SharedPreferences.getInstance();
    int total = prefs.getInt("Total");
    print('Total from sp : $total');
    return total;
  }

  Future<bool> isTotal() async{
    int total = await getTotal();
    if(total!= null)
    return true;
    return false;
  }

  void deleteData() async
  {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('clothcount');
    prefs.remove('total');
    print('Items deleted');
  }
}