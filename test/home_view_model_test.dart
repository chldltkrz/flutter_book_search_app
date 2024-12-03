import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Home View Model Test', () async {
    // ProviderScope안에서 뷰모델을 사용할 수 있도록 설정
    // 테스트 환경에서 쓸데없이 Widget을 생성하지 않고 테스트 할수 있도록 ProviderContainer 제공
    ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    final homeVm = container.read(homeViewModelProvider.notifier);

    // 처음 HomeViewModel의 상태는 빈 리스트
    final firstState = container.read(homeViewModelProvider);
    expect(firstState.books.isEmpty, true);
    // homeViewModel 에서 searchBooks 메서드를 호출하면 상태가 변경되어야 함
    await homeVm.searchBooks('harry');
    final afterState = container.read(homeViewModelProvider);
    expect(afterState.books.isEmpty, false);
  });
}
