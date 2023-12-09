part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class LoadEvent extends PostEvent {}

class PullToRefreshEvent extends PostEvent {}