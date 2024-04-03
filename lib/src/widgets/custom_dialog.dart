import 'package:flutter/material.dart';
import 'package:flutter_template/src/utils/dimensions.dart';
import 'package:flutter_template/src/utils/styles.dart';

class CustomDialog extends StatefulWidget {
  final BuildContext context;
  final String msgText;
  final String imagePath;
  final String posBtnLabel;
  final String negBtnLabel;
  final VoidNavigate onPosButtonClick;
  final VoidNavigate onNegButtonClick;
  final bool isPosBtnVisible;
  final bool isNegBtnVisible;
  final bool isVerticalDividerVisible;

  CustomDialog(
      {required this.context,
      this.msgText = '',
      this.imagePath = '',
      this.posBtnLabel = '',
      this.negBtnLabel = '',
      required this.onPosButtonClick,
      required this.onNegButtonClick,
      this.isNegBtnVisible = false,
      this.isPosBtnVisible = false,
      this.isVerticalDividerVisible = false});

  @override
  _CustomDialog createState() => _CustomDialog();
}

typedef VoidNavigate = void Function(BuildContext context);

class _CustomDialog extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      height: margin,
                    ),
                    Image.asset(widget.imagePath, width: 60.0, height: 60.0),
                    Padding(
                      padding: const EdgeInsets.all(margin),
                      child: Text(
                        widget.msgText,
                        style: black16TextFieldStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Visibility(
                              visible: widget.isNegBtnVisible,
                              child: Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    widget.onNegButtonClick(widget.context);
                                  },
                                  child: Text(
                                    widget.negBtnLabel,
                                    style: black16TextFieldStyle(),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: widget.isVerticalDividerVisible,
                              child: const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.black,
                                  )),
                            ),
                            Visibility(
                              visible: widget.isPosBtnVisible,
                              child: Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    widget.onPosButtonClick(widget.context);
                                  },
                                  child: Text(
                                    widget.posBtnLabel,
                                    style: black16TextFieldStyle(),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    )
                  ]))
        ]));
  }
}
