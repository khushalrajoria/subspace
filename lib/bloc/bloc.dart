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

  BlogBloc(this.blogService) : super(BlogLoading()) {
    // Registering the event handler for LoadBlogs
    on<LoadBlogs>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogs = await blogService.fetchBlogs();
        emit(BlogLoaded(blogs));
      } catch (_) {
        emit(BlogError());
      }
    });

    // Registering the event handler for ToggleFavorite
    on<ToggleFavorite>((event, emit) {
      if (state is BlogLoaded) {
        final loadedState = state as BlogLoaded;
        final updatedBlogs = loadedState.blogs.map((blog) {
          if (blog == event.blog) {
            blog.toggleFavorite(); // Toggle the favorite status
          }
          return blog;
        }).toList();
        emit(BlogLoaded(updatedBlogs));
      }
    });
  }
}
