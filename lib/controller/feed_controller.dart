import 'package:get/get.dart';
import 'package:short_book/data/repository/feed_repository.dart';

class FeedController extends GetxController {
  final _repository = FeedRepository();
  FeedController();

  //List<UserInfo> get friends => _repository.fetchFriends().then((value) => null);
  @override
  void onInit() {
    super.onInit();
  }
}
