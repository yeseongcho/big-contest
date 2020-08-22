library(data.table)
ns_train <- fread("C:/Users/sec/Desktop/2020 빅콘테스트 데이터분석분야-챔피언리그_2019년 실적데이터 분석용.csv", sep=",", encoding="UTF-8")

ns_trains <- fread("C:/Users/sec/Desktop/2020 빅콘테스트 데이터분석분야-챔피언리그_2019년 실적데이터 분석용.csv", sep=",", encoding="UTF-8")

ns_test <- fread("C:/Users/sec/Desktop/2020 빅콘테스트 데이터분석분야-챔피언리그_2020년 6월 판매실적예측데이터(평가데이터)분석용.csv", sep=",", encoding="UTF-8")

ratio <- fread("C:/Users/sec/Desktop/2020 빅콘테스트 데이터분석분야-챔피언리그_시청률 데이터분석용.csv", sep=",", encoding="UTF-8")

ratios <- fread("C:/Users/sec/Desktop/2020 빅콘테스트 데이터분석분야-챔피언리그_시청률 데이터분석용.csv", sep=",", encoding="UTF-8")

str(ns_trains)

View(ratios)

ns_test

ratio[,2]

#ns_train$취급액/ns_train$판매단가

str(ns_train)

##### 상품군이 무형인 경우 ---- 판매단가랑 취급액을 0으로 잡음

## 그런 다음에 chr형 변수를 int형으로 바꾼 다음에 주문량 변수 추가

## 주문량 기준으로 분석을 들어가보자

ns_train$판매단가 <- ifelse( ns_train$상품군 =="무형", 0, ns_train$판매단가)

ns_trains[which(ns_trains$상품군=="무형"),]

ns_train$판매단가 <- gsub(",", "", ns_train$판매단가)

ns_train$판매단가 <- as.numeric(ns_train$판매단가)

ns_train$취급액 <- ifelse(ns_train$상품군 == "무형", 0, ns_train$취급액)

ns_train[which(ns_train$취급액 ==0), ]

ns_train$취급액

ns_train$취급액 <- gsub(",", "", ns_train$취급액)

ns_train$취급액 <- as.numeric(ns_train$취급액)

str(ns_train)

ns_train$주문량 <- as.integer(ns_train$취급액/ns_train$판매단가)

ns_train$주문량 <- ifelse(is.na(ns_train$주문량), 0, ns_train$주문량) 

ns_train

library(lubridate)

library(tidyr)
ns_train$방송일시

?separate

ns_train <- separate(ns_train, col=방송일시, into=c("날짜","시간"), sep=" ")

str(ns_train)

ns_train$시간 <- gsub(":", ".", ns_train$시간) 

ns_train$시간

ns_train$시간 <- as.numeric(ns_train$시간)

# 처음에 이 방법을 사용할까 고민하다가 이게 별로인거 같다.
#ns_train$날짜 <- ymd(ns_train$날짜)

#ns_train$날짜 <- as.character(ns_train$날짜)

ns_train <- separate(ns_train, col=날짜, into=c("년","월","일"),sep="-")

# test data도 동일하게 전처리를 해준다.
ns_test$판매단가 <- ifelse( ns_test$상품군 =="무형", 0, ns_test$판매단가)

ns_test$판매단가 <- gsub(",", "", ns_test$판매단가)

ns_test$판매단가 <- as.numeric(ns_test$판매단가)

ns_test$취급액 <- ifelse(ns_test$상품군 == "무형", 0, ns_test$취급액)

ns_test$취급액 <- gsub(",", "", ns_test$취급액)

ns_test$취급액 <- as.numeric(ns_test$취급액)

ns_test <- separate(ns_test, col=방송일시, into=c("날짜","시간"), sep=" ")

ns_test$시간 <- gsub(":", ".", ns_test$시간) 

ns_test$시간 <- as.numeric(ns_test$시간)

#ns_test$날짜 <- ymd(ns_test$날짜)

#ns_test$날짜 <- as.character(ns_test$날짜)

ns_test <- separate(ns_test, col=날짜, into=c("년","월","일"),sep="-")

table(ns_train$상품군)

table(ns_train$마더코드)

View(ns_test)

    
     
ns_train$년 <- as.integer(ns_train$년)
ns_train$월 <- as.integer(ns_train$월)
ns_train$일 <- as.integer(ns_train$일)

ns_test$년 <- as.integer(ns_test$년)
ns_test$월 <- as.integer(ns_test$월)
ns_test$일 <- as.integer(ns_test$일)

str(ns_train)
str(ns_test)

table(ns_train$상품군)

table(ns_test$상품군)

gagu <- ns_train[which(ns_train$상품군=="가구"), "마더코드"]
gagu_t <- ns_test[which(ns_test$상품군=="가구"), "마더코드"]

table(gagu)
table(gagu_t)

gajeon <- ns_train[which(ns_train$상품군=="가전"), "마더코드"]
gajeon_t <- ns_test[which(ns_test$상품군=="가전"), "마더코드"]

table(gajeon)
table(gajeon_t)

ns_train[which(ns_train$상품군=="건강기능"), "마더코드"]
ns_test[which(ns_test$상품군=="건강기능"), "마더코드"]
 
ns_train[which(ns_train$상품군=="농수축"), "마더코드"]
ns_test[which(ns_test$상품군=="농수축"), "마더코드"]

ns_train[which(ns_train$상품군=="생활용품"), "마더코드"]
ns_test[which(ns_test$상품군=="생활용품"), "마더코드"]

ns_train[which(ns_train$상품군=="속옷"), "마더코드"]
ns_test[which(ns_test$상품군=="속옷"), "마더코드"]

ns_train[which(ns_train$상품군=="의류"), "마더코드"]
ns_test[which(ns_test$상품군=="의류"), "마더코드"]

ns_train[which(ns_train$상품군=="이미용"), "마더코드"]
ns_test[which(ns_test$상품군=="이미용"), "마더코드"]

