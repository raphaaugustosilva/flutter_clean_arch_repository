import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/components.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/theme/app_text_theme.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/mobx_order_list_presenter.dart';

class OrderListPageWithMobx extends StatelessWidget {
  final MobxOrderListPresenter presenter;
  OrderListPageWithMobx({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        presenter.loadData();
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
              Observer(builder: (_) => presenter.isLoading == true ? LoadingComponent() : SizedBox.shrink()),
              Observer(
                builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: presenter.orders?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(presenter.orders[index].title ?? "", style: AppTextTheme.h2(color: Colors.blue)),
                            Text(
                              "Total: " + presenter.orders[index].total?.toString() ?? "",
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
