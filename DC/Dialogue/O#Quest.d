BEGIN O#ARUDIN    // Arudin
BEGIN O#CASTOR    // Castor
BEGIN O#DURN      // Durnkrag 
BEGIN O#KHAGG     // Khaggoth
BEGIN O#BEA       // Beatrice

// Durnkrag, when approached for the first time, quest not given

CHAIN IF ~Global("O#DCQuest","GLOBAL",1)~ THEN O#DURN O#Durn1
@0 
DO ~SetGlobal("O#DCQuest","GLOBAL",2)~
END
++ @1 EXTERN O#DURN O#Durn1.1
++ @2 EXTERN O#DURN O#Durn1.2
++ @3 EXTERN O#DURN O#Durn1.3
++ @4 EXTERN O#DURN O#Durn1.End

CHAIN O#DURN O#Durn1.1
@5 
DO ~SetGlobal("O#DCQuest","GLOBAL",3) AddJournalEntry(@10001,QUEST)~
== O#DURN @6
== O#DURN @7
== O#CASTOR @8
// Nalia
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @9
// Anomen
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @10
== O#ARUDIN IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @11
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @12
== O#ARUDIN IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @13
// Jaheira
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @14
// Aerie
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @15
// Minsc
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @16
== O#ARUDIN IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @17
== O#KHAGG IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @18
== O#ARUDIN IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @19
== O#DURN @20
END
++ @21 EXTERN O#DURN O#Durn1.4
++ @22 EXTERN O#DURN O#Durn1.End
++ @23 EXTERN O#DURN O#Durn1.End

CHAIN O#DURN O#Durn1.2
@24
== O#ARUDIN @25
== O#DURN @26
// Korgan
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @27
== O#DURN IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @28
== O#ARUDIN IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @29
== O#DURN IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @30
// Yoshimo
== YOSHJ IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN @31
== O#DURN IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN @32
== O#ARUDIN IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN @33
== O#DURN @34
END
++ @35 EXTERN O#DURN O#Durn1.1
++ @36 EXTERN O#DURN O#Durn1.End
++ @4 EXTERN O#DURN O#Durn1.End

CHAIN O#DURN O#Durn1.3
@37
== O#KHAGG @38
== O#ARUDIN @39
== O#DURN @40
END
++ @35 EXTERN O#DURN O#Durn1.1
++ @41 EXTERN O#DURN O#Durn1.2
++ @36 EXTERN O#DURN O#Durn1.End
++ @4 EXTERN O#DURN O#Durn1.End

CHAIN O#DURN O#Durn1.End
@42
EXIT

CHAIN O#DURN O#Durn1.4
@43
= @44
DO ~SetGlobal("O#DCAgreedToHelp","GLOBAL",1)~
EXIT

// Durnkrag, when approached later, quest still not given

CHAIN IF ~Global("O#DCQuest","GLOBAL",2)~ THEN O#DURN O#Durn2
@45
END
++ @46 EXTERN O#DURN O#Durn1.1
++ @47 EXTERN O#DURN O#Durn1.End

// Durnkrag, when approached later, quest given

CHAIN IF ~Global("O#DCQuest","GLOBAL",3) Global("O#DCAgreedToHelp","GLOBAL",1)~ THEN O#DURN O#Durn3.a
@48 
END
IF ~~ EXTERN O#ARUDIN O#Arudin.Table

CHAIN IF ~Global("O#DCQuest","GLOBAL",3) !Global("O#DCAgreedToHelp","GLOBAL",1)~ THEN O#DURN O#Durn3.b
@45
END
+ ~GlobalGT("O#DCContact","GLOBAL",1)~ + @49 EXTERN  O#DURN O#Durn3.ContinueQuest
+ ~GlobalLT("O#DCContact","GLOBAL",2) Global("O#DCContactClue","GLOBAL",1)~ + @50 EXTERN  O#DURN O#Durn3.2
++ @51 EXTERN  O#DURN O#Durn3.1
++ @52 EXTERN  O#DURN O#Durn3.1
++ @53 EXTERN  O#DURN O#Durn1.4

CHAIN O#ARUDIN O#Arudin.Table
@54
== O#KHAGG @55
== O#ARUDIN @56
END
+ ~GlobalGT("O#DCContact","GLOBAL",1)~ + @57 EXTERN  O#DURN O#Durn3.ContinueQuest
+ ~GlobalGT("O#DCContact","GLOBAL",1)~ + @58 EXTERN  O#DURN O#Durn3.ContinueQuest
+ ~GlobalLT("O#DCContact","GLOBAL",2) Global("O#DCContactClue","GLOBAL",1)~ + @59 EXTERN  O#DURN O#Durn3.2
++ @60 EXTERN  O#DURN O#Durn3.1
++ @61 EXTERN  O#DURN O#Durn1.4

CHAIN O#DURN O#Durn3.1
@62
== O#ARUDIN @63
EXIT

CHAIN O#DURN O#Durn3.2
@64
== O#ARUDIN @65
== O#CASTOR @66
== O#DURN @67
EXIT

// Arudin, when approached for the first time

CHAIN IF ~Global("O#DCTalkedToArudin","LOCALS",0) GlobalLT("O#DCQuest","GLOBAL",2)~ THEN O#ARUDIN O#Arudin1
@68 
DO ~SetGlobal("O#DCTalkedToArudin","LOCALS",1)~
END
IF ~~ EXTERN O#DURN O#Durn1

// Arudin, when approached later, PC hasn't given him money

CHAIN IF ~GlobalLT("O#DCTalkedToArudin","LOCALS",2) GlobalLT("O#DCQuest","GLOBAL",4)~ THEN O#ARUDIN O#Arudin2
@69 
END
++ @70 EXTERN O#ARUDIN O#Ar2.1
++ @71 EXTERN O#ARUDIN O#Ar2.2
++ @72 EXTERN O#ARUDIN O#Ar2.End

CHAIN O#ARUDIN O#Ar2.1
@73
END
++ @74 EXTERN O#ARUDIN O#Ar2.End
++ @75 EXTERN O#ARUDIN O#Ar2.Sar
++ @76 EXTERN O#ARUDIN O#Ar2.Reason

CHAIN O#ARUDIN O#Ar2.Sar
@77
END
++ @78 EXTERN O#ARUDIN O#Ar2.River
++ @79 EXTERN O#ARUDIN O#Ar2.SarEnd
++ @80 EXTERN O#ARUDIN O#Ar2.End
++ @81 EXTERN O#ARUDIN O#Ar2.Gold

CHAIN O#ARUDIN O#Ar2.SarEnd
@82
EXIT

CHAIN O#ARUDIN O#Ar2.Reason
@83
END
++ @84 EXTERN O#ARUDIN O#Ar2.Gold
++ @85 EXTERN O#ARUDIN O#Ar2.Waste

CHAIN O#ARUDIN O#Ar2.Waste
@86
EXIT

CHAIN O#ARUDIN O#Ar2.2
@87
END
++ @88 EXTERN O#ARUDIN O#Ar2.Prac
++ @89 EXTERN O#ARUDIN O#Ar2.End
++ @90 EXTERN O#ARUDIN O#Ar2.Gold

CHAIN O#ARUDIN O#Ar2.Prac
@91
END
++ @92 EXTERN O#ARUDIN O#Ar2.Gift
++ @93 EXTERN O#ARUDIN O#Ar2.Gold