ns_train[which(ns_train$상품군=="잡화"), "마더코드"]
ns_test[which(ns_test$상품군=="잡화"), "마더코드"]

ns_train[which(ns_train$상품군=="주방"), "마더코드"]
ns_test[which(ns_test$상품군=="주방"), "마더코드"]

ns_train[which(ns_train$상품군=="침구"), "마더코드"]
ns_test[which(ns_test$상품군=="침구"), "마더코드"]


# 상품명은 우선 다르다.... -- 이건 굳이 factor로 바꿀 필요는 없을듯
#ns_train$상품명 <- as.character(ns_train$상품명)
#ns_test$상품명 <- as.character(ns_test$상품명)

# 상품군은 factor로 바꾸어도 되지만
ns_train$상품군 <- as.factor(ns_train$상품군)
ns_test$상품군 <- as.factor(ns_test$상품군)

ns_train$상품명
ns_train$상품군

#levels(ns_test$상품명)
#levels(ns_train$상품명)

table(ns_train_s$상품군)
table(ns_test$상품군)

str(ns_train_s)

ns_day <- ns_train_s[which(ns_train_s$월==6 & (ns_train_s$일==1 | ns_train_s$일==2)),]

ns_day
ns_day_t <- ns_test[which(ns_test$월==6 & ns_test$일==1),]

# 하루치를 보는 것보다 조금 더 거시적으로 살펴보자

#ns_train_s[,c("노출(분)","주문량")]
View(ratio)
ratio$`2019-01-01 to 2019-12-31`
str(ratio)
View(ns_trains)
colnames(ratio)
# 시간대별 평균 시청률
ratios <- ratio[,c(1,367)]
# 마지막 행 제거
ratios <- ratios[-1440,]
ratios$시간대 <- gsub(":",".",ratios$시간대)

ratios$시간대 <- as.numeric(ratios$시간대)

ratios <- ratios[order(ratios$시간대),]

colnames(ratios)[2] <- "평균 시청률"

ratios$시간대 - as.integer(ratios$시간대)

# 시청률 데이터는 구했는데
asd <- ifelse(0<=ratios$시간대 - as.integer(ratios$시간대) & ratios$시간대 - as.integer(ratios$시간대) <=0.1, as.integer(ratios$시간대)+.0, 
                     ifelse(0.1<ratios$시간대 - as.integer(ratios$시간대) & ratios$시간대 - as.integer(ratios$시간대) <=0.25, as.integer(ratios$시간대)+.2,
                            ifelse(0.25 < ratios$시간대 - as.integer(ratios$시간대) & ratios$시간대 - as.integer(ratios$시간대) <0.35,as.integer(ratios$시간대)+.3,
                                   ifelse(0.35<=ratios$시간대 - as.integer(ratios$시간대) & ratios$시간대 - as.integer(ratios$시간대)<=0.59, as.integer(ratios$시간대)+.4, ratios$시간대))))
asd
ratios

ratios$시간대평균 <- asd
ratios$시간대
View(ratios)
ratioss <- ratios[,-1]
colnames(ratioss)[2] <- "시간"
View(ratioss)
ns_train
ns_train[,c("시간")]
ratioss[,c("시간")]

# 어떻게 시청률 데이터를 기존 데이터 프레임에 추가를 할까?
ns_train[which(ns_train$시간==23.4),]
ratioss[which(ratioss$시간==23.4),]

tapply(ratioss$`평균 시청률`, ratioss$시간, mean)

# 직접 다시 시청률 데이터 구축
new_ratio <- data.frame('평균 시청률' = c(0.004727273, 0.004666667, 0.005222222, 0.005320000, 0.004800000, 0.004875000, 0.004555556, 0.004041667, 0.003400000, 0.003000000, 0.003000000, 0.002360000,
                                  0.002400000, 0.002312500, 0.002222222, 0.001960000, 0.001545455, 0.001466667, 0.002000000, 0.002000000, 0.001818182, 0.001733333, 0.002000000, 0.001541667, 0.002181818,
                                  0.002133333, 0.001900000, 0.002208333, 0.002181818, 0.002200000, 0.002400000 ,0.003416667 ,0.003500000, 0.003933333, 0.004700000 ,0.003833333 ,0.003636364, 0.004066667,
                                  0.004400000, 0.004291667, 0.004909091, 0.005333333, 0.005300000, 0.005916667, 0.005363636, 0.006066667 ,0.006200000, 0.005291667 ,0.004727273 ,0.004933333, 0.003800000,
                                  0.004291667, 0.004545455 ,0.005066667, 0.006200000 ,0.005875000 ,0.005909091, 0.006533333, 0.006600000 ,0.006208333 ,0.006818182, 0.006200000, 0.006300000, 0.006291667,
                                  0.005500000, 0.005375000, 0.005888889, 0.005840000, 0.005500000, 0.005437500, 0.006222222, 0.005880000, 0.005500000, 0.005125000, 0.005222222, 0.004960000, 0.004900000, 
                                  0.004750000, 0.004222222, 0.004760000, 0.004100000, 0.003875000, 0.004000000, 0.004280000, 0.004100000, 0.004000000, 0.004333333, 0.004240000 ,0.003700000, 0.004125000,
                                  0.003888889, 0.004320000, 0.005200000, 0.005375000, 0.004777778, 0.004480000 ), "시간" = c(0.0, 0.2, 0.3, 0.4, 1.0, 1.2, 1.3, 1.4, 2.0, 2.2, 2.3, 2.4, 3.0, 3.2, 3.3, 3.4, 4.0, 4.2, 4.3, 4.4, 5, 5.2, 5.3, 5.4, 6, 6.2,
                                              6.3,6.4,7.0, 7.2, 7.3, 7.4, 8.0, 8.2, 8.3, 8.4, 9.0, 9.2,9.3,9.4,10.0,10.2,10.3,10.4,11.0,11.2,11.3,11.4,12.0,12.2,12.3,12.4,
                                              13.0,13.2,13.3,13.4,14.0,14.2,14.3,14.4,15.0,15.2,15.3,15.4,16.0,16.2,16.3,16.4,17.0,17.2,17.3,17.4,18.0,18.2,18.3,18.4,
                                              19.0,19.2,19.3,19.4,20.0,20.2,20.3,20.4,21.0,21.2,21.3,21.4,22.0,22.2,22.3,22.4,23.0,23.2,23.3,23.4))
