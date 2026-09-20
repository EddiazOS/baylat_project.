#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Physik-informierte neuronale Differentialgleichungen und multimodale Spektralsensorik zur autonomen Qualitäts- und Frischevorhersage von kolumbianischem Spezialitätenkaffee],
  subtitle: [Wissenschaftliches Exposé und Forschungsantrag – BAYLAT-Anschubfinanzierung (OASys 2026/2027)],
  objective: [
    Formulierung, Validierung und vergleichende Evaluation eines neuartigen, explorativen Machine-Learning- und Deep-Learning-Frameworks zur präzisen Vorhersage der Alterungskinetik von kolumbianischem Spezialitätenkaffee (Coffea arabica). Im Mittelpunkt steht die systematische Gegenüberstellung klassischer chemometrischer Methoden (PLSR, SVR) mit rein datengetriebenem Deep Learning (1D-CNN) und Physik-informierten neuronalen Netzen (PINN mit integrierten Arrhenius-Abbaukinetiken für Chlorogensäuren und Lipidperoxidation) auf Basis von FTIR-Spektren und normierten AOAC-Referenzdaten, ergänzt durch das explorative Screening moderner Sequenzmodelle (Mamba SSM, Spectral Transformers) und die bilaterale Nachwuchsförderung zwischen der Technischen Hochschule Deggendorf (DIT) und der Universidad de Cartagena (UdC).
  ],
  authors: (
    "Prof. Dr. Isabel Suárez — Technische Hochschule Deggendorf (DIT), KI-Campus",
    "Prof. Dr. Ricardo Vivas — Universidad de Cartagena (UdC), Fakultät für Naturwissenschaften",
  ),
  date: "17. September 2026",
  doc_id: "BAYLAT-EXP-DE-2026",
  header_title: "Wissenschaftliches Exposé (BAYLAT) — DIT & UdC",
)

#set text(lang: "de")

= 1. Einleitung, Problemstellung und sozioökonomische Relevanz

== 1.1 Motivation und bioökonomischer Kontext des kolumbianischen Kaffeesektors
Die Republik Kolumbien zählt weltweit zu den führenden Produzenten von hochwertigem Hochland-Arabica-Kaffee (*Coffea arabica*). Der Kaffeesektor bildet das sozioökonomische Rückgrat des ländlichen Raums: Mehr als $550.000$ kleinbäuerliche Familienbetriebe in den Andenregionen (Huila, Nariño, Cauca, Eje Cafetero, Santander und Sierra Nevada de Santa Marta) erwirtschaften ihre Existenzgrundlage über den Anbau von Kaffeespezialitäten ("Specialty Coffee"). Kaffees mit Cupping-Scores von über $85$ Punkten nach den Standards der Specialty Coffee Association (SCA) erzielen auf dem europäischen und insbesondere dem bayerischen Markt beträchtliche Preisprämien.

Diese Premiumqualität hängt jedoch entscheidend von der chemischen Frische und Stabilität der Bohnen ab. Während der Lagerung von Rohkaffee (Grünkaffee) und geröstetem Kaffee sowie während des transatlantischen Transports (typische Transitzeiten von $20$ bis $45$ Tagen vom Karibikhafen Cartagena de Indias nach Hamburg oder Rotterdam) sind die Partien extremen klimatischen Schwankungen ausgesetzt. Temperaturen zwischen $20 thin degree"C"$ und über $40 thin degree"C"$ sowie relative Luftfeuchtigkeiten ($"r.F."$) zwischen $50\%$ und $85\%$ beschleunigen chemische Abbaupfade dramatisch:
1. *Oxidativer Abbau von Kaffeelipiden:* Kaffee enthält zwischen $12\%$ und $17\%$ Fettphase (insbesondere Cafestol- und Kahweolester sowie ungesättigte Linolsäureacylglycerine), die unter Bildung von Hydroperoxiden und flüchtigen Ranzigkeitsaldehyden oxidieren.
2. *Hydrolyse und Lactonisierung von Chlorogensäuren (CGA):* Die für die feine Säurestruktur verantwortlichen Caffeoylchinasäuren (5-CQA, 3-CQA, 4-CQA) zerfallen in freie Chinasäure und Kaffeesäure oder bilden adstringierend-bittere Chinide.
3. *Feuchtigkeitsaufnahme und Wasseraktivitätskinetik ($a_w$):* Zunehmende Wasseraktivität beschleunigt enzymatische und chemische Bräunungsreaktionen und begünstigt Qualitätsverluste.