CHAIN O#ARUDIN O#Ar2.Gift
@94
END
++ @95 EXTERN O#ARUDIN O#Ar2.Hurry
++ @89 EXTERN O#ARUDIN O#Ar2.End
++ @90 EXTERN O#ARUDIN O#Ar2.Gold

CHAIN O#ARUDIN O#Ar2.Hurry
@96
EXIT

CHAIN O#ARUDIN O#Ar2.Gold
@97
// Jaheira
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @98
== O#ARUDIN IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @99
END
++ @100 EXTERN O#ARUDIN O#Ar2.Take
+ ~PartyGoldGT(49)~ + @101 EXTERN O#ARUDIN O#Ar2.Talk
++ @102 EXTERN O#ARUDIN O#Ar2.Strain

CHAIN O#ARUDIN O#Ar2.Strain
@103
EXIT

CHAIN O#ARUDIN O#Ar2.Take
@104
END
+ ~PartyGoldGT(49)~ + @105 EXTERN O#ARUDIN O#Ar2.Talk
++ @106 EXTERN O#ARUDIN O#Ar2.Way

CHAIN O#ARUDIN O#Ar2.Way
@107
EXIT

CHAIN O#ARUDIN O#Ar2.Talk
@108
DO ~TakePartyGold(50) SetGlobal("O#DCTalkedToArudin","LOCALS",2)~
END
++ @109 EXTERN O#ARUDIN O#Ar2.It
++ @110 EXTERN O#ARUDIN O#Ar2.It
++ @111 EXTERN O#ARUDIN O#Ar2.It
++ @112 EXTERN O#ARUDIN O#Ar2.End

CHAIN O#ARUDIN O#Ar2.End
@113
EXIT

CHAIN O#ARUDIN O#Ar2.It
@114
END
++ @115 EXTERN O#ARUDIN O#Ar2.Final
++ @116 EXTERN O#ARUDIN O#Ar2.No
++ @117 EXTERN O#ARUDIN O#Ar2.Service

CHAIN O#ARUDIN O#Ar2.Service
@118
EXIT

CHAIN O#ARUDIN O#Ar2.Final
@119
END
++ @120 EXTERN O#ARUDIN O#Ar2.End
++ @121 EXTERN O#ARUDIN O#Ar2.No

CHAIN O#ARUDIN O#Ar2.No
@122
END
++ @123 EXTERN O#ARUDIN O#Ar2.Service
++ @124 EXTERN O#ARUDIN O#Ar2.Threat

CHAIN O#ARUDIN O#Ar2.River
@125
EXIT

CHAIN O#ARUDIN O#Ar2.Threat
@126
END
++ @127 EXTERN O#ARUDIN O#Ar2.River
++ @128 EXTERN O#ARUDIN O#Ar2.River

// Arudin, when approached later, PC has given him money

CHAIN IF ~Global("O#DCTalkedToArudin","LOCALS",2) GlobalLT("O#DCQuest","GLOBAL",4)~ THEN O#ARUDIN O#Arudin3
@129
EXIT 

// Castor, when approached for the first time, quest not given

CHAIN IF ~GlobalLT("O#DCQuest","GLOBAL",2)~ THEN O#CASTOR O#Castor1
@130 
== O#CASTOR IF ~OR(6) Gender(Player1,FEMALE) Gender(Player2,FEMALE) Gender(Player3,FEMALE) Gender(Player4,FEMALE) Gender(Player5,FEMALE) Gender(Player6,FEMALE)~ THEN @131
== O#DURN IF ~OR(6) Gender(Player1,FEMALE) Gender(Player2,FEMALE) Gender(Player3,FEMALE) Gender(Player4,FEMALE) Gender(Player5,FEMALE) Gender(Player6,FEMALE)~ THEN @132
== O#CASTOR IF ~OR(6) Gender(Player1,FEMALE) Gender(Player2,FEMALE) Gender(Player3,FEMALE) Gender(Player4,FEMALE) Gender(Player5,FEMALE) Gender(Player6,FEMALE)~ THEN @133
== O#DURN IF ~OR(6) Gender(Player1,FEMALE) Gender(Player2,FEMALE) Gender(Player3,FEMALE) Gender(Player4,FEMALE) Gender(Player5,FEMALE) Gender(Player6,FEMALE)~ THEN @134
== O#CASTOR IF ~OR(6) Gender(Player1,FEMALE) Gender(Player2,FEMALE) Gender(Player3,FEMALE) Gender(Player4,FEMALE) Gender(Player5,FEMALE) Gender(Player6,FEMALE)~ THEN @135
== O#CASTOR IF ~!Gender(Player1,FEMALE) !Gender(Player2,FEMALE) !Gender(Player3,FEMALE) !Gender(Player4,FEMALE) !Gender(Player5,FEMALE) !Gender(Player6,FEMALE)~ THEN @136
== O#CASTOR @137
END
IF ~~ EXTERN O#DURN O#Durn1

// Castor, when approached for the second time

CHAIN IF ~Global("O#DCTalkedToCastor","LOCALS",0) GlobalLT("O#DCQuest","GLOBAL",4)~ THEN O#CASTOR O#Castor2
@138 
DO ~SetGlobal("O#DCTalkedToCastor","LOCALS",1)~
= @139 
// Anomen
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @140
== O#CASTOR IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @141
== ANOMENJ IF ~Gender(Player1,FEMALE) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @142
== O#CASTOR IF ~Gender(Player1,FEMALE) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @143
// Aerie
== O#CASTOR IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @144
== O#KHAGG IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @145
== O#ARUDIN IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @146
== O#CASTOR IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @147
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @148
== O#CASTOR IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @149
// Jaheira
== O#CASTOR IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @150
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @151
== O#CASTOR IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @152
// Mazzy
== O#CASTOR IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @153
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @154
== O#CASTOR IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @155
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @156
== O#CASTOR IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @157
// Nalia
== O#CASTOR IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @158
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @122
== O#CASTOR IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @159
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @160
== O#CASTOR IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @161
// Viconia
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @162
== O#CASTOR IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @163
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @164
== O#CASTOR @165
END
IF ~Gender(LastTalkedToBy,MALE)~ EXTERN O#CASTOR O#Castor2.M
IF ~Gender(LastTalkedToBy,FEMALE)~ EXTERN O#CASTOR O#Castor2.F

// Castor, first additional chain

CHAIN IF ~Global("O#DCCastorSalvanas","LOCALS",0) GlobalLT("O#DCQuest","GLOBAL",4)~ THEN O#Castor O#Castor21
@166
DO ~SetGlobal("O#DCCastorSalvanas","LOCALS",1)~
== O#ARUDIN @167
== O#CASTOR @168
== O#ARUDIN @169
EXIT

// Castor, second additional chain, with Minsc in party

CHAIN IF ~Global("O#DCCastorMinsc","LOCALS",0) GlobalLT("O#DCQuest","GLOBAL",4) InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN O#Castor O#Castor22
@170
DO ~SetGlobal("O#DCCastorMinsc","LOCALS",1)~
== O#ARUDIN @171
== MINSCJ @172
== O#KHAGG @173
== O#CASTOR @174
== O#KHAGG @175
== O#CASTOR @176
EXIT

// Castor, when approached later

CHAIN IF ~Global("O#DCTalkedToCastor","LOCALS",1) GlobalLT("O#DCQuest","GLOBAL",4)~ THEN O#CASTOR O#Castor3
@177
END
IF ~Gender(LastTalkedToBy,MALE)~ EXTERN O#CASTOR O#Castor2.M
IF ~Gender(LastTalkedToBy,FEMALE)~ EXTERN O#CASTOR O#Castor2.F