new_ratio

# 시청률 데이터 추가 완료
ns_train <- merge(ns_train, new_ratio, key="시간")
ns_test <- merge(ns_test, new_ratio, key="시간")

ns_train
library(dplyr)



ns_train <- arrange(ns_train, 월, 일)
ns_test <- arrange(ns_test, 월, 일)
ns_train

# 5월에서 7월 까지의 판매 기록만을 가져와보자 -- 상품이 유사할 수도 있으니까
ns_train_s <- ns_train[which(ns_train$월==6 | ns_train$월==5 | ns_train$월==7), ]
View(ns_train_s)

str(ns_train)
str(ns_test)

# 시간 변수의 경우 factor로 전환
ns_train$시간 <- as.factor(ns_train$시간)
ns_test$시간 <- as.factor(ns_test$시간)

levels(ns_train$시간)
levels(ns_test$시간)

level <- union(levels(ns_train$시간), levels(ns_test$시간))

ns_train$시간 <- factor(ns_train$시간, level=level)
ns_test$시간 <- factor(ns_test$시간, level=level)

## 사실상 년도 정보는 딱히 필요가 없음 -- 제거
ns_train <- ns_train[,-2]
ns_test <- ns_test[,-2]


ns_train[which(ns_train$상품군=="의류"), ]

# 상품명에 "남성", "여성"이 들어간 경우 ==== 성별로 묶자

tail(ns_train[which(ns_train$상품군=="속옷"), ],50) 

# 상품명에 "브라", "치마", "란쥬"가 들어가면 여자
# "트렁크"가 들어가면 남자

library(stringr)
#c <- c()
#for (i in 1:37600){
  #c <- c(c, "혼성")
}

#c <- c[c(-1,-2,-3)]

#ns_train_jjack <- ns_train

#ns_train_jjack$성별 <- c

#ns_train_jjack

#d <- c()
#for (i in 1:2750){
#  d <- c(d, "혼성")
#}

#ns_test_jjack <- ns_test
#ns_test_jjack$성별 <- d

#ns_test_jjack


ns_train$성별 <- c

ns_test$성별 <- d

# 성별 항목 추가!
ns_train
ns_test

ns_train$성별 <- ifelse(str_detect(ns_train$상품명, "남성"), "남성", ns_train$성별)

ns_train$성별 <- ifelse(str_detect(ns_train$상품명, "여성"), "여성", ns_train$성별)

ns_train$성별 <- ifelse(str_detect(ns_train$상품명, "브라"), "여성", ns_train$성별)

ns_train$성별 <- ifelse(str_detect(ns_train$상품명, "치마"), "여성", ns_train$성별)

ns_train$성별 <- ifelse(str_detect(ns_train$상품명, "란쥬"), "여성", ns_train$성별)

ns_train$성별 <- ifelse(str_detect(ns_train$상품명, "트렁크"), "남성", ns_train$성별)

ns_train$성별 <- ifelse(str_detect(ns_train$상품명, "원피스"), "여성", ns_train$성별)

# test도 동일한 전처리를 밟아준다.

ns_test$성별 <- ifelse(str_detect(ns_test$상품명, "남성"), "남성", ns_test$성별)

ns_test$성별 <- ifelse(str_detect(ns_test$상품명, "여성"), "여성", ns_test$성별)

ns_test$성별 <- ifelse(str_detect(ns_test$상품명, "브라"), "여성", ns_test$성별)

ns_test$성별 <- ifelse(str_detect(ns_test$상품명, "치마"), "여성", ns_test$성별)

ns_test$성별 <- ifelse(str_detect(ns_test$상품명, "란쥬"), "여성", ns_test$성별)

ns_test$성별 <- ifelse(str_detect(ns_test$상품명, "트렁크"), "남성", ns_test$성별)

ns_test$성별 <- ifelse(str_detect(ns_test$상품명, "원피스"), "남성", ns_test$성별)

# 이렇게 만든 성별 변수를 factor로 묶는다

ns_train$성별 <- as.factor(ns_train$성별)

ns_test$성별 <- as.factor(ns_test$성별)

#ns_train[which(ns_train$월==1 & ns_train$일==1), ]

###### 마더코드와 상품 코드가 대체 어떻게 상품들을 numbering할 지 그 규칙성을 발견해보자
ns_train[which(ns_train$상품군=="가구"),c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="가구"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="가전"), c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="가전"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="건강기능"), c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="건강기능"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="농수축"), c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="농수축"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="생활용품"), c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="생활용품"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="속옷"), c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="속옷"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="의류"),c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="의류"),c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="이미용"),c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="이미용"),c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="잡화"), c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="잡화"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="주방"),c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="주방"), c("마더코드", "상품명")]

ns_train[which(ns_train$상품군=="침구"), c("마더코드", "상품명")]
ns_test[which(ns_test$상품군=="침구"), c("마더코드", "상품명")]


### 월, 일 데이터도 우선 factor로 변경
ns_train$월 <- as.factor(ns_train$월)

ns_test$월 <- as.factor(ns_test$월)

ns_train$일 <- as.factor(ns_train$일)

ns_test$일 <- as.factor(ns_test$일)

str(ns_train)
str(ns_test)

levels(ns_train$월)
levels(ns_test$월)

levels(ns_train$일)
levels(ns_test$일)

level_m <- union(levels(ns_train$월), levels(ns_test$일))

ns_train$월 <- factor(ns_train$월, level=level_m)
ns_test$월 <- factor(ns_test$월, level=level_m)

