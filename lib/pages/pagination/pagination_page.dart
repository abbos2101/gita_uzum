import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'bloc/pagination_bloc.dart';

class PaginationPage extends StatefulWidget {
  const PaginationPage({Key? key}) : super(key: key);

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  final bloc = PaginationBloc();
  final controller = RefreshController();

  @override
  void initState() {
    bloc.add(PaginationInitEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<PaginationBloc, PaginationState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            controller.refreshCompleted();
            controller.loadComplete();
          }
        },
        builder: (context, state) {
          return Container(
            color: Colors.grey[300],
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                body: SmartRefresher(
                  controller: controller,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () => bloc.add(PaginationInitEvent()),
                  onLoading: () => bloc.add(PaginationNextEvent()),
                  child: ListView.separated(
                    itemCount: state.products.length,
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (_, i) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.grey[300],
                        child: Text(
                          state.products[i],
                          style: const TextStyle(fontSize: 32),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