Bisherige Kontrollmechanismen basieren entweder auf subjektiver sensorischer Verkostung ("Cupping") oder auf zeit- und kostenintensiven chromatographischen Laboranalysen (HPLC-DAD, GC-MS). Diese Verfahren sind destruktiv, erfordern toxische Lösungsmittel und kosten zwischen $150$ und $300 thin "EUR"$ pro Messung. Eine engmaschige Überwachung in Kooperativen, Erzeugerzentren und Häfen ist damit wirtschaftlich unmöglich.

#callout(title: "Zentrale Forschungsfrage des Vorhabens")[
  *Wissenschaftliche Kernfrage:* Inwieweit können Deep-Learning- und physikalisch/chemisch informierte Modelle (PINNs mit integrierten Arrhenius-Abbaukinetiken) Veränderungen der Kaffeequalität aus kontinuierlichen ATR-FTIR-Spektren zuverlässig vorhersagen, und wie schneiden diese Modelle im systematischen Vergleich mit traditionellen Verfahren des Maschinellen Lernens (PLSR, SVR) hinsichtlich Vorhersagegenauigkeit, Generalisierungsfähigkeit und kausaler Interpretierbarkeit ab?
]

== 1.2 Botanische und biochemische Charakterisierung von *Coffea arabica*
Im Rahmen dieses Vorhabens werden die führenden kolumbianischen Varietäten untersucht: *Castillo*, *Caturra*, *Colombia* und *Geisha*. Das phytochemische Profil zeichnet sich durch definierte molekulare Marker aus:
- *Chlorogensäuren (CGA):* $6 - 9\%$ der Trockenmasse, dominiert von 5-Caffeoylchinasäure (5-CQA).
- *Lipidfraktion:* $12 - 17\%$, bestehend aus Diterpenestern und Acylglycerinen mit hohem Linolsäureanteil ($"C18:2"$).
- *Methylxanthine und Alkaloide:* Coffein ($1,0 - 1,4\%$), Trigonellin ($0,8 - 1,2\%$).
- *Kohlenhydrate:* Saccharose ($6 - 9\%$) sowie Polysaccharide (Galactomannane, Arabinogalactane).

== 1.3 Strategische Verankerung als Anschubprojekt und Skalierungs-Roadmap
Dieses Vorhaben ist bewusst als fokussiertes, agiles *Anschubfinanzierungs-Projekt* konzipiert. Um maximale wissenschaftliche Tiefe und methodische Rigorosität bei begrenzten Mitteln ($8.000 thin "EUR"$) zu gewährleisten, konzentriert sich die experimentelle Durchführung exklusiv auf die Agrarmatrix *Spezialitätenkaffee*. 

Die etablierte und validierte Methodik – die Kopplung von ATR-FTIR, nasschemischer Standardanalytik und Physik-informierten Algorithmen – bildet das methodische Fundament für den anschließenden 3-jährigen bilateralen Vollantrag im Programm *DFG-Minciencias Bilateral Research Grants*. In jenem Großprojekt wird das Framework auf drei weitere strategische kolumbianische Wertschöpfungsketten ausgeweitet: Edelkakao (*Theobroma cacao L.*), tropischer Bienenhonig (*Apis mellifera*) und natives Kokosöl (*Cocos nucifera*), ergänzt um hochauflösende chromatographische Metabolomik (HPLC-MS, GC-MS).

---

= 2. Molekulare Abbauprozesse, Kinetik und ATR-FTIR-Spektralsignaturen

== 2.1 Mathematische Formulierung der Abbaukinetik
Die qualitätsmindernden Abbaureaktionen im Kaffee folgen wohldefinierten Gesetzen der chemischen Kinetik. Das Forschungskonsortium modelliert diese Prozesse über Ratengleichungen $n$-ter Ordnung, deren Geschwindigkeitskonstanten $k(T)$ der Arrhenius-Beziehung gehorchen:

$ (d C_i(t)) / (d t) = - k_i(T) dot [C_i(t)]^(n_i) $

