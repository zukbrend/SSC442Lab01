JobAndDefaulting <- ggplot(
  data=bankData,
  mapping=aes(
    x=job,
    fill=default
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  scale_fill_manual(
    values=c("black", "red")
  ) +
  xlab("Occupation") +
  ylab("Number") + 
  ggtitle("Number of Defaulted Accounts Based on Occupation") +
  theme(axis.text.x=element_text(angle=60, hjust=1))

JobAndDefaulting

EducationAndDefaulting <- ggplot(
  data=bankData,
  mapping=aes(
    x=education,
    fill=default
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  scale_fill_manual(
    values=c("black", "red")
  ) +
  xlab("Education Level") +
  ylab("Number") + 
  ggtitle("Number of Defaulted Accounts Based on Education Level") +
  theme(axis.text.x=element_text(angle=60, hjust=1))

EducationAndDefaulting

MortgagesAndLoans <- ggplot(
  data=bankData,
  mapping=aes(
    x=housing,
    fill=loan
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  scale_fill_manual(
    values=c("red", "blue")
  ) + 
  xlab("Has a Mortgage") +
  ylab("Number") + 
  ggtitle("Mortgages and Loans") +
  theme(plot.title=element_text(hjust=0.5))

MortgagesAndLoans