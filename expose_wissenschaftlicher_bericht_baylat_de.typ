#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Physik-informierte neuronale Differentialgleichungen und multimodale Spektralsensorik zur autonomen Qualitäts- und Frischevorhersage von kolumbianischem Spezialitätenkaffee],
  subtitle: [Wissenschaftliches Exposé und Forschungsantrag – BAYLAT-Anschubfinanzierung (OASys 2026/2027)],
  objective: [
    Formulierung, Evaluierung und Validierung eines analytischen und rechnergestützten Rahmens zur Verknüpfung von Fourier-Transform-Infrarotspektroskopie mit abgeschwächter Totalreflexion (ATR-FTIR), normierten physikochemischen Referenzanalysen und Physik-informierten Deep-Learning-Modellen (PIML) für kolumbianischen Spezialitätenkaffee (*Coffea arabica*). Im Fokus steht die systematische Gegenüberstellung traditioneller chemometrischer Methoden (PLSR, SVR) mit tiefen neuronalen Netzen (1D-CNN) und durch kinetische Arrhenius-Abbaugesetze regulierten Modellen (PINN) unter realen tropischen Lagerbedingungen, ergänzt durch das explorative Screening moderner Sequenzmodelle (Mamba SSM, Spektral-Transformer) sowie die Stärkung der bilateralen Kooperation und wissenschaftlichen Nachwuchsförderung zwischen der Technischen Hochschule Deggendorf (DIT) und der Universidad de Cartagena (UdC).
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

= 1. Zusammenfassung

Das vorliegende bilaterale Forschungsvorhaben zwischen der Technischen Hochschule Deggendorf (DIT, Bayern) und der Universidad de Cartagena (UdC, Kolumbien) etabliert einen neuartigen analytischen und rechnergestützten Rahmen zur präzisen Vorhersage des phytochemischen Abbaus und des Frischeverlusts von kolumbianischem Spezialitätenkaffee (*Coffea arabica*). Mit einer 12-monatigen Anschubfinanzierung durch BAYLAT (7.350 €) adressiert das Projekt die qualitativen Veränderungen des Kaffees während der Nacherntelagerung in feucht-warmen tropischen Klimazonen sowie während des transatlantischen Seetransports nach Europa (20 bis 45 Tage Transitzeit), insbesondere zu bayerischen Zielmärkten. In diesen Phasen verändern radikalische Lipidperoxidation und die Hydrolyse von Chlorogensäuren die sensorischen und chemischen Eigenschaften des Rohkaffees maßgeblich.

Angesichts der zeitlichen Verzögerungen und hohen Kosten konventioneller chromatographischer Methoden sowie der Subjektivität rein organoleptischer Verkostungen verfolgt das Projekt einen integrierten methodischen Ansatz:
1. *Longitudinales Monitoring unter realen tropischen Lagerbedingungen* an der kolumbianischen Karibikküste mittels Fourier-Transform-Infrarotspektroskopie mit abgeschwächter Totalreflexion (ATR-FTIR) im mittleren Infrarotbereich, synchronisiert mit normierten physikochemischen Referenzanalysen (AOAC/ISO).
2. *Physik-informierte Deep-Learning-Modelle (PINN)*, die temperaturabhängige Abbaukinetiken nach Arrhenius explizit in die Verlustfunktion einbetten, um klassische lineare Chemometrie (PLSR) und empirische Netze (1D-CNN) zu übertreffen und den Vorhersagen physikochemische Kausalität und Interpretierbarkeit (XAI via Grad-CAM und SHAP) zu verleihen.

Die bilaterale Kooperation umfasst einen Präsenz-Workshop zur KI-Spektroskopie an der UdC in Cartagena sowie einen zweiwöchigen Forschungsaufenthalt eines kolumbianischen Nachwuchswissenschaftlers am KI-Campus Deggendorf und generiert die experimentelle Datenbasis für einen anschließenden Großantrag im bilateralen Förderprogramm DFG-Minciencias.

*Schlagwörter:* Spezialitätenkaffee, Coffea arabica, ATR-FTIR, Physik-informierte neuronale Netze (PINN), Abbaukinetik, Chemometrie.

---

= 2. Einleitung und Problemstellung

== 2.1 Sozioökonomischer Kontext und Bioökonomie des kolumbianischen Spezialitätenkaffees
Die Republik Kolumbien zählt weltweit zu den führenden Produzenten von gewaschenem Hochland-Arabica-Kaffee (*Coffea arabica*). Laut den offiziellen Berichten der Federación Nacional de Cafeteros de Colombia @fnc2023informecafetero bildet der Kaffeesektor das fundamentale sozioökonomische Rückgrat des ländlichen Raums: Mehr als 540.000 kleinbäuerliche Familienbetriebe in über 600 Gemeinden entlang der drei Andenkordilleren und isolierten Gebirgszügen wie der Sierra Nevada de Santa Marta erwirtschaften ihre Existenzgrundlage über den Kaffeeanbau. Mit einer jährlichen Ernte von 12 bis 14 Millionen Sack Rohkaffee (à 60 kg) generiert der Sektor Exporterlöse zwischen 3.000 und 4.000 Millionen USD und stellt das bedeutendste nicht-fossile Exportgut der kolumbianischen Volkswirtschaft dar @fnc2023informecafetero.

Innerhalb dieses Sektors gewinnt das Segment des Spezialitätenkaffees (*Specialty Coffee*), definiert durch die Standards der Specialty Coffee Association @sca2020specialtycoffee, eine herausragende ökonomische Bedeutung. Die SCA definiert Spezialitätenkaffee als rückverfolgbare Rohkaffeelose, die bei standardisierter Verkostung eine Bewertung von mindestens 85 von 100 Punkten erzielen. Diese Kaffees, charakterisiert durch differenzierte florale und fruchtige Aromen sowie komplexe Säureprofile, erzielen auf europäischen Märkten erhebliche Preisprämien. Der Freistaat Bayern und die Bundesrepublik Deutschland bilden einen der weltweit anspruchsvollsten Märkte für Herkunftskaffees hoher Qualität, in dem Röstmanufakturen und Konsumenten höchste Anforderungen an die Qualitätskonstanz stellen @sca2020specialtycoffee.

== 2.2 Reale tropische Lagerbedingungen und transatlantischer Seetransport
Die Bewahrung des sensorischen Profils und der chemischen Frische von Rohkaffee (*green coffee*) hängt unmittelbar von den Umgebungsbedingungen entlang der gesamten Nacherntekette ab. In Kolumbien erfolgt die Zwischenlagerung auf Fincas, in Genossenschaften und in Hafenlagerhäusern der Karibikküste (z. B. in Cartagena de Indias oder Santa Marta) unter feucht-warmen Bedingungen mit Tagestemperaturen zwischen 25 °C und 38 °C sowie relativen Luftfeuchtigkeiten zwischen 60% und 85% r.F.

Während des anschließenden transatlantischen Seetransports nach Europa (typische Transitzeiten von 20 bis 45 Tagen) sind die Frachtcontainer erheblichen tageszeitlichen Temperaturschwankungen und Kondensationszyklen ausgesetzt. Diese Bedingungen beschleunigen chemische Veraltungsprozesse (*staling*), das Verblassen der Bohnenfarbe und den Abbau von Aromavorstufen, was zu einer irreversiblen Minderung des SCA-Cupping-Scores führen kann.

== 2.3 Phytochemische Abbaupfade und molekulare Qualitätsmarker
Auf molekularer Ebene beruht der Qualitätsverlust von *Coffea arabica* während der Lagerung auf drei dominierenden phytochemischen Reaktionspfaden:

1. *Hydrolyse und Isomerisierung von Chlorogensäuren (CGA):* Chlorogensäuren machen 6% bis 9% der Trockenmasse von Arabica-Kaffee aus und umfassen Caffeoylchinasäure-Ester (5-CQA, 3-CQA, 4-CQA), Dicaffeoylchinasäuren und Feruloylchinasäuren @farah2012coffeeconstituents. 5-CQA stellt den Hauptbestandteil dar und bestimmt maßgeblich die feine Säurestruktur sowie das antioxidative Potenzial des Kaffees. Unter erhöhten Lagertemperaturen und Feuchtigkeitseinwirkung unterliegen die Esterbindungen einer fortschreitenden Hydrolyse, wodurch freie Chinasäure und Kaffeesäure freigesetzt werden oder bittere Chinide entstehen @farah2012coffeeconstituents. Dies verändert das Säuregleichgewicht, erhöht die titrierbare Gesamtsäure nach AOAC 920.92 @aoac92092 und führt zu adstringierenden Geschmacksfehlern.

2. *Radikalische Autoxidation der Lipidfraktion:* Die Speicherlipide umfassen 12% bis 17% der Bohnen-Trockenmasse und bestehen primär aus Triacylglycerinen mit hohem Linolsäureanteil ($"C18:2"$) sowie Diterpenestern (Cafestol und Kahweol). Unter Einwirkung von Luftsauerstoff und Temperatur unterliegen ungesättigte Fettsäuren radikalischen Peroxidationsreaktionen @buffo2004coffeevolatiles. Die dabei gebildeten primären Hydroperoxide, quantifizierbar über die Peroxidzahl nach AOAC 965.33 @aoac96533, zerfallen sekundär zu niedermolekularen flüchtigen Aldehyden (Hexanal, trans-2-Nonenal, Octanal), die für holzige, ranzige Fehlnoten (*baggy*) verantwortlich sind @buffo2004coffeevolatiles.

3. *Hygroskopische Dynamik und Wasseraktivität ($a_w$):* Nach der Trocknung wird Rohkaffee standardmäßig mit einer Feuchte von 10% bis 12% gelagert (AOAC 968.11 @aoac96811, ISO 6673 @iso6673), was einer Gleichgewichts-Wasseraktivität ($a_w$) von 0,50 bis 0,60 entspricht. Bei hoher relativer Luftfeuchtigkeit ($> 70\%$) und Temperaturen über 25 °C nimmt das hygroskopische Korn Wasserdampf aus der Atmosphäre auf. Ein Anstieg der Wasseraktivität über $a_w > 0,65$ erhöht die molekulare Beweglichkeit in der Zellmatrix, begünstigt Hydrolyse- und Bräunungsreaktionen und steigert das Risiko von Schimmelbildung, wodurch die Lagerfähigkeit drastisch sinkt.

== 2.4 Limitationen konventioneller Analytik und Potenziale der ATR-FTIR-Spektroskopie
Die Qualitätskontrolle während Lagerung und Transport stößt mit gegenwärtigen Verfahren an methodische Grenzen:
- Die *sensorische Verkostung (SCA Cupping)* @sca2020specialtycoffee ist eine qualitative, subjektive Prüfung durch trainierte Prüfer. Sie erkennt Mängel erst retrospektiv, wenn geschmackliche Defekte bereits eingetreten sind, liefert jedoch keine quantitative Vorhersage der verbleibenden Haltbarkeit.
- *Klassische chromatographische Analysen* (HPLC-DAD, GC-MS) bieten zwar hohe chemische Selektivität, sind jedoch destruktiv, zeitaufwendig und verursachen Kosten von 150 bis 300 USD pro Probe, was eine engmaschige Überwachung in Kooperativen und Exporthäfen ausschließt.

Demgegenüber stellt die *Fourier-Transform-Infrarotspektroskopie mit abgeschwächter Totalreflexion (ATR-FTIR)* im mittleren Infrarotbereich ($4000 - 600 thin "cm"^(-1)$) eine schnelle, zerstörungsfreie und kostengünstige Alternative dar @manzocco2020shelf. Sie liefert innerhalb von Minuten einen molekularen Schwingungsfingerabdruck der gemahlenen Kaffeeprobe ohne aufwendige Probenvorbereitung. Das Spektrum erfasst simultan funktionelle Gruppen: die Ester-Carbonylschwingung $nu("C=O")$ bei $1745 thin "cm"^(-1)$ und die Säureschulter bei $1715 thin "cm"^(-1)$, die olefinische $nu(= "C-H")$-_cis_-Bande bei $3008 thin "cm"^(-1)$, phenolische und Wasser-OH-Schwingungen bei $3400 - 3250 thin "cm"^(-1)$ sowie Chlorogensäure-Esterbanden bei $1380 - 1150 thin "cm"^(-1)$. Aufgrund von Bandenüberlagerungen und Streueffekten sind jedoch präzise kalibrierte mathematische Modelle erforderlich, um kinetische Kausalitäten verlässlich zu extrahieren @manzocco2020shelf.

---

= 3. Wissenschaftliche Fragestellung und Forschungsziele

== 3.1 Zentrale wissenschaftliche Forschungsfrage
#callout(title: "Zentrale Forschungsfrage")[
  *Wissenschaftliche Kernfrage:* Inwieweit können Physik-informierte Deep-Learning-Modelle (PINN), durch die explizite Integration von Differentialgleichungen erster Reaktionsordnung gekoppelt mit der thermischen Arrhenius-Abhängigkeit für Chlorogensäurehydrolyse und Lipidperoxidation, traditionelle chemometrische Verfahren (PLSR, SVR) und empirische neuronale Netze (1D-CNN) in Vorhersagegenauigkeit ($R^2$, RMSE, MAPE), Generalisierungsfähigkeit gegenüber ungesehenen Kaffeelosen (*out-of-distribution*) und physikochemischer Interpretierbarkeit auf Basis von ATR-FTIR-Spektren aus realen tropischen Lagerbedingungen übertreffen?
]

