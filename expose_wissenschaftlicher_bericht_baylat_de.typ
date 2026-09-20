#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Physik-informierte neuronale Differentialgleichungen und multimodale Spektralsensorik zur autonomen Qualitäts- und Frischevorhersage kolumbianischer Agrarmatrizen],
  subtitle: [Wissenschaftliches Exposé und Forschungsantrag – BAYLAT-Anschubfinanzierung (OASys 2026)],
  objective: [
    Entwicklung, Validierung und vergleichende Evaluation eines neuartigen, hybriden Deep-Learning-Frameworks, welches Fourier-Transform-Infrarotspektroskopie mit abgeschwächter Totalreflexion (ATR-FTIR) und physikalisch-chemische Regularisierungsmechanismen (Physics-Informed Neural Networks und Neural Ordinary Differential Equations) synergetisch verknüpft, um die zeitabhängige Abbaukinetik hochrelevanter kolumbianischer Agrarmatrizen (Kakao, Kaffee, Honig und natives Kokosöl) unter tropischen Alterungs- und Transitbedingungen echtzeitfähig und ressourceneffizient vorherzusagen.
  ],
  authors: ("Technische Hochschule Deggendorf (DIT)", "Universidad de Cartagena (UdC)"),
  date: "17. September 2026",
  doc_id: "BAYLAT-EXP-DE-2026",
  header_title: "Wissenschaftliches Exposé (BAYLAT)",
)

#set text(lang: "de")

= 1. Einleitung, Problemstellung und sozioökonomische Relevanz kolumbianischer Agrarmatrizen

== 1.1 Motivation und bioökonomischer Kontext
Die Republik Kolumbien verfügt dank ihrer äquatorialen Lage, ihrer ausgeprägten orographischen Höhenstufung über drei Andenkordilleren und ihrer mikroklimatischen Diversität über eine weltweit herausragende agroalimentäre Biodiversität. Im Rahmen der nationalen Bioökonomiestrategie und der ländlichen Konsolidierung nach dem Friedensabkommen kommt dem nachhaltigen Agrarsektor eine Schlüsselrolle zu. Insbesondere hochwertige pflanzliche Erzeugnisse und Naturstoffe dienen zehntausenden kleinbäuerlichen Familien, afrokolumbianischen Gemeinschaften und indigenen Kooperativen als fundamentale Lebens- und Einkommensgrundlage.

Der Export dieser hochwertigen Agrargüter nach Europa und speziell in den bayerischen Wirtschaftsraum unterliegt jedoch gravierenden logistischen und qualitativen Hürden. Während des seegestützten Transports in Standard- oder Kühlcontainern (mit typischen Transitzeiten zwischen 20 und 45 Tagen vom Karibikhafen Cartagena de Indias zu den europäischen Nordseehäfen Hamburg oder Rotterdam) sowie während vor- und nachgelagerter Lagerphasen in tropischen Lagerhäusern sind die Produkte drastischen Umweltfluktuationen ausgesetzt. Temperaturen im Bereich von $20 thin degree"C"$ bis über $45 thin degree"C"$ und relative Luftfeuchtigkeiten ($"r.F."$) zwischen $50\%$ und $85\%$ induzieren tiefgreifende molekulare Abbauprozesse. 

Bisherige Kontrollregime stützen sich entweder auf die subjektive sensorische Begutachtung bei Ankunft oder auf zeit- und kostenintensive nasschemische sowie chromatographische Laboranalysen (wie HPLC-DAD, LC-MS und GC-MS). Diese Methoden sind destruktiv, erfordern den Einsatz umwelttoxischer organischer Lösungsmittel und können aufgrund von Analysekosten von $150$ bis $300 thin "EUR"$ pro Einzelmessung nicht für eine engmaschige Prozessüberwachung eingesetzt werden. In der Folge werden Qualitätsmängel, Ranzigkeit, Aromaverlust oder das Überschreiten lebensmittelrechtlicher Grenzwerte oft erst im Bestimmungshafen detektiert, was zu Totalverlusten ganzer Schiffsladungen, massiver Wertvernichtung und Reputationsschäden führt.

Zur Überwindung dieses fundamentalen Überwachungsdefizits verfolgt dieses bilaterale Kooperationsprojekt zwischen der Technischen Hochschule Deggendorf (DIT, Bayern) und der Universidad de Cartagena (UdC, Kolumbien) einen zukunftsweisenden, zerstörungsfreien Ansatz: die Kombination von Fourier-Transform-Infrarotspektroskopie mit abgeschwächter Totalreflexion (ATR-FTIR) und modernen hybriden Machine-Learning-Verfahren.

#callout(title: "Kernhypothese des Forschungsvorhabens")[
  Die zeitliche spektrale Evolution im mittleren Infrarotbereich ($4000 - 650 thin "cm"^(-1)$) kodiert die fundamentalen molekularen Abbaukinetiken komplexer Lebensmittelmatrizen. Durch die Einbettung thermodynamischer und kinetischer Gesetzmäßigkeiten (Arrhenius-Kinetik, Reaktionsordnungen, Monotonie) in tiefe neuronale Netze (PINNs und Neural ODEs) lassen sich hochpräzise, physikalisch plausible Frische- und Haltbarkeitstrajektorien rekonstruieren, die rein datengetriebenen Black-Box-Modellen hinsichtlich Extrapolationsfähigkeit und Rauschrobustheit überlegen sind und sich ressourcenschonend auf kostengünstigen Edge-Systemen (Raspberry Pi) ausführen lassen.
]

== 1.2 Die vier strategischen Wertschöpfungsketten Kolumbiens

Im Fokus dieser Untersuchung stehen vier agrarische Modellmatrizen, die das breite Spektrum biochemischer Zusammensetzungen (Polyphenole, Lipide, Kohlenhydrate und Fettsäureester) repräsentieren und zugleich von herausragender sozioökonomischer Bedeutung für die ländliche Entwicklung Kolumbiens sind:

=== A. Kakao (*Theobroma cacao L.*) – Edelkakaolinien (Criollo / Trinitario)
- *Sozioökonomische Verankerung:* Kolumbianischer Kakao wird von der International Cocoa Organization (ICCO) zu über $95\%$ als Edelkakao ("Fine Flavour Cocoa") eingestuft. Mehr als 52.000 kleinbäuerliche Familienbetriebe in ehemaligen Konfliktgebieten der Karibikregion (Sierra Nevada de Santa Marta, Montes de María) und den Tälern von Santander und Huila bestreiten ihren Lebensunterhalt durch den Kakaoanbau. Die Veredelung zu zertifiziertem Single-Origin-Kakao stellt eine tragende Säule legaler ländlicher Wertschöpfung dar.
- *Biochemisches Profil:* Die ungeröstete und schonend fermentierte Kakaomatrix zeichnet sich durch einen hohen Gehalt an bioaktiven Polyphenolen aus, vor allem Flavan-3-olen (monomeres $(-)$-Epicatechin und $(+)$-Catechin sowie Procyanidin-Dimere B2 und B5), Methylxanthinen (Theobromin $1,2 - 2,5\%$, Coffein $0,2 - 0,5\%$) und einer komplexen Triacylglycerinstruktur in der Kakaobutter (dominierende Triglyceride: 1-Palmitoyl-2-oleoyl-3-stearoylglycerin [POS], 1,3-Distearoyl-2-oleoylglycerin [SOS] und 1,3-Dipalmitoyl-2-oleoylglycerin [POP], welche zusammen über $75\%$ der Fettphase ausmachen).
- *Abbaumechanismen:* Während der Lagerung führen Restaktivitäten der Polyphenoloxidase (PPO) sowie nicht-enzymatische Autoxidationsreaktionen zur oxidativen Kondensation von Flavanolen zu unlöslichen hochmolekularen Phlobaphenen (braune Gerbstoffe), was mit einem dramatischen Verlust an antioxidativer Kapazität und sensorischer Bitterkeit einhergeht. Parallel dazu bewirkt eindringende Feuchtigkeit eine Lipolyse der Esterbindungen unter Freisetzung freier Fettsäuren (FFA), gefolgt von einer Radikaloxidation der ungesättigten Ölsäureanteile.

