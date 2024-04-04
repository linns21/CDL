# 加载必要的库
install.packages('wordcloud')
install.packages('tm')
library(wordcloud)
library(tm) # 用于文本挖掘和清理
library(readr)

# 读取CSV文件
scoresheet <- read_csv("scoresheet.csv")

# 检查数据框的前几行，以确保Q4列存在且正确读取
head(scoresheet)

# 假设Q4列包含文本数据，我们将其转换为Corpus对象，以便进行清理
corpus <- Corpus(VectorSource(scoresheet$Q14))


# 创建一个词汇表，计算每个词的频率
dtm <- TermDocumentMatrix(corpus)
matrix <- as.matrix(dtm)
word_freqs <- sort(rowSums(matrix), decreasing = TRUE)
word_freqs_df <- data.frame(word = names(word_freqs), freq = word_freqs)

# 检查频次数据
head(word_freqs_df)