CHAIN O#CASTOR O#Castor2.M
@178
EXIT

CHAIN O#CASTOR O#Castor2.F
@179
END
++ @180 EXTERN O#CASTOR O#Castor2.FY
++ @181 EXTERN O#CASTOR O#Castor2.FN
++ @182 EXTERN O#CASTOR O#Castor2.FM

CHAIN O#CASTOR O#Castor2.FY
@183
== O#DURN @184
EXIT

CHAIN O#CASTOR O#Castor2.FN
@185
== O#ARUDIN @186
== O#CASTOR @187
EXIT

CHAIN O#CASTOR O#Castor2.FM
@188
== O#DURN @189
== O#CASTOR @190
EXIT

// Khaggoth, when approached for the first time

CHAIN IF ~Global("O#DCTalkedToKhaggoth","LOCALS",0) GlobalLT("O#DCQuest","GLOBAL",2)~ THEN O#KHAGG O#Khagg1
@191 
DO ~SetGlobal("O#DCTalkedToKhaggoth","LOCALS",1)~
== O#DURN @192
== O#ARUDIN @193
== O#KHAGG @194
== O#DURN @195
END
IF ~~ EXTERN O#DURN O#Durn1

// Khaggoth, when approached later

CHAIN IF ~GlobalLT("O#DCQuest","GLOBAL",4)~ THEN O#KHAGG O#Khagg2
@196
EXIT

// Clues to where Grudin might be

// Bernard, Copper Coronet

EXTEND_TOP BERNARD 31
+ ~Global("O#DCQuest","GLOBAL",3) GlobalLT("O#DCContact","GLOBAL",2)~ + @197 EXTERN BERNARD O#DCBernardClue
END

CHAIN BERNARD O#DCBernardClue
@198
EXIT

// Black Market Thief in Aran's guild

EXTEND_BOTTOM BMTHIEF 0
+ ~Global("O#DCQuest","GLOBAL",3) GlobalLT("O#DCContact","GLOBAL",2)~ + @197 EXTERN BMTHIEF O#DCBMThiefClue
END

EXTEND_BOTTOM BMTHIEF 1
+ ~Global("O#DCQuest","GLOBAL",3) GlobalLT("O#DCContact","GLOBAL",2)~ + @197 EXTERN BMTHIEF O#DCBMThiefClue
END

CHAIN BMTHIEF O#DCBMThiefClue
@199
DO ~SetGlobal("O#DCContactClue","GLOBAL",1)~
EXIT

// The fence in the south of the docks

EXTEND_TOP DMARK1 6
+ ~Global("O#DCQuest","GLOBAL",3) GlobalLT("O#DCContact","GLOBAL",2)~ + @197 EXTERN DMARK1 O#DCSouthDocksClue
END

CHAIN DMARK1 O#DCSouthDocksClue
@200
DO ~SetGlobal("O#DCContactClue","GLOBAL",1)~
EXIT

// The fence in Gaelan Bayle's house

EXTEND_BOTTOM ARLED 1
+ ~Global("O#DCQuest","GLOBAL",3) GlobalLT("O#DCContact","GLOBAL",2)~ + @201 EXTERN ARLED O#DCGaelanHouseClue
END

CHAIN ARLED O#DCGaelanHouseClue
@202
DO ~SetGlobal("O#DCContactClue","GLOBAL",1)~
EXIT

BEGIN O#GRUDIN     // Grudin the Contact

BEGIN O#GANEL      // Ganelon
BEGIN O#MAC        // Mac
BEGIN O#REMUS      // Remus
BEGIN O#TEAGAN     // Teagan

CHAIN IF ~Global("O#DCContact","GLOBAL",1)~ THEN O#GANEL O#Ganel1
@203 
DO ~SetGlobal("O#DCContact","GLOBAL",2) AddJournalEntry(@10002,QUEST)~
== O#GRUDIN @204
== O#REMUS @205
== O#GANEL @206
== O#GRUDIN @207
== O#GANEL @208
== O#GRUDIN @209
== O#MAC @210
== O#GANEL @211
== O#GRUDIN @212
// Goodbye, Grudin
DO ~ActionOverride("O#Grudin",Kill(Myself))~
// Aerie
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @176
// Anomen
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @213
// Keldorn
== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @214
// Nalia
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @215
== O#GANEL @216
END
++ @217 EXTERN O#GANEL O#Ganel1.Boast
++ @218 EXTERN O#GANEL O#Ganel1.Boast
++ @219 EXTERN O#GANEL O#Ganel1.Part
++ @220 EXTERN O#GANEL O#Ganel1.Togeth
++ @221 EXTERN O#GANEL O#Ganel1.Boast

CHAIN O#GANEL O#Ganel1.Part
@222
END
IF ~~ EXTERN O#GANEL O#Ganel1.Boast

CHAIN O#GANEL O#Ganel1.Togeth
@223
END
IF ~~ EXTERN O#GANEL O#Ganel1.Boast

CHAIN O#GANEL O#Ganel1.Boast
@224
== O#TEAGAN @225
== O#GANEL @226
DO ~ApplySpell("O#Ganel",DRYAD_TELEPORT)
ApplySpell("O#Mac",DRYAD_TELEPORT)
ApplySpell("O#Remus",DRYAD_TELEPORT)
ApplySpell("O#Teagan",DRYAD_TELEPORT)~
EXIT

// Durnkrag, after the party's meeting with the Shadow Pack, from O#Durn3

CHAIN O#DURN O#Durn3.ContinueQuest
@227
DO ~SetGlobal("O#DCQuest","GLOBAL",4) AddJournalEntry(@10003,QUEST)~
== O#CASTOR @228
== O#KHAGG @229
== O#ARUDIN @230
END
++ @231 EXTERN O#DURN O#Durn4.SP
++ @232 EXTERN O#CASTOR O#Durn4.Nasty
++ @233 EXTERN O#DURN O#Durn4.Tough

CHAIN O#CASTOR O#Durn4.Nasty
@234
END
IF ~~ EXTERN O#DURN O#Durn4.Tough

CHAIN O#DURN O#Durn4.Tough
@235
END
IF ~~ EXTERN O#DURN O#Durn4.SP

CHAIN O#DURN O#Durn4.SP
@236
== O#ARUDIN @237
== O#DURN @238
== O#CASTOR @239
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut1")~
EXIT

// Beatrice enters and approaches the party in a run

CHAIN IF ~Global("O#DCQuest","GLOBAL",4)~ THEN O#BEA O#Bea1
@240 
DO ~SetGlobal("O#DCQuest","GLOBAL",5)~
== O#CASTOR @241
== O#BEA @242
== O#ARUDIN @243
== O#KHAGG @244
== O#DURN @245
END
++ @246 EXTERN O#DURN O#Durn4.Rew
++ @247 EXTERN O#DURN O#Durn4.Me
++ @248 EXTERN O#DURN O#Durn4.Go
++ @249 EXTERN O#DURN O#Durn4.Dock

CHAIN O#DURN O#Durn4.Rew
@250
END
IF ~~ EXTERN O#DURN O#Durn4.Me

