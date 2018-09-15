# 인터렉티브 그래프
## plotly 패키지로 인터랙티브 그래프 만들기

install.packages('plotly')
library(plotly)
library(ggplot2)

p <- ggplot(data = mpg,
            aes(x = displ,
                y = hwy,
                col = drv)) +  geom_point()

ggplotly(p)

p <- ggplot(data = diamonds,
            aes(x = cut,
                fill = clarity)) + geom_bar(position = 'dodge')
ggplotly(p)

## dygraphs 패키지로 인터랙티브 시계열 그래프 만들기
install.packages('dygraphs')
library(dygraphs)

economics <- ggplot2::economics
head(economics)

library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

# 그래프 생성
dygraph(eco)

# 날짜 범위 선택 기능
dygraph(eco) %>% dyRangeSelector()

## 여러 값 표현하기
### 저축률
eco_a <- xts(economics$psavert, order.by = economics$date)
### 실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c('psavert', 'unemply')
head(eco2)

dygraph(eco2) %>% dyRangeSelector()

