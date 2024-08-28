import 'package:everlane_style/checkout/myorders.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../bloc/cart/cart_bloc.dart';
import '../data/models/ordermodel.dart';
import '../data/navigation_provider/navigation_provider.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, this.title, this.status, this.paymentmethod, this.orders, this.image, this.quatity, this.orderid, this.retunstatus});
  final String? title;
  final String? image;
  final int? quatity;
  final int? orderid;
  final String? status;
  final String? retunstatus;
  final String? paymentmethod;
  final Order? orders;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late String returnStatus;

  @override
  void initState() {
    returnStatus = widget.retunstatus ?? "NO_RETURN";
    //BlocProvider.of<CartBloc>(context).add(ReturnOrder());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.h), child: CustomAppBar(
        text: 'OrderDetails',
        leading: InkWell(
          onTap: () {
            final navigationProvider =
            Provider.of<NavigationProvider>(context, listen: false);
            navigationProvider.updateScreenIndex(0);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyOrders()),
                  (Route<dynamic> route) => false,
            );
          },
          child: Icon(Icons.arrow_back),
        ),
      )),
      backgroundColor: Colors.white,


      body: MultiBlocListener(
        listeners: [
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              print(state);
              if (state is Returnloading) {
                // Handle loading state
              } else if (state is ReturnSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Return successful!')),
                );
              }


              else if (state is ReturnError) {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Already Requested')),
                );
              }

            },
          ),
        ],
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400.h,
                width: 400.w,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  image:DecorationImage(image: NetworkImage(widget.image??''),fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10.h,),
              Text(widget.title??"",style: CustomFont().subtitleText,),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Method of payment",style: CustomFont().subtitleText,),

                  SizedBox(height: 40.w,),
                  Text(widget.orders?.paymentMethod??"",style: CustomFont().bodyText,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Status",style: CustomFont().subtitleText,),
                  Text(widget.orders?.paymentStatus??"",style: CustomFont().bodyText,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Items",style: CustomFont().subtitleText,),
                  Text(widget.quatity.toString(),style: CustomFont().bodyText,),
                ],
              ),

              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.h),
                child: InkWell(
                  onTap: (){
                    context.read<CartBloc>().add(ReturnOrder(
                      orderItemId: widget.orderid,
                      returnQuantity: widget.quatity,
                      returnReason: "Customer Request",
                    ));
                  },

                  child: Container(
                    height: 50.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(child: Text(returnStatus == 'NO_RETURN'
                        ? 'Return'
                        : returnStatus == 'PENDING'
                        ? 'Requested'
                        : 'Return',style: CustomFont().buttontext,)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
