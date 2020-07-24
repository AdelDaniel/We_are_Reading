
class Book {

  int id;
  String title;
  String author;
  String description;
  int rating;
  int copiesCount;
  String coverPhotoId;
  int ownerId;
  String ownerName;
  int categoryId;
  String categoryName;
  int statusId;
  String status;

	Book.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		title = map["title"],
		author = map["author"],
		description = map["description"],
		rating = map["rating"],
		copiesCount = map["copiesCount"],
		coverPhotoId = map["coverPhotoId"],
		ownerId = map["ownerId"],
		ownerName = map["ownerName"],
		categoryId = map["categoryId"],
		categoryName = map["categoryName"],
		statusId = map["statusId"],
		status = map["status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['title'] = title;
		data['author'] = author;
		data['description'] = description;
		data['rating'] = rating;
		data['copiesCount'] = copiesCount;
		data['coverPhotoId'] = coverPhotoId;
		data['ownerId'] = ownerId;
		data['ownerName'] = ownerName;
		data['categoryId'] = categoryId;
		data['categoryName'] = categoryName;
		data['statusId'] = statusId;
		data['status'] = status;
		return data;
	}
}
