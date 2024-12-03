import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_book_search_app/ui/home/widgets/home_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    // TODO: 홈뷰모델의 searchBooks 메서드 호출
    ref.read(homeViewModelProvider.notifier).searchBooks(text);
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  onSearch(_controller.text);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ],
            title: TextField(
              onSubmitted: onSearch,
              controller: _controller,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Search any book',
                border: MaterialStateOutlineInputBorder.resolveWith((states) {
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    );
                  } else {
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    );
                  }
                }),
              ),
            ),
          ),
          body: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: homeState.books.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                final book = homeState.books[index];
                return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return HomeBottomSheet(book);
                          });
                    },
                    child: Image.network(book.image));
              })),
    );
  }
}
