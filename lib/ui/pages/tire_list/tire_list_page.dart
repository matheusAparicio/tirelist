import 'package:flutter/material.dart';
import 'package:tirelist/ui/pages/tire_list/components/tire_list_app_bar.dart';
import 'package:tirelist/ui/pages/tire_list/components/tire_list_body.dart';
import 'package:tirelist/ui/theme/measures.dart';
import 'package:tirelist/view_model/tire_list_page_view_model.dart';

class TireListPage extends StatefulWidget {
  const TireListPage({super.key});

  @override
  State<TireListPage> createState() => _TireListPageState();
}

class _TireListPageState extends State<TireListPage> {
  final TireListPageViewModel _vm = TireListPageViewModel();

  @override
  void initState() {
    super.initState();
    _vm.onInit();
    _vm.scrollController.addListener(() {
      if (_vm.scrollController.position.outOfRange &&
          _vm.scrollController.offset >
              _vm.scrollController.initialScrollOffset + 200) {
        _vm.onListViewEndReached();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _vm.scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(
          Measures.APP_BAR_HEIGHT,
        ),
        child: TireListAppBar(),
      ),
      body: ValueListenableBuilder(
        valueListenable: _vm.state,
        builder: (context, state, _) {
          return TireListBody(viewModel: _vm);
        },
      ),
    );
  }
}