== 3.2 Gesamtziel des Vorhabens
Entwicklung und experimentelle Validierung eines zerstörungsfreien analytischen und rechnergestützten Rahmens auf Basis von MIR-ATR-FTIR-Spektroskopie, normierten Referenzanalysen (AOAC/ISO) und Physik-informiertem Deep Learning (PINN) zur quantitativen Bestimmung molekularer Marker und zur Vorhersage der Degradationskinetik und des Frischeverlusts von kolumbianischem Spezialitätenkaffee (*Coffea arabica*) unter tropischen Klimabedingungen.

== 3.3 Spezifische Ziele des Vorhabens
1. *Alineiert mit WP1 (Versuchsaufbau, Probenlogistik und Workshop in Cartagena):* Standardisierung des longitudinalen Versuchsplans und des analytischen Protokolls zur schnellen ATR-FTIR-Spektrenakquise an Spezialitätenkaffee (*Coffea arabica* der Varietäten *Castillo*, *Caturra*, *Colombia* und *Geisha*), inklusive instrumenteller Kalibrierung und Durchführung eines bilateralen Präsenz-Workshops zu Angewandter KI in der Spektroskopie an der Universidad de Cartagena durch die Projektleiterin der DIT.
2. *Alineiert mit WP2 (Longitudinales Monitoring unter tropischen Bedingungen und AOAC/ISO-Analytik):* Durchführung des systematischen kinetischen Monitorings über 180 Tage Lagerung unter realen tropischen Umweltbedingungen der kolumbianischen Karibik und Aufbau einer multimodalen Datenbank, die periodische FTIR-Spektren mit normierten Referenzwerten verknüpft: titrierbare Gesamtsäure (@aoac92092), Feuchte und Wasseraktivität (@aoac96811, @iso6673), Lipidperoxidzahl (@aoac96533) und Chlorogensäuren / 5-CQA.
3. *Alineiert mit WP3 (Data Science, Deggendorf-Aufenthalt und 3-Ebenen-Benchmark):* Formulierung, Kalibrierung und vergleichende Evaluierung im Rahmen eines 3-Stufen-Benchmarks – klassische Chemometrie (PLSR, SVR), empirisches Deep Learning (1D-CNN) und Physik-informierte neuronale Netze (PINN mit Arrhenius-Kinetik) – während des zweiwöchigen Forschungsaufenthalts des UdC-Nachwuchswissenschaftlers am KI-Campus der TH Deggendorf, mit Validierung der spektralen Kausalität mittels XAI (Grad-CAM 1D und SHAP).

---

= 4. Theoretischer Rahmen und Stand der Forschung

== 4.1 Phytochemie von Coffea arabica und molekulare Abbaubiomarker
Das Endosperm des Kaffeesamens (*Coffea arabica*) stellt ein komplexes biologisches System dar, dessen phytochemische Zusammensetzung die sensorische Qualität bestimmt (@farah2012coffeeconstituents):
- *Chlorogensäuren (CGA):* Machen 6% bis 9% der Trockenmasse des Rohkaffees aus. Es handelt sich um Ester aus trans-Zimtsäuren (Kaffeesäure, Ferulasäure) und Chinasäure. 5-Caffeoylchinasäure (5-CQA) repräsentiert 70% bis 80% der Gesamtpolyphenole, begleitet von 3-CQA, 4-CQA, Dicaffeoylchinasäuren (di-CQA, 1,5–2,5%) und Feruloylchinasäuren (FQA, 0,8–1,4%). Sie fungieren als Antioxidantien, steuern die Säurefrische und sind essenzielle Aromavorstufen bei der Röstung.
- *Lipidfraktion und Diterpene:* Umfasst 12% bis 17% der Trockenmasse, lokalisiert in intrazellulären Lipidtropfen. Sie besteht zu 75–80% aus Triacylglycerinen mit hohem Anteil an Linolsäure ($"C18:2"$, 40–46%) und Ölsäure ($"C18:1"$, 8–12%) sowie Palmitinsäure ($"C16:0"$, 30–35%). Im unverseifbaren Anteil (15–20%) dominieren die Kaffeediterpene Cafestol und Kahweol, die taxonomische Indikatoren für Arabica-Kaffee sind.
- *Alkaloide:* Coffein (1,0–1,4% w/w) weist hohe thermische und oxidative Stabilität auf; Trigonellin (0,8–1,2% w/w) dient als Osmolyt und ist thermolabile Vorstufe von Pyridinen und Pyrazinen.
- *Kohlenhydrate und Proteine:* Saccharose (6–9% w/w) ist das dominante freie Kohlenhydrat. Strukturpolysaccharide (45–50%) bestehen aus Galactomannanen und Arabinogalactanen. Proteine (10–13%) umfassen Speicherproteine (11S-Globuline) und freie Aminosäuren.

