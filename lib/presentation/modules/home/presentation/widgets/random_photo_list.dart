import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/core/utils/app_style.dart';
import 'package:wall_paper_app/presentation/modules/home/presentation/widgets/photo_card.dart';
import '../../../../widgets/animated_widgets/animated_circular_progress_animater.dart';
import '../../domain/entities/image_model_search_home.dart';
import '../manager/random_image_fetch_bloc/random_image_fetch_bloc.dart';

class RandomPhotoList extends StatefulWidget {
  const RandomPhotoList({super.key});

  @override
  State<RandomPhotoList> createState() => _RandomPhotoListState();
}

class _RandomPhotoListState extends State<RandomPhotoList> {


  late final ScrollController _scrollController;
  int _page = 2;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      final bloc = context.read<RandomImageFetchBloc>();
      if (!bloc.state.isPaginationLoading) {
        bloc.add(FetchDataPaginationEvent(_page));
        _page++;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomImageFetchBloc, RandomImageFetchState<ImageResponseModel>>(
      builder: (BuildContext randomImageFetchContext, RandomImageFetchState<ImageResponseModel> randomImageFetchState) {
        if(randomImageFetchState.isLoading){
          return Center(
              child: AnimatedCircularProgressAnimator()
          );
        }
        else if(randomImageFetchState.data?.photos?.isEmpty ?? true){
          return Center(
            child: Text("No image found!!",
              style: AppStyles.large34.bold.white
            ),
          );
        }
        var photos = randomImageFetchState.data?.photos;
        return ListView.builder(
          controller: _scrollController,
          itemCount: (photos?.length ?? 0) + (randomImageFetchState.isPaginationLoading ? 1 : 0),
          itemBuilder: (BuildContext listViewContext, int index) {
            if (index < (photos?.length ?? 0)) {
              return PhotoCard(
                photo: photos![index],
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
          },
        );
      },
    );
  }
}