=== B. Spezialitätenkaffee (*Coffea arabica*) – Sorten Castillo, Caturra, Colombia und Geisha
- *Sozioökonomische Verankerung:* Kaffee ist das historische agrarische Aushängeschild Kolumbiens. Über 540.000 Kaffeebauernfamilien bewirtschaften Parzellen in den Steilhängen der Andenkordilleren (Eje Cafetero, Huila, Nariño, Tolima). Spezialitätenkaffees ("Specialty Coffee") mit Cupping-Scores $> 85$ Punkten erzielen auf dem europäischen Markt signifikante Preisaufschläge, die jedoch direkt von der absoluten Frische und Unversehrtheit des Bohnenprofils abhängen.
- *Biochemisches Profil:* Das phytochemische Gerüst wird maßgeblich geprägt durch Chlorogensäuren (CGA: insbesondere 5-Caffeoylchinasäure [5-CQA], 3-CQA, 4-CQA und Dicaffeoylchinasäuren mit einem Gesamtanteil von $6 - 9\%$ der Trockenmasse), Saccharose ($6 - 9\%$), Trigonellin ($0,8 - 1,2\%$), Coffein ($1,0 - 1,4\%$) sowie oberflächennahe Diterpenlipide (Cafestol- und Kahweolester).
- *Abbaumechanismen:* Thermische Belastungen während des Transports induzieren eine hydrolytische Spaltung und intramolekulare Lactonisierung der Chlorogensäuren zu Chinasäurelactonen (Chiniden), wodurch die geschätzte feine Säurestruktur zerstört und eine metallisch-adstringierende Bitterkeit erzeugt wird. Gleichzeitig migrieren Lipidfraktionen an die Bohnenoberfläche, wo Linolsäureester (C18:2) mit Luftsauerstoff über Peroxidradikale zu Hydroperoxiden und flüchtigen Abbaualdehyden (Hexanal) oxidieren ("Staling"-Prozess), was zu einem unumkehrbaren Verlust des Frischearomas führt.

=== C. Bienenhonig (*Apis mellifera*) – Karibischer Trockenwald und Bergregenwald
- *Sozioökonomische Verankerung:* Die Imkerei in den ariden Ökosystemen der Montes de María (Departamentos Bolívar und Sucre) sowie in den feuchten Andenvorbergen bietet agroforstlichen Genossenschaften eine nachhaltige, biodiversitätserhaltende Einnahmequelle.
- *Biochemisches Profil:* Honig besteht überwiegend aus den Monosacchariden $D$-Fructose ($38 - 42\%$) und $D$-Glucose ($31 - 35\%$), Wasser ($16 - 20\%$), organischen Säuren (vorwiegend Gluconsäure aus enzymatischer Glucoseoxidation) sowie hochspezifischen thermolabilen Enzymen der Honigbiene ($alpha$-Glucosidase / Diastase, Invertase, Glucoseoxidase).
- *Abbaumechanismen:* Unter tropischer Wärmeeinwirkung katalysiert das natürliche saure Milieu ($"pH" approx 3,4 - 4,5$) die Dehydratisierung von Hexosen (hauptsächlich Fructose über das Fructofuranosyl-Kation unter Abspaltung dreier Wassermoleküle) zu 5-(Hydroxymethyl)-2-furaldehyd (5-HMF). 5-HMF ist der weltweit regulierte Hauptindikator für thermische Überhitzung und Überlagerung (gesetzlicher Grenzwert nach Codex Alimentarius Stan 12-1981: max. $40 thin "mg/kg"$; Ausnahme für Tropenhonige: max. $80 thin "mg/kg"$). Parallel dazu denaturieren die Bienenenzyme exponentiell mit der Lagertemperatur (Verlust der Diastaseaktivität). Bei Glucosekristallisation und Feuchtegradienten droht zudem mikrobielle Gärung durch osmotolerante Hefen.

=== D. Natives Kokosöl (*Cocos nucifera*) – Kaltpressung pazifischer und karibischer Küsten
- *Sozioökonomische Verankerung:* In den afrokolumbianischen Küstengemeinden der Pazifikregion (Guapi, Timbiquí, Tumaco) und an der Karibikküste bildet die handwerkliche Gewinnung von nativem Kokosöl ("Virgin Coconut Oil", VCO) durch Kaltpressung die primäre Lebensader lokaler Kooperativen. VCO erzielt hohe Erlöse im europäischen Bio-Kosmetik- und Nutrazeutikasektor.
- *Biochemisches Profil:* VCO weist eine außergewöhnliche Lipidzusammensetzung auf: Über $65\%$ der Fettsäuren sind mittelkettige gesättigte Fettsäuren (MCTs), dominiert von Laurinsäure (C12:0, $48 - 53\%$), Myristinsäure (C14:0, $16 - 20\%$), Caprylsäure (C8:0, $7 - 9\%$) und Caprinsäure (C10:0, $5 - 7\%$). Der ungesättigte Anteil ist mit Ölsäure (C18:1, $5 - 7\%$) und Linolsäure (C18:2, $1 - 2\%$) sehr gering.
- *Abbaumechanismen:* Trotz der hohen Grundstabilität gesättigter Fettsäuren unterliegt VCO zwei zentralen Abbaupfaden: (1) Hydrolytische Ranzigkeit: In Gegenwart von Restwasser ($> 0,1\%$) spalten native Lipasen oder autokatalytische Säureprozesse Esterbindungen, wodurch freie Laurinsäure freigesetzt wird, was zu einem seifig-brennenden Geschmack führt. (2) Oxidative Ranzigkeit: Radikalische Angriffe auf die allylischen Kohlenstoffatome der geringen ungesättigten Fraktionen generieren konjugierte Hydroperoxide, die zu kurzkettigen Aldehyden und Ketonen zerfallen, begleitet von einer geometrischen _cis_-_trans_-Isomerisierung der Kohlenstoffdoppelbindungen unter thermischer Erregung.

#table(
  columns: (1.2fr, 1.8fr, 2.2fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Agrarmatrix],
    [Botanischer Ursprung & Region],
    [Primäre biochemische Marker],
    [Kritische Abbaureaktionen]
  ),
  [Kakao],
  [*Theobroma cacao L.* \ (Criollo/Trinitario, Santander/Sierra Nevada)],
  [Flavan-3-ole (Epicatechin), Procyanidine, Theobromin, POS/SOS/POP-Triglyceride],
  [Polyphenol-Kondensation zu Phlobaphenen, Kakaobutter-Lipolyse (FFA)],
  [Spezialitätenkaffee],
  [*Coffea arabica* \ (Castillo/Caturra/Geisha, Huila/Eje Cafetero)],
  [Chlorogensäuren (5-CQA), Trigonellin, Cafestol/Kahweol-Lipide],
  [CGA-Hydrolyse zu Chiniden, Oberflächenlipid-Oxidation, Aromaverlust],
  [Bienenhonig],
  [*Apis mellifera* \ (Montes de María, Karibischer Trockenwald)],
  [Fructose, Glucose, Gluconsäure, Diastase, Invertase],
  [Säurekatalysierte Fructosedehydratisierung zu 5-HMF, Enzyminaktivierung],
  [Natives Kokosöl],
  [*Cocos nucifera* \ (Pazifikküste / San Andrés, Kaltpressung)],
  [MCT-Triacylglycerine (Laurinsäure $>48\%$, Myristinsäure, Caprylsäure)],
  [Hydrolytische Spaltung (Laurinsäure-Freisetzung), Peroxidation, _trans_-Isomerisierung]
)

== 1.3 Limitationen konventioneller Analytik vs. Zerstörungsfreie ATR-FTIR-Spektroskopie
Die instrumentelle Überwachung dieser Degradationspfade stieß bislang auf ein methodisches Dilemma: Nasschemische Standardassays erfassen zwar exakte Summenparameter, zerstören jedoch das Probenmaterial und verbieten sich für hochfrequente Zeitreihenanalysen. Chromatographische High-End-Verfahren (HPLC, GC-MS) liefern molekulare Tiefenschärfe, sind jedoch extrem apparate- und kostenintensiv.

Demgegenüber erfasst die ATR-FTIR-Spektroskopie im mittleren Infrarotbereich ($4000 - 650 thin "cm"^(-1)$) innerhalb weniger Sekunden das gesamte molekulare Schwingungsspektrum einer Probe. Grundschwingungen von kovalenten Bindungen ($nu("O-H")$, $nu("C-H")$, $nu("C=O")$, $nu("C=C")$, $nu("C-O")$) und Deformationsmoden bilden einen unverwechselbaren spektralen Fingerabdruck. Da ATR-Kristalle (Diamant) keine chemische Vorbehandlung der Probe erfordern, ermöglicht die Methode ein zerstörungsfreies, reagenzienfreies und hochgradig reproduzierbares Echtzeit-Monitoring. Die Herausforderung besteht darin, aus den subtilen, überlappenden spektralen Bandenverschiebungen quantitative kinetische Parameter zu extrahieren.

---

= 2. Molekulare Abbauprozesse, Reaktionskinetik und ATR-FTIR-Spektralsignaturen

== 2.1 Kinetische Reaktionsmodellierung und Arrhenius-Formalismus
Die biochemischen Abbaureaktionen in den vier Matrizen gehorchen fundamentalen Gesetzen der chemischen Kinetik. Das Forschungsvorhaben modelliert diese Vorgänge über ein System gekoppelter Differentialgleichungen, deren Geschwindigkeitskonstanten $k(T)$ der Arrhenius-Beziehung unterliegen:

$ k(T) = A dot exp(- E_a / (R dot T)) $

