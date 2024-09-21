import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Импортируем пакет

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> notifications = [
    'Яблоко золотая радуга ',
    'Апельсины',
    'Бананы',
    'Драконий фрукт',
    'Груши',
    'Виноград',
  ];

  List<String> descriptions = [
    'Сочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.',
    'Апельсин – источник витаминов, его едят в свежем виде или используют в кулинарии.',
    'Бананы насыщены калием, вкусные и полезные для здоровья.',
    'Экзотический драконий фрукт – отличное дополнение к любому столу.',
    'Сладкие груши – идеальный перекус или ингредиент для салатов.',
    'Виноград – богатый витаминами фрукт, который часто используется для производства соков и вин.',
  ];

  List<String> prices = [
    '340 с/кг',
    '300 с/кг',
    '250 с/кг',
    '400 с/кг',
    '270 с/кг',
    '320 с/кг',
  ];
  List<String> how = [
    '50 c',
    '86 c',
    '340 c',
    '30 c',
    '89 c',
    '54 c',
  ];

  List<String> imageUrls = [
    'assets/icons/image3.png', // Пример изображения
    'assets/icons/image1.png', // Пример изображения
    'assets/icons/image2.png', // Пример изображения
    'assets/icons/image1.png', // Пример изображения
    'assets/icons/image3.png', // Пример изображения
    'assets/icons/image2.png', // Пример изображения
  ];

  // Функция для открытия модального окна
  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(2.h), // Адаптивный отступ
          height: 70.h, // Адаптивная высота модального окна
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 35.sp),
                child: Image.asset(
                  imageUrls[index],
                  height: 20.h, // Адаптивная высота изображения
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                notifications[index],
                style: TextStyle(
                  fontSize: 18.sp, // Адаптивный размер текста
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                prices[index],
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                descriptions[index],
                style: TextStyle(
                  fontSize: 16.sp, // Адаптивный размер текста
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 6.h, // Адаптивная высота кнопки
                child: ElevatedButton(
                  onPressed: () {
                    // Логика для оформления заказа
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Оформить заказ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white), // Адаптивный размер текста
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: const Color(0xFFF8F8F8),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h), // Адаптивный отступ
        child: GridView.builder(
          itemCount: notifications.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.w, // Адаптивный промежуток между элементами
            mainAxisSpacing: 2.w, // Адаптивный промежуток между элементами
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showBottomSheet(context, index);
              },
              child: Container(
                width: 40.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      imageUrls[index],
                      height: 15.h, // Адаптивная высота изображения
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      notifications[index],
                      style: TextStyle(
                        fontSize: 16.sp, // Адаптивный размер текста
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          EdgeInsets.only(right: 22.w), // Адаптивный отступ
                      child: Text(
                        how[index],
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h),
                      child: SizedBox(
                        width: double.infinity,
                        height: 5.h, // Адаптивная высота кнопки
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF75DB1B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Добавить',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
