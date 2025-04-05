class ImageRequestModel {
  final int pageNo;
  final int noOfResultsCanShow;
  final String searchQuery;
  ImageRequestModel(this.pageNo, this.searchQuery, {this.noOfResultsCanShow = 15});

  Map<String, dynamic> get queryParam => {
    "page": pageNo,
    "per_page": noOfResultsCanShow,
    "query": searchQuery
  };
}