Während der Lagerung unter tropischen Bedingungen treten zwei chemische Hauptreaktionen auf (@buffo2004coffeevolatiles, @ribeiro2011chemicalchanges):
1. *Hydrolyse von Chlorogensäure-Estern:* Durch Feuchtigkeit und Wärme hydrolysieren die Esterbindungen zu freier Chinasäure und Kaffeesäure, was den pH-Wert senkt und die titrierbare Gesamtsäure mit adstringierenden Geschmacksnoten ansteigen lässt.
2. *Lipidperoxidation:* Die Bis-Allyl-Methylengruppen der Linolsäure ($-"CH"="CH"-"CH"_2-"CH"="CH"-$, niedrige C-H-Bindungsenergie) reagieren mit Sauerstoff zu Hydroperoxiden (ROOH; messbar über AOAC 965.33), die sekundär zu flüchtigen Aldehyden (Hexanal, Nonanal, trans-2-Nonenal) spalten und holzige Ranzigkeit erzeugen.

== 4.2 Abbaukinetik und Arrhenius-Thermodynamik unter dynamischen Umgebungsbedingungen
Die zeitliche Konzentrationsänderung qualitätsrelevanter Biomarker folgt differentiellen Reaktionsgleichungen $n$-ter Ordnung (@manzocco2020shelf). Für abnehmende Substrate (z. B. 5-CQA, intakte Diterpenester):

$ (d C_i(t)) / (d t) = - k_i(T(t), a_w(t)) dot [C_i(t)]^(n_i) $

Für sich bildende Abbauprodukte (Lipidhydroperoxide, freie Chinasäure):

$ (d P_j(t)) / (d t) = + k_j(T(t), a_w(t)) dot [C_i(t)]^(m_j) $

wobei $C_i(t)$ und $P_j(t)$ die Konzentrationen darstellen, $n_i$ und $m_j$ die Reaktionsordnungen sind ($n=1$ für CGA-Hydrolyse; $n=0$ bis $1$ für primäre Peroxidation) und $k_i$ die Geschwindigkeitskonstante ist.

Die Temperaturabhängigkeit von $k_i$ wird durch die Arrhenius-Beziehung beschrieben:

$ k_i(T) = A_i dot exp(- E_(a,i) / (R dot T)) $

mit dem Frequenzfaktor $A_i$ ($"s"^(-1)$), der scheinbaren Aktivierungsenergie $E_(a,i)$ ($60 - 110 thin "kJ/mol"$ für trockene Matrizen), der Gaskonstante $R = 8,314 thin "J/(mol" dot "K)"$ und der absoluten Temperatur $T$ in Kelvin.

Die Wasseraktivität ($a_w = p / p_0$) fungiert als thermodynamischer Reaktionsmodulator. Nach Gordon-Taylor plastifiziert Wasser die amorphe Biopolymer-Matrix. Unterhalb von $a_w < 0,50$ befindet sich das Endosperm im glasartigen Zustand (*glassy state*), in dem die ultrahohe Viskosität ($eta > 10^(12) thin "Pa" dot "s"$) die Diffusion von Sauerstoff und Reaktanten stark hemmt. Steigt $a_w >= 0,60 - 0,70$ an, sinkt die Glasübergangstemperatur unter die Lagertemperatur ($T > T_g$), und der Übergang in den gummiartigen Zustand (*rubbery state*) beschleunigt Diffusion und Kinetik:

$ k_i(t) = A_i(a_w(t)) dot exp(- E_(a,i) / (R dot T(t))) $

== 4.3 Physikalische Grundlagen der ATR-FTIR-Schwingungsspektroskopie
Die Fourier-Transform-Infrarotspektroskopie im Bereich $4000 - 600 thin "cm"^(-1)$ ($lambda = 2,5 - 16,7 thin mu"m"$) basiert auf der resonanten Absorption von IR-Photonen durch molekulare Schwingungen mit periodischer Dipolmomentänderung ($partial bold(mu) / partial q != 0$).

Bei der Diamant-ATR-Technik trifft die IR-Strahlung unter dem Winkel $theta = 45 degree$ auf die Grenzfläche eines Kristalls mit hohem Brechungsindex ($n_1 approx 2,42$), der in mechanischem Kontakt mit der Kaffeeprobe steht ($n_2 approx 1,40 - 1,50$). Da $theta > theta_c = arcsin(n_2 / n_1) approx 38,2 degree$, tritt Totalreflexion auf, wobei eine evaneszente Welle in die Probe eindringt:

$ E(z) = E_0 dot exp(- z / d_p) $

Die Eindringtiefe $d_p$ folgt aus den Maxwell-Fresnel-Gleichungen:

$ d_p(tilde(nu)) = 1 / (2 pi tilde(nu) n_1 sqrt(sin^2(theta) - (n_2 / n_1)^2)) $

und beträgt zwischen $0,65 thin mu"m"$ ($4000 thin "cm"^(-1)$) und $4,2 thin mu"m"$ ($600 thin "cm"^(-1)$). Die Absorption gehorcht dem modifizierten Lambert-Beer-Gesetz:

$ A(tilde(nu)) = - log_(10) (R(tilde(nu)) / R_0(tilde(nu))) = sum_i epsilon_i(tilde(nu)) dot b_("eff")(tilde(nu)) dot C_i $

#table(
  columns: (1.1fr, 1.4fr, 2.1fr, 3.0fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Wellenzahl ($"cm"^(-1)$)],
    [Schwingungsmodus],
    [Funktionelle Gruppe und Zuordnung],
    [Kinetische Entwicklung während der Tropenlagerung]
  ),
  [$3400 - 3250$],
  [Valenz $nu("O-H")$],
  [Adsorbiertes Wasser ($a_w$) und freie Phenole (CGA)],
  [Bandenverbreiterung und Verschiebung durch hygroskopische Wasseraufnahme.],
  [$3008$],
  [Valenz $nu(= "C-H")$ _cis_],
  [Olefinische Doppelbindungen in TAG (Linolsäure, Ölsäure)],
  [Signalabfall durch radikalische Lipidoxidation zu konjugierten Dienen.],
  [$2925, 2854$],
  [Valenz $nu_("as"), nu_("s")("C-H")$],
  [Aliphatische Methylen- ($-"CH"_2-$) und Methylgruppen ($-"CH"_3$)],
  [Thermostabile Lipidbanden; genutzt als interne Referenz zur SNV-Normalisierung.],
  [$1745$],
  [Valenz $nu("C=O")$ Ester],
  [Triglyceride und Diterpenester (Cafestol, Kahweol)],
  [Rückgang der Peakintensität und Ausbildung einer Schulter bei $1715 thin "cm"^(-1)$ durch Hydrolyse.],
  [$1715 - 1695$],
  [Valenz $nu("C=O")$ Carboxyl],
  [Freie Fettsäuren und freigesetzte Chinasäure],
  [Monotoner Anstieg korreliert mit Frischeverlust; Biomarker für "Staling".],
  [$1650 - 1600$],
  [Valenz $nu("C=C")$ aromatisch],
  [Benzolring der Hydroxyzimtsäuren und Amid I],
  [Signalabnahme durch oxidative Kondensation von Diphenolen.],
  [$1380 - 1150$],
  [$nu("C-O")$, $delta("O-H")$],
  [Esterbindungen der Chlorogensäuren (5-CQA)],
  [Reproduzierbare Signalabnahme korreliert mit HPLC/Folin-Referenzwerten.],
  [$1050 - 1030$],
  [Valenz $nu("C-O")$ pyranosidisch],
  [Saccharose und Strukturpolysaccharide (Galactomannane)],
  [Langsamer Rückgang durch beginnende Maillard-Reaktionen.]
)

== 4.4 Stand der Forschung: Von klassischer Chemometrie zu Physik-informierter KI
In der spektroskopischen Lebensmittelanalytik dominieren traditionell multivariate chemometrische Verfahren (@boadu2024developinganovel, @feng2021applicationofvisibleinfrared, @widiarto2026detectionofadulteration). Hauptkomponentenanalyse (PCA), Partial Least Squares Regression (PLSR) und Support Vector Regression (SVR) werden verbreitet zur Sortenidentifikation und Verfälschungserkennung eingesetzt. Für ein dynamisches Monitoring weisen sie jedoch drei strukturelle Defizite auf:
1. *Atemporalität:* Jedes Spektrum wird als isolierter Punkt ohne zeitliche Korrelation behandelt.
2. *Linearitätsannahme:* Komplexe optische Nichtlinearitäten können nicht adäquat entkoppelt werden.
3. *Physikalischer Agnostizismus:* Modelle extrapolieren unzuverlässig bei ungesehenen Temperatur- und Feuchteverläufen.

