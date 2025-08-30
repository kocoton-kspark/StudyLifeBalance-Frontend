import 'package:flutter/material.dart';

class FourthOneContainer extends StatelessWidget {
  const FourthOneContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ]
        ),
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Q4-1.',
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              '대외활동에서 일주일에 몇시간 정도',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '투자하시나요?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        Text(
                          '(숫자만 입력해주세요!)',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              TextField(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    hintText: '예시: 12',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD9D9D9),
                      fontSize: 16,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD9D9D9))
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}