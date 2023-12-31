import 'package:game/shared/enemy/goblin_controller.dart';
import 'package:game/shared/interface/bar_life_controller.dart';
import 'package:game/shared/npc/critter/critter_controller.dart';
import 'package:game/shared/player/knight_controller.dart';
import 'package:game/tiled_map/game_tiled_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hongyan/bonfire.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  BonfireInjector().putFactory((i) => KnightController());
  BonfireInjector().putFactory((i) => GoblinController());
  BonfireInjector().putFactory((i) => CritterController());
  BonfireInjector().put((i) => BarLifeController());

  runApp(
    const MaterialApp(
      home: Menu(),
    ),
  );
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background: backgroundColor: Colors.cyan[900],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/tiled/image_bg.jpeg"),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: '代号:鸿燕行动',
                    style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: "gameFontFamily" ),
                    children: [
                      TextSpan(
                        text: '  v.1.0.5',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _buildButton(context, '进入游戏', () {
                      _navTo(context, const GameTiledMap());
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const SizedBox(
      //   height: 40,
      //   child: Center(
      //     child: Text(
      //       '键盘：定向和空格键攻击',
      //       style: TextStyle(fontSize: 18),
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildButton(BuildContext context, String label, VoidCallback onTap) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }

  void _navTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