Eindimensionale Faltungsnetze (1D-CNN) können Spektralbanden hochgradig selektiv erfassen (@passos2605convolutionalneuralnetworks). Wie Passos jedoch betont, neigen rein datengetriebene Netze bei begrenzten Stichproben zu Überanpassung und physikalisch inkonsistenten Vorhersagen (z. B. negative Abbauraten oder spontane Zunahme von 5-CQA).

Physik-informierte neuronale Netze (PINN) integrieren mechanistische Differentialgleichungen direkt in das Netzwerk-Training (@perre2025towardmechanisticmodels). Perré zeigte, dass physikalische Strafterme Überanpassung verhindern und exzellente Generalisierung sichern. Pronk & Anthony (@pronk2026neuralnetworkplacementin) wiesen für Kaffeeröstprozesse nach, dass physikalisch konditionierte Netze rein empirischen Architekturen überlegen sind. Zudem belegen Upadhyay & Chaudhary (@upadhyay2026enhancingspectralanalysis) den Nutzen von Spektral-Transformern mit Aufmerksamkeitsmechanismen (SAM) zur chemischen Bandenidentifikation, während Li et al. (@li2026asgmambaadaptivespectral) mit ASGMamba zeigten, dass State-Space-Modelle (SSM) zeitliche Dynamiken mit linearer Komplexität $cal(O)(L)$ erfassen. Felizzato et al. (@felizzato2025datafusionfor) und Grundy et al. (@grundy2025reviewofcurrent) unterstreichen schließlich die Notwendigkeit robuster Datenfusionsstrategien.

Das Projekt implementiert einen strukturierten 3-Stufen-Benchmark mit explorativer Erweiterung:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Benchmark-Stufe], [Modellfamilie], [Konfiguration und Rolle im Projekt]),
  [Stufe 1: Baseline],
  [Klassische Chemometrie \ (Linear & Kernel)],
  [PLSR (5–12 latente Variablen) und SVR (RBF-Kernel) auf SNV- und Savitzky-Golay-vorverarbeiteten Spektren.],
  [Stufe 2: Deep Learning],
  [Empirisches Deep Learning \ (Datengetriebene Netze)],
  [1D-CNN mit multiskalaren Kernen ($3, 7, 15, 31$), BatchNorm und GELU; Training rein über MSE-Verlust.],
  [Stufe 3: PIML],
  [Physik-informiertes DL \ (PINN mit Arrhenius-Verlust)],
  [Neuronales Netz mit dualer Verlustfunktion: Datenverlust plus kinetischer Arrhenius-Strafterm und Monotonie-Schranken.],
  [Explorative Erweiterung],
  [Sequenzmodelle & SSM \ (LSTM / Mamba / Transformer / NODE)],
  [Screening von LSTM/GRU, ASGMamba State-Space-Modellen (@li2026asgmambaadaptivespectral), Spektral-Transformern (@upadhyay2026enhancingspectralanalysis) und kontinuierlichen Neural ODEs.]
)

---

= 5. Forschungsmethodik und Versuchsdesign

== 5.1 Experimentelle Phase und Beprobung im tropischen Klima

=== 5.1.1 Arabica-Kaffeevarietäten und Herkunftszertifizierung
Untersucht werden vier führende kolumbianische Varietäten von *Coffea arabica*: *Castillo*, *Caturra*, *Colombia* und *Geisha*. Die Partien stammen von kontrollierten Hochland-Fincas der Departements Huila, Nariño, Tolima und Cauca ($1.500 - 2.000 thin "m ü. d. M."$).

Die Aufbereitung erfolgt homogen über das traditionelle Nassverfahren (Entpulpen, 18–24 h Fermentation, Waschen mit Quellwasser, Trocknung auf 10,5–11,5% Feuchte). Vor Versuchsbeginn wird jedes Los durch drei zertifizierte Q-Grader nach SCA-Standard bewertet (@sca2020specialtycoffee). Nur Partien mit $>= 85,0 thin "SCA-Punkten"$ ohne sensorische Defekte werden in die Studie aufgenommen.

=== 5.1.2 Lagerungsregime unter realen tropischen Umweltbedingungen
Die Lagerung erfolgt in den Speichereinrichtungen der Universidad de Cartagena an der kolumbianischen Karibikküste (Hauptausfuhrhafen für Kaffee nach Europa). Die Rohkaffeeproben lagern in passiv belüfteten Räumen unter natürlichen tropischen Klimabedingungen ohne Klimatisierung: tageszyklische Temperaturschwankungen zwischen $26 thin degree"C"$ und $36 thin degree"C"$ bei relativen Luftfeuchtigkeiten von $70\%$ bis $90\%$, was die realen Nacherntelager- und Vorverschiffungsbedingungen exakt widerspiegelt.

=== 5.1.3 Kontinuierliches Monitoring mit multiparametrischen Datalogger-Netzwerken
Die Erfassung der Mikroklimadaten erfolgt im 15-Minuten-Takt über kalibrierte digitale Datalogger ($plus.minus 0,3 thin degree"C"$, $plus.minus 2,0\%$ r.F.):
1. *Umgebungstemperatur ($T$):* in Grad Celsius und Kelvin.
2. *Relative Luftfeuchte ($"r.F."$):* in Prozent.
3. *Taupunkttemperatur ($T_("dew")$):* zur Detektion von Oberflächen-Kondensationsrisiken.

=== 5.1.4 Prospektives longitudinales Design und periodisches Beprobungsprotokoll
Das Design umfasst eine 6-monatige Lagerung (180 Tage) mit 8 Beprobungszeitpunkten: $t_0 = 0$, $t_1 = 15$, $t_2 = 30$, $t_3 = 60$, $t_4 = 90$, $t_5 = 120$, $t_6 = 150$ und $t_7 = 180$ Tage.

Zu jedem Termin werden $500 thin "g"$ pro Varietät entnommen und in 3 unabhängigen Replikaten analysiert ($4 thin "Varietäten" times 8 thin "Termine" times 3 thin "Replikate" = 96 thin "Mischproben"$). Zur Vermeidung thermischer Artefakte erfolgt die Mahlung gekühlt bei 4 °C (ASTM Nr. 35, $< 0,50 thin "mm"$).

#table(
  columns: (1.1fr, 1.2fr, 0.9fr, 1.3fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Varietät (*Coffea arabica*)],
    [Herkunft und Höhenlage],
    [Initialer SCA-Score],
    [Lagerungsbedingungen],
    [Beprobungsdesign]
  ),
  [Castillo], [Huila ($1.650 thin "m ü. d. M."$)], [86,5 Punkte], [Cartagena (Real tropisch: $26-36 thin degree"C"$, $70-90\%$ r.F.)], [8 Termine ($0 - 180$ Tage) $times$ 3 Replikate],
  [Caturra], [Nariño ($1.900 thin "m ü. d. M."$)], [87,0 Punkte], [Cartagena (Real tropisch: $26-36 thin degree"C"$, $70-90\%$ r.F.)], [8 Termine ($0 - 180$ Tage) $times$ 3 Replikate],
  [Colombia], [Tolima ($1.550 thin "m ü. d. M."$)], [85,5 Punkte], [Cartagena (Real tropisch: $26-36 thin degree"C"$, $70-90\%$ r.F.)], [8 Termine ($0 - 180$ Tage) $times$ 3 Replikate],
  [Geisha], [Cauca ($1.850 thin "m ü. d. M."$)], [89,0 Punkte], [Cartagena (Real tropisch: $26-36 thin degree"C"$, $70-90\%$ r.F.)], [8 Termine ($0 - 180$ Tage) $times$ 3 Replikate]
)

---

== 5.2 Normierte physikochemische Referenzanalytik und ATR-FTIR-Spektrenakquise

=== 5.2.1 Analytische Referenzbatterie nach offiziellen Standards (*Ground Truth*)
An der Universidad de Cartagena werden vier normierte Referenzanalysen im Triplikat durchgeführt:
1. *Titrierbare Gesamtsäure (AOAC 920.92):* Wässriger Heißextrakt ($10,00 thin "g"$ in $100 thin "mL"$ entgastem Reinstwasser, 15 min bei 90 °C, @aoac92092). Potentiometrische Titration mit standardisierter $0,100 thin "N NaOH"$-Lösung bis zum Endpunkt von $p"H" 8,20 plus.minus 0,02$. Angabe in $"meq NaOH"/100 thin "g"$ Trockenmasse.
2. *Feuchtegehalt und Wasseraktivität ($a_w$) (AOAC 968.11, ISO 6673):* Thermogravimetrische Bestimmung bei $105 plus.minus 1 thin degree"C"$ bis zur Gewichtskonstanz (@aoac96811, @iso6673). Parallele Messung von $a_w$ bei $25,00 plus.minus 0,05 thin degree"C"$ mit einem Taupunkt-Spiegelhygrometer (Genauigkeit $plus.minus 0,003 thin a_w$).
3. *Peroxidzahl der Kaffeelipide (AOAC 965.33):* Kaltextraktion der Lipide mit $n$-Hexan/Petrolether ($1:1 thin v/v$) im Dunkeln bei 4 °C (@aoac96533). Lösung in Eisessig:Chloroform ($3:2 thin v/v$), Zugabe von gesättigter $"KI"$-Lösung und iodometrische Titration mit $0,010 thin "N Na"_2"S"_2"O"_3$ gegen Stärkeindikator ($"meq" thin "O"_2 / "kg Fett"$).
4. *Polyphenole, 5-CQA und thermische Marker (AOAC 980.23 / Folin-Ciocalteu):* Ultraschall-unterstützte Extraktion mit Methanol:Wasser ($70:30 thin v/v$). Photometrische Bestimmung bei $765 thin "nm"$ (Folin-Ciocalteu) kalibriert gegen 5-CQA-Standard ($>= 98,5\%$). UV-Scan bei $325 thin "nm"$ zur Bestimmung freier Ester und 5-HMF nach AOAC 980.23.

