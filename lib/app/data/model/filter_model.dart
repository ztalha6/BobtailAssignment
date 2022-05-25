class FilterModel {
  String? name;
  bool? isSelected;
  FilterModel({this.name, this.isSelected});

  List<FilterModel> get filters => [
        FilterModel(name: 'italian', isSelected: false),
        FilterModel(name: 'pakistani', isSelected: false),
        FilterModel(name: 'indian', isSelected: false),
      ];
}
