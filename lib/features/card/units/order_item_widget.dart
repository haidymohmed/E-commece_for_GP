part of '../card.dart';
class OrderItemWidget extends StatelessWidget {
  Product product ;
  OrderItemWidget({Key? key , required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 60.sp,
        margin: EdgeInsets.symmetric(horizontal: 5.sp , vertical: 5.sp),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: LayoutBuilder(
                    builder: (context, constraints) => Image.network(
                      product.image,
                      fit: BoxFit.fill,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    )
                ),
              ),
              Expanded(
                flex: UserResponsive.get(
                    context: context,
                    mobile: 2,
                    tablet: 3
                ),
                child: Padding(
                  padding:UserResponsive.get(
                      context: context,
                      mobile: const EdgeInsets.all(8.0),
                      tablet: EdgeInsets.all(8.sp)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: UserTheme.get(
                            context: context,
                            fontSize: 12.sp,
                            fontWight: FontWeight.w700,
                            colorBright: AppColor.black,
                            colorDark: AppColor.white
                        ),
                      ),
                      Text(
                        "${product.price.toString()} EGP",
                        style: UserTheme.get(
                            context: context,
                            fontSize: 10.sp,
                            fontWight: FontWeight.w500,
                            colorBright: Colors.grey.shade700,
                            colorDark: Colors.grey.shade500
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                constraints: BoxConstraints.tight(Size(15.sp,15.sp)),
                                decoration: BoxDecoration(
                                    color: AppColor.grey,
                                    borderRadius: BorderRadius.circular(5.sp)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    //IncDecItemCubit.get(context).decrementProduct(product);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 15.sp,
                                    color: AppColor.white,
                                  ),
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.sp , vertical: 5.sp),
                              child: Text(
                                product.price.toString(),
                                style: UserTheme.get(
                                    context: context,
                                    fontSize: 13.sp,
                                    fontWight: FontWeight.w500,
                                    colorBright: AppColor.black,
                                    colorDark: AppColor.white
                                ),
                              ),
                            ),
                            Container(
                                constraints: BoxConstraints.tight(Size(15.sp,15.sp)),
                                decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(5.sp)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    //IncDecItemCubit.get(context).incrementProduct(product, context);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 15.sp,
                                    color: AppColor.white,
                                  ),
                                )
                            ),
                            SizedBox(width: 5.sp,),
                            Container(
                                constraints: BoxConstraints.tight(Size(15.sp,15.sp)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: UserResponsive.get(
                                        context: context,
                                        mobile: 0.sp,
                                        tablet: 5.sp
                                    )
                                ),
                                child: InkWell(
                                    onTap : (){
                                      //CardCubit.get(context).deleteItemFromCard(product);
                                    },
                                    child : Icon(
                                      Icons.delete,
                                      size: UserResponsive.get(
                                          context: context,
                                          mobile: 17.sp,
                                          tablet: 18.sp
                                      ),
                                      color: AppColor.grey,
                                    )
                                )
                            )
                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}
