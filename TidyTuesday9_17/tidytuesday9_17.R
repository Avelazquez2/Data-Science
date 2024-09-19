tt_gh <- tt_load_gh("2024-09-17")
hamlet <- tt_download_file(tt_gh, "hamlet.csv")
macbeth <- tt_download_file(tt_gh, "macbeth.csv")
romeo_juliet <- tt_download_file(tt_gh, "romeo_juliet.csv")


# Graphing the characters with the most lines
line_count_hamlet <- hamlet %>%
  group_by(character) %>%
  summarize(line_count = n())

line_count_macbeth <- macbeth %>%
  group_by(character) %>%
  summarize(line_count = n())

line_count_romjul <- romeo_juliet %>%
  group_by(character) %>%
  summarize(line_count = n())

# plotting the lint count of all characters for each play
ggplot(data = line_count_romjul, aes(y=line_count,x=reorder(character, -line_count)))+geom_bar(stat='identity', aes(fill=character))+labs(title="Line Count for All Characters in Romeo and Juliet",y="Line Count", x="Character")+theme(legend.position="none", axis.text.x = element_text(angle = 90, vjust = 1, hjust = 1))
ggplot(data = line_count_hamlet, aes(y=line_count,x=reorder(character, -line_count)))+geom_bar(stat='identity', aes(fill=character))+labs(title="Line Count for All Characters in Hamlet",y="Line Count", x="Character")+theme(legend.position="none", axis.text.x = element_text(angle = 90, vjust = 1, hjust = 1))
ggplot(data = line_count_macbeth, aes(y=line_count,x=reorder(character, -line_count)))+geom_bar(stat='identity', aes(fill=character))+labs(title="Line Count for All Characters in Macbeth",y="Line Count", x="Character")+theme(legend.position="none", axis.text.x = element_text(angle = 90, vjust = 1, hjust = 1))

othello <- read_csv("othello.csv")
metadata <- read_csv("metadata.csv")