$ k_i(T) = A_i dot exp(- E_(a,i) / (R dot T)) $

wobei $C_i(t)$ die Konzentration der Zielkomponente $i$ (z. B. 5-CQA oder ungesättigte Lipide) zum Zeitpunkt $t$ darstellt, $n_i$ die scheinbare Reaktionsordnung (typischerweise $n=1$ für Chlorogensäureabbau und $n=0$ bzw. $n=1$ für primäre Lipidhydroperoxidbildung), $A_i$ der präexponentielle Frequenzfaktor ($"s"^(-1)$), $E_(a,i)$ die scheinbare Aktivierungsenergie ($"kJ/mol"$), $R = 8,314 thin "J" / ("mol" dot "K")$ die Gaskonstante und $T$ die absolute Temperatur in Kelvin ist.

== 2.2 Spektrale Fingerabdrücke im Mittleren Infrarot (ATR-FTIR)
Die Fourier-Transform-Infrarotspektroskopie mit Diamant-ATR erfasst das molekulare Schwingungsspektrum im Bereich von $4000 - 600 thin "cm"^(-1)$ zerstörungsfrei und ohne Probenvorbereitung. Die spezifischen Schwingungsbanden des Kaffees korrelieren direkt mit den chemischen Abbauvorgängen:

#table(
  columns: (1.2fr, 1.5fr, 2.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Wellenzahl ($"cm"^(-1)$)],
    [Molekulare Zuordnung],
    [Chemische Funktionsgruppe],
    [Kinetisches Verhalten während der Kaffeelagerung]
  ),
  [$3400 - 3250$],
  [$nu("O-H")$ Valenzschwingung],
  [Wasser ($a_w$) und Polyphenol-OH (5-CQA)],
  [Signalabfall bei Dehydratisierung; Bandenverbreiterung bei Feuchteaufnahme],
  [$3008$],
  [$nu(= "C-H")$ _cis_-Alken],
  [Ungesättigte Fettsäuren in Kaffeelipiden],
  [Kontinuierlicher Rückgang durch radikalische Lipidperoxidation],
  [$2925, 2854$],
  [$nu_("as"), nu_("s")("C-H") thin "CH"_2/"CH"_3$],
  [Aliphatische Ketten der Speicherlipide],
  [Thermostabile Referenzbanden zur Normalisierung],
  [$1745$],
  [$nu("C=O")$ Esterbande],
  [Triacylglycerine und Diterpenester (Cafestol)],
  [Bandenverbreiterung und Ausbildung einer Schulter bei $1715 thin "cm"^(-1)$],
  [$1715 - 1695$],
  [$nu("C=O")$ freie Carbonsäuren],
  [Freigesetzte Chinasäure und freie Fettsäuren],
  [Progressiver Intensitätsanstieg durch Hydrolyse ("Staling"-Indikator)],
  [$1650 - 1600$],
  [$nu("C=C")$ aromatisch / $nu("C=O")$],
  [Aromatischer Ring der Caffeinsäure-Motive],
  [Signalabfall durch oxidative Kondensation und Chinonbildung],
  [$1380 - 1150$],
  [$nu("C-O"), delta("O-H")$],
  [Esterbindungen der Chlorogensäuren],
  [Signifikanter Signalrückgang korreliert mit HPLC-Referenzwerten],
  [$1050 - 1030$],
  [$nu("C-O")$ Kohlenhydratschwingung],
  [Saccharose und Strukturpolysaccharide],
  [Langsamer Signalrückgang durch nicht-enzymatische Bräunungsreaktionen]
)

---

= 3. Standardisierte nasschemische Referenzanalytik (AOAC)

