import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/detail_page.dart';
import 'package:flutter_application_1/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              final HomeViewModel = ref.read(HomeViewModelProvider.notifier);
              return TextField(
                // 사용자가 값 입력후 엔터를 누르면 입력한 값이 value 파라미터로 넘어옴
                onSubmitted: (value) {
                  print(value);
                  if (value.trim().isEmpty) {
                    return;
                  }
                  HomeViewModel.searchLocation(value);
                },
                decoration: InputDecoration(
                  hintText: '검색어를 입력해주세요', // 사용자가 아무 텍스트를 입력하지 않았을 때
                  border: MaterialStateOutlineInputBorder.resolveWith(
                    (states) {
                      // 모서리 포커스 받았을 때 진하게
                      if(states.contains(WidgetState.focused)) {
                        return OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        );
                      }
                    
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                          ),
                      );
                    
                    },
                  ),
                ),
              );
            }
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer(
            builder: (context,ref,child) {
              final state = ref.watch(HomeViewModelProvider);
              return ListView.separated(
                itemCount: state.locations.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  final location = state.locations[index];
                  return GestureDetector(
                    onTap: () {
                      if(location.link.isEmpty){
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailPage(location.link);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(location.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(location.category),
                        Text(location.roadAddress),
                        ]
                          
                      ),
                    ),
                  );
                },
                );
            }
          ),
        ),
      
      ),
    );
  }
}