level_d <- union(levels(ns_train$일), levels(ns_test$일))

ns_train$일 <- factor(ns_train$일, level=level_d)
ns_test$일 <- factor(ns_test$일, level=level_d)

str(ns_train)
str(ns_test)

# 우선 마더코드 역시 factor 변수로 바꾸어준다. === 하지만 에러의 가능성이 매우 높으니 우선 수행은 하지 않는다.
#ns_train$마더코드 <- as.factor(ns_train$마더코드)
#ns_test$마더코드 <- as.factor(ns_test$마더코드)

#levels(ns_train$마더코드)
#levels(ns_test$마더코드)

#level_mother <- union(levels(ns_train$마더코드), levels(ns_test$마더코드))

#ns_train$마더코드 <- factor(ns_train$마더코드, level=level_mother)

#ns_test$마더코드 <- factor(ns_test$마더코드, level=level_mother)

#as.numeric(ns_train$마더코드)

str(ns_train)
str(ns_test)

colnames(ns_train)[4] <- "노출"
colnames(ns_test)[4] <- "노출"

test_train <- lm(주문량~월+일+노출+마더코드+상품군+판매단가+성별+평균.시청률+시간, data=ns_train)
colnames(ns_train)
predics <- predict(test_train, newdata=ns_train)

ns_train_tt <- ns_train

ns_train_tt$선형결과 <- predics

ns_train_tt[,c("주문량","선형결과")]

ns_train_tt[is.na(ns_train_tt$선형결과), ]


######## 추후 논의점

## 1. 마더코드, 상품코드가 갖는 규칙성이나 의미는? type은 어떻게 해주어야?

## 2. 노출 시간에 있는 NA값은 어떻게 처리를 하는 것이 좋을까? --- rf, xg에서 다 다루어주더라

###### 간단한 xgboost 모델링
str(ns_train)
library(caret)
library(xgboost)
colnames(ns_train)

idx <- createDataPartition(ns_train$주문량, p=.8, list=F)

ns_train_tr <- ns_train[idx, ]
ns_train_te <- ns_train[-idx, ]


train_x <-data.matrix(ns_train_tr[,c(-7,-10,-11)])
train_y <-data.matrix(ns_train_tr$주문량)

test_x <- data.matrix(ns_train_te[,c(-7,-10,-11)])


x_train <- xgb.DMatrix(data=train_x, label=train_y)

xgb_mdl <- xgboost(data=x_train, eta=0.01, max_depth=20, nrounds=300, objective="reg:linear",eval_metric="rmse")

pred <- predict(xgb_mdl, newdata=test_x)

ns_train_te$부스팅결과 <- pred

ns_train_te[, c("주문량", "부스팅결과")]

calcRMSE(pred, ns_train_te$주문량)


## 결국 EDA, feature engineering을 더 해주어야 할 거 같다.

str(ns_train)
str(ns_test)
View(ns_train)
table(ns_train$상품군)
ns_train[which(ns_train$상품군 == "의류"),]
ns_train[which(ns_train$마더코드==100346),] ## 상품 코드가 남성과 여성이 7차이가 나는 특징이 있네?

ns_train[which(ns_train$마더코드==100377),] ## 여긴 또 6차이가 나네


## 마더코드가 같은데 상품코드만 다른 것은 "판매 단가"로 통제가 되지 않을까??
ns_train[which(ns_train$상품군 == "가전"),]
ns_train[which(ns_train$마더코드 == 100150),] # 무이자, 일시불 차이의 경우 판매 단가로 통제가 가능, # 성별은 통제가 안되므로 변수를 추가해줌

ns_train[which(ns_train$상품군 == "가구"),]
ns_train[which(ns_train$상품군 == "건강기능"),]
ns_train[which(ns_train$상품군 == "농수축"),]
ns_train[which(ns_train$상품군 == "생활용품"),]
## 마더코드 100798의 마스크의 경우 마더코드 같고 상품 코드 다른데 판매 단가가 똑같아서 상품 코드 말고는 통제할 변수가 마땅히 없다...
## 이런 경우에는 어떠한 변수로 통제를 해주어야 하는가..

table(ns_train$상품군)

# 가구 가전 건강기능 농수축 무형 생활용품 속옷 의류 이미용 잡화 주방 침구

# 저 종류들에 대해서 각각 마더코드를 일반화할 수 있는 어떠한 규칙을 찾아보자

### 상품군 내에서 유사한 애들끼리 분류하는 건 어떨까???
gagu <- ns_train[which(ns_train$상품군=="가구"), "마더코드"]
table(gagu)

gagu_t <- ns_test[which(ns_test$상품군=="가구"), "마더코드"]
table(gagu_t)

gageon <- ns_train[which(ns_train$상품군=="가전"), "마더코드"]
table(gageon)

gageon_t <- ns_test[which(ns_test$상품군=="가전"), "마더코드"]
table(gageon_t)


health <- ns_train[which(ns_train$상품군=="건강기능"), "마더코드"]
table(health)

health_t <- ns_test[which(ns_test$상품군=="건강기능"), "마더코드"]
table(health_t)


nong <- ns_train[which(ns_train$상품군=="농수축"), "마더코드"]
table(nong)

nong_t <- ns_test[which(ns_test$상품군=="농수축"), "마더코드"]
table(nong_t)


life <- ns_train[which(ns_train$상품군=="생활용품"), "마더코드"]
table(life)

life_t <- ns_test[which(ns_test$상품군=="생활용품"), "마더코드"]
table(life_t)

inner <- ns_train[which(ns_train$상품군=="속옷"), "마더코드"]
table(inner)

inner_t <- ns_test[which(ns_test$상품군=="속옷"), "마더코드"]
table(inner_t)


cloth <- ns_train[which(ns_train$상품군=="의류"), "마더코드"]
table(cloth)

cloth_t <- ns_test[which(ns_test$상품군=="의류"), "마더코드"]
table(cloth_t)

