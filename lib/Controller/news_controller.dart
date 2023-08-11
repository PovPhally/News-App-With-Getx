import 'package:get/get.dart';
import 'package:news_app/API/api_service.dart';
import 'package:news_app/Model/news_res_model.dart';

class NewsController extends GetxController {
  final api = APIServices().obs;
  var news = NewsResModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() async {
    isLoading(true);
    news.value = await api.value.getNews();
    isLoading(false);
  }
}
