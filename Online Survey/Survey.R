library(readxl)
library(dplyr)

survey_data<- read_excel("files/Online Shopping Survey.xlsx")
survey_data


survey_data$Age <- factor(survey_data$Age)
survey_data$Age 
survey_data$Sex <- factor(survey_data$Sex)
survey_data$Sex 
survey_data$Course <- factor(survey_data$Course)
survey_data$Course
survey_data$`Year & Section` <- factor(survey_data$`Year & Section`)
survey_data$`Year & Section`
survey_data$School<- factor(survey_data$School)
survey_data$School

sex_counts <- table(survey_data$Sex)
sex_counts
sex_df <- data.frame(Sex = names(sex_counts), Count = as.numeric(sex_counts))
sex_df
ggplot(sex_df, aes(x = "", y = Count, fill = Sex)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  ggtitle("Sex Distribution") +
  theme_void() +
  scale_fill_manual(values = c("Male" = "darkblue", "Female" = "pink"))

school_counts <- table(survey_data$School)
school_counts
school_df <- data.frame(School = names(school_counts), Count = as.numeric(school_counts))
school_df
ggplot(school_df, aes(x = School, y = Count, fill = School)) +
  geom_bar(stat = "identity") +
  ggtitle("School Distribution") +
  xlab("School") +
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

age_breaks <- c(18, 19, 22, Inf)
age_breaks

age_labels <- c("18-20", "19-22", "22-and-above")
age_labels

survey_data$Age_Group <- cut(survey_data$Age, breaks = age_breaks, labels = age_labels, right = FALSE)
survey_data$Age_Group

table(survey_data$Age_Group)


survey_data$Age_Group <- factor(survey_data$Age_Group, levels = age_labels)
survey_data$Age_Group
