import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_n_geri/oyun_n_geri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(nGeriConfig.title.length, 33);
    expect(nGeriConfig.tagline.length, 33);
    for (final s in nGeriConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(nGeriConfig.gameId, nGeriId);
    expect(nGeriRules.gameId, nGeriId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(nGeriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: nGeriId, optionalMechanics: nGeriRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(nGeriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
