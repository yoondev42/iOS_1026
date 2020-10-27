
#import <Foundation/Foundation.h>

// Cocoa Design Pattern
// 1. Target-Action: ARC 궁합이 좋지 않다.
// 2. Delegate

// 3. 블록 프로그래밍(Block Programming): Functional Programming

// 함수형 언어 특징
// 1) 함수를 일급 객체(시민)로 취급한다.
//    - 함수를 참조할 수 있다.
//    - 함수를 인자로 전달하거나 함수를 반환할 수 있다.
// 2) 익명 함수를 지원해야 한다.
//    - Lambda(람다): 익명의 코드 조각을 참조하는 기술
//    - Closure(클로져): 블록 외부의 변수를 암묵적으로(명시적으로) 참조하는 기술


// Objective-C: [C + ObjC]
//  : '블록 프로그래밍'은 ObjC의 문법이 아니라 C언어의 확장 문법입니다.

void swap(int* a, int* b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

void sort(int* x, int n, int (^cmp)(int a, int b)) {
  for (int i = 0 ; i < n - 1; i++) {
    for (int j = i+1; j < n; j++) {
      // if (x[i] < x[j]) {
      if (cmp(x[i], x[j]) > 0) {
        swap(&x[i], &x[j]);
      }
    }
  }
}

int cmp1(int a, int b) { return a - b; }

int main() {
  int x[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };
  
  // 블록은 함수를 인자로 전달할 수 없다.
  // sort(x, 10, cmp1);
  // int n = 0;          // capture by value
  __block int n = 0;     // capture by reference
  
  sort(x, 10, ^int(int a, int b) {
    printf("n: %d\n", ++n);
    return a - b;
  });
  
  sort(x, 10, ^int(int a, int b) {
    return b - a;
  });
  
  
  // sort(x, 10, &cmp2);
  
  for (int i = 0 ; i < 10; i++) {
    printf("%d\n", x[i]);
  }
}


#if 0
// sort 함수의 오름차순 또는 내림차순의 정책은 사용자가 결정해야 한다.
// => '정책'을 분리
// => 함수 포인터 인자를 통해 정책을 사용자가 결정할 수 있도록 하자.
// 함수 포인터
//   문제점: "익명 함수를 전달할 수 없다"

void sort(int* x, int n, int (*cmp)(int, int)) {
  for (int i = 0 ; i < n - 1; i++) {
    for (int j = i+1; j < n; j++) {
      // if (x[i] < x[j]) {
      if (cmp(x[i], x[j]) > 0) {
        swap(&x[i], &x[j]);
      }
    }
  }
}

// a가 크면 양수
// b가 크면 음수
// 같다면   0
int cmp1(int a, int b) { return a - b; }
int cmp2(int a, int b) { return b - a; }

int main() {
  int x[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };
  sort(x, 10, &cmp2);
  
  for (int i = 0 ; i < 10; i++) {
    printf("%d\n", x[i]);
  }
}
#endif


#if 0
void sort(int* x, int n) {
  for (int i = 0 ; i < n - 1; i++) {
    for (int j = i+1; j < n; j++) {
      if (x[i] < x[j]) {
        swap(&x[i], &x[j]);
      }
    }
  }
}

int main() {
  int x[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };
  sort(x, 10);
  
  for (int i = 0 ; i < 10; i++) {
    printf("%d\n", x[i]);
  }
}
#endif
