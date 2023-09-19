# ios-juice-maker
쥬스메이커 프로젝트 저장소입니다. 

## 팀원

| <img src="https://avatars.githubusercontent.com/u/22284092?v=4" width="150" height="150"> | <img src="https://avatars.githubusercontent.com/u/91656206?v=4" width="150" height="150"> |
| --- | --- |
| Comdori | bello |

## [Step 1]

[쥬스 자판기 [STEP 1] bello, comdori by JinUng41 · Pull Request #46 · tasty-code/ios-juice-maker](https://github.com/tasty-code/ios-juice-maker/pull/46#event-10361596891)

### 요구사항

- FruitStore는 다음의 조건을 충족해야 합니다.
    - [x]  FruitStore가 관리하는 과일의 종류 : 딸기, 바나나, 파인애플, 키위, 망고
    - [x]  각 과일의 초기 재고 : 10개
    - [x]  각 과일의 수량 n개를 변경하는 기능이 있습니다.
    - [x]  이 외에 더 필요한 기능, 특성, 타입이 있으면 자유롭게 추가해도 좋습니다.
- JuiceMaker.swift 파일에 다음의 조건을 충족하는 JuiceMaker 타입을 정의합니다.
    - [x]  FruitStore의 과일을 사용해 과일쥬스를 제조합니다.
        - 딸기쥬스 : 딸기 16개 소모
        - 바나나쥬스 : 바나나 2개 소모
        - 키위쥬스 : 키위 3개 소모
        - 파인애플 쥬스 : 파인애플 2개 소모
        - 딸바쥬스 : 딸기 10개 + 바나나 1개 소모
        - 망고 쥬스 : 망고 3개 소모
        - 망고키위 쥬스 : 망고 2개 + 키위 1개 소모
    - [x]  과일의 재고가 부족하면 과일쥬스를 제조할 수 없습니다.
    - [x]  JuiceMaker는 FruitStore를 소유하고 있습니다.
    - [x]  이 외에 더 필요한 기능, 특성, 타입이 있으면 자유롭게 추가해도 좋습니다.
    - [x]  (선택사항) 필요한 경우 오류처리(throw, try-catch)를 구현합니다.

### 구현 내용

| 이름 | 타입 | 내용 |
| --- | --- | --- |
| Fruit | enum | 과일의 종류를 정의합니다. |
| JuiceMenu | enum | 제조할 수 있는 쥬스 메뉴에 대해 정의합니다. |
| InventoryError | enum | 과일을 제조할 때 발생할 수 있는 오류에 대해 정의합니다. |
| FruitStore | class | 과일과 수량을 딕셔너리로 가지며, 재고에 대한 수정과 조회에 대한 메서드가 정의되어 있습니다. |
| JuiceMaker | struct | 메뉴를 받아 쥬스를 제조합니다. |

### 📌 생각해보기: Fruit을 `enum`으로 구현한 이유는? 장단점은?

- 함수의 인자로 Fruit 타입을 받고 있는데, 이렇게 구현한 이유는 메서드의 들어올 수 있는 인자의 값을 제한할 수 있다고 생각
- 문자열로 인자를 받는다고 생각하면 오타 등 발생할 수 있는 문제에 대한 처리가 추가로 필요하기 때문에 불편함이 있을 것이라고 생각하였고
- 열거형으로써 정의하여 인자를 전달받는다면, 오류에 대한 처리가 보다 간결하지 않을까 라는 생각에 Fruit을 열거형으로 정의 하였다.

## [Step 2]

- 요구사항
    - [x]  '재고 수정' 버튼을 터치하면 '재고 추가' 화면으로 이동합니다.
        - 이동 방식은 어떤 방식이 적절할까요? Push 방식
            - push방식을 적용한 이유는  `NavigationController`을 사용하였기 때문에 재고추가 화면에서 이전 화면으로 돌아가기 위해 back버튼 역활이 필요하여 사용하였습니다.
    - 각 주문 버튼 터치 시
        - [x]  쥬스 재료의 재고가 있는 경우 : 쥬스 제조 후 `“*** 쥬스 나왔습니다! 맛있게 드세요!”` 얼럿 표시
        - [x]  쥬스 재료의 재고가 없는 경우 : `“재료가 모자라요. 재고를 수정할까요?”` 얼럿 표시
            - [x]  ‘예' 선택시 재고수정 화면으로 이동
            - [x]  ‘아니오' 선택시 얼럿 닫기
        - [x]  과일쥬스를 제조하여 과일의 재고가 변경되면 화면의 적절한 요소에 변경사항을 반영합니다.

## 실행 화면

<!-- 주석: 사진 넣기 .gif -->
