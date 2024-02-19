
# Sjekking av at GaussSuppression-pakka virker

# Denne koden over bør virke uten feil.
library(GaussSuppression)
dataset <- SSBtoolsData("sprt_emp_withEU")
SuppressSmallCounts(data = dataset, 
                    dimVar = c("age", "geo"), 
                    maxN = 3)
# Et datasett med 12 resultatrader skal skrives ut 




# Sjekking av at data kan hentes fra GitHub 


# Du bør klare å laste ned fila sosial.RData
# som ligger i data-mappen i repoet 
# https://github.com/statisticsnorway/kurs-metode-konfidensialitet-frekvens


# Når fila er lagret kan den leses inn i R med load. 

# Hvis fila er på "working directory":
load("sosial.RData")

# Ellers skrives filstien  (bruk / ikke \)
# F.eks: 
load("data/sosial.RData")

# Nå skal det gå an å kjøre denne koden:  
SuppressSmallCounts(data = sosial, 
                    dimVar = c("fylkesnavn", "hovedint"), 
                    maxN = 20)
# Et datasett med 15 resultatrader skal skrives ut 


