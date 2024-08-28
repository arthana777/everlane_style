import 'package:everlane_style/bloc/cart/cart_bloc.dart';
import 'package:everlane_style/checkout/orderdetails.dart';
import 'package:everlane_style/checkout/orderitem.dart';
import 'package:everlane_style/data/models/ordermodel.dart';
import 'package:everlane_style/data/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/profile/profile.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'myorderitem.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Order> orders = [];

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(fetchOrders());
    super.initState();
  }
  final String invoiceUrl = "http://18.143.206.136/media/invoices/invoice_D83A32A692.pdf";
  Future<void> _launchURL() async {
    final Uri url = Uri.parse("http://18.143.206.136/media/invoices/invoice_D83A32A692.pdf");
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: CustomAppBar(
          text: 'My Orders',
          leading: InkWell(
            onTap: () {
              final navigationProvider =
              Provider.of<NavigationProvider>(context, listen: false);
              navigationProvider.updateScreenIndex(0);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
                    (Route<dynamic> route) => false,
              );
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is OrderLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          } else if (state is OrderLoaded) {
            Navigator.pop(context);
            setState(() {
              orders = state.orders;
            });
          }
        },
        child: orders.isEmpty
            ? Center(child: Text("No orders found"))
            : ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];

            // Check if the order has at least one item
            if (order.items.isNotEmpty) {
              final item = order.items[0];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(image: item.productImage,
                      orders: order,title: item.productName,quatity:item.quantity,orderid:item.id,retunstatus: item.returnStatus,)));
                  },
                  child: Myorderitem(
                    title: item.productName,
                    orderstatus: order.orderStatus,
                    image: item.productImage,
                    type: order.paymentMethod,
                    invoicedwnld:  _launchURL,
                    quatity: item.quantity,
                    returnstatus: item.returnStatus,
                  ),
                ),
              );
            } else {
              // Handle the case where there are no items in the order
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("No items available for this order"),
                  subtitle: Text("Order Status: ${order.orderStatus}"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
