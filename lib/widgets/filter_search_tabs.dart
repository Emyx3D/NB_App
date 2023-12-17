import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';

class FilterSearchTab extends ConsumerStatefulWidget {
  const FilterSearchTab({
    super.key,
    required this.text,
    this.onTap,
    this.tabIsSelected = false,
  });
  final String text;
  final void Function()? onTap;
  final bool tabIsSelected;

  @override
  ConsumerState<FilterSearchTab> createState() => _FilterSearchTabState();
}

class _FilterSearchTabState extends ConsumerState<FilterSearchTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          // color: themeIsLight ? const Color(0xFA0857BF) : const Color(0xFF29398C),
          color: widget.tabIsSelected
              ? ProjectColors.mainBlue
              : const Color(0xFFB5CBFF),

          borderRadius: BorderRadius.circular(3.0),
        ),
        padding: const EdgeInsets.only(
          top: 9,
          bottom: 9,
          left: 10,
          right: 8,
        ),
        child: Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: widget.tabIsSelected
                ? ProjectColors.bigTxtWhite
                : Colors.grey[900]!,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
