import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/presentation/modules/home/presentation/widgets/photo_card.dart';
import 'package:wall_paper_app/presentation/modules/search/presentation/manager/search_cubit/search_bloc.dart';
import '../../../../widgets/animated_widgets/animated_circular_progress_animater.dart';
import '../../../home/domain/entities/image_model_search_home.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  late final ScrollController _scrollController;
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    _scrollController = ScrollController();
    _searchBloc = context.read<SearchBloc>();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (!_searchBloc.state.isPagination) {
        _searchBloc.add(OnSearchPaginationBlocEvent());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchBlocState<ImageResponseModel>>(
      builder: (context, searchCubitState) {
        if(searchCubitState.isLoading){
          return Center(child: AnimatedCircularProgressAnimator());
        }
        else if(searchCubitState.data?.photos?.isEmpty ?? true){
          return Text("Search Data Empty");
        }
        var photos = searchCubitState.data?.photos;
        return ListView.builder(
          itemCount: photos!.length + (searchCubitState.isPagination? 1: 0),
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (context, index){
            if (index < (photos.length)) {
              return PhotoCard(
                photo: photos[index],
                isLast: index + 1 == photos.length,
              );
            } else {
              return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: AnimatedCircularProgressAnimator()
                  )
              );
            }
          }
        );
      },
    );
  }
}
