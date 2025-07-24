import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/shared/widgets/app_rich_text.dart';

enum RangeType { weight, height }

class RangeSelector extends StatefulWidget {
  final RangeType type;
  final double initialValue;
  final ValueChanged<double> onValueChanged;
  final double minValue;
  final double maxValue;
  final double step;

  const RangeSelector({
    super.key,
    required this.type,
    required this.initialValue,
    required this.onValueChanged,
    required this.minValue,
    required this.maxValue,
    this.step = 1.0,
  });

  @override
  State<RangeSelector> createState() => _RangeSelectorState();
}

class _RangeSelectorState extends State<RangeSelector> {
  late InfiniteScrollController _controller;
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _controller = InfiniteScrollController(
      initialItem:
          ((widget.initialValue - widget.minValue) / widget.step).round(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _unit {
    return widget.type == RangeType.weight ? 'kg' : 'cm';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Selected value display
        AppRichText(
          textSpans: [
            AppTextSpan(
              text: _currentValue.toStringAsFixed(0),
              fontSize: 38,
              isBold: true,
              color: AppColors.primaryColor,
            ),
            AppTextSpan(
              text: ' $_unit',
              color: AppColors.primaryColor,
              fontSize: 28,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),

        // Carousel with bars
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Infinite Carousel
              InfiniteCarousel.builder(
                controller: _controller,
                loop: false,
                itemCount: ((widget.maxValue - widget.minValue) / widget.step)
                        .round() +
                    1,
                itemExtent: 20,
                onIndexChanged: (index) {
                  setState(() {
                    _currentValue = widget.minValue + (index * widget.step);
                  });
                  widget.onValueChanged(_currentValue);
                },
                itemBuilder: (context, itemIndex, realIndex) {
                  final value = widget.minValue + (itemIndex * widget.step);
                  final isCenter = realIndex == _controller.selectedItem;
                  final bool isMidBar = (itemIndex % 6) == 5;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _buildBarItem(
                          value: value,
                          isCenter: isCenter,
                          itemIndex: itemIndex,
                          isMidBar: isMidBar,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                        child: (isMidBar && !isCenter)
                            ? Text(
                                value.toStringAsFixed(0),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  );
                },
              ),

              Container(
                width: 4,
                height: 100,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBarItem({
    required double value,
    required bool isCenter,
    required int itemIndex,
    required bool isMidBar,
  }) {
    // Determine if this should be a mid bar (every 6th item, index 5, 11, 17, etc.)

    return SizedBox(
      width: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Bar
          Container(
            width: 2,
            height: isMidBar ? 50 : 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCenter ? Colors.yellow : Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // const SizedBox(height: 25),
        ],
      ),
    );
  }
}