wobei $A$ der präexponentielle Frequenzfaktor ($"s"^(-1)$ bzw. $"mol"/(L dot "s")$), $E_a$ die molare Aktivierungsenergie ($"kJ/mol"$), $R = 8,314 thin "J" / ("mol" dot "K")$ die universelle Gaskonstante und $T$ die absolute Temperatur in Kelvin ist.

1. *Kinetik pseudo-erster Ordnung (Polyphenol- und Chlorogensäureabbau):*
   Der oxidative Abbau von Flavan-3-olen im Kakao sowie die thermische Spaltung der Chlorogensäuren im Kaffee verlaufen in guter Näherung nach einer Kinetik pseudo-erster Ordnung:
   $ (d [C]) / (d t) = - k_1(T) dot [C] quad ==> quad [C](t) = [C]_0 dot exp(- k_1(T) dot t) $
   Die Aktivierungsenergien für den polyphenolischen Abbau liegen typischerweise im Bereich $E_(a,"poly") in [45, 65] thin "kJ/mol"$, während die Chlorogensäurehydrolyse $E_(a,"CGA") in [55, 75] thin "kJ/mol"$ aufweist.

2. *Kinetik pseudo-nullter Ordnung (5-HMF-Akkumulation und Freie Fettsäuren):*
   In Honigmatrix bildet sich 5-HMF unter großem Überschuss an Fructose intermediär nach einer Reaktion pseudo-nullter Ordnung:
   $ (d ["HMF"]) / (d t) = k_0(T) quad ==> quad ["HMF"](t) = ["HMF"]_0 + k_0(T) dot t $
   Die 5-HMF-Synthese weist eine ausgeprägte Temperaturabhängigkeit mit hoher Aktivierungsenergie auf ($E_(a,"HMF") in [100, 140] thin "kJ/mol"$, $Q_10 approx 3,5 - 4,2$), was die extreme Hitzesensitivität von Bienenhonig begründet. Die Freisetzung freier Fettsäuren (FFA) durch Triglyceridhydrolyse in Kokosöl und Kakaobutter verläuft bei moderaten Feuchten ebenfalls linear mit $E_(a,"FFA") in [50, 75] thin "kJ/mol"$.

3. *Autokatalytische Lipidperoxidation (Peroxidzahl PV in Ölen):*
   Die radikalische Kettenreaktion der Lipidperoxidation in Kokosöl und Kaffeelipiden folgt einer sigmoidalen Kinetik mit charakteristischer Induktionsperiode $t_("ind")$:
   $ ["PV"](t) = (["PV"]_max) / (1 + exp(- k_("ox")(T) dot (t - t_("ind")))) $
   mit Aktivierungsenergien im Bereich $E_(a,"PV") in [70, 95] thin "kJ/mol"$.

== 2.2 Diagnostische ATR-FTIR-Schwingungsbanden ($4000 - 650 thin "cm"^(-1)$)
Die spektrale Evolution während des Abbaus manifestiert sich in distinkten Schwingungsmoden. Die folgende Tabelle fasst die diagnostischen Zuordnungen, funktionellen Gruppen und das beobachtete kinetische Verhalten systematisch zusammen:

#table(
  columns: (1.1fr, 1.3fr, 1.4fr, 1.8fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Matrix],
    [Wellenzahl ($"cm"^(-1)$)],
    [Schwingungsmodus],
    [Biochemische Gruppe],
    [Diagnostisches Verhalten bei Alterung]
  ),
  [Alle],
  [$3700 - 3100$],
  [$nu("O-H")$ Valenz (breit)],
  [Wasser, Hydroxyle von Zuckern/Phenolen],
  [Intensitäts- und Bandbreitenänderung durch Feuchtigkeitsaufnahme/-abgabe],
  [Kakao],
  [$3400 - 3300$],
  [$nu("O-H")$ phenolisch],
  [Flavanole (Epicatechin, Catechin)],
  [Intensitätsverlust und Verflachung infolge oxidativer Gerbstoffkondensation],
  [Kakao],
  [$2924, 2853$],
  [$nu_("as")("CH"_2), nu_s("CH"_2)$],
  [Aliphatische Acylketten (Kakaobutter)],
  [Stabile Referenzbande für interne Vektornormierung],
  [Kakao],
  [$1742 - 1740$],
  [$nu("C=O")$ Ester-Carbonyl],
  [Triglyceride (POS, SOS, POP)],
  [Bandenverbreiterung und Tieffrequenz-Schulter bei $1715 thin "cm"^(-1)$ durch freie Fettsäuren],
  [Kakao],
  [$1650 - 1630$],
  [$nu("C=O")$ Amid I / Heterocyclus],
  [Methylxanthine (Theobromin, Coffein)],
  [Thermostabiler Marker zur Authentizitäts- und Verdünnungskontrolle],
  [Kakao],
  [$1610 - 1515$],
  [$nu("C=C")$ aromatisch],
  [Aromatische Ringe der Catechine],
  [Signifikanter Signalabfall durch Chinonbildung und Polymerisation],
  [Kaffee],
  [$3400$],
  [$nu("O-H")$ Valenz],
  [Chlorogensäuren und Bohnenfeuchte],
  [Progressive Abnahme durch thermischen CGA-Abbau],
  [Kaffee],
  [$1745$],
  [$nu("C=O")$ Ester],
  [Lipide der Bohnenoberfläche (Cafestolester)],
  [Ausprägung einer Schulter bei $1710 thin "cm"^(-1)$ durch Lipidhydrolyse],
  [Kaffee],
  [$1710 - 1695$],
  [$nu("C=O")$ Carbonsäure],
  [Freigesetzte Chinasäure / freie Fettsäuren],
  [Emergenz und Anstieg mit fortschreitender Bohnenveralterung ("Staling")],
  [Kaffee],
  [$1380 - 1150$],
  [$nu("C-O"), delta("O-H")$],
  [Chinasäure- und Caffeoylester-Einheiten],
  [Kontinuierlicher Intensitätsrückgang korreliert mit CGA-Verlust],
  [Kaffee],
  [$1050 - 1030$],
  [$nu("C-O")$ Kohlenhydrat],
  [Saccharose und Polysaccharide],
  [Langsamer Signalrückgang infolge nicht-enzymatischer Bräunung],
  [Honig],
  [$1680 - 1670$],
  [$nu("C=O")$ konjugiert],
  [5-(Hydroxymethyl)-2-furaldehyd (5-HMF)],
  [*Schlüsselbande:* In frischem Honig abwesend; wächst streng linear mit thermischer Alterung],
  [Honig],
  [$1645 - 1640$],
  [$delta("O-H"), nu_("as")("COO"^-)$],
  [Gebundenes Wasser / Gluconsäure],
  [Signalzunahme bei Gärungsprozessen und Säurebildung],
  [Honig],
  [$1150 - 900$],
  [Zucker-Fingerprint],
  [Fructose ($1055 thin "cm"^(-1)$), Glucose ($1030 thin "cm"^(-1)$)],
  [Peakverhältnis $A_1055 / A_1030$ überwacht Kristallisationsbeginn ($F/G$-Verhältnis)],
  [Kokosöl],
  [$3470$],
  [$nu("O-O-H")$ Oberton / Valenz],
  [Lipid-Hydroperoxide ($"ROOH"$)],
  [*Schlüsselbande:* Signalzunahme während der primären Lipidperoxidation],
  [Kokosöl],
  [$3005$],
  [$nu(= "C-H")$ _cis_-Alken],
  [Ungesättigte Acylketten (Öl-/Linolsäure)],
  [*Schlüsselbande:* Kontinuierlicher Rückgang durch radikalische Addition an Doppelbindungen],
  [Kokosöl],
  [$1746$],
  [$nu("C=O")$ Ester],
  [MCT-Triacylglycerine (Trilaurin u.a.)],
  [Bandenverbreiterung; Entstehung einer Säureschulter bei $1711 thin "cm"^(-1)$],
  [Kokosöl],
  [$1720 - 1711$],
  [$nu("C=O")$ freie Säure / Keton],
  [Freie Laurinsäure, sekundäre Abbaucarbonyls],
  [Wachstum signalisiert sekundäre Ranzigkeit und Hydrolyse],
  [Kokosöl],
  [$967$],
  [$delta(= "C-H")$ _trans_ out-of-plane],
  [_trans_-Isomerisierte Alkendoppelbindungen],
  [*Schlüsselbande:* Entsteht selektiv bei thermisch induzierter _trans_-Isomerisierung]
)

---

= 3. Standardisierte nasschemische Referenzanalytik (AOAC / ISO / Codex)

== 3.1 Das Konzept der agilen Ground-Truth-Kalibrierung
Zur Kalibrierung und Validierung der spektralen KI-Modelle während der 12-monatigen BAYLAT-Anschubförderung setzt das Konsortium auf normierte, hochgradig robuste und kosteneffiziente Standardverfahren der Lebensmittelanalytik (AOAC International, ISO, Codex Alimentarius). 

