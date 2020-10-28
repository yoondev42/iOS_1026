

import Foundation

// 1. 확장자: .swift
// 2. main 함수가 없습니다.
//    main.swift가 그 역활을 대신합니다.
// 3. Foundation - #import <Foundation/Foundation.h>

// 4. Swift 언어 특징
//  1) 안정성(Safe)
//     - 강 타입 언어입니다: 암묵적인 캐스팅이 거의 허용되지 않는다.
//     - ObjC 암묵적으로 허용되었던 많은 부분들이 컴파일 오류가 발생합니다.
//     - null을 안전하게 다룰 수 있는 방법을 제공합니다.
//       : Optional

//  2) 성능(Fast)
//  3) 표현성(Expressive)


// ObjC: 참조 타입(reference type) / 기본 타입(built-in type)

// Swift: 모든 것이 '객체'이다.
//
//        객체
//          1) 참조 타입: ARC에 의한 수명 관리 - class
//          2) 값 타입: 기본 타입처럼 수명 관리 - struct, enum
//
//        모든 타입에 대해서 상태와 메소드를 가지고 있다.
//        Int, Double, String ...

// 변수를 만드는 방법
//  : 타입 추론을 통해 변수를 생성할 수 있습니다.
//  1) var: 가변값
//  2) let: 불변값

// 암시적 타입 추론: 우항의 타입을 통해 n의 타입을 컴파일 타임에 추론합니다.
var n = 10

// 명시적 타입 지정: 타입을 명시적으로 지정합니다.
var n2: Int64 = 42

// n += 10
print(n)


