
import 'config/classes.dart';

class StaticData
{
  static List<Food> food = [
      Food(idFood:"1",nameFood: "Barquette de frites",price: 150.00),
      Food(idFood:"2",nameFood: "Assiete de frites",price: 200.00),
      Food(idFood:"3",nameFood: "Pizza poulé",price: 600.00),
      Food(idFood:"4",nameFood: "Pizza Mega",price: 1800.00),
      Food(idFood:"5",nameFood: "Barquette de frites",price: 150.00),
      Food(idFood:"6",nameFood: "Assiete de frites",price: 200.00),
      Food(idFood:"7",nameFood: "Pizza poulé",price: 600.00),
      Food(idFood:"8",nameFood: "Pizza Mega",price: 1800.00),
      Food(idFood:"9",nameFood: "Barquette de frites",price: 150.00),
      Food(idFood:"10",nameFood: "Assiete de frites",price: 200.00),
      Food(idFood:"11",nameFood: "Pizza poulé",price: 600.00),
      Food(idFood:"12",nameFood: "Pizza Mega",price: 1800.00),
    ];
     static List<Category> menu = [
      Category(banner: "https://glasrestaurant.ie/assets/img/Glas_restaurant_food_01.jpg?v2",food: food,nameCat: "Desserts",idCat: "1"),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Entrées chaudes",idCat: "2"),
      Category(banner: "https://st4.depositphotos.com/1959135/22184/i/1600/depositphotos_221844198-stock-photo-grilled-chicken-legs-tomato-sauce.jpg",food: food,nameCat: "Entrées froids",idCat: "3"),
      Category(banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",food: food,nameCat: "Pizza",idCat: "4"),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Plats",idCat: "5"),
      Category(banner: "https://media.timeout.com/images/105326979/750/422/image.jpg",food: food,nameCat: "Pâtes",idCat: "6"),
      Category(banner: "https://glasrestaurant.ie/assets/img/Glas_restaurant_food_01.jpg?v2",food: food,nameCat: "Desserts",idCat: "7"),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Entrées chaudes",idCat: "8"),
      Category(banner: "https://st4.depositphotos.com/1959135/22184/i/1600/depositphotos_221844198-stock-photo-grilled-chicken-legs-tomato-sauce.jpg",food: [],nameCat: "Entrées froids",idCat: "9"),
      Category(banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",food: food,nameCat: "Pizza",idCat: "10"),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Plats",idCat: "11"),
      Category(banner: "https://media.timeout.com/images/105326979/750/422/image.jpg",food: food,nameCat: "Pâtes",idCat: "12"),
    ];
    static List<Restaurant> restaurants = [
      Restaurant(adrs: "Staouali, Algérie",banner: "https://st4.depositphotos.com/1959135/22184/i/1600/depositphotos_221844198-stock-photo-grilled-chicken-legs-tomato-sauce.jpg",idRestaurant: "1",nameRestaurant: "La Famillie",rating: 4.5,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Bab Ezzouar, Algérie",banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",idRestaurant: "2",nameRestaurant: "Savanah",rating: 5.0,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "El Biar, Algérie",banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",idRestaurant: "3",nameRestaurant: "Casa Alger",rating: 3.7,isOpen: false,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Bab El Oued, Algérie",banner: "https://media.timeout.com/images/105326979/750/422/image.jpg",idRestaurant: "4",nameRestaurant: "Manhattan",rating: 2.6,isOpen: false,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Kouba, Algérie",banner: "https://glasrestaurant.ie/assets/img/Glas_restaurant_food_01.jpg?v2",idRestaurant: "5",nameRestaurant: "Café Store",rating: 1.0,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Alger Centre, Algérie",banner: "https://cdn.pixabay.com/photo/2014/05/18/11/25/pizza-346985_960_720.jpg",idRestaurant: "6",nameRestaurant: "Savanah",rating: 1.8,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Boulevard du 11 Decembre 1960, El Biar, Algérie",banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",idRestaurant: "7",nameRestaurant: "Pizza Time val d'hydra",rating: 1.8,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
    ];
    static List<Order> orders = [
      Order(food: food[0],quantity: 2),
      Order(food: food[2],quantity: 2),
      Order(food: food[1],quantity: 6),
    ];
    static Cart  cart = Cart(restaurant: restaurants[2],orders: orders);
    
}