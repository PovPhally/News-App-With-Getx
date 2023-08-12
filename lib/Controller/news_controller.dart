import 'package:get/get.dart';
import 'package:news_app/API/api_service.dart';
import 'package:news_app/Model/news_res_model.dart';

class NewsController extends GetxController with StateMixin<NewsResModel> {
  final api = APIServices();
  var news = NewsResModel();

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() async {
    change(null, status: RxStatus.loading());
    try {
      news = await api.getNews();
      change(news, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