*Strategische Begründung:* Eine wöchentliche Durchführung hochauflösender Chromatographie (HPLC-DAD, LC-MS, GC-MS) über $792$ Probenansätze hinweg würde ein Budget von über $150.000 thin "EUR"$ erfordern, was den Finanzierungsrahmen der Anschubförderung ($10.000 thin "EUR"$ maximale Reisemittelbeihilfe) um ein Vielfaches übersteigt. Die etablierten nasschemischen Standardverfahren erfordern lediglich Standardglasgeräte, Titrierstände und UV-Vis-Spektrophotometer, welche an der Universidad de Cartagena vollumfänglich einsatzbereit vorhanden sind. Sie liefern exakte, behördlich anerkannte Grenzwerte und bilden das solide Ground-Truth-Fundament für das Modelltraining. Die hochauflösende chromatographische Metabolomik (LC-HRMS, Headspace-GC-MS) wird als logisches Arbeitspaket 2 im anschließenden dreijährigen DFG-Minciencias-Folgeantrag verankert.

== 3.2 Normierte Untersuchungsprotokolle nach Matrizen

=== A. Kakaomatrix
1. *Gesamtpolyphenole nach Folin-Ciocalteu:*
   - *Protokoll:* Entfettung des Kakaopulvers mit $n$-Hexan/Petrolether, zweistufige Ultraschallextraktion mit Aceton/Wasser ($70:30 thin "v/v"$). Umsetzung des wässrigen Phenolextrakts mit dem Folin-Ciocalteu-Reagenz (Phosphormolybdän-/Phosphorwolframsäure) in Gegenwart von Natriumcarbonat ($"Na"_2"CO"_3$) bei $p"H" approx 10$.
   - *Detektion:* Photometrische Messung der Molybdänblau-Komplexabsorption bei $760 - 765 thin "nm"$ gegen Gallussäure-Standards.
   - *Einheit & Referenzwerte:* Milligramm Gallussäure-Äquivalente pro Gramm Trockenmasse ($"mg GAE/g"$). Frischer Edelkakao weist $80 - 120 thin "mg GAE/g"$ auf; gealterter Kakao sinkt auf $< 40 thin "mg GAE/g"$.
2. *Säurezahl der Kakaobutter (AOAC 940.28 / ISO 660):*
   - *Protokoll:* Soxhlet- oder Kaltlösungsextraktion der Fettphase, Lösen in neutralisiertem Ethanol/Diethylether ($1:1 thin "v/v"$), Titration mit standardisierter $0,1 thin "N KOH"$-Lösung gegen Phenolphthalein.
   - *Grenzwert:* Max. $1,75\%$ freie Fettsäuren berechnet als Ölsäure.
3. *Gravimetrischer Trocknungsverlust (AOAC 931.04):*
   - Trocknung im Umluftofen bei $103 thin degree"C" plus.minus 2 thin degree"C"$ bis zur Gewichtskonstanz zur Überwachung des Restwassergehalts.

=== B. Kaffeematrix
1. *Titrierbare Gesamtsäure (AOAC 920.92):*
   - *Protokoll:* Standardisierter Aufguss von $10 thin "g"$ frisch vermahlenem Kaffee mit $100 thin "mL"$ kochendem entgastem Reinstwasser, Filtration, Abkühlung auf $20 thin degree"C"$, potentiometrische Titration mit $0,1 thin "N NaOH"$ bis zum stöchiometrischen Endpunkt von $p"H" 8,20$.
   - *Einheit:* Milliliter $0,1 thin "N NaOH"$ pro $100 thin "g"$ Trockenmasse (bzw. Gramm Citronensäure-Äquivalent pro $100 thin "g"$).
2. *Potentiometrische pH-Wert-Messung:*
   - Glaselektrodenmessung kalibriert gegen IUPAC-Standardpuffer ($p"H" 4,00$ und $7,00$ bei $25 thin degree"C"$).
3. *Gravimetrische Restfeuchte (ISO 6673):*
   - Vakuumtrocknung bei $105 thin degree"C"$ bis zur Massenkonstanz (Handelsgrenzwert Rohkaffee: $10,0 - 12,5\%$).
4. *UV-Vis-Bräunungs- und Veralterungsindex:*
   - Spektrophotometrische Extinktionsmessung bei $420 thin "nm"$ (melanoidinartige Maillard-Kondensate) relativ zu $280 thin "nm"$ (Phenol- und Coffeinabsorption): Index $I_("stale") = A_420 / A_280$.

=== C. Honigmatrix
1. *5-Hydroxymethylfurfural (5-HMF) nach Winkler / White (AOAC 980.23 / Codex Stan 12-1981):*
   - *Protokoll:* Lösen von $5,0 thin "g"$ Honig in Reinstwasser, Klärung mit Carrez-I- ($"K"_4["Fe"("CN")_6] dot 3"H"_2"O"$) und Carrez-II-Lösung ($"Zn"("CH"_3"COO")_2 dot 2"H"_2"O"$). Aufteilung in zwei Aliquote: Aliquot 1 wird mit Wasser versetzt (Messprobe), Aliquot 2 wird mit $0,20\%$-iger Natriumbisulfitlösung ($"NaHSO"_3$) versetzt. Das Bisulfit spaltet selektiv die Carbonylgruppe des 5-HMF und zerstört dessen Chromophor, wodurch ein perfekter matrixidentischer Blindwert entsteht.
   - *Detektion:* Zweistrahl-UV-Spektrophotometrie bei $284 thin "nm"$ (5-HMF-Absorptionsmaximum) und $336 thin "nm"$ (Hintergrundstreuungskorrektur).
   - *Berechnungsvorschrift:*
     $ "HMF" thin ("mg/kg") = ((A_284 - A_336) dot 149,7 dot 5) / (m_("Probe") thin ("g")) $
   - *Grenzwerte:* Codex Alimentarius max. $40 thin "mg/kg"$; tropische Wildhonige max. $80 thin "mg/kg"$.
2. *Diastaseaktivität (Phadebas-Photometrie / IHC-Standard):*
   - *Protokoll:* Enzymatische Hydrolyse eines unlöslichen, blau gefärbten, vernetzten Stärkesubstrats (Phadebas-Tabletten) durch native Honig-Diastase bei $40,0 thin degree"C" plus.minus 0,2 thin degree"C"$. Nach Reaktionsstopp mit $"NaOH"$ wird die Extinktion der freigesetzten wasserlöslichen blauen Farbstofffragmente bei $620 thin "nm"$ gemessen.
    - *Einheit:* Schade-Einheiten / Gothe-Skala (Diastase Number, DN). Gesetzlicher Mindestwert: $"DN" >= 8$ (bzw. $"DN" >= 3$ bei $"HMF" <= 15 thin "mg/kg"$).
3. *Refraktometrische Feuchte und lösliche Trockensubstanz (°Brix, AOAC 969.38):*
   - Digitales Abbe-Refraktometer mit automatischer Temperaturkompensation auf $20,0 thin degree"C"$. Umrechnung des Brechungsindex in den Feuchtegehalt über die Chataway-Tabelle (Maximalgrenzwert: $20,0\%$).
4. *Freie Säure (AOAC 962.19):*
   - Titration mit $0,05 thin "N NaOH"$ bis $p"H" 8,30$ (Codex-Limit: max. $50 thin "meq/kg"$).

=== D. Natives Kokosöl (VCO)
1. *Peroxidzahl (PV) nach AOAC 965.33 / ISO 3960:*
   - *Protokoll:* Einwaage von $5,0 thin "g"$ Kokosöl, Lösen in $30 thin "mL"$ Eisessig/Chloroform ($3:2 thin "v/v"$), Zugabe von $0,5 thin "mL"$ gesättigter Kaliumiodidlösung ($"KI"$). Freigesetztes Iod ($"ROOH" + 2 "I"^- + 2 "H"^+ -> "ROH" + "I"_2 + "H"_2"O"$) wird umgehend mit standardisierter $0,01 thin "N Natriumthiosulfatlösung"$ ($"Na"_2"S"_2"O"_3$) unter Zusatz von $1\%$-iger Stärkelösung als Indikator titriert.
   - *Einheit & Grenzwert:* Milliäquivalent aktiver Sauerstoff pro Kilogramm Fett ($"meq" thin "O"_2/"kg"$). Codex Stan 210 Grenzwert für natives Kokosöl: max. $15 thin "meq" thin "O"_2/"kg"$.
2. *Freie Fettsäuren (FFA) / Säuregrad (ISO 660):*
   - *Protokoll:* Direkte Titration des geschmolzenen Öls in neutralisiertem 2-Propanol mit $0,1 thin "N KOH"$ gegen Phenolphthalein.
   - *Berechnung:* Angabe in Prozent Laurinsäure ($M = 200,32 thin "g/mol"$). Codex-Grenzwert für VCO: max. $0,20\%$ (entspricht Säurezahl $<= 0,56 thin "mg KOH/g"$).
