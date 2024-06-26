import 'package:e_commerce_app/utils/constant/image_string.dart';

import '../features/shop/modal/category_modal.dart';

class DummyData{

  ///Categories

  static final List<CategoriesModal> categories =[
    CategoriesModal(id: '1', name: 'Sports', image: EImages.sportIcon, isFeatured: true),
    CategoriesModal(id: '2', name: 'Electronic', image: EImages.electronicsIcon, isFeatured: true),
    CategoriesModal(id: '3', name: 'Cloths', image: EImages.clothIcon, isFeatured: true),
    CategoriesModal(id: '4', name: 'Animal', image: EImages.animalIcon, isFeatured: true),
    CategoriesModal(id: '5', name: 'Furniture', image: EImages.furnitureIcon, isFeatured: true),
    CategoriesModal(id: '6', name: 'Shoes', image: EImages.shoeIcon, isFeatured: true),
    CategoriesModal(id: '7', name: 'Cosmetic', image: EImages.cosmeticsIcon, isFeatured: true),
    CategoriesModal(id: '14', name: 'Jewelery', image: EImages.jeweleryIcon, isFeatured: true),

    //sub categories
    CategoriesModal(id: '8', name: 'Sport,Shoes', image: EImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoriesModal(id: '9', name: 'Track suits', image: EImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoriesModal(id: '10', name: 'Sports Equipments', image: EImages.sportIcon, isFeatured: false,parentId: '1'),

    CategoriesModal(id: '11', name: 'Bedroom furniture', image: EImages.furnitureIcon, isFeatured: false,parentId: '5'),
    CategoriesModal(id: '12', name: 'kitchen furniture', image: EImages.furnitureIcon, isFeatured: false,parentId: '5'),
    CategoriesModal(id: '13', name: 'Office furniture', image: EImages.furnitureIcon, isFeatured: false,parentId: '5'),

    CategoriesModal(id: '15', name: 'Laptop', image: EImages.electronicsIcon, isFeatured: false,parentId: '2'),
    CategoriesModal(id: '16', name: 'Mobile', image: EImages.electronicsIcon, isFeatured: false,parentId: '2'),

    CategoriesModal(id: '17', name: 'Shirts', image: EImages.clothIcon, isFeatured: false,parentId: '3')

  ];
}