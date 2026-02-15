import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/presentation/cubit/category_cubit.dart';
import 'package:news/features/home/presentation/cubit/get_sources_cubit.dart';
import 'package:news/features/home/presentation/widgets/article_list.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    context.read<GetSourcesCubit>().getSources(
      context.read<CategoryCubit>().state,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSourcesCubit, GetSourcesState>(
      builder: (context, state) {
        return state is GetSourcesLoading
            ? const Center(child: CupertinoActivityIndicator())
            : state is GetSourcesError
            ? Center(child: Text(state.error))
            : DefaultTabController(
          length: state is GetSourcesSuccess ? state.sources.length : 0,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: .start,
                padding: .zero,
                labelColor: Theme.of(context).colorScheme.secondary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Theme.of(context).colorScheme.secondary,
                dividerHeight: 0,
                tabs: state is GetSourcesSuccess
                    ? state.sources.map((e) => Tab(text: e.name)).toList()
                    : [],
              ),
              Expanded(
                child: TabBarView(
                  children: state is GetSourcesSuccess
                      ? state.sources.map((e) => ArticleList(sourceId: e.id!)).toList()
                      : [],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
