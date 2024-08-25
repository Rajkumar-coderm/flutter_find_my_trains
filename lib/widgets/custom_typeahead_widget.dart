import 'package:flutter/material.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TypeAheadTextFieldCustomWidget<T extends StationData>
    extends StatelessWidget {
  const TypeAheadTextFieldCustomWidget({
    super.key,
    this.focusNode,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.selectedStationData,
    this.onSelected,
    required this.suggestionsCallback,
    this.prefixIcon,
    this.suffixIcon,
  });

  final FocusNode? focusNode;
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final T? selectedStationData;
  final Function(T value)? onSelected;
  final Future<List<T>?> Function(String) suggestionsCallback;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) => TypeAheadField<T>(
        focusNode: focusNode,
        constraints: const BoxConstraints(
          maxHeight: 250,
        ),
        hideWithKeyboard: focusNode?.hasFocus ?? false,
        controller: controller,
        itemBuilder: (context, value) => SearchTrailsResultWidget(value: value),
        builder: (context, controller, focusNode) => TextFromFieldWidget(
          controller: controller,
          focusNode: focusNode,
          hintText: hintText,
          onChanged: onChanged,
          suffixIcon: suffixIcon,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              prefixIcon ??
                  const Icon(
                    Icons.room_rounded,
                    color: Colors.white,
                  ),
              if (selectedStationData != null) ...[
                Dimense.boxWidth(10),
                Container(
                  height: 22,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorsValue.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      '${selectedStationData?.code}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Dimense.boxWidth(10)
              ],
            ],
          ),
        ),
        onSelected: onSelected,
        suggestionsCallback: suggestionsCallback,
      );
}

class SearchTrailsResultWidget extends StatelessWidget {
  const SearchTrailsResultWidget({
    super.key,
    required this.value,
  });

  final StationData value;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 10,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorsValue.primaryColor,
              ),
              child: Center(
                child: Text(
                  '${value.code}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Dimense.boxWidth(10),
            Text(
              '${value.name}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
}
