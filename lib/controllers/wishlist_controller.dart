import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/wishlist_repo.dart' as wr;

class WishListScreenController extends ControllerMVC{
  bool tabDataLoaded = false;
  dynamic defaultListData = [];
  bool hasAny = false;
  List<String> tabs = ['Movies', 'Shows'];

  Future<void> fetchMyList() async{
    defaultListData = await wr.fetchList();
    if(defaultListData.length > 0)
      hasAny = true;
    setState(() {
      tabDataLoaded = true;
    });
  }
}