3. *Konjugierte Diene ($K_232$) und Triene ($K_270$) nach ISO 3656:*
   - Spektrophotometrische Extinktionsmessung einer $1\%$-igen Lösung des Öls in reinem Isooctan bei $232 thin "nm"$ (Hydroperoxide mit konjugierten Diensystemen) und $270 thin "nm"$ ($alpha,beta$-ungesättigte Ketone und Aldehyde).

---

= 4. Kritischer Stand der Forschung und methodische Lücken

== 4.1 Analyse des Stands der Technik
Die Anwendung von Infrarotspektroskopie in Kombination mit modernen Auswertemethoden im Agrar- und Lebensmittelsektor hat in den letzten Jahren rasant zugenommen. Eine kritische Analyse der aktuellen internationalen Literatur offenbart jedoch fundamentale konzeptionelle und methodische Limitierungen:

- *Statische Klassifikation statt dynamischer Kinetik:*
  Die überwiegende Mehrheit veröffentlichter Studien nutzt FTIR- oder NIR-Spektren ausschließlich für statische Klassifikationsaufgaben zur Überprüfung von Herkunft, Sorte oder Verfälschung @feng2021applicationofvisibleinfrared. So demonstrierten Upadhyay & Chaudhary (2026) @upadhyay2026enhancingspectralanalysis die erfolgreiche Identifikation von Verfälschungen in Milchfett (Ghee) mittels eines multimodalen 1D-CNN-Transformer-Netzwerks mit spektralem Aufmerksamkeitsmechanismus (SAM) und erreichten eine Klassifikationsgenauigkeit von $99,6\%$. Auch Widiarto et al. (2026) @widiarto2026detectionofadulteration nutzten FTIR-Spektren und multivariate Statistik (PCA, PLS-DA) zur Detektion von Kaffeeverfälschungen. Boadu (2024) @boadu2024developinganovel untersuchte Handheld-NIR-Sensoren für Qualitätskontrollen bei Kaffee. In allen genannten Arbeiten wird ein Spektrum jedoch stets als isolierte Momentaufnahme analysiert. Der zeitliche Verlauf von Alterungs- und Verderbsprozessen wird nicht erfasst.
  
- *Herausforderungen der CNN-Adaption in der Spektroskopie:*
  Passos (2605) @passos2605convolutionalneuralnetworks zeigte in einer grundlegenden Übersichtsarbeit auf, dass die unkritische Übertragung von Standard-Convolutional-Neural-Networks (CNN) aus der 2D-Bildverarbeitung in die 1D-Schwingungsspektroskopie häufig zu gravierenden Artefakten führt. Standard-Pooling-Operationen zerstören die physikalische Stetigkeit spektraler Absorptionsbanden. Effektive 1D-CNN-Architekturen erfordern ein "Conditional Design": Filterkerngrößen müssen exakt an die physikalische Halbwertsbreite (FWHM, typischerweise $10 - 50 thin "cm"^(-1)$) realer Schwingungsbanden angepasst werden, gekoppelt mit chemometrischer Normalisierung (Standard Normal Variate, SNV).

- *Die "PIML-Falle" und das Kausalitäts-Paradoxon:*
  Einen entscheidenden methodischen Durchbruch lieferten kürzlich Pronk & Anthony (2026) @pronk2026neuralnetworkplacementin in *Scientific Reports*. Bei der Untersuchung von 221 industriellen Röstchargen von Kaffee verglichen sie rigoros physikalisch informierte Modelle (PIML auf Basis starrer Differentialgleichungssysteme) mit rein empirischen neuronalen Netzen. Ihr überraschendes, ernüchterndes Ergebnis: *Ein kompaktes, empirisches Feedforward-Netzwerk erzielte eine Modellgüte von $R^2 = 0,97$ mit 3- bis 20-mal weniger Parametern, während starre ODE-basierte PIML-Modelle lediglich $R^2 = 0,70 - 0,94$ erreichten.* Das unbedachte Aufzwingen starrer physikalischer Gleichungen bei unvollständiger Identifizierbarkeit führt zu numerischer Versteifung (Stiffness), Parameterinflation und systematischen Modellfehlern. Perré (2025) @perre2025towardmechanisticmodels zeigte zwar, dass PINNs bei Biomaterial-Trocknungsprozessen physikalisch plausible Extrapolationen über den Trainingsbereich hinaus ermöglichen, operierte dabei jedoch ausschließlich auf simulierten Gitternetzen ohne reale spektroskopische Eingangsdaten.

- *Skalierung temporaler Sequenzmodelle:*
  Für kontinuierliche Zeitreihen demonstrierten Li et al. (2026) @li2026asgmambaadaptivespectral mit ASGMamba (Adaptive Spectral Gating Mamba), dass Selektive State Space Modelle (SSMs) eine lineare Rechenkomplexität $cal(O)(L)$ gegenüber der quadratischen Komplexität $cal(O)(L^2)$ von Standard-Transformern aufweisen und hochfrequente Sensorstörungen adaptiv filtern können. Felizzato et al. (2025) @felizzato2025datafusionfor betonten das Potenzial von Datenfusionstechniken, während Grundy et al. (2025) @grundy2025reviewofcurrent auf die massiven Probleme von Baseline-Drifts und fehlenden standardisierten longitudinalen Datensätzen in der Speiseölspektroskopie hinwiesen.

== 4.2 Die vier identifizierten Forschungslücken
Aus der Synthese des internationalen Schrifttums kristallisieren sich vier gravierende Forschungslücken heraus:

#callout(title: "Forschungslücke 1: Fehlen longitudinaler spektraler Multimatrix-Datensätze")[
  In der internationalen Literatur existiert kein harmonisierter, öffentlich zugänglicher Datensatz, der kontinuierliche ATR-FTIR-Spektren über einen Zeitraum von 180 Tagen unter kontrollierten Klimabedingungen für mehrere tropische Agrarmatrizen mit paralleler nasschemischer Referenzanalytik dokumentiert.
]

#callout(title: "Forschungslücke 2: Entkopplung von Spektroskopie und Kinetiktheorie")[
  Bisherige PIML-Ansätze modellieren physikalische Transport- oder Reaktionsgleichungen losgelöst von optischen Spektren, während spektroskopische Deep-Learning-Modelle rein empirisch ohne Berücksichtigung von Massenbilanzen, Arrhenius-Gesetzen oder Reaktionsordnungen trainiert werden.
]

#callout(title: "Forschungslücke 3: Das Dilemma zwischen Modellsteifigkeit und Black-Box")[
  In Anlehnung an Pronk & Anthony (2026) existiert bislang keine Architektur, die kinetische Restriktionen nicht als starres Korsett, sondern als weiche, adaptive Strafterme (Soft Penalties) formuliert, um die Flexibilität tiefer Repräsentationen mit thermodynamischer Plausibilität zu vereinen.
]

#callout(title: "Forschungslücke 4: Scheinkorrelation vs. Kausale XAI-Validierung")[
  Aufmerksamkeitskarten (z. B. SAM) in spektralen Transformern heben statistische Korrelationen hervor, beweisen jedoch keine chemische Kausalität, solange sie nicht systematisch mit realen funktionellen Schwingungsbanden und standardisierten chemischen Referenzabbaukurven abgeglichen werden.
]

---

= 5. Faktorieller 3-Stufen-Architekturbereich ($3 times 2 times 3 = 18$ Modellkonfigurationen)

Zur systematischen Identifikation der optimalen Architekturspanne etabliert das Projekt einen $3 times 2 times 3$ faktoriellen Erkundungsraum, der zwei komplementäre Aufgabenstellungen simultan löst:
1. *Selbstüberwachte spektrale Zukunftsvorhersage (Spectral Forecasting):*
   $ hat(X)(t + Delta t) = cal(M)_("spec")(X(t_0), X(t_1), dots, X(t)) in bb(R)^W $
2. *Physikochemische Zustandsschätzung (Kinetic State Regression):*
   $ hat(C)_j(t) = cal(M)_("chem")(hat(X)(t)) in bb(R) quad (j in {"PV", "FFA", "HMF", "Polyphenole"}) $

== 5.1 Stufe 1: Spektrale Merkmalskodierer (Encoder)
- *Option 1A – Multiskaliges 1D-CNN mit Chemometrischer LayerNorm (Passos 2026):*
  Parallele Faltungsschichten mit Filterkerngrößen $k in {7, 15, 31, 63}$, was bei einer spektralen Diskretisierung von $2 thin "cm"^(-1)$ einer spektralen Fensterbreite von $Delta nu approx 14, 30, 62, 126 thin "cm"^(-1)$ entspricht. Dies bildet exakt die physikalischen Bandbreiten einzelner Streckschwingungen bis hin zu breiten Wasserstoffbrücken-Netzwerken ab. Verzicht auf aggressives Pooling zur Vermeidung spektraler Phasenverschiebungen; Einsatz von Residualverbindungen.
