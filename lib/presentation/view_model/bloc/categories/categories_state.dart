part of 'categories_bloc.dart';

enum CategoryStatus { initial, sucess, error, loading, selected }

extension CategoryStatusX on CategoryStatus {
  bool get isInitial => this == CategoryStatus.initial;
  bool get isSucess => this == CategoryStatus.sucess;
  bool get isError => this == CategoryStatus.error;
  bool get isLoading => this == CategoryStatus.loading;
  bool get isSelected => this == CategoryStatus.selected;
}

final class CategoryState extends Equatable {
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.idSelected = 0,
    List<String>? categories,
  })  : categories = categories ?? const [];

  final int idSelected;
  final CategoryStatus status;
  final List<String> categories;

  @override
  List<Object?> get props => [status, categories, idSelected];

  CategoryState copyWith({
    List<String>? categories,
    CategoryStatus? status,
    int? idSelected,
  }) {
    return CategoryState(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        idSelected: idSelected ?? this.idSelected);
  }
}