Zur Kalibrierung und Validierung der spektralen Machine-Learning-Modelle führt die Universidad de Cartagena normierte Standarduntersuchungen nach AOAC International durch:
1. *Titrierbare Gesamtsäure (AOAC 920.92):* Wässriger Extrakt von $10 thin "g"$ Kaffee in $100 thin "mL"$ Reinstwasser, potentiometrische Titration mit $0,1 thin "N NaOH"$ bis $p"H" 8,20$.
2. *Feuchtegehalt und Trocknungsverlust (AOAC 968.11 / ISO 6673):* Thermogravimetrische Bestimmung bei $105 thin degree"C"$ bis zur Gewichtskonstanz; Bestimmung der Wasseraktivität ($a_w$) mittels taupunktgestützter Spiegelsensorik.
3. *Peroxidzahl der Kaffeelipide (AOAC 965.33):* Kaltlösungsextraktion der Fettphase, iodometrische Titration mit Natriumthiosulfat ($"Na"_2"S"_2"O"_3$) gegen Stärkeindikator ($"meq" thin "O"_2/"kg Fett"$).
4. *Chlorogensäure-Äquivalente (Folin-Ciocalteu / UV-Vis nach AOAC 980.23):* Photometrische Quantifizierung bei $765 thin "nm"$ bzw. $325 thin "nm"$ gegen 5-CQA-Reinstoffstandards.

---

= 4. Wissenschaftlicher Stand, Forschungslücken und Literaturdiskussion

Die Kombination von Infrarotspektroskopie und Maschinellem Lernen in der Agrar- und Lebensmittelanalytik ist Gegenstand intensiver internationaler Forschung:
- *Traditionelle Chemometrie:* Spektroskopische Studien nutzen überwiegend Hauptkomponentenanalyse (PCA) und Partial Least Squares Regression (PLSR) zur Sorten- und Verfälschungsprüfung (@boadu2024developinganovel, @feng2021applicationofvisibleinfrared, @widiarto2026detectionofadulteration). Diese Verfahren behandeln Spektren als statische Vektoren und vernachlässigen zeitliche Kinetiken.
- *Convolutional Neural Networks:* Passos (@passos2605convolutionalneuralnetworks) wies nach, dass 1D-CNNs mit multiskalaren Faltungskernen Schwingungsbanden hochgradig selektiv erfassen können, mahnt jedoch vor Überanpassung an Rauschkomponenten bei begrenzten Stichprobengrößen.
- *Aufmerksamkeitsmechanismen:* Upadhyay & Chaudhary (@upadhyay2026enhancingspectralanalysis) zeigten anhand von Spektral-Transformern (Spectral Attention Mechanism, SAM), dass Selbstaufmerksamkeitskarten die Zuordnung spektraler Banden zu funktionellen chemischen Gruppen signifikant verbessern.
- *Effiziente Sequenzmodellierung:* Li et al. (@li2026asgmambaadaptivespectral) etablierten mit ASGMamba lineare State-Space-Modelle für multivariate Zeitreihen, die im Vergleich zu Transformern eine lineare Rechenkomplexität $cal(O)(L)$ aufweisen und sich ideal für zeitliche Degradationstrajektorien eignen.
- *Physik-informierte neuronale Netze:* Perré (@perre2025towardmechanisticmodels) demonstrierte die Regularisierung von PINNs für instationäre Transport- und Trocknungsvorgänge. Pronk & Anthony (@pronk2026neuralnetworkplacementin) zeigten anhand industrieller Kaffeeröstprozesse, dass die Platzierung von neuronalen Netzwerken als residuale Terme entscheidend ist, um physikalische Inkonsistenzen zu verhindern. Weiterhin betonen Felizzato et al. (@felizzato2025datafusionfor) und Grundy et al. (@grundy2025reviewofcurrent) die Notwendigkeit robuster Datenfusionsstrategien.

*Identifizierte Forschungslücke:* Bisher existiert kein systematischer Benchmark, der untersucht, ob und wie stark physikalisch regularisierte Deep-Learning-Architekturen die etablierte chemometrische Baseline (PLSR, SVR) bei realen FTIR-Zeitreihen kolumbianischen Kaffees übertreffen.

---

= 5. Exploratives Metamodell und 3-stufiger Architektur-Benchmark

