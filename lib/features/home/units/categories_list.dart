part of '../home_view.dart';
class CategoryList extends StatelessWidget {
  List<Category> categoriess = [
    Category(id: "0" , name: "Tablet", image: AppImageAsset.networkTestImage),
    Category(id: "0" , name: "Mobile", image: AppImageAsset.networkTestImage),
    Category(id: "0" , name: "Lap Top", image: AppImageAsset.networkTestImage),
    Category(id: "0" , name: "Computers", image: AppImageAsset.networkTestImage),
  ];
  CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit , CategoriesState>(
      builder: (context , status){
        if (status is GetCategoriesSuccessfully){
          if(status.categories.isNotEmpty){
            return Container(
                width: MediaQuery.of(context).size.width,
                height: UserResponsive.get(
                    context: context,
                    mobile: UserResponsive.height(context) * 0.19,
                    tablet: UserResponsive.height(context) * 0.23
                ),
                padding: EdgeInsets.all(5.sp),
                child: ListView.builder(
                    itemCount: status.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CategoryScreen(category: status.categories[index])
                              )
                          );
                        },
                        child: CategoryWidget(
                          category: status.categories[index],
                        ),
                      );
                    }
                )
            );
          }
          else{
            const Text("No Categories yet");
          }
        }
        else if (status is GetCategoriesFailed){
          return Text(status.error);
        }
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
        );
      },
    );
  }
}
