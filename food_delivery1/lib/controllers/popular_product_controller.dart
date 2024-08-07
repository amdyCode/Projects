import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({
    required this.popularProductRepo
  });

  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isloaded = false;
  get isloaded => _isloaded;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      print("gots products");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      _isloaded = true;
      update();
    }
    else{

    }
  }
}