=== 5.2.2 Protokoll der MIR-ATR-FTIR-Spektrenakquise
Die Spektrenakquise erfolgt auf einem FTIR-Spektrometer mit Diamant-ATR-Einheit:
- *Spektralbereich:* $4000 - 600 thin "cm"^(-1)$.
- *Optische Auflösung:* $4 thin "cm"^(-1)$ ($3528$ Datenpunkte pro Spektrum nach Mertz-Phasenkorrektur und Happ-Genzel-Apodisation).
- *Scanzahl:* $64$ akkumulierte Scans pro Spektrum ($"SNR" > 50.000:1$).
- *Replikation:* Triplikate pro Mischprobe bei konstantem Anpressdruck von $80 plus.minus 2 thin "N"$.
- *Hintergrundkorrektur:* Neuer Luft-Hintergrundscan vor jeder Probe zur $"CO"_2$- und $"H"_2"O"$-Kompensation; optische Reinigung mit Ethanol/Isopropanol (Transmission $> 99,5\%$).

#table(
  columns: (1.2fr, 1.4fr, 1.5fr, 1.9fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Analysenparameter], [Norm / Protokoll], [Instrumentelles Prinzip], [Kinetische Relevanz und Bereich]),
  [Titrierbare Gesamtsäure], [AOAC 920.92 (@aoac92092)], [Potentiometrische Titration mit $0,1 thin "N NaOH"$ bis $p"H" 8,20$], [CGA-Spaltung zu freier Chinasäure ($1,5 - 4,0 thin "meq/100 g"$)],
  [Restfeuchte], [AOAC 968.11 (@aoac96811), ISO 6673 (@iso6673)], [Thermogravimetrische Trocknung bei $105 thin degree"C"$], [Hygroskopische Feuchteaufnahme im Tropenklima ($9,5 - 13,0\%$)],
  [Wasseraktivität ($a_w$)], [Taupunktspiegel-Sensor], [Taupunkthygrometrie bei $25 thin degree"C"$], [Mobilität von Wasser; Schimmel- und Maillard-Risiko ($0,50 - 0,72 thin a_w$)],
  [Peroxidzahl], [AOAC 965.33 (@aoac96533)], [Kaltextraktion und iodometrische Titration], [Primäre Lipidoxidation ungesättigter Fettsäuren ($0,8 - 15,0 thin "meq" thin "O"_2/"kg"$)],
  [Polyphenole & 5-CQA], [AOAC 980.23 / Folin], [UV-Vis-Spektrophotometrie ($765 thin "nm"$ und $325 thin "nm"$)], [Kinetischer Abbau von Chlorogensäure-Antioxidantien ($35 - 75 thin "mg/g"$)],
  [Schwingungsspektrum], [Diamant-ATR-FTIR], [Mittlere Infrarotabsorption ($4000 - 600 thin "cm"^(-1)$)], [Zerstörungsfreier Schwingungs-Fingerabdruck molekularer Bindungen]
)

---

== 5.3 Data-Science-Pipeline, Modellierung und rigorose Kreuzvalidierung

=== 5.3.1 Vorverarbeitung der Infrarot-Spektralsignaturen
Zur Bereinigung optischer Streueffekte (*multiplicative scatter*) und Basisliniendrifts durchlaufen die Rohspektren folgende Vorverarbeitungspipeline in Python (`scikit-learn`, `SciPy`):
1. *Standard Normal Variate (SNV):* Zentrierung und Skalierung jedes Spektrums $bold(x)$ über seine Standardabweichung zur Elimination partikelgrößenbedingter Pfadlängenschwankungen:
   $ x_(i,"SNV") = (x_i - macron(x)) / s_x $
2. *Asymmetric Least Squares Smoothing (ALS):* Basislinienkorrektur mit Asymmetriefaktor $p = 0,001$ und Glättungsparameter $lambda = 10^5$.
3. *Savitzky-Golay-Filterung (SG):* Polynom 2. Grades mit 15 Glättungspunkten ($Delta nu approx 14 thin "cm"^(-1)$). Evaluierung der 1. Ableitung zur Beseitigung additiver Drifts und der 2. Ableitung zur Peak-Auflösung in Carbonyl- ($1745 thin "cm"^(-1)$), Carboxyl- ($1715 thin "cm"^(-1)$) und Olefinregionen ($3008 thin "cm"^(-1)$).

=== 5.3.2 Faktorieller 3-Stufen-Benchmark und rechnerische Architekturen
- *Stufe 1: Klassische Chemometrie (Lineare und Kernel-Modelle)*
  - *PLSR:* Zerlegung der Spektrenmatrix $bold(X)$ und Referenzmatrix $bold(Y)$ in 1 bis 15 latente Variablen via SIMPLS; Auswahl über den minimalen RMSECV.
  - *SVR:* Quadratische Optimierung mit RBF-Kernel ($K(bold(x), bold(x)') = exp(- gamma ||bold(x) - bold(x)'||^2)$); Hyperparameteroptimierung von $C$, $gamma$ und $epsilon$ über Bayes'sche Suche.
- *Stufe 2: Empirisches Deep Learning (1D-CNN Multiskala)*
  - Vier parallele Faltungszweige mit Kernelgrößen $k in {3, 7, 15, 31}$ nach dem Inception-Prinzip (@passos2605convolutionalneuralnetworks), gefolgt von BatchNorm, GELU-Aktivierung, 1D-MaxPooling und Dropout ($p = 0,25$).
  - MLP-Regressionskopf (128 und 64 Neuronen mit $L_2$-Regularisierung), trainiert mit AdamW rein auf mittleren quadratischen Datenfehler ($cal(L)_("daten") = "MSE"$).
- *Stufe 3: Physik-informiertes Deep Learning (PINN mit Arrhenius-Kinetik)*
  - Einbettung kinetischer Differentialgleichungen in das Training (@perre2025towardmechanisticmodels, @pronk2026neuralnetworkplacementin) über eine zusammengesetzte Verlustfunktion:
    $ cal(L)_("total") = cal(L)_("daten") + lambda_1 cal(L)_("kinetik") + lambda_2 cal(L)_("monotonie") $
    wobei:
    $ cal(L)_("daten") = 1/N sum_(i=1)^N (y_i - hat(y)_i)^2 $
    $ cal(L)_("kinetik") = 1/M sum_(j=1)^M ((d hat(C)_j)/(d t) + k(T_j) dot [hat(C)_j]^(n))^2, quad k(T_j) = A_0 dot exp(- E_a / (R dot T_j(t))) $
    $ cal(L)_("monotonie") = 1/M sum_(j=1)^(M-1) "max"(0, hat(C)_(j+1) - hat(C)_j) $
    Hierbei berechnet PyTorch *Autograd* die Ableitung $d hat(C)_j / d t$ analytisch; GradNorm balanciert $lambda_1$ und $lambda_2$ dynamisch.
- *Explorative Erweiterung:*
  - Screening rekurrenter Netze (LSTM/GRU), Mamba State-Space-Modellen (*ASGMamba* @li2026asgmambaadaptivespectral), Spektral-Transformern mit Self-Attention (*SAM* @upadhyay2026enhancingspectralanalysis) und kontinuierlichen neuronalen Differentialgleichungen (*Neural ODEs* - NODE).

=== 5.3.3 Rigoroses chargenweises Kreuzvalidierungsprotokoll (*Leave-One-Batch-Out*)
Zur Vermeidung von Datenlecks (*data leakage*) schließt das Protokoll die Zufallsteilung (*Random Split*) strikt aus. Die Validierung erfolgt als *GroupKFold* / *Leave-One-Batch-Out* (LOBO): Sämtliche Spektren und Replikate eines kompletten Loses bzw. einer Varietät aus einem Departement werden als Testset isoliert, sodass ausschließlich die Generalisierbarkeit auf ungesehene Partien und Ursprünge evaluiert wird.

=== 5.3.4 Quantitative statistische Performanzmetriken
1. *Bestimmtheitsmaß ($R^2$):* Berechnet für Kalibrierung ($R_("cal")^2$), Kreuzvalidierung ($R_("cv")^2$) und externe Vorhersage ($R_("pred")^2$):
   $ R^2 = 1 - (sum_(i=1)^N (y_i - hat(y)_i)^2) / (sum_(i=1)^N (y_i - macron(y))^2) $
