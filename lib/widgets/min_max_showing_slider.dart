import 'package:flutter/material.dart';
import 'package:short_book/constants/app_config.dart';

class MinMaxShowingSlider extends StatefulWidget {
  final double min;
  final double max;
  final Function(double value)? onChanged;

  const MinMaxShowingSlider(this.onChanged,
      {Key? key, required this.min, required this.max})
      : super(key: key);

  @override
  State<MinMaxShowingSlider> createState() => _MinMaxShowingSliderState();
}

class _MinMaxShowingSliderState extends State<MinMaxShowingSlider> {
  double _currentSilderValue = AppConfig.defaultLimitOfKeywordLength;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.min.toString(),
            style: Theme.of(context).textTheme.labelSmall),
        Slider(
          value: _currentSilderValue,
          onChanged: (value) {
            setState(() {
              _currentSilderValue = value;
              widget.onChanged!(value);
            });
          },
          min: widget.min,
          max: widget.max,
          divisions: (widget.max - widget.min).toInt(),
          label: _currentSilderValue.round().toString(),
        ),
        Text(widget.max.toString(),
            style: Theme.of(context).textTheme.labelSmall)
      ],
    );
  }
}
