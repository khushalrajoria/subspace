import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'bloc_detailView.dart';

class BlogListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blog Explorer')),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BlogLoaded) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return ListTile(
  title: Text(blog.title),
  leading: Image.network(blog.imageUrl),
  trailing: IconButton(
    icon: Icon(
      // blog.isFavorite ? Icons.favorite : Icons.favorite_border,
      // color: blog.isFavorite ? Colors.red : null,
      Icons.abc_outlined
    ),
    onPressed: () {
      BlocProvider.of<BlogBloc>(context).add(ToggleFavorite(blog));
    },
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogDetailView(blog: blog),
      ),
    );
  },
);

              },
            );
          } else if (state is BlogError) {
            return Center(child: Text('Failed to load blogs'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
