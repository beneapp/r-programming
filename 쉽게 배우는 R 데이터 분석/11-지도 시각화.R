# 11 지도 시각화

# 지도 시각화
## 미국 주별 강력 범죄율 단계 구분도 만들기
### 패키지 준비하기

install.packages('ggiraphExtra')
library(ggiraphExtra)

### 미국 주별 범죄 데이터 준비하기
str(USArrests)
head(USArrests)

library(tibble)

crime <- rownames_to_column(USArrests, var = 'state')
crime$state <- tolower(crime$state)

str(crime)
head(crime)

### 미국 주 지도 데이터 준비하기
library(ggplot2)

states_map <- map_data('state')
str(states_map)

ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map)

ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map,
             interactive = T)

## 11-2 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기

### 패키지 준비하기

install.packages('stringi')

install.packages('devtools')
devtools::install_github('cardiomoon/kormaps2014')

library(kormaps2014)

### 대한민국 시도별 인구 데이터 준비하기

# korpop1 | 2015년 센서스 데이터(시도별)
# korpop2 | 2015년 센서스 데이터(시군구별)
# korpop3 | 2015년 센서스 데이터(읍면동별)

str(changeCode(korpop1))

library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

str(changeCode(kormap1))

library(ggiraphExtra)

options(encoding='UTF-8')
### 단계 구분도 만들기
ggChoropleth(data = korpop1,       # 지도에 표현할 데이터
             aes(fill = pop,       # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)      # 인터렉티브

### 대한민국 시도별 결핵 환자 수 단계 구분도 만들기
str(changeCode(tbc))

ggChoropleth(data = tbc,       # 지도에 표현할 데이터
             aes(fill = NewPts,       # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)      # 인터렉티브