2. *Root Mean Square Error of Prediction ($"RMSEP"$):*
   $ "RMSEP" = sqrt(1/N_("test") sum_(i=1)^(N_("test")) (y_i - hat(y)_i)^2) $
3. *Residual Predictive Deviation ($"RPD"$):*
   $ "RPD" = "SD"_("referenz") / "RMSEP" $
   Grenzwerte: $< 1,5$ (ungenügend); $1,5 - 2,0$ (qualitatives Screening); $2,0 - 2,5$ (gute Vorhersage); $>= 2,5$ (exzellente quantitative Genauigkeit).
4. *Mean Absolute Percentage Error ($"MAPE"$):*
   $ "MAPE" = 100\% / N_("test") sum_(i=1)^(N_("test")) |(y_i - hat(y)_i) / y_i| $

=== 5.3.5 Erklärbare spektrale Interpretierbarkeit (XAI) und physikochemische Kausalitätsvalidierung
Zur Sicherstellung der Kausalität integriert die Pipeline zwei XAI-Methoden:
1. *SHAP (SHapley Additive exPlanations):* Berechnung der Shapley-Werte $phi_j$ zur Quantifizierung des Beitrags jeder Wellenzahl $nu_j$.
2. *Grad-CAM 1D:* Rückprojektion der Gradienten auf die letzte Faltungsschicht zur Erzeugung von Relevanzprofilen:
   $ alpha_k = 1/L sum_(l=1)^L (partial hat(y)) / (partial A_l^k), quad L_("Grad-CAM")^("1D")(nu) = "ReLU"(sum_k alpha_k A^k(nu)) $

*Kausalitätskriterium:*
Die Salienzpeaks müssen zwingend mit den chemischen Zuordnungen übereinstimmen:
- *Peroxidzahl:* Schwerpunkte bei $3008 thin "cm"^(-1)$ (Verlust von _cis_-Doppelbindungen), $1745 thin "cm"^(-1)$ ($nu("C=O")$ Ester) und Schulter bei $1715 thin "cm"^(-1)$.
- *Titrierbare Gesamtsäure:* Schwerpunkte bei $1715 - 1695 thin "cm"^(-1)$ (freie Carboxyle) und $1250 - 1150 thin "cm"^(-1)$ ($nu("C-O")$).
- *Polyphenole / 5-CQA:* Schwerpunkte bei $1650 - 1600 thin "cm"^(-1)$ (Caffeoyl-Aromaten) und $1380 - 1150 thin "cm"^(-1)$ (Esterbanden).
- *Feuchte / $a_w$:* Konzentration im breiten OH-Band bei $3400 - 3250 thin "cm"^(-1)$.

Modelle mit hohen statistischen Werten, deren Aktivierung jedoch auf inaktiven Regionen oder atmosphärischen Artefakten beruht, werden als physikalisch inkonsistent verworfen.

---

= 6. Arbeitsplan, Meilensteine und Arbeitspakete (AP1 bis AP4) über 12 Monate

== 6.1 Detaillierte Aktivitätenübersicht nach Arbeitspaketen

=== AP1: Versuchsaufbau, Probenlogistik, Standardisierung und Workshop in Cartagena (Monate 1–4)
- *Federführung:* Universidad de Cartagena (UdC) unter aktiver Mitwirkung der TH Deggendorf (DIT).
- *Leitung:* Prof. Dr. Ricardo Vivas (UdC) und Prof. Dr. Isabel Suárez (DIT).
- *Aktivität 1.1 (Monat 1):* Beschaffung zertifizierter Spezialitätenkaffee-Chargen (*Castillo*, *Caturra*, *Colombia*, *Geisha*) mit SCA-Score $>= 85$.
- *Aktivität 1.2 (Monate 1–2):* Vorbereitung der Lagerung in Cartagena unter realen tropischen Bedingungen ($26 - 36 thin degree"C"$, $70 - 90\%$ r.F.); Installation und Kalibrierung der multiparametrischen Datalogger.
- *Aktivität 1.3 (Monate 1–2):* Metrologische Kalibrierung des ATR-FTIR-Spektrometers und Standardisierung der Messprotokolle (64 Scans, $4 thin "cm"^(-1)$ Auflösung, Triplikate).
- *Aktivität 1.4 (Monat 2): Misión 1 — Senior-Aufenthalt DIT und bilateraler Workshop in Cartagena:* 10-tägiger Aufenthalt von Prof. Dr. Isabel Suárez an der UdC. Durchführung des einwöchigen Präsenz-Workshops *"Angewandte KI und physikochemische Modellierung in der Agrarspektroskopie"* für Forschende, Dozierende und Nachwuchskräfte der UdC. Harmonisierung der Datenübertragung.
- *Aktivität 1.5 (Monate 3–4):* Etablierung des Pilot-Datensatzes und Validierung der spektralen Signalstabilität.
#callout(title: "Meilenstein M1 (Monat 4)")[
  *Standardisiertes Mess- und Lagerungsprotokoll etabliert, Datalogger und ATR-FTIR-Systeme kalibriert, Misión 1 erfolgreich durchgeführt und Pilotdatenbank validiert.*
]

=== AP2: Longitudinales Monitoring unter tropischen Bedingungen und AOAC/ISO-Analytik (Monate 3–8)
- *Federführung:* Universidad de Cartagena (UdC) mit Remote-Unterstützung der DIT.
- *Leitung:* Prof. Dr. Ricardo Vivas (UdC).
- *Aktivität 2.1 (Monate 3–8):* Durchführung der 180-tägigen Tropenlagerung mit 8 periodischen Beprobungsschritten ($t_0$ bis $t_7$).
- *Aktivität 2.2 (Monate 3–8):* Systematische ATR-FTIR-Spektrenakquise im Triplikat zur Verfolgung von Lipidoxidation ($1745 thin "cm"^(-1)$), Säurebildung ($1715 thin "cm"^(-1)$) und Polyphenolabbau ($1600 - 1650 thin "cm"^(-1)$).
- *Aktivität 2.3 (Monate 3–8):* Durchführung der normierten nasschemischen Referenzanalytik (AOAC 920.92, AOAC 968.11 / ISO 6673, AOAC 965.33, AOAC 980.23 / Folin).
- *Aktivität 2.4 (Monate 6–8):* Spektrale Vorverarbeitung (SNV, ALS, Savitzky-Golay), Qualitätskontrolle und Aufbau der relationalen Datenbank $X in RR^(N times P)$ und $Y in RR^(N times K)$.
#callout(title: "Meilenstein M2 (Monat 8)")[
  *Vollständige, qualitätsgeprüfte longitudinale Spektral- und Referenzdatenbank fertiggestellt und für das Modelltraining freigegeben.*
]

=== AP3: Data Science, GPU-Training und bilateraler Forschungsaufenthalt in Deggendorf (Monate 6–11)
- *Federführung:* Technische Hochschule Deggendorf (DIT) in Kooperation mit der UdC.
- *Leitung:* Prof. Dr. Isabel Suárez (DIT) unter Einbindung des kolumbianischen Nachwuchswissenschaftlers.
- *Aktivität 3.1 (Monate 6–8):* Implementierung des 3-Stufen-Benchmarks (PLSR/SVR, 1D-CNN, PINN mit Arrhenius-Verlustfunktion in PyTorch) sowie exploratives Screening von Mamba SSM und Neural ODEs.
- *Aktivität 3.2 (Monate 7–9):* Verteiltes Training auf GPU-Clustern am KI-Campus Deggendorf mit Bayes'scher Hyperparameteroptimierung.
- *Aktivität 3.3 (Monate 8–9): Misión 2 — Forschungsaufenthalt eines UdC-Nachwuchswissenschaftlers am DIT:* Zweiwöchiger Forschungsaufenthalt (exakt 14 Tage / 14 Nächte) in Deggendorf. Intensivtraining in PIML, XAI-Methoden (Grad-CAM, SHAP) und Ausarbeitung des DFG-Minciencias-Antrags.
- *Aktivität 3.4 (Monate 9–11):* Chargenweise Kreuzvalidierung (*Leave-One-Batch-Out*) und XAI-Attributionsanalyse.
#callout(title: "Meilenstein M3 (Monat 9)")[
  *Optimale hybride Modellarchitektur identifiziert und validiert (hohe Genauigkeit, physikochemische Konsistenz via XAI) und Misión 2 erfolgreich abgeschlossen.*
]

