import 'package:flutter/cupertino.dart';// 更新測試：確保 Git 可以偵測到變更
import 'package:flutter/material.dart';

void main() {
  runApp(IOSProfileApp());
}

class IOSProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// ===== 首頁 =====
class HomePage extends StatelessWidget {
  final String name = "徐硯琳";
  final String email = "C111181119@nkust.edu.tw";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("我的自傳"),
        backgroundColor: Color(0xFFF8F8F8),
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            /// 大頭貼
            Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: CupertinoColors.systemGrey5,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              email,
              style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _categoryButton(context, "基本資訊", InfoPage()),
                  _categoryButton(context, "技能專長", SkillsPage()),
                  _categoryButton(context, "興趣嗜好", HobbiesPage()),
                  _categoryButton(context, "未來目標", GoalsPage()),
                  _categoryButton(context, "專題經驗 / 作品", ExperiencesPage()),
                  _categoryButton(context, "社群連結", SocialPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CupertinoButton.filled(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFFC0CB), // 淡粉色
        padding: EdgeInsets.symmetric(vertical: 14),
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => page));
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

/// ===== 公共分類頁面模板 =====
class CategoryPage extends StatelessWidget {
  final String title;
  final List<String> items;

  CategoryPage({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        backgroundColor: Color(0xFFF8F8F8),
        // 自訂黑色返回鍵
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: Row(
            children: const [
              Icon(CupertinoIcons.back, color: Colors.black, size: 20),
              SizedBox(width: 4),
              Text(
                "返回",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildCard(items[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

/// ===== 各分類頁面 =====
class InfoPage extends StatelessWidget {
  final Map<String, String> info = {
    "生日": "2004/07/26",
    "電話": "0970-766-659",
    "學歷": "文昌國小-三光國中-豐原高商-高科大",
    "自我介紹": "大家好，我叫徐硯琳，目前就讀於高科大海事資訊系四年級。"
  };

  @override
  Widget build(BuildContext context) {
    return CategoryPage(
      title: "基本資訊",
      items: info.entries.map((e) => "${e.key}: ${e.value}").toList(),
    );
  }
}

class SkillsPage extends StatelessWidget {
  final List<String> skills = [
    "Flutter App 開發",
    "Python 與 AI 影像辨識",
    "雲端架構",
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryPage(title: "技能專長", items: skills);
  }
}

class HobbiesPage extends StatelessWidget {
  final List<String> hobbies = [
    "學習韓文",
    "追星",
    "旅遊",
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryPage(title: "興趣嗜好", items: hobbies);
  }
}

class GoalsPage extends StatelessWidget {
  final List<String> goals = [
    "成為能獨立開發 APP 的全端工程師",
    "完成更多App整合專案",
    "打造自己的個人作品集網站",
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryPage(title: "未來目標", items: goals);
  }
}

class ExperiencesPage extends StatelessWidget {
  final List<String> experiences = [
    "⚙️ 港口靜穩度模擬系統研究",
    "📷 可愛動植物影像辨識系統",
    "🔥 物理解說專題：熱輻射與車內高溫",
    "🐶 動物保護與領養平台",
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryPage(title: "專題經驗 / 作品", items: experiences);
  }
}

class SocialPage extends StatelessWidget {
  final List<String> socials = [
    "GitHub: github.com/C111181119",
    "Instagram: @yanlin",
    "Facebook: 徐硯琳",
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryPage(title: "社群連結", items: socials);
  }
}
