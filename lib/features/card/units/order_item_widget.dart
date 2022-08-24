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
                flex: 3,
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
              Container(
                  constraints: BoxConstraints.tight(Size(20.sp,20.sp)),
                  margin: EdgeInsets.symmetric(
                      horizontal: UserResponsive.get(
                          context: context,
                          mobile: 0.sp,
                          tablet: 5.sp
                      )
                  ),
                  child: InkWell(
                      onTap : (){
                        Provider.of<CardTest>(context , listen: false).deleteProduct(product) ;
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
    );
  }
}
