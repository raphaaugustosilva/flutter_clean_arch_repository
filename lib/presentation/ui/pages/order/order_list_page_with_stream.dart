import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/theme/app_text_theme.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/stream_order_list_presenter.dart';

class OrderListPageWithStream extends StatefulWidget {
  final StreamOrderListPresenter presenter;
  OrderListPageWithStream({@required this.presenter});

  @override
  _OrderListPageStateWithStream createState() => _OrderListPageStateWithStream();
}

class _OrderListPageStateWithStream extends State<OrderListPageWithStream> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        widget.presenter.loadData();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(child: Image.asset("lib/presentation/ui/assets/images/uncle_bob.png", width: 250, height: 250)),
              ),
              Text("Pedidos", style: AppTextTheme.h1(color: Colors.red)),
              StreamBuilder<bool>(
                stream: widget.presenter.isLoadingStream,
                initialData: true,
                builder: (context, snapshot) {
                  return snapshot.data == true ? LoadingComponent() : SizedBox.shrink();
                },
              ),
              StreamBuilder<List<Order>>(
                stream: widget.presenter.ordersStream,
                builder: (context, snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data[index].title ?? "", style: AppTextTheme.h2(color: Colors.blue)),
                            Text(
                              "Total: " + snapshot.data[index].total?.toString() ?? "",
                              style: AppTextTheme.inputText(),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