Das Vorhaben realisiert einen rigorosen 3-Ebenen-Benchmark:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Benchmark-Ebene], [Architekturfamilie], [Spezifische Konfiguration und Rolle]),
  [Ebene 1: Baseline],
  [Klassische Chemometrie \ (Lineare & Kernel-ML)],
  [PLSR (5–12 latente Variablen), Support Vector Regression (SVR mit RBF-Kernel) und Random Forest auf vorverarbeiteten Spektren (SNV + Savitzky-Golay).],
  [Ebene 2: Deep Learning],
  [Empirisches Deep Learning \ (Datengetriebene Netze)],
  [1D-CNN mit multiskalaren Faltungskernen ($3, 7, 15, 31 thin "Gitterpunkte"$) und MLP-Prädiktionskopf; reines Fehlerminimum ohne physikalische Schranken.],
  [Ebene 3: PIML],
  [Physik-informiertes DL \ (PINN mit Kinetik-Verlust)],
  [Häufigkeitsregularisierte PINN-Architektur mit dualer Verlustfunktion $cal(L)_("ges") = cal(L)_("daten") + lambda cal(L)_("kinetik")$. Einbettung der Arrhenius-Geschwindigkeitsgesetze als Strafterme.],
  [Explorative Erweiterung],
  [Sequenzmodelle & SSM \ (LSTM / Mamba / Transformers / Neural ODEs)],
  [Modulare Evaluierung rekurrenter Netze (LSTM/GRU), moderner Mamba State-Space-Modelle (@li2026asgmambaadaptivespectral), Spectral Transformers mit Aufmerksamkeitsmatrizen (@upadhyay2026enhancingspectralanalysis) und kontinuierlicher Neural ODEs (NODE).]
)

== 5.1 Verlustfunktion der Physik-informierten Architektur (PINN)
Die PINN minimiert eine zusammengesetzte Verlustfunktion:

$ cal(L)_("ges") = underbrace(1/N sum_(i=1)^N (y_i - hat(y)_i)^2, cal(L)_("daten")) + lambda_1 underbrace(1/M sum_(j=1)^M ((d hat(C)_j)/(d t) + k(T) hat(C)_j)^2, cal(L)_("kinetik")) + lambda_2 underbrace(cal(R)_("monoton"), cal(L)_("physik")) $

Hierbei bestraft $cal(L)_("kinetik")$ Abweichungen von der Arrhenius-Geschwindigkeit, während $cal(L)_("physik")$ unphysikalische Konzentrationsanstiege der Chlorogensäuren unter Ausschluss von Reaktanten nach dem zweiten Hauptsatz der Thermodynamik unterdrückt.

== 5.2 Pareto-Optimierung und Edge-Deployment (Raspberry Pi)
Die Modellauswahl erfolgt über eine multikriterielle Pareto-Optimierung:
1. *Prädiktionsgüte:* RMSE und $R^2$ bei chargenweiser Kreuzvalidierung (*Leave-One-Batch-Out*).
2. *Kausale Bandenattribution:* Grad-CAM und SHAP-Attributionsanalyse zur Verifizierung der Schwingungsbanden ($1745, 1715, 1600 - 1650 thin "cm"^(-1)$).
3. *Edge-Inferenz:* Quantisierung (INT8/FP16) und Inferenzlatenz $< 2 thin "Sekunden"$ auf einem Single-Board-Computer (Raspberry Pi 4B/5) mit $< 500 thin "MB"$ RAM-Bedarf.

---

= 6. Kooperationskonzept, Arbeitsplan und Finanzkalkulation

== 6.1 Bilaterale Arbeitsteilung und Synergien
- *Technische Hochschule Deggendorf (DIT) — Prof. Dr. Isabel Suárez:* Leitung der mathematischen Modellierung, GPU-Trainingscluster, Implementierung von PINN, Mamba und XAI-Attribution, Durchführung des Workshops in Cartagena.
- *Universidad de Cartagena (UdC) — Prof. Dr. Ricardo Vivas:* Probenbeschaffung von Spezialitätenkaffee, Leitung der akzelerierten Lagerung (25 °C, 40 °C, 60 °C; 60% und 75% r.F.), ATR-FTIR-Spektrenakquise und normierte AOAC-Analytik.

== 6.2 Bilaterale Mobilitätsmaßnahmen und Nachwuchsförderung
1. *Misión 1 (DIT -> UdC, Monat 2, 10 Tage):* Forschungsaufenthalt von Prof. Dr. Isabel Suárez an der Universidad de Cartagena. Durchführung eines einwöchigen Präsenz-Workshops "Angewandte KI und Physik-informiertes Maschinelles Lernen für spektroskopische Agrardaten" für Masterstudierende, Promovierende und Dozierende der UdC; Standardisierung der FTIR-Messprotokolle im Labor von Prof. Vivas.
2. *Misión 2 (UdC -> DIT, Monat 8–9, 21 Tage):* Forschungsaufenthalt eines/einer Nachwuchswissenschaftlers/in der UdC am KI-Campus Deggendorf. Intensivtraining in PyTorch/JAX, Modelltraining auf GPU-Clustern, XAI-Interpretierbarkeit und Mitarbeit am DFG-Minciencias-Antrag.

