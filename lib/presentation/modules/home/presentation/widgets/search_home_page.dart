import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_k_padding.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../widgets/app_text_field/app_text_field.dart';
import '../../../../widgets/app_text_field/silver_validation/validation/validation.dart';
import '../../../../widgets/app_text_field/silver_validation/validator/validator.dart';

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key, this.isFromHome = false});
  final bool isFromHome;

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {

  late final ValidatedController searchFieldController;

  @override
  void initState() {
    searchFieldController = ValidatedController(validation: Validation.string.searchText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
        enabled:!widget.isFromHome,
        contentPadding: AppPadding.padA10,
        cursorColor: AppColors.chineseBlack,
        hintText: "Password",
        label: "",
        prefixWidget: const Padding(
          padding: EdgeInsets.all(14.0),
          child: Icon(Icons.ac_unit),
        ),
        autocorrect: true,
        obscureText: true,
        maxLines: 1,
        disableBorderColor: AppColors.gainsboro,
        inputAction: TextInputAction.send,
        textStyle: AppStyles.baseFont.chineseBlack,
        controller: searchFieldController,
        enableBorderColor: AppColors.chineseBlack,
      );
  }
}
