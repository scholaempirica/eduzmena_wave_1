data <- read.csv("survey_867277_R_data_file.csv", quote = "'\"", na.strings=c("", "\"\""), stringsAsFactors=FALSE, fileEncoding="UTF-8-BOM")


# LimeSurvey Field type: F
data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"
# LimeSurvey Field type: DATETIME23.2
data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"
# LimeSurvey Field type: F
data[, 3] <- as.numeric(data[, 3])
attributes(data)$variable.labels[3] <- "lastpage"
names(data)[3] <- "lastpage"
# LimeSurvey Field type: A
data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "startlanguage"
names(data)[4] <- "startlanguage"
# LimeSurvey Field type: A
data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "Počáteční"
names(data)[5] <- "q_"
# LimeSurvey Field type: A
data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- "{TOKEN:TOKEN}"
names(data)[6] <- "token"
# LimeSurvey Field type: DATETIME23.2
data[, 7] <- as.character(data[, 7])
attributes(data)$variable.labels[7] <- "startdate"
names(data)[7] <- "startdate"
# LimeSurvey Field type: DATETIME23.2
data[, 8] <- as.character(data[, 8])
attributes(data)$variable.labels[8] <- "datestamp"
names(data)[8] <- "datestamp"
# LimeSurvey Field type: F
data[, 9] <- as.numeric(data[, 9])
attributes(data)$variable.labels[9] <- "Jste žena, nebo muž?"
data[, 9] <- factor(data[, 9], levels=c(1,2),labels=c("Žena", "Muž"))
names(data)[9] <- "S0Q1"
# LimeSurvey Field type: F
data[, 10] <- as.numeric(data[, 10])
attributes(data)$variable.labels[10] <- "Kolik je Vám let? (Uveďte prosím číslo.)"
names(data)[10] <- "S0Q2"
# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "Byla učitelská profese z hlediska kariéry Vaší první volbou? „Kariérou“ se rozumí placená práce, která z Vašeho pohledu utváří Váš pracovní život."
data[, 11] <- factor(data[, 11], levels=c(1,2,3),labels=c("Ano", "Ne", "Nevím / nedokážu to již posoudit"))
names(data)[11] <- "S0Q3"
# LimeSurvey Field type: A
data[, 12] <- as.character(data[, 12])
attributes(data)$variable.labels[12] <- "[Můj pracovní úvazek na této škole …] Jaký je Váš současný pracovní úvazek učitele/učitelky z hlediska počtu hodin? Prosím vezměte v úvahu pracovní úvazek na této škole a také veškeré ostatní pracovní úvazky na pozici učitele.   Prosím, ujistěte se, že úvazek na této škole není vyšší než všechny učitelské úvazky dohromady."
data[, 12] <- factor(data[, 12], levels=c("A2","A3","A4","A5"),labels=c("Plný úvazek (více než 90 % času odpovídajícího plnému úvazku)", "Částečný úvazek (71-90 % času odpovídajícího plnému úvazku)", "Částečný úvazek (50-70 % času odpovídající ho plnému úvazku)", "Částečný úvazek (méně než 50 % času odpovídající plnému úvazku)"))
names(data)[12] <- "S0Q4_SQ002"
# LimeSurvey Field type: A
data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "[Všechny mé učitelské pracovní úvazky dohromady ...] Jaký je Váš současný pracovní úvazek učitele/učitelky z hlediska počtu hodin? Prosím vezměte v úvahu pracovní úvazek na této škole a také veškeré ostatní pracovní úvazky na pozici učitele.   Prosím, ujistěte se, že úvazek na této škole není vyšší než všechny učitelské úvazky dohromady."
data[, 13] <- factor(data[, 13], levels=c("A2","A3","A4","A5"),labels=c("Plný úvazek (více než 90 % času odpovídajícího plnému úvazku)", "Částečný úvazek (71-90 % času odpovídajícího plnému úvazku)", "Částečný úvazek (50-70 % času odpovídající ho plnému úvazku)", "Částečný úvazek (méně než 50 % času odpovídající plnému úvazku)"))
names(data)[13] <- "S0Q4_SQ003"
# LimeSurvey Field type: F
data[, 14] <- as.numeric(data[, 14])
attributes(data)$variable.labels[14] <- "[jako učitel/ka v této škole pracuji ...] Kolik let pracovních zkušeností máte za sebou bez ohledu na to, zdali jste pracoval/a na plný či částečný úvazek?   Do celkového počtu nezahrnujte delší období, kdy jste byl/a z práce uvolněn/a, jako je mateřská/rodičovská dovolená. Uveďte prosím číslo do obou řádků. V případě žádných let napište 0 (nula). Zaokrouhlete prosím na celé roky."
names(data)[14] <- "S0Q5_SQ002"
# LimeSurvey Field type: F
data[, 15] <- as.numeric(data[, 15])
attributes(data)$variable.labels[15] <- "[jako učitel/ka jsem celkem pracoval/a ...] Kolik let pracovních zkušeností máte za sebou bez ohledu na to, zdali jste pracoval/a na plný či částečný úvazek?   Do celkového počtu nezahrnujte delší období, kdy jste byl/a z práce uvolněn/a, jako je mateřská/rodičovská dovolená. Uveďte prosím číslo do obou řádků. V případě žádných let napište 0 (nula). Zaokrouhlete prosím na celé roky."
names(data)[15] <- "S0Q5_SQ003"
# LimeSurvey Field type: A
data[, 16] <- as.character(data[, 16])
attributes(data)$variable.labels[16] <- "{TOKEN:TOKEN}"
names(data)[16] <- "token"
# LimeSurvey Field type: A
data[, 17] <- as.character(data[, 17])
attributes(data)$variable.labels[17] <- "{TOKEN:ATTRIBUTE_1}"
names(data)[17] <- "izo"
# LimeSurvey Field type: A
data[, 18] <- as.character(data[, 18])
attributes(data)$variable.labels[18] <- "{TOKEN:ATTRIBUTE_2}"
names(data)[18] <- "ico"
# LimeSurvey Field type: A
data[, 19] <- as.character(data[, 19])
attributes(data)$variable.labels[19] <- "{TOKEN:ATTRIBUTE_3}"
names(data)[19] <- "nazev"
# LimeSurvey Field type: A
data[, 20] <- as.character(data[, 20])
attributes(data)$variable.labels[20] <- "[Učitelé a žáci spolu obvykle dobře vycházejí.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o tom, co se děje v této škole?"
data[, 20] <- factor(data[, 20], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[20] <- "S1Q1_SQ002"
# LimeSurvey Field type: A
data[, 21] <- as.character(data[, 21])
attributes(data)$variable.labels[21] <- "[Většina učitelů věří, že úspěch žáků je důležitý.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o tom, co se děje v této škole?"
data[, 21] <- factor(data[, 21], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[21] <- "S1Q1_SQ003"
# LimeSurvey Field type: A
data[, 22] <- as.character(data[, 22])
attributes(data)$variable.labels[22] <- "[Většinu učitelů zajímá názor žáků.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o tom, co se děje v této škole?"
data[, 22] <- factor(data[, 22], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[22] <- "S1Q1_SQ004"
# LimeSurvey Field type: A
data[, 23] <- as.character(data[, 23])
attributes(data)$variable.labels[23] <- "[Jestliže žák potřebuje další pomoc, škola mu ji poskytne.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o tom, co se děje v této škole?"
data[, 23] <- factor(data[, 23], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[23] <- "S1Q1_SQ005"
# LimeSurvey Field type: A
data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[24] <- "[Učitelé se na sebe mohou vzájemně spolehnout.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o tom, co se děje v této škole?"
data[, 24] <- factor(data[, 24], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[24] <- "S1Q1_SQ006"
# LimeSurvey Field type: A
data[, 25] <- as.character(data[, 25])
attributes(data)$variable.labels[25] <- "[Tato škola poskytuje zaměstnancům příležitosti aktivně se podílet na rozhodování o školních záležitostech.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o této škole?"
data[, 25] <- factor(data[, 25], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[25] <- "S1Q2_SQ002"
# LimeSurvey Field type: A
data[, 26] <- as.character(data[, 26])
attributes(data)$variable.labels[26] <- "[Tato škola poskytuje rodičům nebo zákonným zástupcům příležitosti aktivně se podílet na rozhodování o školních záležitostech.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o této škole?"
data[, 26] <- factor(data[, 26], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[26] <- "S1Q2_SQ003"
# LimeSurvey Field type: A
data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[27] <- "[Tato škola poskytuje žákům příležitosti aktivně se podílet na rozhodování o školních záležitostech.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky o této škole?"
data[, 27] <- factor(data[, 27], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[27] <- "S1Q2_SQ004"
# LimeSurvey Field type: A
data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[28] <- "[Většina učitelů v této škole se snaží přicházet s novými myšlenkami v oblasti výuky a vzdělávání.] Když se zamyslíte nad učiteli v této škole, do jaké míry souhlasíte, či nesouhlasíte s následujícími výroky?"
data[, 28] <- factor(data[, 28], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[28] <- "S1Q3_SQ002"
# LimeSurvey Field type: A
data[, 29] <- as.character(data[, 29])
attributes(data)$variable.labels[29] <- "[Většina učitelů v této škole je otevřena změnám.] Když se zamyslíte nad učiteli v této škole, do jaké míry souhlasíte, či nesouhlasíte s následujícími výroky?"
data[, 29] <- factor(data[, 29], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[29] <- "S1Q3_SQ003"
# LimeSurvey Field type: A
data[, 30] <- as.character(data[, 30])
attributes(data)$variable.labels[30] <- "[Většina učitelů v této škole hledá nové způsoby, jak řešit problémy.] Když se zamyslíte nad učiteli v této škole, do jaké míry souhlasíte, či nesouhlasíte s následujícími výroky?"
data[, 30] <- factor(data[, 30], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[30] <- "S1Q3_SQ004"
# LimeSurvey Field type: A
data[, 31] <- as.character(data[, 31])
attributes(data)$variable.labels[31] <- "[Většina učitelů v této škole si vzájemně poskytuje praktickou podporu při uplatňování nových myšlenek.] Když se zamyslíte nad učiteli v této škole, do jaké míry souhlasíte, či nesouhlasíte s následujícími výroky?"
data[, 31] <- factor(data[, 31], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[31] <- "S1Q3_SQ005"
# LimeSurvey Field type: A
data[, 32] <- as.character(data[, 32])
attributes(data)$variable.labels[32] <- "[… dokážou naučit matematiku i nejslabší žáky.] Označte míru souhlasu či nesouhlasu s následujícími výroky týkajícími se učitelského týmu Vaší školy. Učitelé v této škole…"
data[, 32] <- factor(data[, 32], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[32] <- "S1Q4_SQ002"
# LimeSurvey Field type: A
data[, 33] <- as.character(data[, 33])
attributes(data)$variable.labels[33] <- "[… dokážou dosáhnout čtenářské gramotnosti (porozumění textu) i u nejslabších žáků.] Označte míru souhlasu či nesouhlasu s následujícími výroky týkajícími se učitelského týmu Vaší školy. Učitelé v této škole…"
data[, 33] <- factor(data[, 33], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[33] <- "S1Q4_SQ004"
# LimeSurvey Field type: A
data[, 34] <- as.character(data[, 34])
attributes(data)$variable.labels[34] <- "[…dokážou naučit přírodní vědy i nejslabší žáky.] Označte míru souhlasu či nesouhlasu s následujícími výroky týkajícími se učitelského týmu Vaší školy. Učitelé v této škole…"
data[, 34] <- factor(data[, 34], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[34] <- "S1Q4_SQ005"
# LimeSurvey Field type: A
data[, 35] <- as.character(data[, 35])
attributes(data)$variable.labels[35] <- "[… dokážou vzbudit zájem o školu i u nejslabších žáků] Označte míru souhlasu či nesouhlasu s následujícími výroky týkajícími se učitelského týmu Vaší školy. Učitelé v této škole…"
data[, 35] <- factor(data[, 35], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[35] <- "S1Q4_SQ006"
# LimeSurvey Field type: A
data[, 36] <- as.character(data[, 36])
attributes(data)$variable.labels[36] <- "[Vyučuji týmově společně s jinými učiteli v téže třídě.] Jak často se v průměru Vy osobně v této škole věnujete následujícím činnostem?"
data[, 36] <- factor(data[, 36], levels=c("A1","A2","A3","A4","A5","A6","A7"),labels=c("Nikdy", "Jednou za rok nebo méně často", "2-4krát za rok", "5-10krát za rok", "1-3krát za měsíc", "Jednou za týden nebo častěji", "Nevím / nechci odpovědět"))
names(data)[36] <- "S2Q1_a"
# LimeSurvey Field type: A
data[, 37] <- as.character(data[, 37])
attributes(data)$variable.labels[37] <- "[Pozoruji výuku ostatních učitelů a poskytuji jim zpětnou vazbu.] Jak často se v průměru Vy osobně v této škole věnujete následujícím činnostem?"
data[, 37] <- factor(data[, 37], levels=c("A1","A2","A3","A4","A5","A6","A7"),labels=c("Nikdy", "Jednou za rok nebo méně často", "2-4krát za rok", "5-10krát za rok", "1-3krát za měsíc", "Jednou za týden nebo častěji", "Nevím / nechci odpovědět"))
names(data)[37] <- "S2Q1_b"
# LimeSurvey Field type: A
data[, 38] <- as.character(data[, 38])
attributes(data)$variable.labels[38] <- "[Vyměňuji si učební materiály s kolegy.] Jak často se v průměru Vy osobně v této škole věnujete následujícím činnostem?"
data[, 38] <- factor(data[, 38], levels=c("A1","A2","A3","A4","A5","A6","A7"),labels=c("Nikdy", "Jednou za rok nebo méně často", "2-4krát za rok", "5-10krát za rok", "1-3krát za měsíc", "Jednou za týden nebo častěji", "Nevím / nechci odpovědět"))
names(data)[38] <- "S2Q1_c"
# LimeSurvey Field type: A
data[, 39] <- as.character(data[, 39])
attributes(data)$variable.labels[39] <- "[Probírám s kolegy studijní pokroky konkrétních žáků.] Jak často se v průměru Vy osobně v této škole věnujete následujícím činnostem?"
data[, 39] <- factor(data[, 39], levels=c("A1","A2","A3","A4","A5","A6","A7"),labels=c("Nikdy", "Jednou za rok nebo méně často", "2-4krát za rok", "5-10krát za rok", "1-3krát za měsíc", "Jednou za týden nebo častěji", "Nevím / nechci odpovědět"))
names(data)[39] <- "S2Q1_d"
# LimeSurvey Field type: A
data[, 40] <- as.character(data[, 40])
attributes(data)$variable.labels[40] <- "[Spolupracuji s ostatními učiteli v této škole s cílem zabezpečit stejné standardy při hodnocení pokroku žáků.] Jak často se v průměru Vy osobně v této škole věnujete následujícím činnostem?"
data[, 40] <- factor(data[, 40], levels=c("A1","A2","A3","A4","A5","A6","A7"),labels=c("Nikdy", "Jednou za rok nebo méně často", "2-4krát za rok", "5-10krát za rok", "1-3krát za měsíc", "Jednou za týden nebo častěji", "Nevím / nechci odpovědět"))
names(data)[40] <- "S2Q1_e"
# LimeSurvey Field type: A
data[, 41] <- as.character(data[, 41])
attributes(data)$variable.labels[41] <- "[Zapojuji se do společných aktivit napříč třídami a věkovými skupinami (např. do projektů).] Jak často se v průměru Vy osobně v této škole věnujete následujícím činnostem?"
data[, 41] <- factor(data[, 41], levels=c("A1","A2","A3","A4","A5","A6","A7"),labels=c("Nikdy", "Jednou za rok nebo méně často", "2-4krát za rok", "5-10krát za rok", "1-3krát za měsíc", "Jednou za týden nebo častěji", "Nevím / nechci odpovědět"))
names(data)[41] <- "S2Q1_f"
# LimeSurvey Field type: A
data[, 42] <- as.character(data[, 42])
attributes(data)$variable.labels[42] <- "[Přesvědčit žáky, že mohou mít dobré výsledky.] Do jaké míry zvládáte při výuce následující? "
data[, 42] <- factor(data[, 42], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[42] <- "S2Q2_SQ001"
# LimeSurvey Field type: A
data[, 43] <- as.character(data[, 43])
attributes(data)$variable.labels[43] <- "[Pomoci žákům uvědomit si, jakou má učení hodnotu.] Do jaké míry zvládáte při výuce následující? "
data[, 43] <- factor(data[, 43], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[43] <- "S2Q2_SQ002"
# LimeSurvey Field type: A
data[, 44] <- as.character(data[, 44])
attributes(data)$variable.labels[44] <- "[Mít pod kontrolou vyrušování ve třídě.] Do jaké míry zvládáte při výuce následující? "
data[, 44] <- factor(data[, 44], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[44] <- "S2Q2_SQ003"
# LimeSurvey Field type: A
data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[45] <- "[Motivovat žáky, kteří nemají zájem o školní práci.] Do jaké míry zvládáte při výuce následující? "
data[, 45] <- factor(data[, 45], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[45] <- "S2Q2_SQ004"
# LimeSurvey Field type: A
data[, 46] <- as.character(data[, 46])
attributes(data)$variable.labels[46] <- "[Vyjasnit svá očekávání ohledně chování žáků.] Do jaké míry zvládáte při výuce následující? "
data[, 46] <- factor(data[, 46], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[46] <- "S2Q2_SQ005"
# LimeSurvey Field type: A
data[, 47] <- as.character(data[, 47])
attributes(data)$variable.labels[47] <- "[Pomáhat žákům myslet kriticky.] Do jaké míry zvládáte při výuce následující? "
data[, 47] <- factor(data[, 47], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[47] <- "S2Q2_SQ006"
# LimeSurvey Field type: A
data[, 48] <- as.character(data[, 48])
attributes(data)$variable.labels[48] <- "[Dosáhnout toho, aby žáci dodržovali pravidla ve třídě.] Do jaké míry zvládáte při výuce následující? "
data[, 48] <- factor(data[, 48], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[48] <- "S2Q2_SQ007"
# LimeSurvey Field type: A
data[, 49] <- as.character(data[, 49])
attributes(data)$variable.labels[49] <- "[Uklidnit žáka, který vyrušuje nebo je hlučný.] Do jaké míry zvládáte při výuce následující? "
data[, 49] <- factor(data[, 49], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[49] <- "S2Q2_SQ018"
# LimeSurvey Field type: A
data[, 50] <- as.character(data[, 50])
attributes(data)$variable.labels[50] <- "[Vysvětlit klíčové koncepty tak, aby jim dobře porozuměli i nejslabší žáci ve třídě.] Do jaké míry zvládáte při výuce následující? "
data[, 50] <- factor(data[, 50], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Velmi málo", "Do určité míry", "Do značné míry", "Nevím / nechci odpovědět"))
names(data)[50] <- "S2Q2_SQ019"
# LimeSurvey Field type: A
data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[51] <- "[Žáci se mi svěřují se svými problémy a starostmi, sdělují mi své zážitky.] Do jaké míry souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 51] <- factor(data[, 51], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[51] <- "S2Q3_a"
# LimeSurvey Field type: A
data[, 52] <- as.character(data[, 52])
attributes(data)$variable.labels[52] <- "[Vím, co se žáci učí v jiných předmětech, a zohledňuji to ve svých předmětech.] Do jaké míry souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 52] <- factor(data[, 52], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[52] <- "S2Q3_b"
# LimeSurvey Field type: A
data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[53] <- "[Připravuji si odlišné úlohy a vzdělávací aktivity pro různé typy žáků (nadané žáky, cizince a žáky se speciálními vzdělávacími potřebami apod.).] Do jaké míry souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 53] <- factor(data[, 53], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[53] <- "S2Q3_c"
# LimeSurvey Field type: A
data[, 54] <- as.character(data[, 54])
attributes(data)$variable.labels[54] <- "[Máte kapacitu reagovat na individuální potřeby svých žáků?] Odpovězte, prosím, na následující otázky:"
data[, 54] <- factor(data[, 54], levels=c("A2","A3","A4","A5","A6","A7"),labels=c("Určitě ne", "Spíše ne", "Tak napůl", "Spíše ano", "Určitě ano", "Nevím / nechci odpovědět"))
names(data)[54] <- "S2Q4_SQ002"
# LimeSurvey Field type: A
data[, 55] <- as.character(data[, 55])
attributes(data)$variable.labels[55] <- "[Znáte rodinné zázemí svých žáků?] Odpovězte, prosím, na následující otázky:"
data[, 55] <- factor(data[, 55], levels=c("A2","A3","A4","A5","A6","A7"),labels=c("Určitě ne", "Spíše ne", "Tak napůl", "Spíše ano", "Určitě ano", "Nevím / nechci odpovědět"))
names(data)[55] <- "S2Q4_SQ003"
# LimeSurvey Field type: A
data[, 56] <- as.character(data[, 56])
attributes(data)$variable.labels[56] <- "[Radíte individuálně svým žákům, co mají dělat, aby se ve Vašem předmětu zlepšili? [Nepočítejte rady typu „musíš se víc učit“, ale doporučení „šitá na míru“ konkrétním žákům, vycházející z jejich schopností a možností.]] Odpovězte, prosím, na následující otázky:"
data[, 56] <- factor(data[, 56], levels=c("A2","A3","A4","A5","A6","A7"),labels=c("Určitě ne", "Spíše ne", "Tak napůl", "Spíše ano", "Určitě ano", "Nevím / nechci odpovědět"))
names(data)[56] <- "S2Q4_SQ004"
# LimeSurvey Field type: A
data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[57] <- "[V současné době mám přiděleného mentora, který mi pomáhá.] Jste v současné době zapojen/a do nějakých mentorských činností, které jsou formální součástí chodu této školy? (“Mentorování“ je způsob, jakým mohou zkušenější učitelé podpořit méně zkušené učitele na školách.)"
data[, 57] <- factor(data[, 57], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[57] <- "S3Q1_SQ002"
# LimeSurvey Field type: A
data[, 58] <- as.character(data[, 58])
attributes(data)$variable.labels[58] <- "[V současné době působím jako mentor jednoho či více učitelů.] Jste v současné době zapojen/a do nějakých mentorských činností, které jsou formální součástí chodu této školy? (“Mentorování“ je způsob, jakým mohou zkušenější učitelé podpořit méně zkušené učitele na školách.)"
data[, 58] <- factor(data[, 58], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[58] <- "S3Q1_SQ003"
# LimeSurvey Field type: A
data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[59] <- "Máte alespoň jednoho kolegu, který sice není Váš formální mentor (ani Vy jeho), ale se kterým pravidelně a systematicky diskutuje své pedagogické metody, používané techniky a jejich výsledky a pomáháte si tak vzájemně v rozvoji svých učitelských dovedností?"
data[, 59] <- factor(data[, 59], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[59] <- "S3Q2"
# LimeSurvey Field type: A
data[, 60] <- as.character(data[, 60])
attributes(data)$variable.labels[60] <- "Když se zamyslíte nad všemi zpětnými vazbami, které jste obdržel/a během posledních 12 měsíců, máte dojem, že měla některá z nich pozitivní vliv na styl Vaší výuky?"
data[, 60] <- factor(data[, 60], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[60] <- "S3Q3"
# LimeSurvey Field type: A
data[, 61] <- as.character(data[, 61])
attributes(data)$variable.labels[61] <- "[Prohloubení mých faktických znalostí a vědomostí v předmětech, které vyučuji] Když se zamyslíte nad zpětnou vazbou, kterou jste obdržel/a během posledních 12 měsíců, máte dojem, že vedla k pozitivním změnám ve kterémkoliv z následujících aspektů Vaší výuky?"
data[, 61] <- factor(data[, 61], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[61] <- "S3Q4_SQ002"
# LimeSurvey Field type: A
data[, 62] <- as.character(data[, 62])
attributes(data)$variable.labels[62] <- "[Pedagogické dovednosti pro výuku mého předmětu] Když se zamyslíte nad zpětnou vazbou, kterou jste obdržel/a během posledních 12 měsíců, máte dojem, že vedla k pozitivním změnám ve kterémkoliv z následujících aspektů Vaší výuky?"
data[, 62] <- factor(data[, 62], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[62] <- "S3Q4_SQ003"
# LimeSurvey Field type: A
data[, 63] <- as.character(data[, 63])
attributes(data)$variable.labels[63] <- "[Využití hodnocení žáků za účelem zlepšení jejich učení] Když se zamyslíte nad zpětnou vazbou, kterou jste obdržel/a během posledních 12 měsíců, máte dojem, že vedla k pozitivním změnám ve kterémkoliv z následujících aspektů Vaší výuky?"
data[, 63] <- factor(data[, 63], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[63] <- "S3Q4_SQ004"
# LimeSurvey Field type: A
data[, 64] <- as.character(data[, 64])
attributes(data)$variable.labels[64] <- "[Vedení třídy] Když se zamyslíte nad zpětnou vazbou, kterou jste obdržel/a během posledních 12 měsíců, máte dojem, že vedla k pozitivním změnám ve kterémkoliv z následujících aspektů Vaší výuky?"
data[, 64] <- factor(data[, 64], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[64] <- "S3Q4_SQ005"
# LimeSurvey Field type: A
data[, 65] <- as.character(data[, 65])
attributes(data)$variable.labels[65] <- "[Metody výuky žáků se speciálními potřebami] Když se zamyslíte nad zpětnou vazbou, kterou jste obdržel/a během posledních 12 měsíců, máte dojem, že vedla k pozitivním změnám ve kterémkoliv z následujících aspektů Vaší výuky?"
data[, 65] <- factor(data[, 65], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[65] <- "S3Q4_SQ006"
# LimeSurvey Field type: A
data[, 66] <- as.character(data[, 66])
attributes(data)$variable.labels[66] <- "[Metody výuky v multikulturním či vícejazyčném prostředí] Když se zamyslíte nad zpětnou vazbou, kterou jste obdržel/a během posledních 12 měsíců, máte dojem, že vedla k pozitivním změnám ve kterémkoliv z následujících aspektů Vaší výuky?"
data[, 66] <- factor(data[, 66], levels=c("A2","A3","A4"),labels=c("Ano", "Ne", "Nevím / nechci odpovědět"))
names(data)[66] <- "S3Q4_SQ007"
# LimeSurvey Field type: F
data[, 67] <- as.numeric(data[, 67])
attributes(data)$variable.labels[67] <- "Prosím pokuste se co nejpřesněji odhadnout, kolik hodin jste v minulém pololetí (které již skončilo, nikoliv v tom probíhajícím) strávil/a na přednáškách, workshopech či jiných odborných akcích věnovaných Vašemu profesnímu rozvoji z vlastního zájmu (nad rámec povinného vzdělávání)?"
names(data)[67] <- "S3Q5"
# LimeSurvey Field type: A
data[, 68] <- as.character(data[, 68])
attributes(data)$variable.labels[68] <- "[Průběh svých hodin si mohu organizovat podle vlastního uvážení.] Do jaké míry souhlasíte s následujícími výroky?"
data[, 68] <- factor(data[, 68], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[68] <- "S4Q1_SQ002"
# LimeSurvey Field type: A
data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[69] <- "[Důležité poznatky o pokroku žáků pravidelně sděluji rodičům.] Do jaké míry souhlasíte s následujícími výroky?"
data[, 69] <- factor(data[, 69], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[69] <- "S4Q1_SQ003"
# LimeSurvey Field type: A
data[, 70] <- as.character(data[, 70])
attributes(data)$variable.labels[70] <- "[Dokážu bez váhání konkrétně pojmenovat, v čem se chci jako učitel/ka v příštím roce zlepšovat.] Do jaké míry souhlasíte s následujícími výroky?"
data[, 70] <- factor(data[, 70], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[70] <- "S4Q1_SQ004"
# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[71] <- "Uvedl/a jste, že dokážete pojmenovat, v čem se chcete jako učitel/ka v příštím roce zlepšovat. Moc by nám pomohlo, kdybyste to mohl/a krátce popsat."
names(data)[71] <- "S4Q2"
# LimeSurvey Field type: A
data[, 72] <- as.character(data[, 72])
attributes(data)$variable.labels[72] <- "[Vnímám ředitele/ředitelku školy jako dobrého leadera.] Když se zamyslíte nad vedením této školy, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 72] <- factor(data[, 72], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[72] <- "S4Q3_SQ002"
# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[73] <- "[Koordinace všech činností ve škole je promyšlená.] Když se zamyslíte nad vedením této školy, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 73] <- factor(data[, 73], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[73] <- "S4Q3_SQ003"
# LimeSurvey Field type: A
data[, 74] <- as.character(data[, 74])
attributes(data)$variable.labels[74] <- "[Vedení školy přistupuje ke všem spravedlivě.] Když se zamyslíte nad vedením této školy, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 74] <- factor(data[, 74], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[74] <- "S4Q3_SQ004"
# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[75] <- "[Forma i rozsah komunikace s vedením školy mi vyhovují.] Když se zamyslíte nad vedením této školy, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 75] <- factor(data[, 75], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[75] <- "S4Q3_SQ005"
# LimeSurvey Field type: A
data[, 76] <- as.character(data[, 76])
attributes(data)$variable.labels[76] <- "[Moje náměty a připomínky jsou vedením školy vyslechnuty a dostanu na ně odpovídající reakci.] Když se zamyslíte nad vedením této školy, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 76] <- factor(data[, 76], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[76] <- "S4Q3_SQ006"
# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[77] <- "[Vedení školy mě vede ke zlepšení mého pracovního výkonu.] Když se zamyslíte nad vedením této školy, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 77] <- factor(data[, 77], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[77] <- "S4Q3_SQ007"
# LimeSurvey Field type: A
data[, 78] <- as.character(data[, 78])
attributes(data)$variable.labels[78] <- "[Vedení školy podporuje můj odborný růst.] Když se zamyslíte nad vedením této školy, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 78] <- factor(data[, 78], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[78] <- "S4Q3_SQ008"
# LimeSurvey Field type: A
data[, 79] <- as.character(data[, 79])
attributes(data)$variable.labels[79] <- "[Škola spolupracuje s místní komunitou, s organizacemi v místě školy.] Když se zamyslíte nad touto školou, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 79] <- factor(data[, 79], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[79] <- "S5Q1_SQ002"
# LimeSurvey Field type: A
data[, 80] <- as.character(data[, 80])
attributes(data)$variable.labels[80] <- "[Škola spolupracuje s jinými školami.] Když se zamyslíte nad touto školou, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 80] <- factor(data[, 80], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[80] <- "S5Q1_SQ003"
# LimeSurvey Field type: A
data[, 81] <- as.character(data[, 81])
attributes(data)$variable.labels[81] <- "[Ve škole existuje sdílená vize toho, kam se chceme posouvat.] Když se zamyslíte nad touto školou, do jaké míry souhlasíte či nesouhlasíte s následujícími výroky?"
data[, 81] <- factor(data[, 81], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[81] <- "S5Q1_SQ004"
# LimeSurvey Field type: A
data[, 82] <- as.character(data[, 82])
attributes(data)$variable.labels[82] <- "[V práci pociťuji stres.] Z Vaší vlastní zkušenosti učitele/ky na této škole, jak často dochází k následujícím situacím?"
data[, 82] <- factor(data[, 82], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[82] <- "S6Q1_SQ002"
# LimeSurvey Field type: A
data[, 83] <- as.character(data[, 83])
attributes(data)$variable.labels[83] <- "[Při mé práci mi zbývá dostatek času na osobní život.] Z Vaší vlastní zkušenosti učitele/ky na této škole, jak často dochází k následujícím situacím?"
data[, 83] <- factor(data[, 83], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[83] <- "S6Q1_SQ003"
# LimeSurvey Field type: A
data[, 84] <- as.character(data[, 84])
attributes(data)$variable.labels[84] <- "[Moje práce má negativní vliv na mé duševní zdraví.] Z Vaší vlastní zkušenosti učitele/ky na této škole, jak často dochází k následujícím situacím?"
data[, 84] <- factor(data[, 84], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[84] <- "S6Q1_SQ004"
# LimeSurvey Field type: A
data[, 85] <- as.character(data[, 85])
attributes(data)$variable.labels[85] <- "[Moje práce má negativní vliv na mé tělesné zdraví.] Z Vaší vlastní zkušenosti učitele/ky na této škole, jak často dochází k následujícím situacím?"
data[, 85] <- factor(data[, 85], levels=c("A1","A2","A3","A4","A5"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[85] <- "S6Q1_SQ005"
# LimeSurvey Field type: A
data[, 86] <- as.character(data[, 86])
attributes(data)$variable.labels[86] <- "[Příliš přípravné práce na hodiny] Když se zamyslíte nad svou prací v této škole, do jaké míry jsou pro vás následující situace zdrojem stresu v práci?"
data[, 86] <- factor(data[, 86], levels=c("A2","A3","A4","A5","A6"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[86] <- "S6Q2_SQ002"
# LimeSurvey Field type: A
data[, 87] <- as.character(data[, 87])
attributes(data)$variable.labels[87] <- "[Příliš vyučovacích hodin] Když se zamyslíte nad svou prací v této škole, do jaké míry jsou pro vás následující situace zdrojem stresu v práci?"
data[, 87] <- factor(data[, 87], levels=c("A2","A3","A4","A5","A6"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[87] <- "S6Q2_SQ003"
# LimeSurvey Field type: A
data[, 88] <- as.character(data[, 88])
attributes(data)$variable.labels[88] <- "[Příliš práce se známkováním] Když se zamyslíte nad svou prací v této škole, do jaké míry jsou pro vás následující situace zdrojem stresu v práci?"
data[, 88] <- factor(data[, 88], levels=c("A2","A3","A4","A5","A6"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[88] <- "S6Q2_SQ004"
# LimeSurvey Field type: A
data[, 89] <- as.character(data[, 89])
attributes(data)$variable.labels[89] <- "[Příliš mnoho administrativní práce (např. vyplňování formulářů)] Když se zamyslíte nad svou prací v této škole, do jaké míry jsou pro vás následující situace zdrojem stresu v práci?"
data[, 89] <- factor(data[, 89], levels=c("A2","A3","A4","A5","A6"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[89] <- "S6Q2_SQ005"
# LimeSurvey Field type: A
data[, 90] <- as.character(data[, 90])
attributes(data)$variable.labels[90] <- "[Povinnosti navíc kvůli chybějícím učitelům] Když se zamyslíte nad svou prací v této škole, do jaké míry jsou pro vás následující situace zdrojem stresu v práci?"
data[, 90] <- factor(data[, 90], levels=c("A2","A3","A4","A5","A6"),labels=c("Vůbec ne", "Do určité míry", "Docela ano", "Do velké míry", "Nevím / nechci odpovědět"))
names(data)[90] <- "S6Q2_SQ006"
# LimeSurvey Field type: A
data[, 91] <- as.character(data[, 91])
attributes(data)$variable.labels[91] <- "[Když odvedu dobrou práci, dostane se mi uznání.] Do jaké míry souhlasíte s následujícími výroky zaměřenými na odměňování na Vaší škole?"
data[, 91] <- factor(data[, 91], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[91] <- "S6Q3_SQ002"
# LimeSurvey Field type: A
data[, 92] <- as.character(data[, 92])
attributes(data)$variable.labels[92] <- "[Vím, jakým způsobem je stanoveno mé platové ohodnocení.] Do jaké míry souhlasíte s následujícími výroky zaměřenými na odměňování na Vaší škole?"
data[, 92] <- factor(data[, 92], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[92] <- "S6Q3_SQ003"
# LimeSurvey Field type: A
data[, 93] <- as.character(data[, 93])
attributes(data)$variable.labels[93] <- "[Odměňování je v naší škole spravedlivé.] Do jaké míry souhlasíte s následujícími výroky zaměřenými na odměňování na Vaší škole?"
data[, 93] <- factor(data[, 93], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[93] <- "S6Q3_SQ004"
# LimeSurvey Field type: A
data[, 94] <- as.character(data[, 94])
attributes(data)$variable.labels[94] <- "[Rád/a bych přešel/přešla na jinou školu, kdyby to bylo možné.] Rádi bychom se zeptali, jak obecně nahlížíte na svou práci. Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 94] <- factor(data[, 94], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[94] <- "S6Q4_SQ002"
# LimeSurvey Field type: A
data[, 95] <- as.character(data[, 95])
attributes(data)$variable.labels[95] <- "[Práce v této škole mě těší.] Rádi bychom se zeptali, jak obecně nahlížíte na svou práci. Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 95] <- factor(data[, 95], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[95] <- "S6Q4_SQ003"
# LimeSurvey Field type: A
data[, 96] <- as.character(data[, 96])
attributes(data)$variable.labels[96] <- "[Doporučil/a bych tuto školu jako dobré pracoviště.] Rádi bychom se zeptali, jak obecně nahlížíte na svou práci. Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 96] <- factor(data[, 96], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[96] <- "S6Q4_SQ004"
# LimeSurvey Field type: A
data[, 97] <- as.character(data[, 97])
attributes(data)$variable.labels[97] <- "[Celkově jsem ve svém zaměstnání spokojen/a.] Rádi bychom se zeptali, jak obecně nahlížíte na svou práci. Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 97] <- factor(data[, 97], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[97] <- "S6Q4_SQ005"
# LimeSurvey Field type: A
data[, 98] <- as.character(data[, 98])
attributes(data)$variable.labels[98] <- "[Jsem spokojen/a s platem, který za svou práci dostávám.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 98] <- factor(data[, 98], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[98] <- "S7Q1_SQ002"
# LimeSurvey Field type: A
data[, 99] <- as.character(data[, 99])
attributes(data)$variable.labels[99] <- "[Média v této zemi si učitelů cení.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 99] <- factor(data[, 99], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[99] <- "S7Q1_SQ003"
# LimeSurvey Field type: A
data[, 100] <- as.character(data[, 100])
attributes(data)$variable.labels[100] <- "[Učitelskou profesi vnímám jako prestižní záležitost.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 100] <- factor(data[, 100], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[100] <- "S7Q1_SQ004"
# LimeSurvey Field type: A
data[, 101] <- as.character(data[, 101])
attributes(data)$variable.labels[101] <- "[Rodiče žáků doceňují moji práci.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 101] <- factor(data[, 101], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[101] <- "S7Q1_SQ005"
# LimeSurvey Field type: A
data[, 102] <- as.character(data[, 102])
attributes(data)$variable.labels[102] <- "[Česká společnost doceňuje význam učitelů.] Nakolik souhlasíte nebo nesouhlasíte s následujícími výroky?"
data[, 102] <- factor(data[, 102], levels=c("A1","A2","A3","A4","A5"),labels=c("Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím", "Nevím / nechci odpovědět"))
names(data)[102] <- "S7Q1_SQ006"
# LimeSurvey Field type: F
data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[103] <- "[Čtení, psaní a literatura] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 103] <- factor(data[, 103], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[103] <- "S8Q1_SQ002"
# LimeSurvey Field type: F
data[, 104] <- as.numeric(data[, 104])
attributes(data)$variable.labels[104] <- "[Matematika] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 104] <- factor(data[, 104], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[104] <- "S8Q1_SQ003"
# LimeSurvey Field type: F
data[, 105] <- as.numeric(data[, 105])
attributes(data)$variable.labels[105] <- "[Přírodní vědy [Zahrnuje přírodní vědy, fyziku, fyzikální vědy, chemii, biologii, biologii člověka, vědy o životním prostředí, zemědělství/zahradnictví/lesnictví]] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 105] <- factor(data[, 105], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[105] <- "S8Q1_SQ004"
# LimeSurvey Field type: F
data[, 106] <- as.numeric(data[, 106])
attributes(data)$variable.labels[106] <- "[Společenské vědy [Zahrnuje studium společenských věd, ekonomii, zeměpis, dějepis, právní vědy, vědy o vlastní zemi, filosofii]] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 106] <- factor(data[, 106], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[106] <- "S8Q1_SQ005"
# LimeSurvey Field type: F
data[, 107] <- as.numeric(data[, 107])
attributes(data)$variable.labels[107] <- "[Soudobé cizí jazyky [Zahrnuje jiné jazyky, než je vyučovací jazyk]] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 107] <- factor(data[, 107], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[107] <- "S8Q1_SQ006"
# LimeSurvey Field type: F
data[, 108] <- as.numeric(data[, 108])
attributes(data)$variable.labels[108] <- "[Klasická řečtina a/nebo latina] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 108] <- factor(data[, 108], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[108] <- "S8Q1_SQ007"
# LimeSurvey Field type: F
data[, 109] <- as.numeric(data[, 109])
attributes(data)$variable.labels[109] <- "[Technologie [Zahrnuje základy technologií včetně IT, počítače, stavby/průzkum, elektroniku, grafiku a design, ovládání klávesnice, zpracování textu, dílenskou technologii/technologii designu]] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 109] <- factor(data[, 109], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[109] <- "S8Q1_SQ008"
# LimeSurvey Field type: F
data[, 110] <- as.numeric(data[, 110])
attributes(data)$variable.labels[110] <- "[Umění [Zahrnuje umění, hudbu, výtvarné umění, užité umění, dramatické umění, koncertní hudbu, fotografii, kreslení, ruční práce, tvořivé šití]] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 110] <- factor(data[, 110], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[110] <- "S8Q1_SQ010"
# LimeSurvey Field type: F
data[, 111] <- as.numeric(data[, 111])
attributes(data)$variable.labels[111] <- "[Tělesná výchova] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 111] <- factor(data[, 111], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[111] <- "S8Q1_SQ011"
# LimeSurvey Field type: F
data[, 112] <- as.numeric(data[, 112])
attributes(data)$variable.labels[112] <- "[Náboženství a/nebo etika] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 112] <- factor(data[, 112], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[112] <- "S8Q1_SQ012"
# LimeSurvey Field type: F
data[, 113] <- as.numeric(data[, 113])
attributes(data)$variable.labels[113] <- "[Praktické a odborné dovednosti [Zahrnuje odborné dovednosti (přípravu na konkrétní povolání), techniku, vedení domácnosti, účetnictví, obchodní studie, přípravu na povolání, oblékání a textilie, řízení vozidel, domácí hospodaření, polytechnický kurz, kurz pro sekretářky, cestovní ruch a pohostinství, ruční práce]] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
data[, 113] <- factor(data[, 113], levels=c(1,0),labels=c("Ano", "Nevybráno"))
names(data)[113] <- "S8Q1_SQ013"
# LimeSurvey Field type: A
data[, 114] <- as.character(data[, 114])
attributes(data)$variable.labels[114] <- "[Jiné] Které z následujících kategorií předmětů vyučujete nebo jste vyučoval/a v tomto nebo předchozím školním roce?"
names(data)[114] <- "S8Q1_other"
# LimeSurvey Field type: F
data[, 115] <- as.numeric(data[, 115])
attributes(data)$variable.labels[115] <- "[…….. % učím na prvním stupni] Pokuste se, prosím, odhadnout, kolik procent Vaší výuky na této škole je na prvním stupni a kolik na druhém stupni. Doplňte čísla tak, aby v součtu dávala 100%.  Pokud učíte na SŠ, na otázku neodpovídejte a přeskočte ji."
names(data)[115] <- "S8Q2_SQ002"
# LimeSurvey Field type: F
data[, 116] <- as.numeric(data[, 116])
attributes(data)$variable.labels[116] <- "[…….. % učím na druhém stupni] Pokuste se, prosím, odhadnout, kolik procent Vaší výuky na této škole je na prvním stupni a kolik na druhém stupni. Doplňte čísla tak, aby v součtu dávala 100%.  Pokud učíte na SŠ, na otázku neodpovídejte a přeskočte ji."
names(data)[116] <- "S8Q2_SQ003"
# LimeSurvey Field type: A
data[, 117] <- as.character(data[, 117])
attributes(data)$variable.labels[117] <- "Na závěr bychom Vás rádi požádali o informace, které nám umožní spojit Vaše odpovědi z tohoto dotazníku s případnými budoucími odpověďmi, o které Vás v průběhu Eduzměny ještě můžeme požádat. Díky tomu budeme moci vyhodnotit vývoj postojů v čase, což je pro nás velmi důležité.  Aby dotazník zůstal anonymní, rádi bychom vás požádali, abyste poskytli pouze kód podle následujícího pravidla:   	 	Zadejte třetí písmeno svého rodného příjmení 	 	 	Den v měsíci, kdy jste se narodil/a 	 	 	První písmeno z názvu místa Vašeho narození 	   POUŽIJTE KAPITÁLKY A NEPOUŽÍVEJTE DIAKRITIKU.   Například:   	 	John Lennon se narodil 9. října v New Yorku. Vloží tedy: N9N 	 	 	Jana Nováková, roz. Kučerová se narodila 16. července v Neratovicích. Vloží tedy: C16N 	      Slibujeme, že tyto informace použijeme pouze k propojení informací z tohoto dotazníku s informacemi z budoucích dotazníků. Tyto informace nebudeme nikdy s nikým sdílet, ani se zřizovatelem, ani s vedením školy, ani s nikým jiným.   (Pokud máte přesto pochybnosti, můžete zadat svůj vlastní kód. V tom případě si jej prosím dobře uložte pro budoucí použití. Tuto možnost ale nedoporučujeme, u mnoha lidí hrozí, že vlastní kód ztratí.)"
names(data)[117] <- "S9Q0"
# LimeSurvey Field type: A
data[, 118] <- as.character(data[, 118])
attributes(data)$variable.labels[118] <- "Zadejte, prosím, Váš osobní kód podle výše uvedeného pravidla."
names(data)[118] <- "S9Q1"
# LimeSurvey Field type: A
data[, 119] <- as.character(data[, 119])
attributes(data)$variable.labels[119] <- "Toto je úplně poslední otázka. Je něco, co byste chtěl/a ke svým odpovědím doplnit nebo nám vzkázat?"
names(data)[119] <- "S10Q1"
# Variable name was incorrect and was changed from  to q_ .