=== AP4: Bilaterale Synthese, Q1-Publikationen, Abschlussbericht und DFG-Antrag (Monate 10–12)
- *Federführung:* Gemeinsames Konsortium DIT – UdC (Ko-Leitung: Prof. Suárez und Prof. Vivas).
- *Aktivität 4.1 (Monate 10–11):* Bilateraler Synthese-Workshop zur Integration der chemischen und algorithmischen Ergebnisse.
- *Aktivität 4.2 (Monate 10–12):* Erstellung und Einreichung zweier gemeinsamer Open-Access-Publikationen in führenden Q1-Fachzeitschriften (*Food Chemistry* und *Computers and Electronics in Agriculture*).
- *Aktivität 4.3 (Monate 11–12):* Finalisierung des wissenschaftlichen und administrativen Verwendungsnachweises für BAYLAT.
- *Aktivität 4.4 (Monate 11–12):* Ausarbeitung und Einreichung des 3-jährigen DFG-Minciencias-Verbundantrags zur Skalierung auf weitere Agrarmatrizen.
#callout(title: "Meilenstein M4 (Monat 12)")[
  *BAYLAT-Abschlussbericht vorgelegt, zwei Q1-Manuskripte eingereicht und DFG-Minciencias-Vollantrag formal eingereicht.*
]

== 6.2 Monatlicher Terminplan und Meilenstein-Matrix

#table(
  columns: (0.9fr, 2.5fr, 0.7fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else if row in (1, 6, 11, 16) { rgb("#fbfcfd") } else { none },
  align: (left, left, center, center, center, center, center, center, center, center, center, center, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Paket], [Aktivität], [Leitung],
    [M1], [M2], [M3], [M4], [M5], [M6], [M7], [M8], [M9], [M10], [M11], [M12],
    [Meilenstein]
  ),
  table.cell(rowspan: 5)[*AP1:* Setup & Misión 1],
  [1.1 Probenbeschaffung und SCA-Cupping], [UdC], [x], [], [], [], [], [], [], [], [], [], [], [], [],
  [1.2 Lagerungsaufbau und Datalogger], [UdC], [x], [x], [], [], [], [], [], [], [], [], [], [], [],
  [1.3 ATR-FTIR-Standardisierung], [UdC], [x], [x], [], [], [], [], [], [], [], [], [], [], [],
  [1.4 *Misión 1: KI-Workshop Cartagena*], [DIT], [], [x], [], [], [], [], [], [], [], [], [], [], [*M1 in Monat 2*],
  [1.5 Pilotversuche und Datenvalidierung], [UdC/DIT], [], [], [x], [x], [], [], [], [], [], [], [], [], [*H1 (Monat 4)*],
  table.cell(rowspan: 4)[*AP2:* Monitoring & Analytik],
  [2.1 Tropenlagerung (180 Tage)], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.2 Kontinuierliche ATR-FTIR-Scans], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.3 AOAC-Analytik (Feuchte, IP, CGA)], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.4 Datenvorverarbeitung und Kuration], [UdC/DIT], [], [], [], [], [], [x], [x], [x], [], [], [], [], [*H2 (Monat 8)*],
  table.cell(rowspan: 4)[*AP3:* Modellierung & Misión 2],
  [3.1 3-Ebenen-Benchmark (PLSR/CNN/PINN)], [DIT], [], [], [], [], [], [x], [x], [x], [], [], [], [], [],
  [3.2 GPU-Training und Hyperparameter], [DIT], [], [], [], [], [], [], [x], [x], [x], [], [], [], [],
  [3.3 *Misión 2: Forschungsaufenthalt DIT*], [UdC], [], [], [], [], [], [], [], [x], [x], [], [], [], [*M2 in Monat 8–9*],
  [3.4 Leave-One-Batch & XAI-Validierung], [DIT/UdC], [], [], [], [], [], [], [], [], [x], [x], [x], [], [*H3 (Monat 9)*],
  table.cell(rowspan: 4)[*AP4:* Synthese & DFG],
  [4.1 Bilaterale Ergebnissynthese], [DIT/UdC], [], [], [], [], [], [], [], [], [], [x], [x], [], [],
  [4.2 Erstellung von 2 Q1-Publikationen], [DIT/UdC], [], [], [], [], [], [], [], [], [], [x], [x], [x], [],
  [4.3 Finalisierung BAYLAT-Abschlussbericht], [DIT/UdC], [], [], [], [], [], [], [], [], [], [], [x], [x], [],
  [4.4 Einreichung DFG-Minciencias-Antrag], [DIT/UdC], [], [], [], [], [], [], [], [], [], [], [x], [x], [*H4 (Monat 12)*]
)

---

= 7. Bilaterale Kooperation, Mobilitätsplan und BAYLAT-Budget

== 7.1 Wissenschaftliche und institutionelle Synergie (UdC – DIT)
Die bilaterale Kooperation basiert auf einer exzellenten disziplinären Komplementarität zwischen Bayern und Kolumbien:
- *Universidad de Cartagena (UdC, Kolumbien) — Chemisch-experimentelle Expertise:* Die Gruppe von Prof. Dr. Ricardo Vivas (Fakultät für Naturwissenschaften) besitzt ausgewiesene Führungskompetenz in phytochemischer Analytik tropischer Naturstoffe, Kaffeematrizen und normierter Lebensmittelchemie (AOAC/ISO). Sie verfügt über moderne FTIR-Spektrometer, nasschemische Labore, direkte Verbindungen zu Erzeugergenossenschaften und die logistische Infrastruktur für reale Tropenlagerungsstudien.
- *Technische Hochschule Deggendorf (DIT, Deutschland) — Angewandte KI und Supercomputing:* Der KI-Campus unter Leitung von Prof. Dr. Isabel Suárez bringt Spitzenkompetenz in maschinellem Lernen, Physik-informierten neuronalen Architekturen (PINN), Sequenzmodellen (Mamba SSM) und erklärbarer KI (XAI) ein, unterstützt durch moderne GPU-Rechencluster.

Diese Synergie schließt die Lücke zwischen empirischer Datenerhebung in den Erzeugerländern und hochentwickelter algorithmischer Modellierung in Bayern.

== 7.2 Transatlantischer Mobilitätsplan und Nachwuchsförderung
Das Mobilitätskonzept gliedert sich in zwei gezielte Präsenzmissionen:

=== Misión 1: Senior-Wissenschaftlerin DIT nach Cartagena (10 Tage, Monat 2)
- *Teilnehmerin:* Prof. Dr. Isabel Suárez (Projektleiterin DIT).
- *Reiseroute:* München (MUC) – Cartagena (CTG) – München (MUC); 10 Tage / 10 Nächte in Monat 2.
- *Arbeitsprogramm:*
  1. Durchführung des einwöchigen Intensiv-Workshops *"Angewandte KI und physikochemische Modellierung in der Agrarspektroskopie"* für Forschende, Dozierende und Nachwuchskräfte der UdC.
  2. Begutachtung der Labore und Kalibrierung der Mess- und Datalogger-Systeme.
  3. Harmonisierung der Datenstrukturen und Cloud-Schnittstellen für den Transfer nach Deggendorf.

=== Misión 2: Nachwuchswissenschaftler UdC an die TH Deggendorf (Exakt 2 Wochen / 14 Tage / 14 Nächte, Monate 8–9)
- *Teilnehmer:* Ein/e qualifizierte/r Nachwuchswissenschaftler/in (Doktorand/in oder Master-Forscher/in) aus der Gruppe von Prof. Dr. Ricardo Vivas (UdC).
- *Reiseroute:* Cartagena (CTG) – München (MUC) – Deggendorf; exakt 14 Tage und 14 Nächte zwischen Monat 8 und 9.
- *Arbeitsprogramm:*
  1. Intensives Modelltraining auf den GPU-Clustern des KI-Campus unter Anleitung von Prof. Suárez (PyTorch, JAX, Arrhenius-Verlustfunktionen).
  2. Durchführung des 3-Stufen-Benchmarks auf dem konsolidierten Gesamtdatensatz und Berechnung von Grad-CAM- und SHAP-Attributionskarten.
  3. Mitarbeit an der Strukturierung der Arbeitspakete für den DFG-Minciencias-Vollantrag.

== 7.3 Konsolidiertes Budget der BAYLAT-Kooperation
Die Budgetkalkulation orientiert sich streng an den Richtlinien der BAYLAT-Anschubfinanzierung und schöpft den maximalen Förderrahmen von 8.000 € mit einer Beantragung von 7.350 € verantwortungsbewusst aus:

- *Flugkosten (Economy-Tarif mit Frühbuchung):*
  - Misión 1 (Prof. Dr. Isabel Suárez: MUC – CTG – MUC): 1.450 €.
  - Misión 2 (Nachwuchskraft UdC: CTG – MUC – CTG): 1.500 €.
  - Zwischensumme Flüge: 2.950 €.
- *Übernachtungskosten:*
  - Misión 1: 10 Nächte in Cartagena à 110 €/Nacht = 1.100 €.
  - Misión 2: 14 Nächte in Deggendorf (DIT-Gästehaus) à 55 €/Nacht = 770 €.
  - Zwischensumme Übernachtung: 1.870 €.
- *Tagegelder (Verpflegungspauschalen nach BayRKG / DAAD):*
  - Misión 1: 10 Tage in Kolumbien à 50 €/Tag = 500 €.
  - Misión 2: 14 Tage in Deutschland à 45 €/Tag = 630 €.
  - Zwischensumme Tagegelder: 1.130 €.
