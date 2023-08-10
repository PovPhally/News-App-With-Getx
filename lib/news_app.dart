import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/news_controller.dart';
import 'package:news_app/Model/news_res_model.dart';

class NewsApp extends StatelessWidget {
  NewsApp({super.key});

  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(
              color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.getNews();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.news.articles!.length,
              itemBuilder: (context, index) {
                final Articles article = controller.news.articles![index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        article.urlToImage ??
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        article.title ?? "No Title",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
