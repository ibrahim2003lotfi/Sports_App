import 'package:flutter/material.dart';
import '../../widgets/article_card.dart';
import '../../config/app_strings.dart';
import '../../config/app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedTab = 0;
  final List<String> _categories = [
    'جميع الأخبار',
    'كرة القدم',
    'كرة السلة',
    'التنس',
    'أخبار رياضية',
  ];

  final List<Map<String, dynamic>> _articles = [
    {
      'title': 'فوز تاريخي للفريق الوطني في البطولة الآسيوية',
      'category': 'كرة القدم',
      'timeAgo': 'قبل ساعتين',
      'imageUrl': 'https://picsum.photos/400/300?random=1',
      'likes': 245,
      'isLiked': false,
    },
    {
      'title': 'لاعب النادي الأهلي يتوج بجائزة أفضل لاعب في الشهر',
      'category': 'كرة القدم',
      'timeAgo': 'قبل 5 ساعات',
      'imageUrl': 'https://picsum.photos/400/300?random=2',
      'likes': 189,
      'isLiked': true,
    },
    {
      'title': 'انطلاق منافسات الدوري الممتاز لكرة السلة',
      'category': 'كرة السلة',
      'timeAgo': 'قبل يوم',
      'imageUrl': 'https://picsum.photos/400/300?random=3',
      'likes': 76,
      'isLiked': false,
    },
    {
      'title': 'لاعبة التنس السعودية تحقق إنجازاً عالمياً',
      'category': 'التنس',
      'timeAgo': 'قبل يومين',
      'imageUrl': 'https://picsum.photos/400/300?random=4',
      'likes': 321,
      'isLiked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appName,
          style: const TextStyle(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Navigate to search
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Categories Tab
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ChoiceChip(
                    label: Text(_categories[index]),
                    selected: _selectedTab == index,
                    selectedColor: AppTheme.primaryColor,
                    labelStyle: TextStyle(
                      color: _selectedTab == index ? Colors.white : AppTheme.textPrimary,
                      fontFamily: 'Cairo',
                    ),
                    onSelected: (selected) {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          // Trending News
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppTheme.primaryColor.withOpacity(0.05),
            child: Row(
              children: [
                const Icon(Icons.trending_up, color: AppTheme.primaryColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  AppStrings.trending,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryColor,
                    fontFamily: 'Cairo',
                  ),
                ),
                const Spacer(),
                const Text(
                  'فوز ريال مديد على برشلونة 3-1',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),

          // Articles List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  final article = _articles[index];
                  return ArticleCard(
                    title: article['title'],
                    category: article['category'],
                    timeAgo: article['timeAgo'],
                    imageUrl: article['imageUrl'],
                    likes: article['likes'],
                    isLiked: article['isLiked'],
                    onTap: () {
                      // TODO: Navigate to article detail
                      print('Open article: ${article['title']}');
                    },
                    onLike: () {
                      setState(() {
                        _articles[index]['isLiked'] = !_articles[index]['isLiked'];
                        _articles[index]['likes'] += _articles[index]['isLiked'] ? 1 : -1;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textSecondary,
        selectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'بحث',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'جديد',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
        onTap: (index) {
          // TODO: Handle navigation
        },
      ),
    );
  }
}