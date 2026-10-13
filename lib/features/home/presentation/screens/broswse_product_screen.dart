// import 'package:agroxpert/app/urls.dart';
// import 'package:agroxpert/core/services/network_caller.dart';
// import 'package:agroxpert/features/home/data/models/prodect_model.dart';
// import 'package:agroxpert/features/home/presentation/widgets/product_card.dart';
// import 'package:flutter/material.dart';

// class BrowseProductListScreen extends StatefulWidget {
//   const BrowseProductListScreen({super.key});

//   @override
//   State<BrowseProductListScreen> createState() =>
//       _BrowseProductListScreenState();
// }

// class _BrowseProductListScreenState extends State<BrowseProductListScreen> {
//   bool _productListInProgress = false;
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';

//   final List<ProductModel> _productList = [];
//   List<ProductModel> get _filteredProductList {
//     if (_searchQuery.isEmpty) return _productList;

//     final normalizedQuery = _searchQuery.toLowerCase().trim();
//     return _productList.where((product) {
//       return product.title.toLowerCase().contains(normalizedQuery) ||
//           product.category.toLowerCase().contains(normalizedQuery);
//     }).toList();
//   }

//   Future<void> _fetchProductListApi() async {
//     if (_productListInProgress) return;

//     _productListInProgress = true;
//     setState(() {});
//     ApiResponse response = await NetworkCaller.getRequest(
//       url: Urls.productListUrl,
//     );
//     if (response.isSuccess) {
//       _productList.clear();

//       final List data = response.responseData;

//       for (final item in data) {
//         _productList.add(ProductModel.fromJson(item));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           duration: const Duration(seconds: 2),
//           backgroundColor: Colors.red,
//           content: Center(
//             child: Text(
//               response.errorMessage,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//     _productListInProgress = false;
//     setState(() {});
//   }

//   // init function
//   @override
//   void initState() {
//     super.initState();
//     _fetchProductListApi();
//   }

//   // dispose fucntion
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final filteredProducts = _filteredProductList;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Product List',
//           style: TextStyle(
//             fontSize: 22,
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search products...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchQuery.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           setState(() {
//                             _searchQuery = '';
//                           });
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 12),
//             Expanded(
//               child: Visibility(
//                 visible: _productListInProgress == false,
//                 replacement: const Center(child: CircularProgressIndicator()),
//                 child: RefreshIndicator(
//                   onRefresh: _fetchProductListApi,
//                   child: filteredProducts.isEmpty
//                       ? ListView(
//                           physics: const AlwaysScrollableScrollPhysics(),
//                           children: [
//                             Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 48,
//                                 ),
//                                 child: Text(
//                                   _searchQuery.isEmpty
//                                       ? 'No products available.'
//                                       : 'No products match "$_searchQuery".',
//                                   style: const TextStyle(fontSize: 16),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       : GridView.builder(
//                           physics: const AlwaysScrollableScrollPhysics(),
//                           itemCount: filteredProducts.length,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 3,
//                                 crossAxisSpacing: 12,
//                                 mainAxisSpacing: 12,
//                                 childAspectRatio: 0.65,
//                               ),
//                           itemBuilder: (context, index) {
//                             final product = filteredProducts[index];

//                             return InkWell(
//                               borderRadius: BorderRadius.circular(12),
//                               onTap: () {
//                                 //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProductDetailsScreen(product: product),))
//                               },
//                               child: ProductCard(
//                                 productId: product.id,
//                                 title: product.title,
//                                 price: product.price,
//                                 image: product.image,
//                                 description: product.description,
//                                 category: product.category,
//                                 rate: product.rate,
//                                 count: product.count,
//                               ),
//                             );
//                           },
//                         ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
