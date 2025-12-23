import 'package:flutter/material.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1147),
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    "Levels",
                    style: TextStyle(
                      color: Color(0xff3dffb8),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      return _levelCard(index);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _levelCard(int index) {
    final colors = [
      const Color(0xff7b6cff),
      const Color(0xff4fc3f7),
      const Color(0xffff9f43),
      const Color(0xff2ecc71),
      const Color(0xffe84393),
      const Color(0xff5f27cd),
    ];

    final starsCount = [3, 3, 2, 2, 1, 0];
    final isLocked = index == 5;

    return Column(
      children: [

        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (i) => Icon(
              Icons.star,
              size: 18,
              color: i < starsCount[index]
                  ? Colors.amber
                  : Colors.white24,
            ),
          ),
        ),

        const SizedBox(height: 10),

    
        ClipPath(
          clipper: PentagonClipper(),
          child: Container(
            height: 120,
            width: 120,
            color: colors[index],
            child: Center(
              child: isLocked
                  ? const Icon(Icons.lock, color: Colors.white, size: 40)
                  : Text(
                      "Level\n0${index + 1}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height * 0.38);
    path.lineTo(size.width * 0.82, size.height);
    path.lineTo(size.width * 0.18, size.height);
    path.lineTo(size.width * 0.18, size.height);
    path.lineTo(0, size.height * 0.38);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
