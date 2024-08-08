import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'blocList_view.dart';
import 'services/bloc_services.dart';

void main() {
  final BlogService blogService = BlogService();

  runApp(
    BlocProvider(
      create: (context) => BlogBloc(blogService)..add(LoadBlogs()),
      child: MaterialApp(
        home: BlogListView(),
      ),
    ),
  );
}
