// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomDropdownButton2 extends StatelessWidget {
//   final String hint;
//   final String? value;
//   final List<String> dropdownItems;
//   final ValueChanged<String?>? onChanged;
//   final DropdownButtonBuilder? selectedItemBuilder;
//   final Alignment? hintAlignment;
//   final Alignment? valueAlignment;
//   final double? buttonHeight, buttonWidth;
//   final EdgeInsetsGeometry? buttonPadding;
//   final BoxDecoration? buttonDecoration;
//   final int? buttonElevation;
//   final Widget? icon;
//   final double? iconSize;
//   final Color? iconEnabledColor;
//   final Color? iconDisabledColor;
//   final double? itemHeight;
//   final EdgeInsetsGeometry? itemPadding;
//   final double? dropdownHeight, dropdownWidth;
//   final EdgeInsetsGeometry? dropdownPadding;
//   final BoxDecoration? dropdownDecoration;
//   final int? dropdownElevation;
//   final Radius? scrollbarRadius;
//   final double? scrollbarThickness;
//   final bool? scrollbarAlwaysShow;
//   final Offset offset;

//   const CustomDropdownButton2({
//     required this.hint,
//     required this.value,
//     required this.dropdownItems,
//     required this.onChanged,
//     this.selectedItemBuilder,
//     this.hintAlignment,
//     this.valueAlignment,
//     this.buttonHeight,
//     this.buttonWidth,
//     this.buttonPadding,
//     this.buttonDecoration,
//     this.buttonElevation,
//     this.icon,
//     this.iconSize,
//     this.iconEnabledColor,
//     this.iconDisabledColor,
//     this.itemHeight,
//     this.itemPadding,
//     this.dropdownHeight,
//     this.dropdownWidth,
//     this.dropdownPadding,
//     this.dropdownDecoration,
//     this.dropdownElevation,
//     this.scrollbarRadius,
//     this.scrollbarThickness,
//     this.scrollbarAlwaysShow,
//     this.offset = const Offset(0, 0),
//   }) : super();

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25),
//         child: DropdownButton2(
//           isExpanded: true,
//           hint: Container(
//             alignment: hintAlignment,
//             child: Text(
//               hint,
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Theme.of(context).hintColor,
//               ),
//             ),
//           ),
//           value: value,
//           items: dropdownItems
//               .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Container(
//                       alignment: valueAlignment,
//                       child: Text(
//                         item,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: const TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ))
//               .toList(),
//           onChanged: onChanged,
//           selectedItemBuilder: selectedItemBuilder,
//           buttonStyleData: ButtonStyleData(
//             height: buttonHeight ?? 40,
//             width: buttonWidth ?? MediaQuery.of(context).size.width,
//             padding:
//                 buttonPadding ?? const EdgeInsets.symmetric(horizontal: 20),
//             decoration: buttonDecoration ??
//                 BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                     color: Colors.black45,
//                   ),
//                 ),
//             elevation: buttonElevation,
//           ),
//           iconStyleData: IconStyleData(
//             icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
//             iconSize: iconSize ?? 12,
//             iconEnabledColor: iconEnabledColor,
//             iconDisabledColor: iconDisabledColor,
//           ),
//           dropdownStyleData: DropdownStyleData(
//             //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
//             maxHeight: dropdownHeight ?? 200,
//             width: dropdownWidth ?? 140,
//             padding: dropdownPadding,
//             decoration: dropdownDecoration ??
//                 BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//             elevation: dropdownElevation ?? 8,
//             //Null or Offset(0, 0) will open just under the button. You can edit as you want.
//             offset: offset,
//             //Default is false to show menu below button
//             isOverButton: false,
//             scrollbarTheme: ScrollbarThemeData(
//               radius: scrollbarRadius ?? const Radius.circular(40),
//               thickness: scrollbarThickness != null
//                   ? MaterialStateProperty.all<double>(scrollbarThickness!)
//                   : null,
//               thumbVisibility: scrollbarAlwaysShow != null
//                   ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
//                   : null,
//             ),
//           ),
//           menuItemStyleData: MenuItemStyleData(
//             height: itemHeight ?? 40,
//             padding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
//           ),
//         ),
//       ),
//     );
//   }
// }
