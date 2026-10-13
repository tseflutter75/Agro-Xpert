class Urls {
  static const _baseUrl = "https://fakestoreapi.com";

  static const productListUrl = "$_baseUrl/products";

  // leaveinfo

  static updateleaveRequestUrl(String id) => "$_baseUrl/leave/edit/$id";
  static deleteleaveRequestUrl(String id) => "$_baseUrl/leave/delete/$id";
}
