import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../services/bloc_services.dart';

// Events
abstract class BlogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBlogs extends BlogEvent {}

class ToggleFavorite extends BlogEvent {
  final Blog blog;

  ToggleFavorite(this.blog);

  @override
  List<Object> get props => [blog];
}


// States
abstract class BlogState extends Equatable {
  @override
  List<Object> get props => [];
}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<Blog> blogs;

  BlogLoaded(this.blogs);

  @override
  List<Object> get props => [blogs];
}

class BlogError extends BlogState {}

// Bloc
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogService blogService;

  BlogBloc(this.blogService) : super(BlogLoading());

  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    if (event is LoadBlogs) {
      yield BlogLoading();
      try {
        final blogs = await blogService.fetchBlogs();
        yield BlogLoaded(blogs);
      } catch (_) {
        yield BlogError();
      }
    } else if (event is ToggleFavorite) {
  if (state is BlogLoaded) {
    final loadedState = state as BlogLoaded;
    final updatedBlogs = loadedState.blogs.map((blog) {
      if (blog == event.blog) {
        blog.toggleFavorite(); // Toggle the favorite status
      }
      return blog;
    }).toList();
    yield BlogLoaded(updatedBlogs);
  }
}

  }
}