CHAIN O#DURN O#Durn4.Me
@251
END
++ @252 EXTERN O#DURN O#Durn4.Meet
++ @253 EXTERN O#DURN O#Durn4.Meet
++ @254 EXTERN O#DURN O#Durn4.Mind
++ @255 EXTERN O#DURN O#Durn4.Mind

CHAIN O#DURN O#Durn4.Go
@256
END
IF ~~ EXTERN O#DURN O#Durn4.Me

CHAIN O#DURN O#Durn4.Dock
@257
END
IF ~~ EXTERN O#DURN O#Durn4.Meet

CHAIN O#DURN O#Durn4.Meet
@258
== O#DURN @259
DO ~ActionOverride("O#Arudin",EscapeArea())
ActionOverride("O#Bea",EscapeArea())
ActionOverride("O#Castor",EscapeArea())
ActionOverride("O#Durn",EscapeArea())
ActionOverride("O#Khagg",EscapeArea())~
EXIT

CHAIN O#DURN O#Durn4.Mind
@260
== O#DURN @259
DO ~ActionOverride("O#Arudin",EscapeArea())
ActionOverride("O#Bea",EscapeArea())
ActionOverride("O#Castor",EscapeArea())
ActionOverride("O#Durn",EscapeArea())
ActionOverride("O#Khagg",EscapeArea())~
EXIT

// At the docks: both groups are there

CHAIN IF ~Global("O#DCQuest","GLOBAL",6)~ THEN O#DURN O#Durn5
@261 
DO ~SetGlobal("O#DCQuest","GLOBAL",7)~
== O#GANEL @262 
== O#ARUDIN @263  
== O#TEAGAN @264
== O#CASTOR @265
== O#MAC @266
// Minsc
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @267
// Nalia
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @268
// Viconia
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @269
// Yoshimo
== YOSHJ IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN @270
== O#TEAGAN @271
== O#DURN @272
== O#GANEL @273
== O#ARUDIN @274
END
++ @275 EXTERN O#DURN O#Durn5.1
++ @276 EXTERN O#DURN O#Durn5.1
++ @277 EXTERN O#GANEL O#Ganel5.1
++ @278 EXTERN O#GANEL O#Ganel5.1
++ @279 EXTERN O#DURN O#Durn5.leave

CHAIN O#DURN O#Durn5.leave
@280
== O#GANEL @281
== O#TEAGAN @282
== O#ARUDIN @283
END
++ @284 EXTERN O#DURN O#Durn5.1
++ @285 EXTERN O#GANEL O#Ganel5.1
++ @286 EXTERN O#ARUDIN O#Arudin5.kill

CHAIN O#ARUDIN O#Arudin5.kill
@287
== O#GANEL @288
== O#CASTOR @228
== O#GANEL @289
== O#ARUDIN @290
DO ~ApplySpell("O#Ganel",DRYAD_TELEPORT)
ApplySpell("O#Mac",DRYAD_TELEPORT)
ApplySpell("O#Remus",DRYAD_TELEPORT)
ApplySpell("O#Teagan",DRYAD_TELEPORT)
ApplySpell("O#Arudin",DRYAD_TELEPORT)
ApplySpell("O#Bea",DRYAD_TELEPORT)
ApplySpell("O#Castor",DRYAD_TELEPORT)
ApplySpell("O#Durn",DRYAD_TELEPORT)
ApplySpell("O#Khagg",DRYAD_TELEPORT)~
EXIT

CHAIN O#DURN O#Durn5.1
@291
== O#KHAGG @292
== O#MAC @293
== O#GANEL @294
DO ~SetGlobal("O#DCQuestGood","GLOBAL",1)
ApplySpell("O#Ganel",DRYAD_TELEPORT)
ApplySpell("O#Mac",DRYAD_TELEPORT)
ApplySpell("O#Remus",DRYAD_TELEPORT)
ApplySpell("O#Teagan",DRYAD_TELEPORT)~
EXIT

CHAIN O#GANEL O#Ganel5.1
@295
== O#ARUDIN @296
== O#BEA @297
== O#DURN @298
== O#ARUDIN @299
DO ~SetGlobal("O#DCQuestEvil","GLOBAL",1)
ApplySpell("O#Arudin",DRYAD_TELEPORT)
ApplySpell("O#Bea",DRYAD_TELEPORT)
ApplySpell("O#Castor",DRYAD_TELEPORT)
ApplySpell("O#Durn",DRYAD_TELEPORT)
ApplySpell("O#Khagg",DRYAD_TELEPORT)~
EXIT

// After the confrontation, good guys 'win':

CHAIN IF ~Global("O#DCQuestGood","GLOBAL",1)~ THEN O#DURN O#Durn6
@300 
DO ~SetGlobal("O#DCQuestGood","GLOBAL",2) SetGlobal("O#DCQuest","GLOBAL",8) AddJournalEntry(@10004,QUEST)~
== O#ARUDIN @301 
== O#DURN @302
DO ~ActionOverride("O#Arudin",MoveToPoint([1820.3603]))
ActionOverride("O#Bea",MoveToPoint([1822.3605]))
ActionOverride("O#Castor",MoveToPoint([1802.3609]))
ActionOverride("O#Durn",MoveToPoint([1840.3618]))
ActionOverride("O#Khagg",MoveToPoint([1830.3607]))~
EXIT

// After the confrontation, bad guys 'win':

CHAIN IF ~Global("O#DCQuestEvil","GLOBAL",1)~ THEN O#GANEL O#Ganel6
@303 
DO ~SetGlobal("O#DCQuestEvil","GLOBAL",2) SetGlobal("O#DCQuest","GLOBAL",8) AddJournalEntry(@10005,QUEST)~
== O#TEAGAN @304
== O#GANEL @305
DO ~ActionOverride("O#Ganel",MoveToPoint([1820.3608]))
ActionOverride("O#Mac",MoveToPoint([1822.3605]))
ActionOverride("O#Remus",MoveToPoint([1802.3619]))
ActionOverride("O#Teagan",MoveToPoint([1840.3607]))~
EXIT

// After the group(good or evil) approaches Captain Randall

BEGIN O#RAND   // Randall

CHAIN IF ~Global("O#DCQuest","GLOBAL",9)~ THEN O#RAND O#Rand1
@306
DO ~SetGlobal("O#DCQuest","GLOBAL",10) AddJournalEntry(@10006,QUEST)~
== O#DURN IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @307
== O#GANEL IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @308
== O#RAND @309
== O#ARUDIN IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @310
== O#TEAGAN IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @311
== O#RAND @312
== O#GANEL IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @313
== O#DURN IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @314
// Aerie
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @315
// Anomen
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @316
// Jaheira
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @317
// Viconia
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @318
== O#RAND @319
END
+ ~Global("O#DCQuestGood","GLOBAL",2) PartyGoldGT(999)~ + @320 EXTERN O#RAND O#Rand1.G
+ ~Global("O#DCQuestEvil","GLOBAL",2) PartyGoldGT(999)~ + @320 EXTERN O#RAND O#Rand1.E
++ @321 EXTERN O#RAND O#Rand1.2
++ @322 EXTERN O#RAND O#Rand1.2
++ @323 EXTERN O#RAND O#Rand1.3

CHAIN O#RAND O#Rand1.G
@324
== O#RAND @325
DO ~TakePartyGold(1000)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut2")~
EXIT

CHAIN O#RAND O#Rand1.E
@324
== O#RAND @325
DO ~TakePartyGold(1000)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut3")~
EXIT

