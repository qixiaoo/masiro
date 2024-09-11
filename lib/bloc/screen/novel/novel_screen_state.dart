import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/novel_detail.dart';

sealed class NovelScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NovelScreenInitialState extends NovelScreenState {}

class NovelScreenErrorState extends NovelScreenState {
  final String? message;

  NovelScreenErrorState({this.message});

  @override
  List<Object?> get props => [message];
}

class NovelScreenLoadedState extends NovelScreenState {
  final NovelDetail novelDetail;

  NovelScreenLoadedState({required this.novelDetail});

  NovelScreenLoadedState copyWith({NovelDetail? novelDetail}) {
    return NovelScreenLoadedState(novelDetail: novelDetail ?? this.novelDetail);
  }

  @override
  List<Object?> get props => [novelDetail];
}