beauty <- ns_train[which(ns_train$상품군=="이미용"), "마더코드"]
table(beauty)

beauty_t <- ns_test[which(ns_test$상품군=="이미용"), "마더코드"]
table(beauty_t)


jab <- ns_train[which(ns_train$상품군=="잡화"), "마더코드"]
table(jab)

jab_t <- ns_test[which(ns_test$상품군=="잡화"), "마더코드"]
table(jab_t)


kitchen <- ns_train[which(ns_train$상품군=="주방"), "마더코드"]
table(kitchen)

kitchen_t <- ns_test[which(ns_test$상품군=="주방"), "마더코드"]
table(kitchen_t)

bed <- ns_train[which(ns_train$상품군=="침구"), "마더코드"]
table(bed)

bed_t <- ns_test[which(ns_test$상품군=="침구"), "마더코드"]
table(bed_t)


# 가구 가전 건강기능 농수축 무형 생활용품 속옷 의류 이미용 잡화 주방 침구

gagu_u <- union(gagu, gagu_t)

# union의 특징...!
tsd <- c("1","2","1","2","3")
td <- c("3","4","4","3")
union(tsd, td) ## 중복되는거 빼고 결합이 되더라

gageon_u <- union(gageon, gageon_t)

health_u <- union(health, health_t)

nong_u <- union(nong, nong_t)

life_u <- union(life, life_t)

inner_u <- union(inner, inner_t)

cloth_u <- union(cloth, cloth_t)

beauty_u <- union(beauty, beauty_t)

jab_u <- union(jab, jab_t)

kitchen_u <- union(kitchen, kitchen_t)

bed_u <- union(bed, bed_t)

class <- c()

nrow(ns_train)
nrow(ns_test)

#for (i in 1:37600){
#  class <- c(class, NA)
#}


#ns_train$클래스 <- class

#class <- c()
#for (i in 1:2750){
#  class <- c(class, NA)
#}
#ns_test$클래스 <- class

##### 상품군에서 마더코드 유사한 종목끼리 분류해보자
sort(gagu_u)
# 훈련
#ns_train$클래스 <- ifelse((100075<=ns_train$마더코드 & ns_train$마더코드<=100079)&(ns_train$상품군=="가구"), "가구1", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100203<=ns_train$마더코드 & ns_train$마더코드<=100230)&(ns_train$상품군=="가구"), "가구2", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100373<=ns_train$마더코드 & ns_train$마더코드<=100391)&(ns_train$상품군=="가구"), "가구3", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100500<=ns_train$마더코드 & ns_train$마더코드<=100594)&(ns_train$상품군=="가구"), "가구4", ns_train$클래스)
# 테스트
#ns_test$클래스 <- ifelse((100075<=ns_test$마더코드 & ns_test$마더코드<=100079)&(ns_test$상품군=="가구"), "가구1", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100203<=ns_test$마더코드 & ns_test$마더코드<=100230)&(ns_test$상품군=="가구"), "가구2", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100373<=ns_test$마더코드 & ns_test$마더코드<=100391)&(ns_test$상품군=="가구"), "가구3", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100500<=ns_test$마더코드 & ns_test$마더코드<=100594)&(ns_test$상품군=="가구"), "가구4", ns_test$클래스)

#sort(gageon_u)
# 훈련
#ns_train$클래스 <- ifelse((100067<=ns_train$마더코드 & ns_train$마더코드<=100068)&(ns_train$상품군=="가전"), "가전1", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100091<=ns_train$마더코드 & ns_train$마더코드<=100092)&(ns_train$상품군=="가전"), "가전2", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100148<=ns_train$마더코드 & ns_train$마더코드<=100157)&(ns_train$상품군=="가전"), "가전3", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100289<=ns_train$마더코드 & ns_train$마더코드<=100290)&(ns_train$상품군=="가전"), "가전4", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100572<=ns_train$마더코드 & ns_train$마더코드<=100578)&(ns_train$상품군=="가전"), "가전5", ns_train$클래스)
# 테스트
#ns_test$클래스 <- ifelse((100067<=ns_test$마더코드 & ns_test$마더코드<=100068)&(ns_test$상품군=="가전"), "가전1", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100091<=ns_test$마더코드 & ns_test$마더코드<=100092)&(ns_test$상품군=="가전"), "가전2", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100148<=ns_test$마더코드 & ns_test$마더코드<=100157)&(ns_test$상품군=="가전"), "가전3", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100289<=ns_test$마더코드 & ns_test$마더코드<=100290)&(ns_test$상품군=="가전"), "가전4", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100572<=ns_test$마더코드 & ns_test$마더코드<=100578)&(ns_test$상품군=="가전"), "가전5", ns_test$클래스)

#sort(health_u)

#ns_train$클래스 <- ifelse((100044<=ns_train$마더코드 & ns_train$마더코드<=100058)&(ns_train$상품군=="건강기능"), "건강기능1", ns_train$클래스)

#ns_train$클래스 <-  ifelse((ns_train$마더코드==100125)&(ns_train$상품군=="건강기능"), "건강기능2", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100220<=ns_train$마더코드 & ns_train$마더코드<=100299)&(ns_train$상품군=="건강기능"), "건강기능3", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100309<=ns_train$마더코드 & ns_train$마더코드<=100321)&(ns_train$상품군=="건강기능"), "건강기능4", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100367<=ns_train$마더코드 & ns_train$마더코드<=100382)&(ns_train$상품군=="건강기능"), "건강기능5", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100532<=ns_train$마더코드 & ns_train$마더코드<=100540)&(ns_train$상품군=="건강기능"), "건강기능6", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100558<=ns_train$마더코드 & ns_train$마더코드<=100562)&(ns_train$상품군=="건강기능"), "건강기능7", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100622<=ns_train$마더코드 & ns_train$마더코드<=100624)&(ns_train$상품군=="건강기능"), "건강기능8", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100651<=ns_train$마더코드 & ns_train$마더코드<=100671)&(ns_train$상품군=="건강기능"), "건강기능9", ns_train$클래스)

