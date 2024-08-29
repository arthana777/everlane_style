

import 'package:everlane_style/checkout/address_list.dart';
import 'package:everlane_style/checkout/ordersuccess.dart';
import 'package:everlane_style/checkout/pickuplocations.dart';
import 'package:everlane_style/checkout/webviewscreen.dart';
import 'package:everlane_style/data/models/disastermodel.dart';
import 'package:everlane_style/data/models/pickupmodel.dart';
import 'package:everlane_style/donation/disaster_list.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/cart/cart_bloc.dart';
import '../cartscreen/cartitem.dart';
import '../data/models/addressmodel.dart';
import '../data/models/cartmodel.dart';
import '../widgets/customcolor.dart';
import 'orderitem.dart';

class PaymentScreen extends StatefulWidget {
  final UserAddress? address;
  late final PickupLocation? pickupLocation;
  // late final PickupLocation? pickuplocations;
  PaymentScreen({super.key,  this.address,  this.pickupLocation, });


  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<Cart> carts=[];
  String selectedPaymentMethod = "COD";
  String selectedOrderType = "delivery";
   bool isSelected=false;
  bool _isAddressSelected = false;
  String disasterName = '';

  String disasterLocation = '';
  List<PickupLocation> pickuplocation=[];


   bool _isVisible=false;

   void _toggleVisibility() {
     setState(() {
       _isVisible = !_isVisible;
     });
   }
  void _selectPaymentMethod(String method) {
    setState(() {
      if (selectedOrderType == "donate") {
        selectedPaymentMethod = "ONLINE";
      } else {
        if (selectedPaymentMethod == method) {
          selectedPaymentMethod = "ONLINE";
        } else {
          selectedPaymentMethod = method;
        }
      }
    });
  }