CHAIN O#RAND O#Rand1.2
@326
== O#DURN IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @327
== O#ARUDIN IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @328
== O#DURN IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @329
== O#GANEL IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @330
== O#REMUS IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @331
== O#GANEL IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @332
== O#RAND @333
EXIT

CHAIN O#RAND O#Rand1.3
@334
== O#DURN IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @335
== O#GANEL IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @336
== O#RAND @337
EXIT

// Waiting for the departure

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#RAND O#Rand2
@338
END
+ ~Global("O#DCQuestGood","GLOBAL",2) PartyGoldGT(999)~ + @339 EXTERN O#RAND O#Rand1.G
+ ~Global("O#DCQuestEvil","GLOBAL",2) PartyGoldGT(999)~ + @339 EXTERN O#RAND O#Rand1.E
+ ~Global("O#DCQuestGood","GLOBAL",2) PartyGoldGT(999)~ + @340 EXTERN O#RAND O#Rand1.G
+ ~Global("O#DCQuestEvil","GLOBAL",2) PartyGoldGT(999)~ + @340 EXTERN O#RAND O#Rand1.E
++ @341 EXTERN O#RAND O#Rand2.1

CHAIN O#RAND O#Rand2.1
@342
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#DURN O#Durn7
@343
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#ARUDIN O#Arudin7
@344
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#BEA O#Bea7
@345
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#CASTOR O#Castor7
@346
== O#DURN @132
== O#CASTOR @347
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#KHAGG O#Khagg7
@348
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#GANEL O#Ganel7
@349
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#MAC O#Mac7
@350
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#REMUS O#Remus7
@351
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",10)~ THEN O#TEAGAN O#Teagan7
@352
EXIT

// In the dungeon, the good/evil party leaves

// Good guys

CHAIN IF ~Global("O#DCQuest","GLOBAL",11)~ THEN O#DURN O#Durn8
@353 
DO ~SetGlobal("O#DCQuest","GLOBAL",12) AddJournalEntry(@10007,QUEST)~
== O#CASTOR @354 
== O#KHAGG @355
== O#ARUDIN @356
== O#BEA @357
== O#DURN @358
== O#ARUDIN @359
== O#DURN @360
== O#ARUDIN @361
// Aerie
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @362
== O#CASTOR IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @363
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @364
// EDWIN
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @365
== O#ARUDIN IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @366
== O#DURN IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @367
// Minsc
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @368
== O#ARUDIN IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @369
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @370
== O#ARUDIN IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @371
// Viconia
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @372
== O#BEA IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @373
== O#KHAGG IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @374
== O#CASTOR IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @375
== O#DURN IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @376
== O#KHAGG @377
== O#DURN @378
END
++ @379 EXTERN O#DURN O#Durn8.1
++ @380 EXTERN O#DURN O#Durn8.2
++ @381 EXTERN O#DURN O#Durn8.3

CHAIN O#DURN O#Durn8.1
@382
END
IF ~~ EXTERN O#ARUDIN O#Arudin.Traps1

CHAIN O#DURN O#Durn8.2
@383
END
IF ~~ EXTERN O#ARUDIN O#Arudin.Traps1

CHAIN O#DURN O#Durn8.3
@384
END
IF ~~ EXTERN O#ARUDIN O#Arudin.Traps1

CHAIN O#ARUDIN O#Arudin.Traps1
@385
== O#CASTOR @386
== O#ARUDIN @387
== O#CASTOR @388
== O#DURN @389
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut4")~
EXIT

// Evil guys

CHAIN IF ~Global("O#DCQuest","GLOBAL",11)~ THEN O#GANEL O#Ganel8
@390 
DO ~SetGlobal("O#DCQuest","GLOBAL",12) AddJournalEntry(@10007,QUEST)~
== O#REMUS @391
== O#GANEL @392
// Jaheira
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @393
// Keldorn
== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @394
// Mazzy
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @395
// Nalia
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @396
== O#TEAGAN @397
== O#MAC @398
== O#GANEL @399
END
++ @400 EXTERN O#GANEL O#Ganel8.1
++ @401 EXTERN O#GANEL O#Ganel8.2
++ @402 EXTERN O#GANEL O#Ganel8.3

CHAIN O#GANEL O#Ganel8.1
@403
END
IF ~~ EXTERN O#GANEL O#Ganel8.Instr

CHAIN O#GANEL O#Ganel8.2
@404
END
IF ~~ EXTERN O#GANEL O#Ganel8.Instr

CHAIN O#GANEL O#Ganel8.3
@405
== O#TEAGAN @406
== O#MAC @145
== O#GANEL @407
END
IF ~~ EXTERN O#GANEL O#Ganel8.Instr

CHAIN O#GANEL O#Ganel8.Instr
@408
== O#MAC @409
== O#TEAGAN @410
== O#REMUS @411
== O#TEAGAN @412
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut5")~
EXIT

// Lepus

BEGIN O#LEPUS 

CHAIN IF ~Global("O#DCQuest","GLOBAL",13)~ THEN O#LEPUS O#Lepus1
@413 
DO ~SetGlobal("O#DCQuest","GLOBAL",14)~
END
++ @414 EXTERN O#LEPUS O#Lepus1.1
++ @415 EXTERN O#LEPUS O#Lepus1.11
++ @416 EXTERN O#LEPUS O#Lepus1.3
++ @417 EXTERN O#LEPUS O#Lepus1.4

CHAIN O#LEPUS O#Lepus1.1
@418
END
IF ~~ EXTERN O#LEPUS O#Lepus1.2

CHAIN O#LEPUS O#Lepus1.11
@419
END 
IF ~~ EXTERN O#LEPUS O#Lepus1.2

CHAIN O#LEPUS O#Lepus1.2
@420
// Anomen
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @421
// Jaheira
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @422
// Jan
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @423
// Korgan
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @424
== O#LEPUS @425
END
++ @426 EXTERN O#LEPUS O#Lepus1.6
++ @427 EXTERN O#LEPUS O#Lepus1.5
++ @428 EXTERN O#LEPUS O#Lepus1.6
++ @429 EXTERN O#LEPUS O#Lepus1.7
++ @430 EXTERN O#LEPUS O#Lepus1.8

CHAIN O#LEPUS O#Lepus1.3
@431
END
IF ~~ EXTERN O#LEPUS O#Lepus1.2

CHAIN O#LEPUS O#Lepus1.4
@432
END
IF ~~ EXTERN O#LEPUS O#Lepus1.2

CHAIN O#LEPUS O#Lepus1.5
@433
END
IF ~~ EXTERN O#LEPUS O#Lepus1.6

CHAIN O#LEPUS O#Lepus1.6
@434
END
++ @435 EXTERN O#LEPUS O#Lepus1.9
++ @436 EXTERN O#LEPUS O#Lepus1.9
++ @437 EXTERN O#LEPUS O#Lepus1.9
++ @438 EXTERN O#LEPUS O#Lepus1.8

CHAIN O#LEPUS O#Lepus1.7
@439
END
IF ~~ EXTERN O#LEPUS O#Lepus1.6

CHAIN O#LEPUS O#Lepus1.8
@440
DO ~Enemy()~
EXIT 

CHAIN O#LEPUS O#Lepus1.9
@441
DO ~Enemy()~
EXIT

// Lepus is defeated, and the Shadow Pack/Dungeon Crawlers appear

