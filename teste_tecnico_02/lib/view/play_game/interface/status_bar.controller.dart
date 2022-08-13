import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_02/view/play_game/interface/sword.component.dart';

class StatusBarController extends StateController<SwordComponent> {
  int _life = 0, _money = 0, _sword = 0;
  bool _isFinish = false;

  @override
  void update(double dt, SwordComponent component) {}

  int get sword => _sword;

  set sword(int value) {
    _sword = value;
    notifyListeners();
  }

  bool get isFinish => _isFinish;

  set isFinish(bool value) {
    _isFinish = value;
    notifyListeners();
  }

  int get life => _life;

  set life(int value) {
    _life = value;
    notifyListeners();
  }

  int get money => _money;
  set money(int value) {
    _money = value;
    notifyListeners();
  }
}
