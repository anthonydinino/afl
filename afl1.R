library(fitzRoy) # run this command first
library(dplyr) # then this command

players <- fetch_player_stats(2021)

disposalsDF <- players %>%  
  select(player.givenName, player.surname,team.name, disposals, team.name)


changedDisposals <- disposalsDF %>% 
  group_by(player.surname, player.givenName, team.name) %>% 
  summarise(games.played = n(),
            over15.count = sum(disposals >= 15),
            over15dissies = scales::percent(over15.count / games.played, accuracy=0.01),
            over20.count = sum(disposals >= 20),
            over20dissies = scales::percent(over20.count / games.played, accuracy=0.01),
            over25.count = sum(disposals >= 25),
            over25dissies = scales::percent(over25.count / games.played, accuracy=0.01),
            over30.count = sum(disposals >= 30),
            over30dissies = scales::percent(over30.count / games.played, accuracy=0.01),
            over35.count = sum(disposals >= 35),
            over35dissies = scales::percent(over35.count / games.played, accuracy=0.01),
            over40.count = sum(disposals >= 40),
            over40dissies = scales::percent(over40.count / games.played, accuracy=0.01)) %>% 
  select(player.surname, player.givenName, team.name,
         over15dissies, over20dissies, over25dissies,
         over30dissies, over35dissies, over40dissies)


            