  void _selectOrderType(String type) {
    setState(() {
      if (selectedOrderType == type) {
        selectedOrderType = "delivery";
      } else {
        selectedOrderType = type;
        if (type == "donate") {
          selectedPaymentMethod = "ONLINE";
          // _isAddressSelected = true;
        }
      }
    });
  }
  Future<void> _selectDisasterAddress() async {
    final PickupLocation? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pickuplocations()),
    );

    if (selectedLocation != null) {
      setState(() {
        // Set address fields with selected pickup location data
        widget.pickupLocation = selectedLocation;
        selectedOrderType = "donate";
        _isAddressSelected = true;
      });
    }
  }


  @override
  void initState() {
  context.read<CartBloc>().add(FetchCartData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        onPressed: () {
          if (selectedPaymentMethod.isNotEmpty) {
            if (selectedOrderType == "donate" && widget.pickupLocation == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select a pickup location')),
              );
            } else if (selectedOrderType == "delivery" && widget.address == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select a delivery address')),
              );
            }
            else if (carts.isNotEmpty) {
              if (selectedPaymentMethod == "COD") {
                // Place order directly for COD
                context.read<CartBloc>().add(PlaceOrder(
                  deliveryAddressId: widget.address?.id ?? 0,
                  orderType: selectedOrderType,
                  paymentMethod: selectedPaymentMethod,
                ));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order placed successfully!')),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OrderSuccessScreen()),
                );
              } else if (selectedPaymentMethod == "ONLINE") {

                String approvalUrl = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=EC-3A653758636168226";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebviewScreen(url: approvalUrl),
                  ),
                );
              }
            }
            else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Your cart is empty. Please add items to the cart before placing an order.')),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please select a payment method')),
            );
          }
        },
        label: Container(
          height: 30.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
          ),
          child: Center(
            child: Text("Place Order", style: CustomFont().buttontext),
          ),
        ),
        icon: Icon(
          Icons.shopping_bag_outlined,
          size: 20.sp,
          color: CustomColor.buttoniconColor,
        ),
      ),

      backgroundColor:  Color(0xFFEFEFEF),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar(text: "Confirm Order",
        leading: InkWell(
            onTap: (){
              // final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
              // navigationProvider.updateScreenIndex(0);
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => AddressList()),
              );
            },
            child: Icon(Icons.arrow_back)),)),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              print(state);
              if (state is CartLoading) {
                // Handle loading state
              } else if (state is CartLoaded) {
                carts = state.carts;
                print("Cart Loaded: ${carts.length} carts loaded.");
                setState(() {});
              }
              else if (state is placeOrderSuccess) {
               // WidgetsBinding.instance.addPostFrameCallback((_) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('Order placed successfully!')),
                //   );
                // });

              }

              else if (state is CartError) {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   width: 400.w,
                //     child: CartItemCard(title: cart,)),
                if (_isVisible)
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: carts.isEmpty ? 0 : carts.length,
                    itemBuilder: (context, cartIndex) {
                      if (carts.isEmpty) {
                        return Center(child: Text("No items in cart"));
                      }
                      return Column(
                        children: carts[cartIndex].items.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OrderItem(
                              title: item.productName,
                              price: item.productPrice,
                              image: item.productImage,
                              itemcount: item.quantity.toString(),

                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 150.w),
                  child: TextButton(
                    onPressed: _toggleVisibility,
                    child: Text(_isVisible ? 'Hide' : 'View ',style: GoogleFonts.questrial(
                        textStyle: TextStyle(
                          color: Color(0xFF973d93),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        )),),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Address",style: CustomFont().subtitleText,),
                      TextButton(onPressed: (){
                        if (selectedOrderType == "delivery") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddressList()),
                          );
                        } else if (selectedOrderType == "donate") {
                          _selectDisasterAddress(); // Navigate to DisasterList and select disaster address
                        }
                      },
                          child: Text("Choose",style: GoogleFonts.questrial(color: Colors.purple,),))],
                  ),
                ),
                SizedBox(height: 8.h,),
                if (selectedOrderType == "delivery")
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      height: 150.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.address?.address??""),
                            Text(widget.address?.state??""),
                            Text(widget.address?.city??""),
                            Text(widget.address?.pincode??""),
                            Text(widget.address?.mobile??""),
                            Text(widget.address?.locality??""),
                            //Text(widget.pickupLocation?.city??""),

                          ],
                        ),
                      ),
                    ),
                  )
                else if (selectedOrderType == "donate")
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      height: 150.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(widget.pickupLocation?.city??""),
                            Text(widget.pickupLocation?.address??""),

                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 8.h,),

            SizedBox(height: 8.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                  child: Text("Payment Method",style: CustomFont().subtitleText,),
                ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              child: Container(
              padding: EdgeInsets.all(10),
              height: 50.h,
              //width: 380.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cash on delivery",style: CustomFont().bodyText,),
             IconButton(onPressed: (){
               _selectPaymentMethod("COD");
             },
                 icon:Icon(selectedPaymentMethod == "COD" ? Icons.check_circle : Icons.circle_outlined))
                ],
              ),
                  ),
            ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50.h,
                    //width: 380.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Paypal",style: CustomFont().bodyText,),
                        IconButton(onPressed: (){
                          _selectPaymentMethod("ONLINE");
                        }, icon: Icon(selectedPaymentMethod == "ONLINE" ? Icons.check_circle : Icons.circle_outlined))
                        ,
                      ],
                    ),


                  ),
                ),
                SizedBox(height: 20.h,),
                 Padding(
                   padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                   child: Text("OrderType",style: CustomFont().subtitleText,),
                 ),
               Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50.h,
                    //width: 380.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Buyformyself",style: CustomFont().bodyText,),
                        IconButton(onPressed: (){
                          _selectOrderType("delivery");
                        }, icon:      Icon(selectedOrderType == "delivery" ? Icons.check_circle : Icons.circle_outlined))

                      ],
                    ),


                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50.h,
                    //width: 380.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Donate",style: CustomFont().bodyText,),
                        IconButton(onPressed: (){
                          _selectOrderType("donate");
                        }, icon: Icon(selectedOrderType == "donate" ? Icons.check_circle : Icons.circle_outlined))
                        ,
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 150.h,
                    width: 450.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          _buildRow(context, "Delivery", "0.0"),
                          SizedBox(height: 10.h),
                          _buildRow(context, "Discount", "00"),
                          SizedBox(height: 10.h),
                          _buildRow(context, "Total", carts.isNotEmpty ? carts[0].totalPrice ?? '' : '0.0',),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

   Widget _buildRow(BuildContext context, String label, String value) {
     return Row(
       children: [
         SizedBox(
           width: 100.w,
           child: Text(
             label,
             style: CustomFont().bodyText,
           ),
         ),
         SizedBox(
           width: 20.w,
           child: Text(
             ":",
             style: CustomFont().subtitleText,
           ),
         ),
         SizedBox(width: 10.w),
         SizedBox(
           width: 100.w,
           child: Text(
             value,
             style: CustomFont().bodyText,
           ),
         ),
       ],
     );
   }
}