#ns_train$클래스 <-  ifelse((ns_train$마더코드==100784)&(ns_train$상품군=="건강기능"), "건강기능10", ns_train$클래스)

#ns_train$클래스 <-  ifelse((ns_train$마더코드==100826)&(ns_train$상품군=="건강기능"), "건강기능11", ns_train$클래스)

## 테스트
#ns_test$클래스 <- ifelse((100044<=ns_test$마더코드 & ns_test$마더코드<=100058)&(ns_test$상품군=="건강기능"), "건강기능1", ns_test$클래스)

#ns_test$클래스 <-  ifelse((ns_test$마더코드==100125)&(ns_test$상품군=="건강기능"), "건강기능2", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100220<=ns_test$마더코드 & ns_test$마더코드<=100299)&(ns_test$상품군=="건강기능"), "건강기능3", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100309<=ns_test$마더코드 & ns_test$마더코드<=100321)&(ns_test$상품군=="건강기능"), "건강기능4", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100367<=ns_test$마더코드 & ns_test$마더코드<=100382)&(ns_test$상품군=="건강기능"), "건강기능5", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100532<=ns_test$마더코드 & ns_test$마더코드<=100540)&(ns_test$상품군=="건강기능"), "건강기능6", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100558<=ns_test$마더코드 & ns_test$마더코드<=100562)&(ns_test$상품군=="건강기능"), "건강기능7", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100622<=ns_test$마더코드 & ns_test$마더코드<=100624)&(ns_test$상품군=="건강기능"), "건강기능8", ns_test$클래스)

#ns_test$클래스 <-  ifelse((100651<=ns_test$마더코드 & ns_test$마더코드<=100671)&(ns_test$상품군=="건강기능"), "건강기능9", ns_test$클래스)

#ns_test$클래스 <-  ifelse((ns_test$마더코드==100784)&(ns_test$상품군=="건강기능"), "건강기능10", ns_test$클래스)

#ns_test$클래스 <-  ifelse((ns_test$마더코드==100826)&(ns_test$상품군=="건강기능"), "건강기능11", ns_test$클래스)

#sort(nong_u)

# 훈련
#ns_train[which(ns_train$마더코드==100016),]
#ns_train$클래스 <- ifelse((100002<=ns_train$마더코드 & ns_train$마더코드<=100009)&(ns_train$상품군=="농수축"), "농수축1", ns_train$클래스)

#ns_train$클래스 <- ifelse((100010<=ns_train$마더코드 & ns_train$마더코드<=100016)&(ns_train$상품군=="농수축"), "농수축2", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100022<=ns_train$마더코드 & ns_train$마더코드<=100027)&(ns_train$상품군=="농수축"), "농수축3", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100035<=ns_train$마더코드 & ns_train$마더코드<=100053)&(ns_train$상품군=="농수축"), "농수축4", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100114<=ns_train$마더코드 & ns_train$마더코드<=100116)&(ns_train$상품군=="농수축"), "농수축5", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100165<=ns_train$마더코드 & ns_train$마더코드<=100183)&(ns_train$상품군=="농수축"), "농수축6", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100198<=ns_train$마더코드 & ns_train$마더코드<=100202)&(ns_train$상품군=="농수축"), "농수축7", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100253<=ns_train$마더코드 & ns_train$마더코드<=100274)&(ns_train$상품군=="농수축"), "농수축8", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100300<=ns_train$마더코드 & ns_train$마더코드<=100301)&(ns_train$상품군=="농수축"), "농수축9", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100317<=ns_train$마더코드 & ns_train$마더코드<=100323)&(ns_train$상품군=="농수축"), "농수축8", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100337<=ns_train$마더코드 & ns_train$마더코드<=100349)&(ns_train$상품군=="농수축"), "농수축9", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100350<=ns_train$마더코드 & ns_train$마더코드<=100361)&(ns_train$상품군=="농수축"), "농수축8", ns_train$클래스)

#ns_train$클래스 <-  ifelse((ns_train$마더코드==100383)&(ns_train$상품군=="농수축"), "농수축9", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100430<=ns_train$마더코드 & ns_train$마더코드<=100437)&(ns_train$상품군=="농수축"), "농수축8", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100491<=ns_train$마더코드 & ns_train$마더코드<=100499)&(ns_train$상품군=="농수축"), "농수축9", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100510<=ns_train$마더코드 & ns_train$마더코드<=100514)&(ns_train$상품군=="농수축"), "농수축8", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100521<=ns_train$마더코드 & ns_train$마더코드<=100523)&(ns_train$상품군=="농수축"), "농수축9", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100535<=ns_train$마더코드 & ns_train$마더코드<=100589)&(ns_train$상품군=="농수축"), "농수축8", ns_train$클래스)

#ns_train$클래스 <-  ifelse((100621<=ns_train$마더코드 & ns_train$마더코드<=100708)&(ns_train$상품군=="농수축"), "농수축9", ns_train$클래스)

### 잠깐 작업을 중단하고 factor로 바꾸어 작업을 진행하여 보자
ns_train$마더코드 <- as.factor(ns_train$마더코드)
ns_test$마더코드 <- as.factor(ns_test$마더코드)
level_mother_u <- union(levels(ns_train$마더코드), levels(ns_test$마더코드))
ns_train$마더코드 <- factor(ns_train$마더코드, levels=level_mother_u)
ns_test$마더코드 <- factor(ns_test$마더코드, levels=level_mother_u)

str(ns_train)

View(ns_trains)
View(ns_train)
     
str(ns_train)     

## xgboost 모델 재시행 --- factor자체에는 문제가 없어서 그대로 시행하기로 함..!
ns_train[,14] <- NULL
ns_test[,13] <- NULL
idx <- createDataPartition(ns_train$주문량, p=.8, list=F)

