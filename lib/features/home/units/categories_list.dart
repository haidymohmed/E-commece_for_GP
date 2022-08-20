part of '../home_view.dart';
class CategoryList extends StatelessWidget {
  List<Category> categories = [
    Category(id: "0" , name: "Tablet", image: AppImageAsset.networkTestImage),
    Category(id: "0" , name: "Mobile", image: AppImageAsset.networkTestImage),
    Category(id: "0" , name: "Lap Top", image: AppImageAsset.networkTestImage),
    Category(id: "0" , name: "Computers", image: AppImageAsset.networkTestImage),
  ];
  CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: UserResponsive.get(
            context: context,
            mobile: UserResponsive.height(context) * 0.19,
            tablet: UserResponsive.height(context) * 0.23
        ),
        padding: EdgeInsets.all(5.sp),
        child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CategoryScreen(category: categories[index])
                      )
                  );
                },
                child: CategoryWidget(
                  category: categories[index],
                ),
              );
            }
        )
    );
  }
}
