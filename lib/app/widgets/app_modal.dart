import 'package:flutter/material.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:collection/collection.dart';

Future<T?> showModalDialog<T>({
  required BuildContext context,
  // required WidgetBuilder builder,
  String? title,
  List<Widget>? actions,
  Widget? content,
  Widget? icon,
  bool useDivider = true,
  bool? dismissable,
  double? contentWidth,
  EdgeInsets? insetPadding,
  EdgeInsets? contentPadding,
  String? subtitle,
}) {
  return showDialog(
      context: context,
      barrierDismissible: dismissable ?? true,
      builder: (BuildContext context) {
        return PopScope(
          canPop: dismissable ?? true,
          child: AlertDialog(
            insetPadding: insetPadding,
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: whiteColor,
            content: Container(
                width: contentWidth,
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon != null
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            margin: const EdgeInsets.only(bottom: 16),
                            child: icon,
                          )
                        : Container(),
                    title != null
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Container(),
                    subtitle != null
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 4),
                            child: Text(
                              subtitle,
                              style: const TextStyle(
                                fontSize: 12,
                                color: subtitleColor,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    content != null
                        ? Container(
                            padding: contentPadding ??
                                const EdgeInsets.symmetric(horizontal: 16),
                            child: content,
                          )
                        : Container(),
                    const SizedBox(
                      height: 16,
                    ),
                    actions != null && actions.isNotEmpty
                        ? Column(children: [
                            useDivider
                                ? const Divider(color: borderColor, height: 1)
                                : const SizedBox.shrink(),
                            Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: actions
                                      .mapIndexed((index, action) => Padding(
                                            padding: EdgeInsets.only(
                                                bottom: (index ==
                                                        actions.length - 1)
                                                    ? 0
                                                    : 12),
                                            child: action,
                                          ))
                                      .toList(),
                                ))
                          ])
                        : Container()
                  ],
                )),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actionsOverflowDirection: VerticalDirection.down,
          ),
        );
      });
}