- *Option 1B – Spectral Transformer mit Spectral Attention Mechanism (SAM, Upadhyay & Chaudhary 2026):*
  Multi-Head Self-Attention (MHSA mit 8 Köpfen) über 1.738 spektrale Kanäle mit lernbarem 1D-Sinus-Positions-Embedding. Ermöglicht die Erfassung langreichweitiger Korrelationen zwischen Grundschwingungen (z. B. Ester-Carbonyl bei $1746 thin "cm"^(-1)$) und deren Obertönen/Kombinationsschwingungen (z. B. Hydroperoxid-Oberton bei $3470 thin "cm"^(-1)$).
- *Option 1C – Spektrochemisches Graph Neural Network (GNN):*
  Graph Convolutional Network (GCN), bei dem Knoten diskrete funktionelle Gruppen darstellen (Knoten 1: Phenolisches O-H; Knoten 2: Ester-C=O; Knoten 3: _cis_-Alken; Knoten 4: _trans_-Alken; Knoten 5: 5-HMF-Furan; Knoten 6: Kohlenhydrat-Fingerprint). Kanten repräsentieren bekannte biochemische Reaktionspfade und empirische Kovarianzkorrelationen ($rho > 0,70$).

== 5.2 Stufe 2: Temporale Sequenzmodelle (Backbone)
- *Option 2A – Bidirektionales LSTM / Gated Recurrent Unit (Bi-LSTM / GRU):*
  Zweistufiges rekurrentes Netzwerk mit Hidden-Dimension $d_h = 128$. Bewährter Baseline-Standard für zeitliche Abhängigkeiten, leidet jedoch unter sequentieller Trainingsunfähigkeit und quadratischer Skalierung bei langen Zeithorizonten.
- *Option 2B – Selektives State-Space-Modell (Mamba / ASGMamba, Li et al. 2026):*
  Hardware-effiziente Zustandsparametrisierung mit zeitinvarianten kontinuierlichen Matrizen $(bold(A), bold(B), bold(C), Delta)$, diskretisiert mittels Zero-Order-Hold (ZOH):
  $ bold(h)_t = bold(macron(A))_t bold(h)_(t-1) + bold(macron(B))_t bold(x)_t, quad bold(y)_t = bold(C)_t bold(h)_t $
  Linearer Rechen- und Speicheraufwand $cal(O)(L)$ in der Sequenzlänge $L$, paralleler assoziativer Scan beim Training und konstanter Rechenaufwand $cal(O)(1)$ pro Zeitschritt bei der Inferenz auf Edge-Geräten. Integriertes adaptives spektrales Gating (ASG) filtert instrumentelles Rauschen.

== 5.3 Stufe 3: Physikalische und kinetische Regularisierung
- *Option 3A – Rein empirische unbeschränkte Basislinie:*
  Standardmäßiger Mean Squared Error (MSE) über Spektren und Konzentrationen:
  $ cal(L)_("data") = 1/B sum_(i=1)^B ( ||hat(X)_i - X_i||^2 + alpha sum_j (hat(C)_(i,j) - C_(i,j))^2 / sigma_j^2 ) $
- *Option 3B – PINN mit weichen Arrhenius-Straftermen (Soft Penalties):*
  Lösung des von Pronk & Anthony (2026) aufgedeckten Steifigkeitsproblems durch dynamisch gewichtete weiche Nebenbedingungen:
  $ cal(L)_("total") = cal(L)_("data") + lambda_("kin") cal(L)_("kin") + lambda_("mono") cal(L)_("mono") $
  wobei der kinetische Strafterm die Abweichung von der theoretischen Reaktionsgeschwindigkeit bestraft:
  $ cal(L)_("kin") = 1/N sum_j || (d hat(C)_j) / (d t) + k_j(T) hat(C)_j^n ||^2, quad k_j(T) = A_j dot exp(- E_(a,j) / (R dot T)) $
  mit lernbaren thermodynamischen Parametern $A_j$ und $E_(a,j)$ innerhalb physikalisch plausibler Grenzen. Der Monotonieterm erzwingt die thermodynamische Irreversibilität kumulativer Marker:
  $ cal(L)_("mono") = sum_j || "ReLU"( - (d hat(C)_j) / (d t) ) ||^2 $
- *Option 3C – Hierarchische Neural Ordinary Differential Equations (Neural ODEs):*
  Kontinuierliche zeitliche Trajektorie des latenten Zustandsvektors $bold(z)(t)$:
  $ (d bold(z)(t)) / (d t) = bold(f)_("mech")(bold(z)(t), T; bold(kappa)_m) + bold(g)_theta(bold(z)(t), t, T, "r.F.") $
  Hierbei beschreibt $bold(f)_("mech")$ den geschlossenen stöchiometrischen Driftvektor der Hauptreaktion, während das neuronale Residuum $bold(g)_theta$ Matrixinteraktionen und Diffusionshemmungen kompensiert. Integration via Runge-Kutta-Fehlberg (RK45) mit Adjoint-Sensitivitätsanalyse für konstanten Speicherbedarf im Backpropagation-Schritt.

#table(
  columns: (0.8fr, 1.4fr, 1.2fr, 1.6fr, 1.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [ID],
    [Stufe 1: Encoder],
    [Stufe 2: Backbone],
    [Stufe 3: Regularisierung],
    [Theoretische Komplexität],
    [Edge-Eignung]
  ),
  [$M_1$], [1D-CNN (Passos)], [Bi-LSTM], [Empirische Basislinie], [$cal(O)(K dot W) + cal(O)(L dot d_h^2)$], [Sehr hoch],
  [$M_2$], [1D-CNN (Passos)], [Bi-LSTM], [PINN Arrhenius Soft], [$cal(O)(K dot W) + cal(O)(L dot d_h^2) + cal(O)(N)$], [Sehr hoch],
  [$M_3$], [1D-CNN (Passos)], [Bi-LSTM], [Hierarchical Neural ODE], [$cal(O)(K dot W) + cal(O)(N_("steps") dot d_z^2)$], [Mittel],
  [$M_4$], [1D-CNN (Passos)], [Mamba SSM], [Empirische Basislinie], [$cal(O)(K dot W) + cal(O)(L dot d_h)$], [Exzellent],
  [$M_5$], [1D-CNN (Passos)], [Mamba SSM], [PINN Arrhenius Soft], [$cal(O)(K dot W) + cal(O)(L dot d_h) + cal(O)(N)$], [Exzellent],
  [$M_6$], [1D-CNN (Passos)], [Mamba SSM], [Hierarchical Neural ODE], [$cal(O)(K dot W) + cal(O)(N_("steps") dot d_z)$], [Hoch],
  [$M_7$], [Transformer (SAM)], [Bi-LSTM], [Empirische Basislinie], [$cal(O)(W^2) + cal(O)(L dot d_h^2)$], [Mittel],
  [$M_8$], [Transformer (SAM)], [Bi-LSTM], [PINN Arrhenius Soft], [$cal(O)(W^2) + cal(O)(L dot d_h^2) + cal(O)(N)$], [Mittel],
  [$M_9$], [Transformer (SAM)], [Bi-LSTM], [Hierarchical Neural ODE], [$cal(O)(W^2) + cal(O)(N_("steps") dot d_z^2)$], [Gering],
  [$M_10$], [Transformer (SAM)], [Mamba SSM], [Empirische Basislinie], [$cal(O)(W^2) + cal(O)(L dot d_h)$], [Mittel],
  [$M_11$], [Transformer (SAM)], [Mamba SSM], [PINN Arrhenius Soft], [$cal(O)(W^2) + cal(O)(L dot d_h) + cal(O)(N)$], [Gut],
  [$M_12$], [Transformer (SAM)], [Mamba SSM], [Hierarchical Neural ODE], [$cal(O)(W^2) + cal(O)(N_("steps") dot d_z)$], [Mittel],
  [$M_13$], [Spectral GNN], [Bi-LSTM], [Empirische Basislinie], [$cal(O)(|cal(V)| dot |cal(E)|) + cal(O)(L dot d_h^2)$], [Gut],
  [$M_14$], [Spectral GNN], [Bi-LSTM], [PINN Arrhenius Soft], [$cal(O)(|cal(V)| dot |cal(E)|) + cal(O)(L dot d_h^2) + cal(O)(N)$], [Gut],
  [$M_15$], [Spectral GNN], [Bi-LSTM], [Hierarchical Neural ODE], [$cal(O)(|cal(V)| dot |cal(E)|) + cal(O)(N_("steps") dot d_z^2)$], [Gering],
  [$M_16$], [Spectral GNN], [Mamba SSM], [Empirische Basislinie], [$cal(O)(|cal(V)| dot |cal(E)|) + cal(O)(L dot d_h)$], [Sehr hoch],
  [$M_17$], [Spectral GNN], [Mamba SSM], [PINN Arrhenius Soft], [$cal(O)(|cal(V)| dot |cal(E)|) + cal(O)(L dot d_h) + cal(O)(N)$], [Sehr hoch],
  [$M_18$], [Spectral GNN], [Mamba SSM], [Hierarchical Neural ODE], [$cal(O)(|cal(V)| dot |cal(E)|) + cal(O)(N_("steps") dot d_z)$], [Mittel]
)

