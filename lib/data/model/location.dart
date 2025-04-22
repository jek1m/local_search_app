class Location {
  String title;
  String link;
  String category;
  String description;
  String telephone;
  String address;
  String roadAddress;
  String mapx;
  String mapy;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  Location.fromJson(Map<String, dynamic> jsonData) 
    : this(
        title: jsonData['title'],
        link: jsonData['link'],
        category: jsonData['category'],
        description: jsonData['description'],
        telephone: jsonData['telephone'],
        address: jsonData['address'],
        roadAddress: jsonData['roadAddress'],
        mapx: jsonData['mapx'],
        mapy: jsonData['mapy'],
      );



}
    // {
    //   "title": "삼성1동 주민센터",
    //   "link": "http://www.gangnam.go.kr/center/main.do?office=3220047",
    //   "category": "공공,사회기관>행정복지센터",
    //   "description": "",
    //   "telephone": "",
    //   "address": "서울특별시 강남구 삼성1동 161-2",
    //   "roadAddress": "서울특별시 강남구 봉은사로 616 삼성1동 주민센터",
    //   "mapx": "1270625320",
    //   "mapy": "375144424"
    // },