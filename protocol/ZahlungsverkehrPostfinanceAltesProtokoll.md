# Protokoll Zahlungsverkehr Post und Bank

Im ersten Teil wird Kontrollbereich erstellt.

Der erste Record definiert die Transaktions-Art.
Danach folgen die Datensätze der Post und Bank.
Der letzte Record definiert den Abschluss der Transaktion.

# Protokoll
## Kontrollbereich

| Feldname                  	| Pos. 	| Picture 	| Inhalt                                          	| fak. /obl 	| Bemerkung                                                                       	|
|---------------------------	|------	|---------	|-------------------------------------------------	|-----------	|---------------------------------------------------------------------------------	|
| File-Identifikation       	| 1    	| 9(3)    	| 036                                             	| obl.      	| ist im Orginal auf 036 Fix gesetzt                                                |
| Fälligkeitsdatum          	| 4    	| 9(6)    	| JJMMTT                                          	| obl.      	| Postwerktag als von Mo-Sa                                                         |
| Reserve                   	| 10   	| 9(6)    	| 000000                                          	| obl.      	|                                                                                 	|
| Lastkontonummer           	| 16   	| 9(9)    	| 000000000                                       	| obl.      	|                                                                                 	|
| Gebührenkontonummer       	| 25   	| 9(9)    	| 000000000                                       	| obl.      	|                                                                                 	|
| Auftragsnummer/ RNummer   	| 34   	| 9(2)    	| 00                                              	| obl.         	|                                                                                 	|
| Transaktionsart (TRX-ART) 	| 36   	| 9(2)    	| 00                                              	| obl.      	| 05 default gemäss alter impl.  (00 Kopfzeile,05 Auszahlung, 98 Total)             |
| Transaktionslaufnummer    	| 38   	| 9(6)    	| Kopfrecord = 000000 Transaktionsrecord = 000001 	| obl.      	| Aufsteigend nach Transaktionslaufnummer sortiert. Die Laufnummer ist eindeutig. 	|
| Reserve-02                	| 44   	| 9(2)    	| 00                                              	| obl.      	|                                                                                 	|
| Zahlungsart               	| 46   	| 9(1)    	| 0                                               	| obl.      	|                                                                                 	|
| Reserve-03                	| 48   	| 9(4)    	| 00                                              	| obl.      	|                                                                                 	|

## Post

| Feldname                               | Pos. | Picture  | Inhalt  | fak. /obl | Bemerkung                                                        |
|----------------------------------------|------|----------|---------|-----------|------------------------------------------------------------------|
| Betrag                                 | 51   | 9(09)V99 |         | obl.      | grösser als null                                                 |
| Konto Empfänger                        | 64   | 9(09)    |         | obl.      |                                                                  |
| Bank Empfänger	 	                 | 73   | X(27)    | SPACES  |           | Im Orginal Bank-Endbeg, wird im Postkonto mit SPACES ausgefüllt. |
| Reserve                                | 100  | X(28)    | SPACES  | obl.      |                                                                  |
| Vorname, Name des Empfänger            | 128  | X(30)    | SPACES  | obl.      | Name Vorname                                                     |
| Zusatz-Bezeichnung des Empfänger       | 158  | X(30)    | SPACES  | obl.      | (Vorname) - wenn Name Vorname zu lang ist wird es aufgeteilt     |
| Strasse des Empfängers                 | 188  | X(30)    | SPACES  | obl.      |                                                                  |
| PLZ des Empfängers 1-4                 | 218  | X(04)    | SPACES  | obl.      |                                                                  |
| PLZ des Empfängers 5-6 Zusatz          | 222  | X(02)    | SPACES  | obl.      |                                                                  |
| Ort des Empfängers                     | 224  | X(24)    | SPACES  | obl.      |                                                                  |
| Vorname, Name des Endbegünstigten      | 248  | X(30)    | SPACES  |           | Name Vorname                                                     |
| Zusatz Bezeichnung des Endbegünstigten | 278  | X(30)    | SPACES  |           | (Vorname) - wenn Name Vorname zu lang ist wird es aufgeteilt     |
| Strasse des Endbegünstigten            | 308  | X(30)    | SPACES  |           |                                                                  |
| PLZ des Endbegünstigten 1-4            | 338  | X(04)    | SPACES  |           |                                                                  |
| PLZ de Endbegünstigten 5-6 Zusatz      | 342  | X(02)    | SPACES  |           |                                                                  |
| Ort des Endbegünstigten                | 344  | X(24)    | SPACES  |           |                                                                  |
| Reserve                                | 368  | X(08)    | SPACES  |           |                                                                  |
| Message Block 1                        | 376  | X(28)    | SPACES  |           |                                                                  |
| Message Block 2                        | 404  | X(28)    | SPACES  |           |                                                                  |
| Message Block 3                        | 432  | X(28)    | SPACES  |           |                                                                  |
| Message Block 4                        | 460  | X(28)    | SPACES  |           |                                                                  |
| Message Block 5                        | 488  | X(28)    | SPACES  |           |                                                                  |
| Reserve                                | 516  | X(67)    | SPACES  |           |                                                                  |
| Vorname, Name des Auftragsgeber        | 583  | X(30)    | SPACES  |           |                                                                  |
| Zusatz-Bezeichnung des Auftragsgeber   | 613  | X(30)    | SPACES  |           |                                                                  |
| Strasse des Auftragsgeber              | 643  | X(30)    | SPACES  |           |                                                                  |
| PLZ des Endbegünstigten 1-4            | 673  | X(04)    | SPACES  |           |                                                                  |
| PLZ de Endbegünstigten 5-6 Zusatz      | 677  | X(02)    | SPACES  |           |                                                                  |
| Ort des Endbegünstigten                | 679  | X(24)    | SPACES  |           |                                                                  |

