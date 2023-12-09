part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class LoadingState extends PostState {}

final class LoadedState extends PostState {
  final List<Post> posts;
  LoadedState({
    required this.posts
  });
}

final class FailureLoadState extends PostState {
  final String message;
  FailureLoadState({
    required this.message
  });
}