---

= 6. Experimentelles Versuchsdesign der akzelerierten Alterung

== 6.1 Vollfaktorieller Versuchsplan
Zur Generierung einer longitudinalen Datenbasis mit höchster statistischer Aussagekraft und kontrollierter Varianz führt die Universidad de Cartagena ein vollreguliertes Alterungsexperiment durch.

- *Agrarmatrizen:* 4 Matrizen (Kakao, Spezialitätenkaffee, Bienenhonig, natives Kokosöl).
- *Chargen:* 3 unabhängige, zertifizierte Primärchargen pro Matrix von distinkten Kleinbauernkooperativen mit gesicherter Rückverfolgbarkeit ($4 times 3 = 12$ Chargen).
- *Klimaregime:* 6 vollfaktorielle Kammerbedingungen ($T times "r.F."$) in zertifizierten Umwelt-Brutschränken:
  1. *Kammer 1:* $25,0 thin degree"C" plus.minus 0,5 thin degree"C"$ bei $60\% plus.minus 2\%$ r.F. (Standard-Umgebungskontrolle)
  2. *Kammer 2:* $25,0 thin degree"C" plus.minus 0,5 thin degree"C"$ bei $75\% plus.minus 2\%$ r.F. (Feuchtes tropisches Milieu)
  3. *Kammer 3:* $40,0 thin degree"C" plus.minus 0,5 thin degree"C"$ bei $60\% plus.minus 2\%$ r.F. (Milde akzelerierte Alterung)
  4. *Kammer 4:* $40,0 thin degree"C" plus.minus 0,5 thin degree"C"$ bei $75\% plus.minus 2\%$ r.F. (Transozeanischer Feuchtetransit)
  5. *Kammer 5:* $60,0 thin degree"C" plus.minus 0,5 thin degree"C"$ bei $60\% plus.minus 2\%$ r.F. (Thermischer Hitzestress)
  6. *Kammer 6:* $60,0 thin degree"C" plus.minus 0,5 thin degree"C"$ bei $75\% plus.minus 2\%$ r.F. (Extremer Tropenstress)
- *Longitudinale Beprobungsintervalle über 180 Tage:*
  11 Beprobungszeitpunkte: $t in {0, 3, 7, 14, 21, 30, 45, 60, 90, 120, 180}$ Tage.
- *Experimenteller Durchsatz:*
  $ 4 thin "Matrizen" times 3 thin "Chargen" times 6 thin "Klimakammern" times 11 thin "Zeitpunkte" = 792 thin "experimentelle Einheiten" $
  - *ATR-FTIR-Messungen:* 792 Einheiten $times 3$ analytische Replikate $= bold(2.376) thin "Spektren"$.
  - *Nasschemische Referenzanalysen:* 792 Messungen des jeweiligen matrixspezifischen AOAC/ISO-Qualitätsmarkers.

== 6.2 Standardarbeitsanweisungen (SOP) zur Spektrenakquise
1. *Spektrometer-Konfiguration:* Forschungs-FTIR mit temperaturkontrolliertem Diamant-ATR-Einstufen-Reflexionselement, Peltier-temperiert auf $25,0 thin degree"C" plus.minus 0,2 thin degree"C"$, um thermische Bandenverbreiterungen während der Messung auszuschließen.
2. *Optische Parameter:* Spektralbereich $4000 - 650 thin "cm"^(-1)$, Auflösung $4,0 thin "cm"^(-1)$, 64 akkumulierte Scans pro Spektrum, Happ-Genzel-Apodisation, Zero-Filling-Faktor 2 (ergibt 1.738 diskrete spektrale Datenpunkte).
3. *Qualitätssicherung:* Vor jeder Triplikat-Messung automatische Erfassung des Umgebungs-Hintergrundspektrums ($"Background"$, $"CO"_2$- und Feuchtekompensation). Tägliche Funktionsqualifizierung (OQ/PQ) anhand eines zertifizierten $0,05 thin "mm"$ Polystyrol-Prüfkörpers (Überprüfung der Wellenzahlgenauigkeit bei $3060,0$, $1601,2$ und $1028,3 thin "cm"^(-1)$ auf $plus.minus 0,5 thin "cm"^(-1)$). Reinigung des Diamantkristalls mit hochreinem Isopropanol und Überprüfung auf Rückstandsfreiheit (Extinktion $< 0,002$).

---

= 7. Multikriterielle Pareto-Entscheidungsmatrix und Edge-AI-Implementierung

Die endgültige Modellauswahl aus den 18 factorialen Kandidaten erfolgt nicht a priori, sondern nach Abschluss des Modelltrainings am GPU-Cluster des DIT über eine multikriterielle Pareto-Entscheidungsanalyse (Multi-Criteria Decision Analysis, MCDA):

$ max_(theta in cal(C)_18) cal(F)(theta) = (f_("acc")(theta), f_("edge")(theta), f_("ident")(theta), f_("causal")(theta)) $

== 7.1 Die vier Bewertungsdimensionen

1. *Kriterium 1: Generalisierungsgenauigkeit und OOD-Robustheit (Gewichtung: 35%):*
   - Rigorose Kreuzvalidierung nach dem *Leave-One-Batch-Out (LOBO)*-Prinzip: Training auf zwei Chargen, Testung ausschließlich auf der ungesehenen dritten Charge, sowie Transfertests über Matrizen hinweg.
   - Akzeptanzgrenzen: Bestimmtheitsmaß $R^2 >= 0,90$ über alle vier Matrizen; mittlerer absoluter prozentualer Fehler ($"MAPE" <= 8,0\%$); Vorhersagefehler ($"RMSEP"$) innerhalb der analytischen Streubreite der Referenzmethode ($sigma_("assay")$).

2. *Kriterium 2: Sparsamkeit und Edge-AI-Tauglichkeit auf Raspberry Pi (Gewichtung: 25%):*
   - Benchmarking auf realer Embedded-Hardware: *Raspberry Pi 4 Model B (4 GB RAM)* und *Raspberry Pi 5 (4 GB RAM)* unter 64-Bit Raspberry Pi OS mit ONNX Runtime und PyTorch Lite.
   - Akzeptanzgrenzen: Inferenzzeit pro Spektrum $<= 2,0 thin "Sekunden"$; maximaler RAM-Bedarf im Betrieb $<= 500 thin "MB"$; serialisierte Modellgröße auf dem Flash-Speicher $<= 50 thin "MB"$.
   - *Parsimonie-Regel nach Pronk & Anthony (2026):* Erzielt ein hochkomplexes Modell (z. B. GNN + Neural ODE) gegenüber einer schlankeren Architektur (z. B. 1D-CNN + Mamba + PINN Soft Penalty) nur einen marginalen Genauigkeitsgewinn ($Delta R^2 < 0,02$), erfordert dafür jedoch ein Vielfaches an Rechenzeit und Parametern, dominiert die sparsamere Architektur nach Pareto und erhält den Vorzug.

3. *Kriterium 3: Kinetische Identifizierbarkeit und numerische Stabilität (Gewichtung: 20%):*
   - Divergenzfreie Integration während des Trainings; Ausschluss numerischer Versteifung (Stiffness).
   - Thermodynamische Plausibilität der extrahierten Aktivierungsenergien: Die vom Modell gelernten Parameter $E_a$ müssen innerhalb von $plus.minus 15\%$ mit den klassisch aus der Arrhenius-Linearisierung ermittelten Literaturwerten ($45 - 140 thin "kJ/mol"$) übereinstimmen.

4. *Kriterium 4: Chemische Kausalität und Bandenattributionsübereinstimmung (Gewichtung: 20%):*
   - Generierung von Attributionskarten via Integrated Gradients oder Spectral Attention Maps (SAM).
   - Berechnung des *Spectral Attribution Alignment Score* ($S_("align")$): Jaccard-Ähnlichkeitsindex zwischen den Top-Dezil-Gewichten des Modells und den verifizierten Schwingungsbanden aus Abschnitt 2.2. Akzeptanzschwelle: $S_("align") >= 0,75$.

---

= 8. Projekt-Governance, RACI-Matrix und Risikomanagement

== 8.1 Institutionelle RACI-Matrix
Die Aufgabenverteilung zwischen der Universidad de Cartagena (UdC, Kolumbien) und der Technischen Hochschule Deggendorf (DIT, Bayern) ist komplementär verzahnt:
- *R* = Responsible (operative Durchführung)
- *A* = Accountable (Gesamtverantwortung & Freigabe)
- *C* = Consulted (fachliche Zuarbeit / Beratung)
- *I* = Informed (Berichterstattung / Information)

