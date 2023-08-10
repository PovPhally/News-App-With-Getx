import 'package:get/get.dart';
import 'package:news_app/API/api_service.dart';
import 'package:news_app/Model/news_res_model.dart';

class NewsController extends GetxController {
  final api = APIServices();
  var news = NewsResModel();
  var isLoading = true;

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() async {
    isLoading = true;
    update();
    news = await api.getNews();
    isLoading = false;
    update();
  }
}