## Bank
Ist bis auf den ersten Block für Konto und Clearing gleich. (Pos. 51-100)

| Feldname                               | Pos. | Picture  | Inhalt  | fak. /obl | Bemerkung                                                        |
|----------------------------------------|------|----------|---------|-----------|------------------------------------------------------------------|
| Betrag                                 | 51   | 9(09)V99 |         | obl.      |                                                                  |
| Clearing Empfänger                     | 64   | X(09)    |         | obl.      |                                                                  |
| Bank Empfänger                         | 73   | X(27)    | SPACES  | obl.      | Im Orginal Bank-Endbeg, wird im Postkonto mit SPACES ausgefüllt. |
| Reserve                                | 100  | X(28)    | SPACES  | obl.      |                                                                  |
| Vorname, Name des Empfänger            | 128  | X(30)    | SPACES  | obl.      | Name Vorname                                                     |
| Zusatz-Bezeichnung des Empfänger       | 158  | X(30)    | SPACES  | obl.      | (Vorname) - wenn Name Vorname zu lang ist wird es aufgeteilt     |
| Strasse des Empfängers                 | 188  | X(30)    | SPACES  | obl.      |                                                                  |
| PLZ des Empfängers 1-4                 | 218  | X(04)    | SPACES  | obl.      |                                                                  |
| PLZ des Empfängers 5-6 Zusatz          | 222  | X(02)    | SPACES  | obl.      |                                                                  |
| Ort des Empfängers                     | 224  | X(24)    | SPACES  | obl.      |                                                                  |
| Vorname, Name des Endbegünstigten      | 248  | X(30)    | SPACES  |           | Name Vorname                                                     |
| Zusatz Bezeichnung des Endbegünstigten | 278  | X(30)    | SPACES  |           | (Vorname) - wenn Name Vorname zu lang ist wird es aufgeteilt     |
| Strasse des Endbegünstigten            | 308  | X(30)    | SPACES  |           |                                                                  |
| PLZ des Endbegünstigten 1-4            | 338  | X(04)    | SPACES  |           |                                                                  |
| PLZ de Endbegünstigten 5-6 Zusatz      | 342  | X(02)    | SPACES  |           |                                                                  |
| Ort des Endbegünstigten                | 344  | X(24)    | SPACES  |           |                                                                  |
| Reserve                                | 368  | X(08)    | SPACES  |           |                                                                  |
| Message Block 1                        | 376  | X(28)    | SPACES  |           |                                                                  |
| Message Block 2                        | 404  | X(28)    | SPACES  |           |                                                                  |
| Message Block 3                        | 432  | X(28)    | SPACES  |           |                                                                  |
| Message Block 4                        | 460  | X(28)    | SPACES  |           |                                                                  |
| Message Block 5                        | 488  | X(28)    | SPACES  |           |                                                                  |
| Reserve                                | 516  | X(67)    | SPACES  |           |                                                                  |
| Vorname, Name des Auftragsgeber        | 583  | X(30)    | SPACES  |           |                                                                  |
| Zusatz-Bezeichnung des Auftragsgeber   | 613  | X(30)    | SPACES  |           |                                                                  |
| Strasse des Auftragsgeber              | 643  | X(30)    | SPACES  |           |                                                                  |
| PLZ des Endbegünstigten 1-4            | 673  | X(04)    | SPACES  |           |                                                                  |
| PLZ de Endbegünstigten 5-6 Zusatz      | 677  | X(02)    | SPACES  |           |                                                                  |
| Ort des Endbegünstigten                | 679  | X(24)    | SPACES  |           |                                                                  |

