import 'package:flutter/material.dart';

class ExpansionCardItem extends StatelessWidget {
  final String title;
  final String selectedItem;
  final List<Widget> children;
  final Function(bool)? onExpansionChanged;

  const ExpansionCardItem(
      {Key? key,
      this.title = "",
      this.selectedItem = "",
      this.children = const <Widget>[],
      this.onExpansionChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color.fromARGB(255, 32, 32, 32),
      elevation: 10,
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(10),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.all(10),
        maintainState: true,
        onExpansionChanged: onExpansionChanged,
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        trailing:
            Text(selectedItem, style: Theme.of(context).textTheme.labelLarge),
        children: children,
      ),
    );
  }
}