#table(
  columns: (2.5fr, 1.0fr, 1.0fr, 3.5fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Arbeitspaket / Teilaufgabe],
    [UdC],
    [DIT],
    [Primäres Lieferergebnis / Meilenstein]
  ),
  [AP 1.1: Agronomische Probenahme & Botanische Zertifizierung],
  [*R / A*],
  [I],
  [Zertifiziertes Chargenregister (Kakao, Kaffee, Honig, Kokosöl)],
  [AP 1.2: Design der Alterung & Kalibrierung der Klimakammern],
  [*R / A*],
  [C],
  [SOP Klimastudie & Prüfprotokoll der Brutschränke],
  [AP 1.3: Bilateraler Kick-off-Workshop 1 (Cartagena, Monat 2)],
  [*R*],
  [*R / A*],
  [Workshop-1-Protokoll & gemeinsames Daten-SOP unterzeichnet],
  [AP 2.1: Durchführung der 180-Tage-Alterungsstudie],
  [*R / A*],
  [I],
  [Vollständige Kammerprotokolle & Probenintegritätsnachweis],
  [AP 2.2: Kontinuierliche ATR-FTIR-Spektrenakquise (2.376 Scans)],
  [*R / A*],
  [C],
  [Rohdatenspektraldatenbank (`.csv`, `.spa`)],
  [AP 2.3: Standardisierte nasschemische Analysen (AOAC/ISO)],
  [*R / A*],
  [C],
  [Ground-Truth-Referenzdatenmatrix],
  [AP 3.1: Spektrale Vorverarbeitung (SNV, Savitzky-Golay)],
  [C],
  [*R / A*],
  [Kuratierter, rauschbereinigter Trainings- und Testdatensatz],
  [AP 3.2: PyTorch-Implementierung der 18 Modellarchitekturen],
  [I],
  [*R / A*],
  [Modulares, offenes Code-Repository auf GPU-Cluster],
  [AP 3.3: Faktorielles Modelltraining & LOBO-Kreuzvalidierung],
  [I],
  [*R / A*],
  [Trainings- und Evaluierungsbericht],
  [AP 3.4: Multikriterielle Pareto-Auswahl],
  [C],
  [*R / A*],
  [*Meilenstein M3:* Dossier der ausgewählten Bestarchitektur],
  [AP 3.5: Chemische XAI-Validierung & Bandenattribution],
  [*R*],
  [*R / A*],
  [Attributionskarten korreliert mit biochemischen Banden],
  [AP 3.6: Edge-AI-Demonstrator auf Raspberry Pi 4/5],
  [I],
  [*R / A*],
  [Lauffähiger Edge-Prototyp zur Vor-Ort-Inferenz],
  [AP 4.1: Bilateraler Synthese-Workshop 2 (Deggendorf, Monat 11)],
  [*R*],
  [*R / A*],
  [Workshop-2-Synthesebericht & Publikationsmanuskripte],
  [AP 4.2: Gemeinsame Publikationen in Q1/Q2-Fachjournalen],
  [*R*],
  [*R / A*],
  [2 eingereichte gemeinsame Manuskripte],
  [AP 4.3: Ausarbeitung & Einreichung DFG-Minciencias-Antrag],
  [C],
  [*R / A*],
  [*Meilenstein M4:* Vollständiger 36-Monats-Verbundantrag]
)

== 8.2 Fünf-Punkte-Risikomanagementplan und Kontingenzprotokolle

#table(
  columns: (1.5fr, 0.8fr, 0.8fr, 2.4fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Identifiziertes Risiko],
    [Wahrsch.],
    [Auswirk.],
    [Präventive Vermeidungsstrategie],
    [Kontingenz- / Ausweichprotokoll]
  ),
  [R1: Chargenheterogenität und agronomisches Rauschen],
  [Mittel],
  [Mittel],
  [Beschaffung ausschließlich zertifizierter Single-Origin-Chargen mit bekanntem Erntedatum.],
  [Standard Normal Variate (SNV) und chargenspezifische hierarchische Latent-Space-Embeddings.],
  [R2: Instrumentelle FTIR-Baseline-Drift über 180 Tage],
  [Mittel],
  [Hoch],
  [Tägliche Polystyrol-Standardisierung und Background-Messung vor jeder Probe.],
  [Piecewise Direct Standardization (PDS) oder Normierung auf interne inerte Methylenbande ($2924 thin "cm"^(-1)$).],
  [R3: Numerische Steifigkeit bei Neural ODEs],
  [Hoch],
  [Hoch],
  [Lipschitz-Beschränkung der neuronalen Schichten und adaptive Zeitschrittweitenkontrolle.],
  [*Pronk & Anthony Fallback:* Umschalten auf Stufe 3B (PINN Soft Penalty mit Mamba) oder empirisches Backbone.],
  [R4: Latenz-/Speicherüberlauf auf Raspberry Pi],
  [Mittel],
  [Mittel],
  [Post-Training INT8-Quantisierung und strukturiertes Gewichts-Pruning.],
  [Fallback auf Stufe 1A (1D-CNN mit Mamba), welches Sub-Sekunden-Inferenz garantiert.],
  [R5: Verzögerungen bei Probenversand nach Deutschland],
  [Niedrig],
  [Mittel],
  [Vollständige physikalische Alterung und Messung verbleibt in Cartagena; digitaler Datentransfer.],
  [Kein physischer Probentransport nach Bayern zwingend erforderlich; Modellierung erfolgt rein digital.]
)

---

= 9. Skalierungs-Roadmap: Brücke zum DFG-Minciencias-Verbundantrag

Die 12-monatige BAYLAT-Anschubfinanzierung erfüllt eine unverzichtbare strategische Katalysatorfunktion, um die Wettbewerbsfähigkeit des deutsch-kolumbianischen Konsortiums für eine großvolumige Anschlussförderung sicherzustellen:

== 9.1 Phase 1: BAYLAT-Anschubförderung (Monate 1 – 12)
- *Budgetrahmen:* Max. $10.000 thin "EUR"$ zur Finanzierung gegenseitiger Forschungsaufenthalte, zweier Präsenz-Workshops (Cartagena und Deggendorf) sowie der wissenschaftlichen Vernetzung.
- *Kernleistungen:* Etablierung standardisierter Protokolle, Generierung des ersten longitudinalen 180-Tage-FTIR-Datensatzes Kolumbiens ($2.376$ Spektren), Kalibrierung gegen AOAC-Standardwerte, Erprobung des 18-Modell-Bereichs, Auswahl des Pareto-Optimums und Erstellung eines funktionierenden Raspberry-Pi-Prototyps.

== 9.2 Phase 2: Bilaterales Großprojekt DFG–Minciencias (Jahre 2 – 4 / 36 Monate)
Die im Monat 11–12 einzureichende Großantragsskizze (DFG-Sachbeihilfe auf deutscher Seite mit ca. $350.000 - 450.000 thin "EUR"$ sowie Minciencias Convocatoria Bilateral auf kolumbianischer Seite mit ca. $800 thin "Mio. COP"$) baut direkt auf den Resultaten auf und skaliert das Vorhaben in drei Dimensionen:

1. *Dimension 1: Hochauflösende chromatographische Metabolomik:*
   Einsatz von Ultra-High-Performance Liquid Chromatography gekoppelt mit hochauflösender Massenspektrometrie (UHPLC-Orbitrap-HRMS) zur exakten Identifikation individueller polyphenoler Oxidationsintermediate sowie Headspace-SPME-GC-MS zur Entschlüsselung flüchtiger Veralterungsvolatome bei Kaffee und Kakao.
2. *Dimension 2: Feldintegration und portable MEMS-Sensorik:*
   Übertragung der optimierten Algorithmen auf ultraportable MEMS-basierte Handheld-Infrarot- und Mikrospektrometer (z. B. MicroNIR), die direkt in Erzeugerkooperativen in Bolívar, Santander und Huila zur Qualitätsbestimmung vor Ort eingesetzt werden.
3. *Dimension 3: Transkontinentales IoT-Echtzeitmonitoring:*
   Installation autarker Edge-Sensorknoten in Frachtcontainern für kontinuierliche Frischevorhersagen während der realen Seereise nach Hamburg.

#callout(title: "Nachhaltigkeit der Partnerschaft")[
  Die Kooperation zwischen dem DIT und der UdC begründet eine dauerhafte transatlantische Forschungsachse. Durch die Einbindung von Nachwuchswissenschaftlern (Master- und Promotionsstudierende beider Hochschulen) wird der Grundstein für nachhaltige Doppelabschlüsse, Gastdozenturen und gemeinsame Publikationen in führenden internationalen Fachzeitschriften gelegt.
]

#bibliography("references.bib", title: [Literaturverzeichnis])