CHAIN IF ~Global("O#DCQuest","GLOBAL",15)~ THEN O#LEPUS O#Lepus2
@442 
DO ~SetGlobal("O#DCQuest","GLOBAL",16)~
== O#MAC IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @443
== O#KHAGG IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @443
== O#LEPUS @444
== O#KHAGG IF ~Global("O#DCQuestGood","GLOBAL",2)~ THEN @445
== O#MAC IF ~Global("O#DCQuestEvil","GLOBAL",2)~ THEN @445
== O#LEPUS @446
DO ~ActionOverride("O#Lepus",DestroySelf())~
EXIT

// Good guys have the chest 

CHAIN IF ~Global("O#DCQuest","GLOBAL",16) Global("O#DCQuestGood","GLOBAL",2)~ THEN O#DURN O#Durn14
@447 
DO ~SetGlobal("O#DCQuest","GLOBAL",17)~
== O#ARUDIN @448 
== O#DURN @449
== O#ARUDIN @450
== O#DURN @451
== O#ARUDIN @452
== O#DURN @453
END
++ @454 EXTERN O#ARUDIN O#Arudin14.1
++ @455 EXTERN O#ARUDIN O#Arudin14.2
++ @456 EXTERN O#ARUDIN O#Arudin14.3

CHAIN O#ARUDIN O#Arudin14.1
@457
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut8")~
EXIT

CHAIN O#ARUDIN O#Arudin14.2
@458
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut8")~
EXIT

CHAIN O#ARUDIN O#Arudin14.3
@459
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut8")~
EXIT

// Evil guys have the chest

CHAIN IF ~Global("O#DCQuest","GLOBAL",16) Global("O#DCQuestEvil","GLOBAL",2)~ THEN O#GANEL O#Ganel14
@460 
DO ~SetGlobal("O#DCQuest","GLOBAL",17)~
== O#TEAGAN @461
== O#GANEL @462
END
++ @463 EXTERN O#TEAGAN O#Ganel14.1
++ @464 EXTERN O#GANEL O#Ganel14.2
++ @465 EXTERN O#GANEL O#Ganel14.3

CHAIN O#TEAGAN O#Ganel14.1
@466
== O#GANEL @467
== O#TEAGAN @468
== O#GANEL @469
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut9")~
EXIT

CHAIN O#GANEL O#Ganel14.2
@470
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut9")~
EXIT

CHAIN O#GANEL O#Ganel14.3
@471
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DCCut9")~
EXIT

// Evil guys, on the roof of the Copper Coronet

CHAIN IF ~Global("O#DCQuest","GLOBAL",18) Global("O#DCQuestEvil","GLOBAL",2)~ THEN O#GANEL O#Ganel15
@472 
= @473 
DO ~SetGlobal("O#DCQuest","GLOBAL",19)~
== O#TEAGAN @474
== O#REMUS @475
== O#GANEL @476
== O#MAC @477
END
++ @478 EXTERN O#GANEL O#Ganel15.1
++ @479 EXTERN O#GANEL O#Ganel15.1
++ @480 EXTERN O#GANEL O#Ganel15.1
++ @481 EXTERN O#GANEL O#Ganel15.2

CHAIN O#GANEL O#Ganel15.1
@482
DO ~SetGlobal("O#DCQuestEvil","GLOBAL",4)~
== O#MAC @483
== O#GANEL @484
== O#TEAGAN @485
END
IF ~~ EXTERN O#REMUS O#Remus15

CHAIN O#REMUS O#Remus15
@486
== O#MAC @487
== O#GANEL @488
END
++ @489 EXTERN O#GANEL O#Ganel15.3
++ @490 EXTERN O#GANEL O#Ganel15.3
++ @491 EXTERN O#GANEL O#Ganel15.4

CHAIN O#GANEL O#Ganel15.2
@492
== O#TEAGAN @493
== O#GANEL @494
== O#MAC @495
END
IF ~~ EXTERN O#REMUS O#Remus15

CHAIN O#GANEL O#Ganel15.3
@496
DO ~EraseJournalEntry(@10001)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10005)
EraseJournalEntry(@10006)
EraseJournalEntry(@10007)
AddJournalEntry(@10008,QUEST_DONE)
CreateItem("MISC47",0,0,0)
DropItem("MISC47",[3726.2038])
ActionOverride("O#Ganel",EscapeArea())
ActionOverride("O#Mac",EscapeArea())
ActionOverride("O#Remus",EscapeArea())
ActionOverride("O#Teagan",EscapeArea())~
EXIT

CHAIN O#GANEL O#Ganel15.4
@497
DO ~EraseJournalEntry(@10001)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10005)
EraseJournalEntry(@10006)
EraseJournalEntry(@10007)
AddJournalEntry(@10009,QUEST_DONE)
CreateItem("MISC47",0,0,0)
ActionOverride("O#Ganel",Enemy())
ActionOverride("O#Mac",Enemy())
ActionOverride("O#Remus",Enemy())
ActionOverride("O#Teagan",Enemy())~
EXIT

// Good guys, on the roof of the Copper Coronet

CHAIN IF ~Global("O#DCQuest","GLOBAL",18) Global("O#DCQuestGood","GLOBAL",2)~ THEN O#CASTOR O#Castor15
@498 
DO ~SetGlobal("O#DCQuest","GLOBAL",19)~
== O#DURN @499
== O#BEA @500
== O#KHAGG @501
END 
++ @502 EXTERN O#DURN O#Durn15.1
++ @503 EXTERN O#DURN O#Durn15.1
++ @504 EXTERN O#DURN O#Durn15.1
++ @505 EXTERN O#DURN O#Durn15.1
++ @506 EXTERN O#BEA O#Durn15.2

CHAIN O#DURN O#Durn15.1
@507
== O#KHAGG @508
== O#DURN @509
END
++ @510 EXTERN O#DURN O#Durn15.3
++ @511 EXTERN O#DURN O#Durn15.3
++ @506 EXTERN O#BEA O#Durn15.2

CHAIN O#BEA O#Durn15.2
@512
== O#DURN @513
END
++ @514 EXTERN O#DURN O#Durn15.3
++ @515 EXTERN O#DURN O#Durn15.4

CHAIN O#DURN O#Durn15.3
@516
DO ~SetGlobal("O#DCRewardTime","GLOBAL",1)
AddJournalEntry(@10011,QUEST)
ActionOverride("O#Arudin",EscapeArea())
ActionOverride("O#Bea",EscapeArea())
ActionOverride("O#Castor",EscapeArea())
ActionOverride("O#Durn",EscapeArea())
ActionOverride("O#Khagg",EscapeArea())~
EXIT

CHAIN O#DURN O#Durn15.4
@517
== O#ARUDIN @518
== O#BEA @519
== O#CASTOR @520
DO ~CreateItem("MISC47",0,0,0)
EraseJournalEntry(@10001)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10004)
EraseJournalEntry(@10006)
EraseJournalEntry(@10007)
AddJournalEntry(@10010,QUEST_DONE)
ActionOverride("O#Arudin",Enemy())
ActionOverride("O#Bea",Enemy())
ActionOverride("O#Castor",Enemy())
ActionOverride("O#Durn",Enemy())
ActionOverride("O#Khagg",Enemy())~
EXIT

// Good guys, inside the Copper Coronet

BEGIN O#THADD // Lord Thaddeus Leoncourt