ns_train_tr <- ns_train[idx, ]
ns_train_te <- ns_train[-idx, ]

colnames(ns_train_te)
train_x <-data.matrix(ns_train_tr[,c(-7,-10,-11,-14)])
train_y <-data.matrix(ns_train_tr$주문량)

test_x <- data.matrix(ns_train_te[,c(-7,-10,-11,-14,-15)])


x_train <- xgb.DMatrix(data=train_x, label=train_y)

xgb_mdl <- xgboost(data=x_train, eta=0.01, max_depth=20, nrounds=400, objective="reg:linear",eval_metric="rmse")

pred <- predict(xgb_mdl, newdata=test_x)

ns_train_te$부스팅결과 <- pred

ns_train_te[, c("주문량", "부스팅결과")]

calcRMSE(pred, ns_train_te$주문량)

str(ns_test)

str(ns_train)
View(ns_train)

ns_train

# 취급액이 판매단가보다 적은 경우 0원
ns_train$취급액 <- ifelse(ns_train$취급액 < ns_train$판매단가, 0, ns_train$취급액)

# 요일 변수 추가하기 위한 전처리 과정..!
library(lubridate)

str(ns_train)
ns_train$년 <- as.character(ns_train$년)
nrow(ns_train)
years <- c()
for(i in 1:37600){
  years <- c(years, "2019")
}
years <- years[-1]

ns_train$년 <- years
str(ns_train)
ns_train$월 <- as.character(ns_train$월)
ns_train$일 <- as.character(ns_train$일)
?unite
ns_train
str(ns_train)
ns_train <- unite(ns_train, col="날짜", c("년","월","일"), sep="-")
str(ns_train)
ns_train$요일 <- weekdays(as.Date(ns_train$날짜))
?separate
ns_train <- separate(ns_train, col="날짜", into=c("년","월","일"))
ns_train
# 년도 제거
ns_train <- ns_train[-2]

ns_train$월 <- as.factor(ns_train$월)
ns_train$일 <- as.factor(ns_train$일)

str(ns_train)
ns_train$요일 <- as.factor(ns_train$요일)

ns_train$상품코드 <- as.factor(ns_train$상품코드)
ns_test$상품코드 <- as.factor(ns_test$상품코드)
unions <- union(levels(ns_train$상품코드), levels(ns_test$상품코드))
ns_train$상품코드 <- factor(ns_train$상품코드, levels=unions)
ns_test$상품코드 <- factor(ns_test$상품코드, levels=unions)

### test도 동일한 전처리
nrow(ns_test)
years <- c()
for(i in 1:2750){
  years <- c(years, "2020")
}
years

ns_test$년 <- years
ns_test$월 <- as.character(ns_test$월)
ns_test$일 <- as.character(ns_test$일)
ns_test <- unite(ns_test, col=날짜, c("년","월","일"), sep="-")
ns_test$요일 <- weekdays(as.Date(ns_test$날짜))
ns_test <- separate(ns_test, col="날짜", into=c("년","월","일"))

ns_test <- ns_test[-2]
ns_test$월 <- as.factor(ns_test$월)
ns_test$일 <- as.factor(ns_test$일)
ns_test$요일 <- as.factor(ns_test$요일)

# 노출은 똑같은 시간의 것으로 채움
colSums(is.na(ns_train))

ns_train %>% fill("노출(분)", .direction="up") -> ns_train
ns_test %>% fill("노출(분)", .direction="up") -> ns_test

ns_train$`노출(분)` <- ifelse(is.na(ns_train$`노출(분)`), 20, ns_train$`노출(분)`)
## 일시불, 무이자 가리기
halbu <- c()
for(i in 1:37600){
  halbu <- c(halbu, "할부")
}
ns_train$할부방식 <- halbu
library(stringr)
ns_train
ns_train$할부방식 <- ifelse(str_detect(ns_train$할부방식,"일시불"), "일시불", ns_train$할부방식)
ns_train$할부방식 <- ifelse(str_detect(ns_train$할부방식,"무이자"),"무이자",ns_train$할부방식)
nrow(ns_test)
halbu <- c()
for(i in 1:2750){
  halbu <- c(halbu, "할부")
}

ns_test$할부방식 <- halbu

ns_test$할부방식 <- ifelse(str_detect(ns_test$할부방식, "일시불"),"일시불",ns_test$할부방식)
ns_test$할부방식 <- ifelse(str_detect(ns_test$할부방식, "무이자"),"무이자",ns_test$할부방식)

ns_train$할부방식 <- as.factor(ns_train$할부방식)
ns_test$할부방식 <- as.factor(ns_test$할부방식)

## 우선 상품코드를 factor로 해보자
ns_train$상품코드 <- as.factor(ns_train$상품코드)

ns_test$상품코드 <- as.factor(ns_test$상품코드)

all_level <- union(levels(ns_train$상품코드), levels(ns_test$상품코드))

ns_train$상품코드 <- factor(ns_train$상품코드, levels=all_level)
ns_test$상품코드 <- factor(ns_test$상품코드, levels=all_level)

## xgboost
library(caret)
idx <- createDataPartition(ns_train$주문량, p=.8, list=F)

ns_train_tr <- ns_train[idx, ]
ns_train_te <- ns_train[-idx, ]

colnames(ns_train_tr)

str(ns_train)

train_x <-data.matrix(ns_train_tr[,c(-10,-7,-11)])
# asd                                  
                              
train_y <-data.matrix(ns_train_tr$주문량)

colnames(ns_train_te)
test_x <- data.matrix(ns_train_te[,c(-7,-10,-11)])

library(xgboost)
x_train <- xgb.DMatrix(data=train_x, label=train_y)

xgb_mdl <- xgboost(data=x_train, eta=0.01, max_depth=20, nrounds=500, objective="reg:linear",eval_metric="rmse")

pred <- predict(xgb_mdl, newdata=test_x)

ns_train_te$부스팅결과 <- as.integer(pred)

