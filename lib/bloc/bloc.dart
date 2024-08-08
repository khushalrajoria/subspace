import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/bloc_services.dart';

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


class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogService blogService;

  BlogBloc(this.blogService) : super(BlogLoading()) {
    on<LoadBlogs>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogs = await blogService.fetchBlogs();
        emit(BlogLoaded(blogs));
      } catch (_) {
        emit(BlogError());
      }
    });

   on<ToggleFavorite>((event, emit) {
  if (state is BlogLoaded) {
    final loadedState = state as BlogLoaded;
    final updatedBlogs = loadedState.blogs.map((blog) {
      if (blog == event.blog) {
        blog.toggleFavorite(); 
      }
      return blog;
    }).toList();
    emit(BlogLoaded(updatedBlogs));
  }
});

  }
}