CHAIN IF ~Global("O#DCQuest","GLOBAL",20)~ THEN O#THADD O#Thadd1
@521
DO ~SetGlobal("O#DCQuest","GLOBAL",21) 
EraseJournalEntry(@10001)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10004)
EraseJournalEntry(@10006)
EraseJournalEntry(@10007)
EraseJournalEntry(@10011)
AddJournalEntry(@10012,QUEST_DONE)~
== O#DURN @522
== O#THADD @523
== O#THADD @524
== O#KHAGG @435
== O#CASTOR @525
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @526
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @527
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @528
== YOSHJ IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN @529
== O#ARUDIN @530
== O#CASTOR @531
== O#BEA @532
== O#THADD @533
== O#DURN @534
== O#THADD @535
DO ~GiveGoldForce(5000)
ActionOverride("O#Thadd",EscapeArea())~
EXIT

CHAIN IF ~Global("O#DCQuest","GLOBAL",21)~ THEN O#DURN O#Durn.DidIt
@536 
DO ~SetGlobal("O#DCQuest","GLOBAL",22)~
== O#KHAGG @537
== O#ARUDIN @538
== O#CASTOR @539
== O#ARUDIN @540
== O#DURN @541
== O#KHAGG @18
== O#BEA @542
== O#CASTOR @543
== O#ARUDIN @544
== O#DURN @545
END
++ @546 EXTERN O#DURN O#Durn1.Last1
++ @547 EXTERN O#DURN O#Durn1.Last2
++ @548 EXTERN O#DURN O#Durn1.Last3

CHAIN O#DURN O#Durn1.Last1
@549
END
IF ~~ EXTERN O#DURN O#Durn1.Last4
 
CHAIN O#DURN O#Durn1.Last2
@550
END
IF ~~ EXTERN O#DURN O#Durn1.Last4

CHAIN O#DURN O#Durn1.Last3
@551
END
IF ~~ EXTERN O#DURN O#Durn1.Last4

CHAIN O#DURN O#Durn1.Last4
@552
DO ~ActionOverride("O#Arudin",EscapeArea())
ActionOverride("O#Bea",EscapeArea())
ActionOverride("O#Castor",EscapeArea())
ActionOverride("O#Durn",EscapeArea())
ActionOverride("O#Khagg",EscapeArea())~
EXIT

BEGIN O#SRAX    // Sraxsuth
BEGIN O#BLINKY  // Blinky

// Blinky

CHAIN IF ~Global("O#DCTalkedToBeholder","LOCALS",0)~ THEN O#BLINKY O#Blinky1
@553
DO ~SetGlobal("O#DCTalkedToBeholder","LOCALS",1)~
== O#SRAX @554
== O#BLINKY @555
== O#SRAX @556
// Cernd
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @557
// Jan
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @558
// Mazzy
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @559
// Nalia
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @560
// Valygar
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @561
== O#BLINKY @562
END
++ @563 EXTERN O#BLINKY O#Blinky1.1
+ ~Global("O#DCSmugglerQuest","GLOBAL",1) !Global("O#DCAttackedSmugglers","GLOBAL",1)~ + @564 EXTERN O#BLINKY O#Blinky1.5
+ ~Dead("O#Smug") Global("O#DCSmugglerQuest","GLOBAL",2)~ + @565 EXTERN O#SRAX O#Srax1.4
++ @566 EXTERN O#BLINKY O#Blinky1.2
++ @567 EXTERN O#BLINKY O#Blinky1.3
++ @568 EXTERN O#BLINKY O#Blinky1.4

CHAIN O#BLINKY O#Blinky1.1
@569
END
++ @570 EXTERN O#BLINKY O#Blinky1.Enemy
++ @571 EXTERN O#BLINKY O#Blinky1.2
++ @572 EXTERN O#BLINKY O#Blinky1.3

CHAIN O#BLINKY O#Blinky1.2
@573
== O#SRAX @574
== O#BLINKY @575
== O#SRAX @576
EXIT

CHAIN O#BLINKY O#Blinky1.3
@577
END
++ @578 EXTERN O#BLINKY O#Blinky1.4
++ @579 EXTERN O#BLINKY O#Blinky1.2

CHAIN O#BLINKY O#Blinky1.4
@580
DO ~StartStore("O#DCSTO",LastTalkedToBy())~ 
EXIT

CHAIN O#BLINKY O#Blinky1.Enemy
@581 
DO ~ChangeAIScript("GAUTH01",OVERRIDE)
Enemy()
ActionOverride("O#Srax",Enemy())~
EXIT
 
CHAIN IF ~Global("O#DCTalkedToBeholder","LOCALS",1)~ THEN O#BLINKY O#Blinky2
@562
END
+ ~Global("O#DCSmugglerQuest","GLOBAL",1) !Global("O#DCAttackedSmugglers","GLOBAL",1)~ + @564 EXTERN O#BLINKY O#Blinky1.5
+ ~Dead("O#Smug") Global("O#DCSmugglerQuest","GLOBAL",2)~ + @565 EXTERN O#SRAX O#Srax1.4
++ @582 EXTERN O#BLINKY O#Blinky1.4
++ @579 EXTERN O#BLINKY O#Blinky1.2
++ @583 EXTERN O#BLINKY O#Blinky1.2

CHAIN O#BLINKY O#Blinky1.5
@584
DO ~SetGlobal("O#DCSmugglerQuest","GLOBAL",2)~
== O#SRAX @585
== O#BLINKY @586
== O#SRAX @587
== O#BLINKY @588
== O#SRAX @589
END
++ @590 EXTERN O#BLINKY O#Blinky1.6
++ @591 EXTERN O#BLINKY O#Blinky1.7
++ @592 EXTERN O#BLINKY O#Blinky1.Enemy

CHAIN O#BLINKY O#Blinky1.6
@593
== O#SRAX @594
== O#BLINKY @595
== O#SRAX @596
== O#BLINKY @347
EXIT

CHAIN O#BLINKY O#Blinky1.7
@597
== O#SRAX @598
== O#BLINKY @347
EXIT

// Sraxsuth

CHAIN IF ~Global("O#DCTalkedToLich","LOCALS",0)~ THEN O#SRAX O#Srax1
@599
END
++ @600 EXTERN O#SRAX O#Srax1.1
+ ~Global("O#DCSmugglerQuest","GLOBAL",1) !Global("O#DCAttackedSmugglers","GLOBAL",1)~ + @564 EXTERN O#BLINKY O#Blinky1.5
+ ~Dead("O#Smug") Global("O#DCSmugglerQuest","GLOBAL",2)~ + @565 EXTERN O#SRAX O#Srax1.4
++ @583 EXTERN O#SRAX O#Srax1.2
++ @601  DO ~StartStore("O#DCTAV",LastTalkedToBy())~ EXIT
++ @602 EXTERN O#SRAX O#Srax1.3

CHAIN O#SRAX O#Srax1.1
@603
END
++ @604 EXTERN O#SRAX O#Srax1.Enemy
++ @605 EXTERN O#SRAX O#Srax1.2
++ @606 EXTERN O#SRAX O#Srax1.3

CHAIN O#SRAX O#Srax1.2
@607
EXIT

CHAIN O#SRAX O#Srax1.3
@608
END
++ @609 EXTERN O#SRAX O#Srax1.2
++ @610 EXTERN O#SRAX O#Srax1.Enemy
++ @611  DO ~StartStore("O#DCTAV",LastTalkedToBy())~ EXIT

