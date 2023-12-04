# 🔰 데이터베이스 팀 프로젝트 4조

<p align="center">
    <img src="./images/메인_이미지_1.jpg" width="700"/>
</p>

### 🔰 WBS 작성

[WBS 작성](https://docs.google.com/spreadsheets/d/1xLm-xROs7w3wNpA4cNaKn08dEufptOjM1-2yztjS-Zg/edit#gid=0)

### 1. 프로젝트 개요

![image](https://github.com/BEYOND-SW-CAMP-TEAM4/Database_team4/assets/139551676/b178286a-d1e1-4314-8253-02e3e03b1c19)

우리 팀은 우아한형제들의 '비마트'에 착안한 서비스를 구상해봤습니다.
이 서비스에는 크게 소비자, 매장(과 직원), 배달로 3가지 role이 참여하고,
각각의 role에서 관리하는 데이터를 구성하였습니다.
위 이미지에는 부여된 데이터 중 저희가 구현할 때 중요하게 여겼거나 신경 써본 detail들만 넣었습니다.

### 2. IDEATION

2.1 [전시 시스템](https://github.com/BEYOND-SW-CAMP-TEAM4/Database_team4/blob/main/ideation/usersystem-ideation.md)
   <br />
   처음에는 전시 시스템, 풀필먼트 시스템, 딜리버리 시스템, 추가적인 요소들로 카테고리화 하여 구상해보았고,
   이 과정에서 주소와 구역을 어떻게 나눌 것인지, 딜리버리 플랫폼은 어디까지 생각해볼 것인지, 추가 요소에는 쿠폰이나 포인트가 구현 가능할지에 대해 논의해보았습니다.

2.2 [풀필먼트 시스템](https://github.com/BEYOND-SW-CAMP-TEAM4/Database_team4/blob/main/ideation/fullfillment-ideation.md)
   <br />
   주소는 배달의 민족의 음식점 부분처럼 여러 매장이 있을 수도 있을지 등 여러 가지 경우를 고려했는데,
   실제로 비마트에 들어가면 하나의 매장이 자동으로 연계가 되는 것을 보아 한 구역당 베타마트는 하나가 있다는 것으로 가정하고 모델링을 진행했습니다.
   <br />
   <p align="center">
    <img src="./images/Bmart_usersystem_example.png" width="560"/>
</p>

2.3 [딜리버리 시스템](https://github.com/BEYOND-SW-CAMP-TEAM4/Database_team4/blob/main/ideation/delivery-ideation.md)
   <br />
   딜리버리 플랫폼은 후 개념적 모델링을 진행하면서 제대로 된 딜리버리 플랫폼 구현은 어렵고, 현재 이 시스템에 필요한 정도로만 생각해보기로 결론 지었습니다. 

2.4 추가 ideation
<br />
   저희의 논리적 모델링은 다음과 같습니다.
   모델링 중 가장 어려움이 있던 부분은 매장 현황(재고)과 order, order detail를 어떻게 연결을 할지였습니다. 주문을 할때 매장의 재고와 주문 내역을 연결과, 담당 직원은 어떻게 연결할지에 대한 문제를 고민하니 처음 테이블 셋팅이 되었을때 테이블 3~4개를 한번에 조인하는 과정이 필요해보였습니다.
   이 문제는 몇차례 시행착오를 겪으면서 store_item, stock_status 테이블을 만들어 보완하며 모델링을 완성했습니다.

### 3. [개념적 모델링 설계](https://github.com/BEYOND-SW-CAMP-TEAM4/Database_team4/blob/38ec28fb6ef044d8a7df98e69b1bf41b6804bf10/images/%EA%B0%9C%EB%85%90%EC%A0%81-%EB%AA%A8%EB%8D%B8%EB%A7%81-%EC%84%A4%EA%B3%84.png)
<br />
우리 시스템은 위 비마트의 풀필먼트 시스템의 구조 이미지처럼 풀필먼트 시스템에 포커싱해 구체적으로 모델링을 진행해보았고,
아래 이미지처럼 최종적으로 개념적 모델링이 걸계되었습니다.
   
### 4. [논리적 모델링 설계](./images/논리적-모델링.png)

### 5. [물리적 모델링 설계](./data_modeling/beta_mart.sql)

### 6. [테스트 케이스](./queries/testcase.sql)

- [테이블 별 INSERT 테스트](https://github.com/BEYOND-SW-CAMP-TEAM4/Database_team4/blob/main/queries/docs/insert_test.md)