## Kopfzeile (Pos. 0)

| Feldname                  | Pos. | Picture | Inhalt               | fak. /obl | Bemerkung                          |
|---------------------------|------|---------|----------------------|-----------|------------------------------------|
| File-Identifikation       | 1    | 9(3)    | 036                  | obl.      | ist im Orginal auf 036 Fix gesetzt |
| Fälligkeitsdatum          | 4    | 9(6)    | JJMMTT               | obl.      | Postwerktag als von Mo-Sa          |
| Reserve                   | 10   | 9(6)    | 000000               | obl.      |                                    |
| Lastkontonummer           | 16   | 9(9)    | 000000000            | obl.      |                                    |
| Gebührenkontonummer       | 25   | 9(9)    | 000000000            | obl.      |                                    |
| Auftragsnummer/ RNummer   | 34   | 9(2)    | 00                   | obl.      |                                    |
| Transaktionsart (TRX-ART) | 36   | 9(2)    | 00                   | obl.      | default ist 00 Kopfzeile           |
| Transaktionslaufnummer    | 38   | 9(6)    | Kopfrecord = 000000  | obl.      | default 000000                     |
| Reserve-02                | 44   | 9(2)    | 00                   | obl.      |                                    |
| Zahlungsart               | 46   | 9(1)    | 0                    | obl.      |                                    |
| Reserve-03                | 48   | 9(4)    | 00                   | obl.      |                                    |

## Abschlusszeile / Total / letzte Zeile

Bis Pos 51 wird Kontrollbereich verwendet mit spez. Params. 

| Feldname                  | Pos. | Picture  | Inhalt        | fak. /obl | Bemerkung                                          |
|---------------------------|------|----------|---------------|-----------|----------------------------------------------------|
| File-Identifikation       | 1    | 9(03)    | 036           | obl.      | ist im Orginal auf 036 Fix gesetzt                 |
| Fälligkeitsdatum          | 4    | 9(06)    | JJMMTT        | obl.      | Postwerktag als von Mo-Sa                          |
| Reserve                   | 10   | 9(06)    | 000000        | obl.      |                                                    |
| Lastkontonummer           | 16   | 9(09)    | 000000000     | obl.      |                                                    |
| Gebührenkontonummer       | 25   | 9(09)    | 000000000     | obl.      |                                                    |
| Auftragsnummer/ RNummer   | 34   | 9(02)    | 00            | obl.      |                                                    |
| Transaktionsart (TRX-ART) | 36   | 9(02)    | 98            | obl.      | 98 steht für Total                                 |
| Transaktionslaufnummer    | 38   | 9(06)    |  000000       | obl.      |                                                    |
| Reserve-02                | 44   | 9(02)    | 00            | obl.      |                                                    |
| Zahlungsart               | 46   | 9(01)    | 0             | obl.      |                                                    |
| Reserve-03                | 48   | 9(04)    | 00            | obl.      |                                                    |
| Währungs Code             | 51   | 9(02)    | 00            | obl.      | 01 für CHF                                         |
| Anzahl Transaktionen      | 53   | 9(06)    | 0000000       |           | Transaktionslaufnummer - 1 (z.B 000057-1 = 000056) |
| Total Betrag              | 59   | 9(11)V99 | 0000000000000 | obl.      |                                                    |
| Währungs elt2-15          | 72   | X(294)   | ZERO          | obl.      | wird mit ZERO gefüllt                              |
| Reserve                   | 366  | X(335)   |               |           | Hat im Orginal nichts                              |