CHAIN O#SRAX O#Srax1.Enemy
@581 
DO ~Enemy()
ActionOverride("O#Blinky",Enemy())
ActionOverride("O#Blinky",ChangeAIScript("GAUTH01",OVERRIDE))~
EXIT

CHAIN O#SRAX O#Srax1.4
@612
DO ~SetGlobal("O#DCSmugglerQuest","GLOBAL",3)~
== O#BLINKY @613
END
++ @614 DO ~StartStore("O#DCTAV",LastTalkedToBy())~ EXIT
++ @615  EXTERN O#BLINKY O#Blinky1.4
++ @616 EXTERN O#SRAX O#Srax1.2

// Smugglers

BEGIN O#SMUG // Fren, the boss
BEGIN O#THUG // other smugglers

CHAIN IF ~Global("O#DCTalkedToSmuggler","LOCALS",0)~ THEN O#SMUG O#Smug1
@617
DO ~SetGlobal("O#DCTalkedToSmuggler","LOCALS",1) SetGlobal("O#DCSmugglerQuest","GLOBAL",1)~
== O#SMUG @618
END
++ @619 EXTERN O#SMUG O#Smug1.1
++ @620 EXTERN O#SMUG O#Smug1.2
++ @621 EXTERN O#SMUG O#Smug1.3
++ @622 EXTERN O#SMUG O#Smug1.4

CHAIN O#SMUG O#Smug1.1
@623
END
IF ~~ EXTERN O#SMUG O#Smug1.5

CHAIN O#SMUG O#Smug1.2
@624
END
IF ~~ EXTERN O#SMUG O#Smug1.5

CHAIN O#SMUG O#Smug1.3
@625
END
IF ~~ EXTERN O#SMUG O#Smug1.5

CHAIN O#SMUG O#Smug1.4
@626
END
IF ~~ EXTERN O#SMUG O#Smug1.5

CHAIN O#SMUG O#Smug1.5
@627
// Edwin
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @628
// Jaheira
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @629
// Keldorn
== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @630
// Viconia
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @631
== O#SMUG @632
== O#SMUG @633
END
++ @634  EXTERN O#SMUG O#Smug1.Chest
++ @635 EXTERN O#SMUG O#Smug1.6
++ @636 EXTERN O#SMUG O#Smug1.6
++ @637 EXTERN O#SMUG O#Smug1.7
++ @638 EXTERN O#SMUG O#Smug1.7

CHAIN O#SMUG O#Smug1.Chest
@639
END
++ @640 EXTERN O#SMUG O#Smug1.6
++ @641 EXTERN O#SMUG O#Smug1.7

CHAIN O#SMUG O#Smug1.6
@642
EXIT

CHAIN O#SMUG O#Smug1.7
@643
DO ~SetGlobal("O#DCAttackedSmugglers","GLOBAL",1)
Enemy()~
EXIT

CHAIN IF ~Global("O#DCTalkedToSmuggler","LOCALS",1)~ THEN O#SMUG O#Smug2
@644
END
+ ~Global("O#DCAskedChestSmuggler","LOCALS",0)~ + @645 DO ~SetGlobal("O#DCAskedChestSmuggler","LOCALS",1)~ EXTERN O#SMUG O#Smug1.Chest
+ ~Dead("O#Srax") Dead("O#Blinky")~ + @646 EXTERN O#SMUG O#Smug2.1
++ @647 EXTERN O#SMUG O#Smug1.7
++ @648 EXTERN O#SMUG O#Smug1.7
+ ~Global("O#DCSmugglerQuest","GLOBAL",2)~ + @649 EXTERN O#SMUG O#Smug2.2
++ @650 EXTERN O#SMUG O#Smug2.3

CHAIN O#SMUG O#Smug2.1
@651
= @652
DO ~SetGlobal("O#DCTalkedToSmuggler","LOCALS",2) ActionOverride(Player1,GiveGoldForce(2000))~
EXIT

CHAIN O#SMUG O#Smug2.2
@653
EXIT

CHAIN O#SMUG O#Smug2.3
@654
EXIT

CHAIN IF ~Global("O#DCTalkedToSmuggler","LOCALS",2)~ THEN O#SMUG O#Smug3
@655
EXIT

// Other smugglers

CHAIN IF ~RandomNum(4,1)~ THEN O#THUG O#Thug1
@656
EXIT

CHAIN IF ~RandomNum(4,2)~ THEN O#THUG O#Thug2
@657
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#THUG O#Thug3
@280
EXIT

CHAIN IF ~RandomNum(4,4)~ THEN O#THUG O#Thug4
@658
EXIT

// A wandering monk on the first floor

BEGIN O#QUAGIS // Quagis

CHAIN IF ~Global("O#DCTalkedToMonkQuagis","LOCALS",0)~ THEN O#QUAGIS O#Quag1
@659
END
++ @620 EXTERN O#QUAGIS O#Quag1.1
++ @660 EXTERN O#QUAGIS O#Quag1.2
++ @661 EXTERN O#QUAGIS O#Quag1.3
++ @662 EXTERN O#QUAGIS O#Quag1.4
++ @663 EXTERN O#QUAGIS O#Quag1.Enemy
++ @664 EXTERN O#QUAGIS O#Quag1.5

CHAIN O#QUAGIS O#Quag1.1
@665
END
IF ~~ EXTERN O#QUAGIS O#Quag1

CHAIN O#QUAGIS O#Quag1.2
@666
= @667
END
IF ~~ EXTERN O#QUAGIS O#Quag1

CHAIN O#QUAGIS O#Quag1.3
@668
END
IF ~~ EXTERN O#QUAGIS O#Quag1

CHAIN O#QUAGIS O#Quag1.4
@669
END
IF ~~ EXTERN O#QUAGIS O#Quag1

CHAIN O#QUAGIS O#Quag1.5
@670
EXIT 

CHAIN O#QUAGIS O#Quag1.Enemy
@671
DO ~ChangeAIScript("MAGE14M",OVERRIDE) Enemy()~
EXIT

// When buying tea from Sraxsuth, rumors

BEGIN O#DCTAV

CHAIN IF ~RandomNum(12,1)~ THEN O#DCTAV O#Tav1
@672
EXIT

CHAIN IF ~RandomNum(12,2)~ THEN O#DCTAV O#Tav2
@673
EXIT

CHAIN IF ~RandomNum(12,3)~ THEN O#DCTAV O#Tav3
@674
EXIT

CHAIN IF ~RandomNum(12,4)~ THEN O#DCTAV O#Tav4
@675
EXIT

CHAIN IF ~RandomNum(12,5)~ THEN O#DCTAV O#Tav5
@676
EXIT

CHAIN IF ~RandomNum(12,6)~ THEN O#DCTAV O#Tav6
@677
EXIT

CHAIN IF ~RandomNum(12,7)~ THEN O#DCTAV O#Tav7
@678
EXIT

CHAIN IF ~RandomNum(12,8)~ THEN O#DCTAV O#Tav8
@679
EXIT

CHAIN IF ~RandomNum(12,9)~ THEN O#DCTAV O#Tav9
@680
EXIT

CHAIN IF ~RandomNum(12,10)~ THEN O#DCTAV O#Tav10
@681
EXIT

CHAIN IF ~RandomNum(12,11)~ THEN O#DCTAV O#Tav11
@682
EXIT

CHAIN IF ~RandomNum(12,12)~ THEN O#DCTAV O#Tav12
@683
EXIT