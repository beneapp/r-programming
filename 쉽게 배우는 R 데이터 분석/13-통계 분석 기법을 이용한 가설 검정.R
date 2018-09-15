# 13 통계 분석 기법을 이용한 가설 검정X

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)

mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c('compact', 'suv'))

head(mpg_diff)
table(mpg_diff$class)

t.test(data = mpg_diff,
       cty ~ class, 
       var.equal = T)

# 일반 휘발유과 고급 휘발유의 도시 연비 t 검정
mpg_diff2 <- mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c('r', 'p'))

table(mpg_diff2)

t.test(data=mpg_diff2, cty ~ fl, var.equal = T)
