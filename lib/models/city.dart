
// ignore_for_file: non_constant_identifier_names

class City{
   String title;
   String sub_title;
   String image;

  City({required this.title, required this.sub_title, required this.image});
  
}


List<City> cities = [
  City(
      title: "Portland",
      image:
          "portland.png",
      sub_title: "1.5 hour drive"),
  City(
      title: "Boston",
      image:
          "boston.png",
      sub_title: "5 hour drive"),
  City(
      title: "Newark",
      image:
          "newark.png",
      sub_title: "3 hour drive"),
  City(
      title: "New York",
      image:
          "newyork.png",
      sub_title: "8 hour drive"),
];