- *Auslandskrankenversicherung (Höchstsatz 100 € pro Person):*
  - Misión 1: 100 €.
  - Misión 2: 100 €.
  - Zwischensumme Versicherung: 200 €.
- *Veranstaltungskosten Workshop in Cartagena:*
  - Tagungsunterlagen, Catering und Raumlogistik: 450 €.
- *Zwischensumme Mobilität und Präsenzworkshop:*
  - Misión 1 (DIT -> UdC): 1.450 € + 1.100 € + 500 € + 100 € + 450 € = *3.600 €*.
  - Misión 2 (UdC -> DIT, 14 Tage): 1.500 € + 770 € + 630 € + 100 € = *3.000 €*.
  - Zwischensumme Mobilität: *6.600 €*.
- *Labormaterialien (Kaffeeanalytik):*
  - Reagenzien und 5-CQA-Reinstoffstandards für kinetische Referenzreihen: *600 €* (Maximalansatz nach BAYLAT-Richtlinien).
- *Digitale Medien und Konferenztechnik:*
  - Zubehör für hybride Workshop-Übertragung und Kollaborationslizenzen: *150 €*.
- *Gesamtfördersumme:*
  $3.600 thin "€" + 3.000 thin "€" + 600 thin "€" + 150 thin "€" = bold(7.350 thin "€")$ (unterhalb des Förderhöchstsatzes von 8.000 €).

#table(
  columns: (1.5fr, 0.9fr, 0.9fr, 0.8fr, 0.8fr, 2.1fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else if row == 8 { rgb("#eef5fb") } else { none },
  align: (left, center, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Kostenkategorie],
    [Misión 1 \ (DIT -> UdC)],
    [Misión 2 \ (UdC -> DIT)],
    [Sonstige \ Ausgaben],
    [Gesamt (€)],
    [Berechnungsgrundlage und Begründung]
  ),
  [Flugkosten (Hin- und Rückflug)], [1.450 €], [1.500 €], [-], [2.950 €], [Transatlantikflüge MUC-CTG und CTG-MUC in Economy Class],
  [Übernachtungskosten], [1.100 €], [770 €], [-], [1.870 €], [10 Nächte à 110 € (Cartagena) / 14 Nächte à 55 € (DIT-Gästehaus)],
  [Tagegelder (Verpflegung)], [500 €], [630 €], [-], [1.130 €], [10 Tage à 50 € (Kolumbien) / 14 Tage à 45 € (Deutschland) gem. BayRKG],
  [Auslandskrankenversicherung], [100 €], [100 €], [-], [200 €], [Internationale Reisekrankenversicherung (max. 100 € pro Person)],
  [Workshop-Organisation UdC], [450 €], [-], [-], [450 €], [Lehrmaterialien, audiovisuelle Technik und Tagungsbewirtung],
  [Verbrauchsmaterial Labor], [-], [-], [600 €], [600 €], [Chemikalien, Standards für CGA-Analytik (BAYLAT-Höchstsatz: 600 €)],
  [Digitale Medien / Lizenzen], [-], [-], [150 €], [150 €], [Hardware für Hybrid-Streaming des Workshops und Datentransfer],
  [*Gesamtsumme*], [*3.600 €*], [*3.000 €*], [*750 €*], [*7.350 €*], [*Beantragtes Fördervolumen bei BAYLAT (unter Höchstsatz 8.000 €)*]
)

---

= 8. Strategische Perspektive: Skalierung auf die bilaterale DFG-Minciencias-Ausschreibung

== 8.1 Roadmap für den gemeinsamen DFG-Minciencias-Vollantrag (36 Monate)
Die BAYLAT-Anschubfinanzierung dient als gezielter Katalysator zur methodischen Risikominimierung (*De-Risking*). Große Förderinstitutionen wie die Deutsche Forschungsgemeinschaft (DFG) und das kolumbianische Wissenschaftsministerium (*Minciencias*) setzen für bilaterale Verbundanträge nachweisbare Kooperationserfahrung, harmonisierte Messprotokolle und belastbare Pilotdaten voraus.

In den Monaten 11 und 12 wird das bayerisch-kolumbianische Team einen dreijährigen Vollantrag (*DFG-Minciencias Bilateral Research Grants*) einreichen. Zentrale Säulen des Großprojekts sind:
1. *Erweitertes Konsortium:* Etablierung einer binationalen Nachwuchsgruppe mit institutionalisierter Co-Betreuung von Promotionen (*Cotutelle de Thèse*) zwischen der DIT und kolumbianischen Promotionsprogrammen.
2. *Dreijähriges Fördervolumen:* Beantragung von ca. 350.000 € bei der DFG (Personalmittel in Bayern, GPU-Rechenzeit, LC-HRMS-Analytik) und adäquater Gegenfinanzierung bei Minciencias (Feldarbeit, Laborausstattung an der UdC).
3. *Strategische Einreichung:* Einreichung im regulären bilateralen DFG-Minciencias-Fenster in Monat 12 zur nahtlosen Fortführung der Forschungsarbeiten.

== 8.2 Skalierung auf strategische Agrarmatrizen der kolumbianischen Biodiversität
Das im Anschubprojekt an Spezialitätenkaffee (*Coffea arabica*) validierte PIML-Paradigma wird im Folgeantrag auf drei weitere strategische Wertschöpfungsketten Kolumbiens übertragen:

1. *Edelkakao (*Theobroma cacao L.*):*
   Kolumbien ist international anerkannter Produzent von Edelkakao (*Fino de Aroma*), einer Schlüsselkultur für die ländliche Friedenskonsolidierung. Modelliert werden die Lipidoxidation der Kakaobutter und der thermische Abbau von Flavanolen (Epicatechin, Procyanidine) während der Lagerung von Bohnen und Kakaomasse.
2. *Handwerklicher Bienenhonig (*Apis mellifera*):*
   Naturprodukt aus Trockenwald- und Andenökosystemen. Das Framework modelliert die Akkumulation von 5-Hydroxymethylfurfural (5-HMF nach AOAC 980.23), die thermische Inaktivierung von Enzymen (Diastase, Invertase) und hygroskopische Gärungsrisiken.
3. *Natives Kokosöl (*Cocos nucifera*):*
   Bioökonomisches Leitprodukt pazifischer und karibischer Küstengemeinschaften. Das Modell adressiert hydrolytische Lipolyse und Peroxidbildung zur Bewahrung mittelkettiger Fettsäuren (Laurinsäure C12:0).

#table(
  columns: (1.3fr, 1.3fr, 1.8fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  align: (left, left, left, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Agrarmatrix],
    [Botanische Spezies],
    [Kritische molekulare Marker],
    [Normierte Referenzanalytik]
  ),
  [Gewaschener Spezialitätenkaffee],
  [*Coffea arabica*],
  [5-CQA-Abbau, Lipidperoxidation und freie Chinasäure],
  [AOAC 965.33, AOAC 920.92, AOAC 968.11, ISO 6673],
  [Edelkakao (Fino de Aroma)],
  [*Theobroma cacao*],
  [Epicatechin-Oxidation, Kakaobutter-Lipolyse, Methylxanthine],
  [Folin-Ciocalteu UV-Vis, Säurezahl, AOAC 965.33],
  [Handwerklicher Bienenhonig],
  [*Apis mellifera*],
  [5-HMF-Bildung, Diastaseaktivität, Reduktionszucker],
  [AOAC 980.23 UV-Vis-Photometrie, elektrische Leitfähigkeit],
  [Natives Kokosöl],
  [*Cocos nucifera*],
  [Hydrolyse von Triacylglycerinen (Laurinsäure) und Peroxide],
  [AOAC 965.33 Peroxidzahl, freie Fettsäuren, konjugierte Diene]
)

== 8.3 Integration fortgeschrittener chromatographischer Metabolomik (LC-HRMS und GC-MS)
Während das BAYLAT-Anschubprojekt auf schneller, kostengünstiger ATR-FTIR-Spektroskopie basiert, integriert die DFG-Minciencias-Phase hochauflösende Chromatographie zur Strukturaufklärung:
- *Untargeted Metabolomics via LC-HRMS (Q-TOF / Orbitrap):* Zur Identifikation von Spurenabbaustoffen, konjugierten Polyphenolen und fortgeschrittenen Oxidationsprodukten in allen vier Matrizen.
- *Flüchtige Aromaprofile via HS-SPME-GC-MS:* Erfassung flüchtiger Pyrazine, Terpene sowie früher Ranzigkeitsmarker (Hexanal, Nonanal, Octen-3-ol).
- *Mehrebenen-Datenfusion und mechanistische Verankerung:* Chromatographische Daten dienen der exakten Parametrisierung der PINN-Terme und verknüpfen IR-Banden über Low-, Mid- und High-Level-Datenfusion (@felizzato2025datafusionfor) mit Reinsubstanzen.

---

#bibliography("references.bib", title: [Literaturverzeichnis])