ns_train_te$부스팅결과 <- as.integer(ns_train_te$부스팅결과)
ns_train_te[, c("주문량", "부스팅결과")]

calcRMSE(pred, ns_train_te$주문량)

ns_train_te$부스팅결과 <- as.integer(ns_train_te$부스팅결과)
# 부스팅 결과 제거
colnames(ns_train_te)
ns_train_te <- ns_train_te[-16]


## 상당히 예측이 약했다는 것을 알 수 있다.
#install.packages("keras")
library(keras)
#install_keras(tensorflow="gpu")
#devtools::install_github("rstudio/keras")
library(reticulate)
#remove.packages('keras')
library(tensorflow)

tensorflow::tf$compat$v1$disable_eager_execution()


idx <- createDataPartition(ns_train$주문량, p=.8, list=F)

ns_train_tr <- ns_train[idx, ]
ns_train_te <- ns_train[-idx, ]

colnames(ns_train_tr)

str(ns_train_tr)

train_x <-data.matrix(ns_train_tr[,c(-10,-7,-11)])
# asd                                  

train_y <-data.matrix(ns_train_tr$주문량)

colnames(ns_train_te)
test_x <- data.matrix(ns_train_te[,c(-7,-10,-11)])

train_x
train_y
test_x

# 정규화 진행
trains <- normalize(train_x[,c(4,8,9)])
trains
trains <- cbind(trains, train_x[,c(1,2,3,5,6,7,10,11,12)])
trains
train_y
tests
tests <- normalize(test_x[,c(4,8,9)])
tests <- cbind(tests, test_x[,c(1,2,3,5,6,7,10,11,12)])

tests

train_x

dim(trains)
library(dplyr)
model <- keras_model_sequential() %>% 
  layer_dense(units=100, activation="relu",input_shape=c(12)) %>%
  layer_dense(units=50,activation="relu") %>%
  layer_dense(units=25, activation="relu") %>%
  layer_dense(units=1)

model %>% summary()

model %>% get_config()

model %>% compile(loss="mse", 
                  optimizer = optimizer_rmsprop(),
                  metrics = c("mean_absolute_error"))

model %>% compile(loss="mse", 
                  optimizer = 'RMSprop',
                  metrics = c("mean_absolute_error"))

model %>% compile(loss="mse", 
                  optimizer = 'adam',
                  metrics = c("mean_absolute_error"))

trains

history <- model %>% 
  fit(train_x, train_y,
      epoch=30,
      validation_split=0.2)

history

train_x

test_x

summary(model)

predict(model, test_x)

train_x
test_x <- test_x[,c(-12,-13)]
test_x
answer <- model %>% predict(test_x)

answer <- as.integer(answer)

answer

## 여기는 결과 보고 붙여 넣어라..!!!!!
ns_train_te$딥러닝결과 <- as.integer(answer)

ns_train_te[,c("주문량", "딥러닝결과")]

ns_train_te[, c("주문량", "부스팅결과", "딥러닝결과")]
#ns_train_te[which(is.na(ns_train_te$딥러닝결과)),]

ns_train_te <- ns_train_te[,-16]

#score <- model %>% evaluate(ns_train_te$딥러닝결과, ns_train_te$주문량)
calcRMSE(answer, ns_train_te$주문량)
calcRMSE(ns_train_te$부스팅결과, ns_train_te$주문량)

## xgboost 모델링을 더 개선해보자..!!

#ns_trainss <- fread("C:/Users/sec/Desktop/ns_train.csv",sep=",", encoding="utf-8")
#ns_trainss
## 딥러닝 === nnet이나 neuralnet 같은 다른 방법을 사용해보자

install.packages("nnet")
library(nnet)
library(neuralnet)
library(ROCR)
fomula <- paste("주문량", paste(colnames(ns_train_tr)[c(-7,-10,-11)],collapse="+"), sep="~")
fomula
idx <- createDataPartition(ns_train$주문량, p=.8, list=F)

ns_train_tr <- ns_train[idx, ]
ns_train_te <- ns_train[-idx, ]

colnames(ns_train_tr)

str(ns_train_tr)

train_x <-data.matrix(ns_train_tr[,c(-10,-7)])
# asd                                  

train_y <-data.matrix(ns_train_tr$주문량)

colnames(ns_train_tr)
test_x <- data.matrix(ns_train_te[,c(-7,-10,-11)])


nn <- nnet(x=train_x , y=train_y, size=50, rang=0.001)
summary(nn)


predict(nn, newdata=test_x)

datas = cbind(train_x, train_y)
datas
datass = cbind(trains, train_y)
colnames(train_x)
trains <- scale(train_x[,c(4,8,10)])
trains <- cbind(trains, train_x[,c(-4,-8,-10)])
tests <- scale(test_x[,c(4,8,10)])
tests <- cbind(tests, test_x[,c(-4,-8,-10)])
datass <- cbind(trains, train_y)
trains
neural <- neuralnet(fomula, data=d.train, act.fct="tanh", linear.output=TRUE, hidden=5, threshold=0.1)
fomula
str(ns_train_tr)

model_result <- compute(neural, tests)
model_result$net.result

?neuralnet
LETTERS[1:10]
colnames(trains) <- LETTERS[1:12]
colnames(trains)

colnames(tests)
colnames(tests) 

nrow(tests)
nrow(trains)

sangmodel
origin_te
sangresult <- compute(sangmodel, origin_te)
#predict(sangmodel, origin_te)

d.train <- as.data.frame(trains)

d.train

tests <- as.data.frame(tests)

cs <- c()
nrow(tests)
for(i in 1:7519){
  cs <- c(cs, NA)
}

tests$주문량 <- cs

tests


## xgboost의 하이퍼 파라미터 튜닝을 해보고

## 추가적으로 넣을 만한 변수들을 추가해보자..!

## 딥러닝도 epochs 나 validation_split을 조금 조정해가면서 한번 돌려보자..!

