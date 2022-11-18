import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/constants/app_theme.dart';
import 'package:short_book/controller/feed_controller.dart';
import 'package:short_book/data/model/relay_book.dart';

class WritingRequestView extends StatelessWidget {
  final controller = Get.find<FeedController>();
  WritingRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (controller.request.isEmpty) {
          return const Center(
            child: Text("empty"),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () =>
                  controller.gotoWritingPage(controller.request[index]),
              child: requestCardItem(controller.request[index]),
            ),
            itemCount: controller.request.length,
          );
        }
      }),
    );
  }
}

class requestCardItem extends StatelessWidget {
  final RelayBook challengeInfo;
  const requestCardItem(this.challengeInfo, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Icon(
                    Icons.pending_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                  child: Text(
                    challengeInfo.title,
                    style: Get.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                  child: Text(
                    '글짓기 요청이 있습니다',
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'by ${challengeInfo.fromAuthor.name}',
                        style: Get.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
