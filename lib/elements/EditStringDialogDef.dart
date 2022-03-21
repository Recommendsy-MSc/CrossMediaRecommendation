import 'package:cross_media_recommendation/elements/CustomDialog.dart';
import 'package:cross_media_recommendation/elements/EditStringDialog.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditStringDialogDef extends CustomDialog{
  dynamic data;
  String? name;
  String? value;
  bool large;

  EditStringDialogDef({this.name, this.value, this.large = false, this.data});
  @override
  String getTitle() {
    return name!;
  }

  @override
  dynamic getData() {
    return data!;
  }

  @override
  Widget dialogDesign(BuildContext context) {
    return EditStringDialog(name: getTitle(), value: value, large: large,);
  }


}