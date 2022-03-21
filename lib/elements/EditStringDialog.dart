import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:cross_media_recommendation/elements/CustomDialog.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomSpacer.dart';

class EditStringDialog extends StatefulWidget{
  String? name;
  String? value;
  bool large;
  EditStringDialog({this.name, this.value, this.large = false});

  @override
  PageState createState() => PageState();
}

class PageState extends State<EditStringDialog>{
  TextEditingController? textController;

  @override
  void initState(){
    super.initState();
    textController = TextEditingController(text: widget.value!);
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      content: Container(
        width: widget.large ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.name!,
                style: TextStyle(
                    color: accentColor,
                    fontSize: 18,
                  letterSpacing: 1.01
                ),
              ),
            ),
            CustomSpacer(),
            Form(
              child: TextFormField(
                style: TextStyle(
                  color: primaryTextColor.withOpacity(0.7)
                ),
                controller: textController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryTextColor.withOpacity(0.1))
                  ),
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: primaryTextColor.withOpacity(0.2))
                  ),

                ),
                maxLines: widget.large ? 10 : 1,
                minLines: widget.large ? 8 : 1,
              ),
            )
          ],

        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonComponent(title: "Save", onClick: (){
              Navigator.of(context).pop(
                  {
                    "submit": true,
                    "data": textController!.text
                  }
              );
            }),
            ButtonComponent(title: "Cancel", onClick: (){
              Navigator.of(context).pop(
                  {
                    "submit": false
                  }
              );
            })
          ],
        )
      ],
      actionsPadding: edgeInsetsAll20,
    );
  }
}