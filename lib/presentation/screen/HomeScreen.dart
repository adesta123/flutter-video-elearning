// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_elearning/bloc/post_bloc.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call To Api"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state){
          if(state is LoadedState){
            return RefreshIndicator(
              child: ListView.builder(
                  itemBuilder: (context, index){
                    final post = state.posts[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(post.id.toString())),
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      ),
                    );
                }, 
                itemCount: state.posts.length,
              ), 
              onRefresh: () async {
              context.read<PostBloc>().add(PullToRefreshEvent());
              },
            );
          }
          if(state is LoadingState){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          return const Center(
            child: Text("Fail to Load Data")
          );
        }
      )
    );
  }
}