== 6.3 Arbeitsplan und Meilensteine (12 Monate)
- *AP1 (Monate 1–4, UdC/DIT):* Versuchsaufbau, Kaffeebeschaffung, Workshop 1 in Cartagena mit Prof. Dr. Suárez (M2). *Meilenstein M1 (M4):* Standardisiertes Alterungsprotokoll und Pilotdaten etabliert.
- *AP2 (Monate 3–8, UdC):* Akzelerierte Alterung (180 Tage), kontinuierliche ATR-FTIR-Scans und AOAC-Analytik. *Meilenstein M2 (M8):* Vollständige Spektraldatenbank fertiggestellt.
- *AP3 (Monate 6–11, DIT/UdC):* 3-Ebenen-Benchmark (PLSR vs. 1D-CNN vs. PINN), Forschungsaufenthalt des UdC-Nachwuchswissenschaftlers am DIT (M8–9). *Meilenstein M3 (M9):* Pareto-optimale Architektur identifiziert.
- *AP4 (Monate 10–12, DIT/UdC):* Bilaterale Synthese, 2 Open-Access-Publikationen, Einreichung des DFG-Minciencias-Antrags. *Meilenstein M4 (M12):* Projektbericht und Vollantrag fertiggestellt.

== 6.4 Detaillierte Kostenkalkulation (Gesamtfördersumme: 8.000 €)
Die Mittelverwendung entspricht exakt den Richtlinien der BAYLAT-Anschubfinanzierung und der beigefügten Kalkulationstabelle (*06_Reiseverwaltung_Kostenkalkulation_Anschubfinanzierung.xlsx*):

#table(
  columns: (1.4fr, 0.9fr, 0.9fr, 0.8fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  align: (left, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header([Kategorie], [Misión 1 (DIT->UdC)], [Misión 2 (UdC->DIT)], [Gesamt], [Berechnungsgrundlage]),
  [Flugkosten (Hin/Rück)], [1.450 €], [1.500 €], [2.950 €], [Transatlantikflug München-Cartagena / Cartagena-München (Economy)],
  [Übernachtungskosten], [1.100 €], [1.155 €], [2.255 €], [10 Nächte à 110 € in Cartagena / 21 Nächte à 55 € in Gästehaus DIT],
  [Tagegelder (Verpflegung)], [500 €], [945 €], [1.445 €], [10 Tage à 50 € (Kolumbien) / 21 Tage à 45 € (Deutschland)],
  [Bewirtung / Workshop], [400 €], [-], [400 €], [Catering für den bilateralen KI-Workshop an der UdC],
  [Versicherungsschutz], [100 €], [100 €], [200 €], [Auslandskrankenversicherung (Max. 200 € laut BAYLAT-Richtlinie)],
  [Labormaterialien], [-], [-], [600 €], [Reagenzien und Standards für Kaffeelagerung (Max. 600 € laut BAYLAT)],
  [Sachausgaben digital], [-], [-], [150 €], [Zubehör für hybride Workshop-Übertragung und Kooperationsplattform],
  [*Gesamtsumme*], [*3.550 €*], [*3.700 €*], [*8.000 €*], [*Beantragtes Fördervolumen bei BAYLAT (Deckblatt & Belegliste, Förderhöchstsatz)*]
)

== 6.5 Ausblick auf die DFG-Minciencias-Anschlussförderung
Die in diesem Anschubprojekt validierten Modelle und Pilotdatensätze bilden die notwendige Voraussetzung für die erfolgreiche Einwerbung eines 3-jährigen Verbundprojekts im bilateralen Programm *DFG-Minciencias Bilateral Research Grants*. In der Ausbauphase wird das hybride PIML-Paradigma auf die Matrizen *Edelkakao*, *Bienenhonig* und *natives Kokosöl* transferiert und um hochauflösende chromatographische Metabolomik (LC-HRMS, Headspace-GC-MS) erweitert.

#bibliography("references.bib", title: [Literaturverzeichnis])
