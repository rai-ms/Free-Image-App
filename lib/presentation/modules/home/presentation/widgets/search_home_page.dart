import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wall_paper_app/core/services/route_service/route_names.dart';
import 'package:wall_paper_app/core/utils/debouncer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_k_padding.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/space.dart';
import '../../../../widgets/app_text_field/app_text_field.dart';
import '../../../../widgets/app_text_field/silver_validation/validation/validation.dart';
import '../../../../widgets/app_text_field/silver_validation/validator/validator.dart';
import '../../../search/presentation/manager/search_cubit/search_bloc.dart';

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key, this.isFromHome = false});
  final bool isFromHome;

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {

  late final ValidatedController searchFieldController;
  late final SearchBloc _searchBloc;
  final DeBouncer _deBouncer = DeBouncer();

  @override
  void initState() {
    searchFieldController = ValidatedController(validation: Validation.string.searchText);
    _searchBloc = context.read<SearchBloc>();
    super.initState();
  }

  void goSearchPage(){
    context.pushNamed(RoutesName.searchPage);
  }

  void onChangeSearchField(String query){
    if(query.isNotEmpty) {
      _deBouncer((){
        _searchBloc.add(OnSearchSearchBlocEvent(query));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextField(
            contentPadding: AppPadding.padA10,
            cursorColor: AppColors.whiteColor,
            hintText: "Search your image",
            label: "",
            onTap: widget.isFromHome? goSearchPage: null,
            prefixWidget: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Icon(Icons.search_sharp, color: AppColors.whiteColor,),
            ),
            autocorrect: true,
            maxLines: 1,
            onChange: onChangeSearchField,
            disableBorderColor: AppColors.gainsboro,
            inputAction: TextInputAction.send,
            textStyle: AppStyles.baseFont.white,
            controller: searchFieldController,
            enableBorderColor: AppColors.whiteColor,
          ),
        Space.h16
      ],
    );
  }
}
