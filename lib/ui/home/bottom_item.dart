import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/controller/home_controller.dart';

class BottomItem extends StatelessWidget {
  final int _index;
  final String _title;
  final IconData _icon;
  final _controller = Get.find<HomeController>();

  BottomItem(this._index, this._title, this._icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () => _controller.changePage(_index),
        child: Column(
          children: [
            Icon(
              _icon,
              size: 35,
              color:
                  _controller.pageIndex == _index ? Colors.white : Colors.grey,
            ),
            Text(
              _title,
              style: _controller.pageIndex == _index
                  ? Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedLabelStyle
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedLabelStyle,
            )
          ],
        ),
      ),
    );
  }
}
