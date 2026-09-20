#import "typst-scientific-report-template/template.typ": project, callout

#set text(lang: "en")

#show: project.with(
  title: [Physics-Informed Neural Differential Equations and Multimodal Spectral Sensing for Autonomous Freshness and Quality Forecasting in Colombian Agri-Food Matrices],
  subtitle: [Detailed Scientific Research Proposal – BAYLAT Seed Grant (OASys 2026)],
  objective: [
    To formulate, benchmark, and validate a physics-regularized deep learning framework coupling Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR) spectroscopy with standardized physicochemical reference assays across four high-value Colombian agri-food matrices: Fine & Aroma Cocoa (*Theobroma cacao L.*), Specialty Coffee (*Coffea arabica*), Artisanal Honey (*Apis mellifera*), and Virgin Coconut Oil (*Cocos nucifera*). By systematically evaluating an 18-candidate factorial architecture space (Spectral Encoders $times$ Temporal Backbones $times$ Thermodynamic Regularizers), the project reconciles the representational capacity of deep neural networks with the governing kinetics of chemical degradation, mitigating black-box spurious correlations and establishing a parsimonious, edge-deployable freshness monitoring system for rural bioeconomy value chains.
  ],
  authors: ("Deggendorf Institute of Technology (DIT)", "Universidad de Cartagena (UdC)"),
  date: "September 17, 2026",
  doc_id: "BAYLAT-EXP-EN-2026",
  header_title: "Scientific Research Proposal (BAYLAT)",
)

= 1. Executive Summary and Project Overview

Global agri-food supply chains are increasingly challenged by environmental fluctuations during post-harvest handling, storage, and transatlantic logistics. For tropical commodities originating in Latin America, environmental stress—particularly elevated temperature and relative humidity—drives complex, progressive physicochemical degradation cascades that degrade organoleptic quality, deplete bioactive secondary metabolites, and induce regulatory non-compliance.

This bilateral seed project establishes an international research partnership between the *Deggendorf Institute of Technology* (DIT, Bavaria, Germany) and the *Universidad de Cartagena* (UdC, Colombia). The joint initiative aims to develop, calibrate, and validate a novel, non-destructive, and computationally efficient paradigm for continuous degradation monitoring and shelf-life forecasting in four strategically essential Colombian agricultural matrices:
- Fine and Aroma Cocoa (*Theobroma cacao L.*)
- Specialty Highland Coffee (*Coffea arabica*)
- Artisanal Tropical Honey (*Apis mellifera*)
- Cold-Pressed Virgin Coconut Oil (*Cocos nucifera*)

Conventional quality assurance paradigms rely predominantly on end-point destructive wet chemistry or high-resolution chromatography (HPLC, GC-MS). While chemically rigorous, such analytical workflows require specialized instrumentation, toxic organic solvents, certified reference standards, and substantial per-sample costs ($150 - 300 "USD"$), rendering frequent longitudinal monitoring economically and logistically unfeasible for smallholder cooperatives and export logistics hubs. Conversely, mid-infrared spectroscopy—specifically Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR)—provides rapid, non-destructive, and reagent-free spectral acquisitions ($4000 - 650 "cm"^(-1)$) capturing the complete vibrational state of the sample.

However, extracting reliable kinetic degradation trajectories from continuous vibrational spectra remains a profound scientific and computational challenge. Traditional chemometrics (PCA, PLS regression) treats spectra as static, time-independent observations, while standard black-box deep learning architectures often learn spurious correlations linked to baseline instrumental drift or batch noise.

To overcome these barriers, this project establishes an *agile, highly viable experimental framework* executed at the Universidad de Cartagena, coupled with an *advanced 3-tier factorial deep learning exploration space* executed at the Deggendorf Institute of Technology:
1. *Empirical Ground Truth:* Accelerated aging across 6 controlled microclimatic regimes ($25, 40, 60 space degree "C"$; $60%, 75%$ RH) monitored longitudinally over 180 days across 12 certified batches (792 sample units, 2,376 ATR-FTIR spectra), paired with standardized wet-chemical and spectrophotometric assays (AOAC 965.33, AOAC 980.23, Folin-Ciocalteu, titratable acidity, and $degree "Brix"$).
2. *Factorial AI Architecture ($3 times 2 times 3 = 18$ Candidates):* Systematically exploring Spectral Encoders (1D-CNN, Spectral Transformer with SAM, Spectro-Chemical GNN), Temporal Backbones (Bi-LSTM/GRU, Selective State Space Models / Mamba), and Thermodynamic Kinetic Regularizers (Unconstrained Empirical, Arrhenius PINN soft-penalties, and Hierarchical Neural ODEs).
3. *Multi-Objective Pareto Selection:* Identifying the optimal architecture that balances generalization accuracy (Leave-One-Batch-Out $R^2 >= 0.90$), causal spectral interpretability ($S_"align" >= 0.75$), kinetic thermodynamic identifiability, and edge deployment feasibility on low-cost single-board computers (Raspberry Pi 4/5 latency $< 2.0 "s"$, RAM $< 500 "MB"$).

The 12-month BAYLAT seed funding finances essential transatlantic researcher exchanges, bilateral calibration workshops in Cartagena and Deggendorf, and joint data harmonization. This groundwork directly matures the experimental and algorithmic foundation required to submit a competitive, large-scale 3-year bilateral research grant under the *DFG-Minciencias Bilateral Programme*, wherein high-throughput metabolomics (LC-HRMS, GC-MS) and on-farm sensor deployment will be scaled.

#callout(title: "Strategic Vision")[
  By fusing cutting-edge Bavarian artificial intelligence with Colombia's extraordinary agro-ecological biodiversity, this project bridges empirical food chemistry and physics-informed computational intelligence, directly empowering rural agricultural cooperatives through accessible, automated quality assurance technologies.
]

= 2. Socioeconomic Context, Bioeconomy Framing, and Agricultural Relevance

Colombia represents one of the world's most biodiverse nations, possessing exceptional agro-ecological conditions characterized by high-altitude Andean cordilleras, Caribbean coastal alluvial plains, and tropical rainforest microclimates. Within the national bioeconomic framework (*Misión de Sabios de Colombia*), sustainable rural industrialization, post-harvest valorization, and agro-export diversification are critical strategic priorities for national peace consolidation and rural economic stabilization.

The four agri-food matrices investigated in this research proposal represent fundamental socio-economic pillars for over 600,000 rural farming families, regional producer cooperatives, and high-value export markets.

== 2.1 Fine and Aroma Cocoa (*Theobroma cacao L.*)
Cocoa cultivation supports over 52,000 smallholder farming families in Colombia, predominantly located in historical post-conflict territories such as the Sierra Nevada de Santa Marta, the Caribbean hinterlands (Montes de María), Santander, Arauca, and Huila. The International Cocoa Organization (ICCO) classifies approximately 95% of Colombian cocoa exports as "Fine and Aroma Cocoa" (Criollo and Trinitario cultivars), distinguished internationally by complex floral, fruity, and nutty sensory notes.

The economic premium of fine cocoa depends entirely on the biochemical integrity of its bioactive polyphenols (principally $(-)$-epicatechin, $(+)$-catechin, and procyanidin oligomers) and the lipid profile of cocoa butter (triacylglycerols POS, SOS, and POP). During post-fermentation drying, regional transport, and maritime transit to European processing plants, cocoa beans are frequently exposed to humid tropical environments, initiating enzymatic and non-enzymatic polyphenol condensation, astringency deterioration, and triacylglycerol lipolysis. Developing rapid, reagent-free spectral verification prevents quality discounting at international receiving terminals.

== 2.2 Specialty Highland Coffee (*Coffea arabica*)
Coffee is Colombia's flagship agricultural commodity, providing the primary livelihood for more than 540,000 farming households across the Andean biogeographic regions (Huila, Antioquia, Cauca, Nariño, Tolima). In contrast to commodity commercial coffees, Colombian specialty coffees (*Coffea arabica* varieties including Castillo, Caturra, Colombia, and Geisha) command prices two to four times higher based on rigorous Specialty Coffee Association (SCA) cupping scores ($>= 84 "points"$).

This sensory excellence is chemically governed by a delicate balance of chlorogenic acids (CGAs, predominantly 5-caffeoylquinic acid), sucrose, citric and malic acids, and delicate volatile aroma compounds trapped within surface diterpenes and lipids. Specialty coffee beans are notoriously sensitive to environmental aging: during warehouse storage and maritime container shipping, thermal and oxidative stress trigger chlorogenic acid hydrolysis, free radical lipid peroxidation, and Maillard staling, causing rapid loss of origin freshness and severe economic losses for growers.

== 2.3 Artisanal Tropical Honey (*Apis mellifera*)
Artisanal beekeeping (*Apis mellifera*) is an emerging, high-potential bioeconomic activity in Colombia's dry Caribbean forests (e.g., Montes de María, Canal del Dique) and montane cloud forests. Beekeeping delivers vital ecosystem pollination services while generating sustainable income for rural and indigenous communities.

However, commercialization of tropical honey is severely restricted by environmental perishability. Raw honey is an acidic, concentrated carbohydrate solution containing fructose, glucose, organic acids, and native enzymes (diastase, invertase). When exposed to warm tropical temperatures ($> 30 space degree "C"$) during storage, fructose undergoes rapid acid-catalyzed dehydration into *5-hydroxymethylfurfural (5-HMF)*, an internationally monitored indicator of heat damage and adulteration. Because the Codex Alimentarius establishes strict regulatory limits for 5-HMF (maximum $40 "mg/kg"$; tropical threshold $80 "mg/kg"$), unmonitored storage frequently causes export rejection.

== 2.4 Cold-Pressed Virgin Coconut Oil (*Cocos nucifera*)
Virgin Coconut Oil (VCO) represents a vital coastal bioeconomy asset for Afro-Colombian and indigenous communities along the Colombian Pacific (Guapi, Tumaco) and Caribbean coasts (San Bernardo Archipelago, San Andrés, Bolívar). Extracted exclusively through wet or cold-press mechanical processing without chemical refining, bleaching, or deodorizing, VCO is rich in medium-chain triacylglycerols (MCTs, $> 65%$), notably lauric acid (C12:0, $48 - 53%$).

VCO is highly prized in European natural cosmetics and functional nutraceutical markets. Despite its relatively high oxidative stability compared to polyunsaturated vegetable oils, VCO undergoes gradual auto-oxidation of trace unsaturated fatty acids (oleic and linoleic chains) and moisture-driven hydrolytic rancidity during maritime storage, yielding free fatty acids, conjugated dienes, and volatile secondary off-flavors.

#table(
  columns: (1.2fr, 1.4fr, 1.8fr, 1.8fr, 1.8fr),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black, top: 1pt + black) } else { (bottom: 0.5pt + luma(200)) },
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  inset: (x: 5pt, y: 6pt),
  [Agri-Food Matrix], [Botanical Origin & Cultivar], [Primary Producing Regions in Colombia], [Key Bioactive & Chemical Markers], [Socioeconomic & Bioeconomic Impact],
  [*Cocoa*], [*Theobroma cacao L.* (Criollo / Trinitario)], [Sierra Nevada, Montes de María, Santander, Arauca], [Flavan-3-ols (epicatechin), theobromine, POS/SOS butter], [52,000+ smallholder families; post-conflict peace crop; ICCO fine flavor export],
  [*Specialty Coffee*], [*Coffea arabica* (Castillo, Caturra, Geisha)], [Huila, Cauca, Nariño, Eje Cafetero, Tolima], [Chlorogenic acids (5-CQA), sucrose, surface lipids], [540,000+ farming families; national export emblem; SCA cup score $> 84$],
  [*Tropical Honey*], [*Apis mellifera* (Polyfloral tropical)], [Montes de María, Caribbean dry forest, Huila], [D-Fructose, D-Glucose, diastase, invertase, 5-HMF], [Rural community beekeeping; ecosystem pollination; strict Codex 5-HMF compliance],
  [*Virgin Coconut Oil*], [*Cocos nucifera* (Cold-pressed)], [Pacific Coast (Guapi, Tumaco), Caribbean Coast], [Lauric acid ($C_(12:0)$ MCTs), polyphenols, oleic acid], [Afro-Colombian coastal cooperatives; circular bioeconomy; European cosmetic demand],
)

= 3. Physicochemical Degradation Kinetics and Diagnostic Vibrational Spectroscopy

To formulate genuine physics-informed neural network architectures, the mathematical framework must be anchored directly in the molecular phenomena governing degradation in each agricultural matrix.

== 3.1 Fundamental Degradation Cascades and Reaction Mechanisms

=== 3.1.1 Cocoa: Polyphenol Condensation and Cocoa Butter Lipolysis
In cocoa beans, degradation is governed by two simultaneous cascades:
1. *Oxidative Polymerization of Flavan-3-ols:* Monomeric $(-)$-epicatechin and $(+)$-catechin undergo quinone-mediated oxidation driven by residual polyphenol oxidase activity and atmospheric triplet oxygen. The resulting ortho-quinones rapidly couple with neighboring phenolic units, condensing into high-molecular-weight brown tannins (phlobaphenes). This polymerization alters the aromatic vibrational resonance and depletes free hydroxyl groups.
2. *Triglyceride Hydrolysis:* In the presence of residual moisture, ester bonds of the dominant triacylglycerols (1-palmitoyl-2-oleoyl-3-stearoylglycerol, POS; 1,3-distearoyl-2-oleoylglycerol, SOS) undergo slow hydrolysis, liberating free fatty acids (FFAs) and partial glycerides, which decreases fat melting resistance and increases titratable fat acidity.

=== 3.1.2 Specialty Coffee: Chlorogenic Acid Hydrolysis and Surface Lipid Auto-Oxidation
The decline in coffee freshness during storage follows two primary molecular pathways:
1. *CGA Cleavage and Lactonization:* 5-caffeoylquinic acid (5-CQA) undergoes thermal hydrolysis, cleaving into free caffeic acid and quinic acid, followed by dehydration into bitter quinides (caffeoylquinic acid lactones). This reaction depletes intrinsic acidity and alters the ester vibrational fingerprint.
2. *Surface Lipid Peroxidation:* Surface coffee diterpenes (cafestol, kahweol) and triacylglycerols undergo free radical attack. Alkyl radicals react with oxygen to form lipid hydroperoxides ($"ROOH"$), which break down via $beta$-scission into volatile aldehydes (hexanal, (E)-2-nonenal) responsible for stale, cardboard off-flavors.

=== 3.1.3 Honey: Acid-Catalyzed Dehydration and Diastase Denaturation
Honey quality degradation is dominated by two temperature-dependent phenomena:
1. *Fructose Dehydration to 5-HMF:* In honey's naturally acidic environment ($"pH" approx 3.5 - 4.5$), hexose monosaccharides—predominantly D-fructose in its fructofuranose ring conformation—undergo enolization followed by acid-catalyzed elimination of three water molecules. This generates *5-hydroxymethylfurfural (5-HMF)* via the fructofuranosyl cation intermediate. The emergence of the conjugated furan ring and formyl group provides a distinct vibrational and spectrophotometric absorption profile.
2. *Enzymatic Denaturation:* Thermally induced conformational unfolding disrupts the catalytic sites of native diastase ($alpha$- and $beta$-amylases) and invertase ($alpha$-glucosidase), leading to irreversible catalytic inactivation.

=== 3.1.4 Virgin Coconut Oil: Primary Peroxidation, Secondary Cleavage, and trans-Isomerization
Although VCO is predominantly saturated ($> 90%$ saturated fatty acids), its degradation involves three critical stages:
1. *Primary Peroxidation:* Radical hydrogen abstraction occurs at the allylic methylene carbons of the minor oleic ($C_(18:1)$) and linoleic ($C_(18:2)$) fractions, generating conjugated diene hydroperoxides.
2. *Secondary Decomposition:* Homolytic decomposition of the labile peroxide bond ($-"O"-"O"-$, dissociation energy $approx 180 "kJ/mol"$) produces alkoxy radicals that undergo carbon-carbon bond cleavage, generating short-chain free fatty acids, aldehydes, and ketones.
3. *Geometric trans-Isomerization:* Thermal stress induces catalytic isomerization of naturally occurring cis-alkene double bonds into thermodynamically more stable trans-conformers.

== 3.2 Mathematical Formulation of Degradation Kinetics and Arrhenius Thermodynamics

The degradation reactions of quality markers in the target matrices follow formal chemical kinetics governed by differential equations:

$ (d C_j(t)) / (d t) = - k_j (T) dot [C_j (t)]^n $

where $C_j(t)$ denotes the concentration of the chemical constituent (e.g., polyphenols, chlorogenic acids), $n$ represents the empirical reaction order ($n in {0, 1, 2}$), and $k_j(T)$ is the temperature-dependent reaction velocity constant.

For zero-order reactions ($n = 0$), typical of early-stage 5-HMF accumulation in honey and free fatty acid liberation:
$ C_j (t) = C_(j, 0) + k_j (T) dot t $

For first-order degradation ($n = 1$), characteristic of polyphenol oxidation, chlorogenic acid loss, and diastase inactivation:
$ C_j (t) = C_(j, 0) dot exp(- k_j (T) dot t) $

The reaction rate constant $k_j(T)$ obeys the *Arrhenius law*:

$ k_j (T) = A_j dot exp(- E_(a, j) / (R dot T)) $

where $A_j$ is the pre-exponential frequency factor ($"s"^(-1)$ or $"concentration" dot "s"^(-1)$), $E_(a, j)$ is the activation energy of the specific chemical reaction ($"J/mol"$), $R = 8.314 "J" / ("mol" dot "K")$ is the universal gas constant, and $T$ is the absolute temperature in Kelvin ($"K"$).

Taking the natural logarithm yields the linearized thermodynamic relation:
$ ln(k_j (T)) = ln(A_j) - E_(a, j) / R dot 1 / T $

From verified kinetic literature and empirical studies in tropical food chemistry, the characteristic activation energy ranges for the four matrices are:
- *Cocoa Polyphenol Degradation:* $E_(a, "poly") = 45 - 65 "kJ/mol"$
- *Cocoa Butter FFA Hydrolysis:* $E_(a, "lip") = 60 - 85 "kJ/mol"$
- *Coffee Chlorogenic Acid Cleavage:* $E_(a, "CGA") = 55 - 75 "kJ/mol"$
- *Coffee Lipid Peroxidation:* $E_(a, "ox") = 65 - 90 "kJ/mol"$
- *Honey 5-HMF Formation:* $E_(a, "HMF") = 100 - 140 "kJ/mol"$ (exhibiting extreme temperature sensitivity with $Q_10 approx 3.5 - 4.2$)
- *Honey Diastase Inactivation:* $E_(a, "dia") = 85 - 110 "kJ/mol"$
- *Virgin Coconut Oil Hydroperoxidation:* $E_(a, "PV") = 70 - 95 "kJ/mol"$
- *Virgin Coconut Oil Hydrolysis (FFA):* $E_(a, "FFA") = 50 - 75 "kJ/mol"$

These thermodynamic parameters define strict physical boundary constraints within our physics-informed neural network loss functions, preventing neural weights from converging onto physically impossible kinetic rates.

== 3.3 Comprehensive ATR-FTIR Diagnostic Band Assignments ($4000 - 650 "cm"^(-1)$)

Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR) spectroscopy probes the fundamental vibrational transitions of chemical bonds across the mid-infrared region. Each targeted degradation mechanism manifests as specific spectral shifts, intensity decreases, or emergent absorbance bands.

The following table details the diagnostic vibrational band assignments across all four matrices:

#table(
  columns: (1.1fr, 1.4fr, 1.8fr, 1.8fr, 2.3fr),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black, top: 1pt + black) } else { (bottom: 0.5pt + luma(200)) },
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  inset: (x: 5pt, y: 6pt),
  [Matrix Target], [Wavenumber ($"cm"^(-1)$)], [Vibrational Mode & Bond], [Functional Chemical Group], [Degradation Behavior & Diagnostic Role],
  [*General*], [$3700 - 3100$ (broad)], [$nu("O-H")$ stretching], [Moisture, phenolic and sugar hydroxyls], [Broadens and shifts with moisture sorption/desorption and crystallization],
  [*Cocoa*], [$3400 - 3300$], [$nu("O-H")$ phenolic stretching], [Flavan-3-ol monomers (catechin/epicatechin)], [*Decreases progressively* as polyphenols condense into insoluble tannins],
  [*Cocoa*], [$2924, 2853$], [$nu_"as"("CH"_2), nu_s("CH"_2)$], [Aliphatic acyl chains of cocoa butter], [Stable internal standard for pathlength and vector normalization],
  [*Cocoa*], [$1742 - 1740$], [$nu("C=O")$ ester carbonyl], [Triglyceride ester bonds (POS, SOS)], [*Broadens with shoulder at $1715 "cm"^(-1)$* as free fatty acids accumulate],
  [*Cocoa*], [$1650 - 1630$], [$nu("C=O")$ amide I / heterocyclic], [Theobromine and caffeine ring system], [Thermostable internal reference marker for botanical cultivar identity],
  [*Cocoa*], [$1610 - 1515$], [$nu("C=C")$ aromatic skeletal stretch], [Catechin/epicatechin benzene ring vibrations], [*Decreases significantly* during quinone oxidative polymerization],
  [*Cocoa*], [$1165$], [$nu("C-O-C")$ ester stretching], [Glycerol backbone ester bonds], [Modulates with partial glyceride and diacylglycerol formation],
  [*Coffee*], [$3400$], [$nu("O-H")$ stretch], [Chlorogenic acids (5-CQA) and bound water], [*Decreases progressively* tracking thermal chlorogenic acid cleavage],
  [*Coffee*], [$2924, 2854$], [$nu_"as"("CH"_2), nu_s("CH"_2)$], [Surface diterpenes (cafestol, kahweol)], [Ratio to $1745 "cm"^(-1)$ shifts during bean surface lipid oxidation],
  [*Coffee*], [$1745$], [$nu("C=O")$ ester carbonyl], [Coffee triacylglycerol surface lipids], [*Broadens with shoulder emergence* tracking staling lipid hydrolysis],
  [*Coffee*], [$1710 - 1695$], [$nu("C=O")$ carboxylic acid stretch], [Cleaved free caffeic acid and lipid FFAs], [*Emerges and increases* as acidity rises and rancidity develops],
  [*Coffee*], [$1655$], [$nu("C=O")$ heterocyclic amide], [Caffeine heterocyclic nitrogen ring], [Thermostable internal standard across thermal aging regimes],
  [*Coffee*], [$1380 - 1150$], [$nu("C-O"), delta("O-H")$], [Quinic and caffeic acid ester moieties], [*Decreases steadily*; primary marker for chlorogenic acid loss],
  [*Coffee*], [$1050 - 1030$], [$nu("C-O")$ carbohydrate stretch], [Sucrose and structural hemicelluloses], [Decreases with non-enzymatic caramelization and staling],
  [*Honey*], [$3300 - 3280$], [$nu("O-H")$ H-bonded stretching], [Aqueous hexose hydrogen-bonded network], [Correlates with water activity ($a_w$) and free moisture content],
  [*Honey*], [$2930$], [$nu("C-H")$ aliphatic stretch], [Pyranose and furanose ring carbons], [Stable structural marker utilized for baseline vector scaling],
  [*Honey*], [$1680 - 1670$], [$nu("C=O")$ conjugated carbonyl stretch], [*5-Hydroxymethylfurfural (5-HMF)* furan], [*Critical emergent diagnostic band*: grows monotonically with heat damage],
  [*Honey*], [$1645 - 1640$], [$delta("O-H")$ water bend / $nu_"as"("COO"^-)$], [Hydration shell water and gluconic acid], [Increases with spontaneous fermentation and free acidity rise],
  [*Honey*], [$1150 - 900$], ["Sugar Fingerprint Region"], [Fructose ($1055 "cm"^(-1)$), Glucose ($1030 "cm"^(-1)$)], [Ratio $A_1055 / A_1030$ monitors sugar balance and crystallization onset],
  [*Honey*], [$920$], [Pyranose ring skeletal deformation], [$alpha$-D-glucopyranose conformer], [Sharpens noticeably upon spontaneous glucose monohydrate crystallization],
  [*VCO*], [$3470$], [$nu("O-O-H")$ overtone / stretch], [*Hydroperoxides ($"ROOH"$)*], [*Increases during primary oxidation*; direct correlate of peroxide value],
  [*VCO*], [$3005$], [$nu(="C-H")$ cis-alkene stretch], [Unsaturated acyl chains (oleic/linoleic)], [*Decreases continuously* as radical oxidation consumes cis-double bonds],
  [*VCO*], [$2922, 2852$], [$nu_"as"("CH"_2), nu_s("CH"_2)$], [Saturated lauric/myristic methylene chains], [Stable backbone reference for optical thickness normalization],
  [*VCO*], [$1746$], [$nu("C=O")$ ester carbonyl], [Saturated triacylglycerol esters (MCTs)], [*Band width broadens*; shifts toward $1711 "cm"^(-1)$ as FFA accumulates],
  [*VCO*], [$1720 - 1711$], [$nu("C=O")$ secondary acid/ketone], [Aldehydes, ketones, and free lauric acid], [*Increases during secondary rancidity* and moisture-driven lipolysis],
  [*VCO*], [$1465, 1377$], [$delta("CH"_2)$ scissor, $delta("CH"_3)$ symmetric], [Aliphatic chain bending vibrations], [Internal structural invariant standard across temperature regimes],
  [*VCO*], [$1160, 1148, 1112$], [$nu("C-O")$ ester triplet], [Triglyceride C-O stretching modes], [Triplet peak ratio distorts with mono- and diacylglycerol formation],
  [*VCO*], [$967$], [$delta(="C-H")$ out-of-plane trans-alkene], [*trans-Isomerized double bonds*], [*Diagnostic emergent band*: increases during thermal oxidative stress],
  [*VCO*], [$722$], [$rho("CH"_2)_n$ rocking ($n >= 4$)], [Aliphatic lauric chain skeleton], [Monitors crystalline lattice packing and phase transitions],
)

= 4. Analytical Methodology and Standardized Reference Assays

A core methodological strength of this proposal is the decoupling of high-cost instrumental chromatography from the initial 12-month grant phase, anchoring model training instead in standardized, internationally validated wet-chemical and spectrophotometric reference assays.

== 4.1 Standardized Quality Control Protocols (AOAC / ISO / Codex)

Every longitudinal sampling interval at the Universidad de Cartagena triggers a dual analytical protocol: an aliquot is scanned on the temperature-controlled ATR-FTIR diamond crystal, and an identical split aliquot is analyzed via the corresponding standardized reference protocol.

=== 4.1.1 Cocoa Reference Assays
1. *Total Polyphenols by Folin-Ciocalteu Micro-Assay:*
   - *Sample Preparation:* Defatting of ground cocoa powder ($1.00 "g"$) with petroleum ether, followed by ultrasonic-assisted extraction with acetone:water ($70:30 "v/v"$) containing $0.5% "v/v"$ glacial acetic acid.
   - *Assay Protocol:* Phenolic extract is reacted with Folin-Ciocalteu phosphomolybdic-phosphotungstic reagent in sodium carbonate ($"Na"_2"CO"_3$, $7.5% "w/v"$) alkaline buffer.
   - *Quantification:* Spectrophotometric absorbance measurement at $lambda = 760 "nm"$ against a gallic acid calibration curve ($10 - 200 "mg/L"$, $R^2 >= 0.998$). Results are expressed as milligrams of gallic acid equivalents per gram of defatted dry matter ($"mg GAE/g"$). Fresh unaged cocoa typically displays $80 - 120 "mg GAE/g"$, dropping to $30 - 50 "mg GAE/g"$ under advanced degradation.
2. *Cocoa Butter Free Fatty Acid (Acid Value) Titration:*
   - *Protocol:* AOAC Official Method 940.28 / ISO 660. Solvent-extracted butter is dissolved in neutralized ethanol:diethyl ether ($1:1 "v/v"$) and titrated against standardized $0.1 "N KOH"$ using phenolphthalein indicator. Results are reported as percentage free fatty acids calculated as oleic acid ($"MW" = 282.46 "g/mol"$). International limit: $<= 1.75%$.

=== 4.1.2 Specialty Coffee Reference Assays
1. *Titratable Acidity and pH Potentiometry:*
   - *Protocol:* AOAC Official Method 920.92. Aqueous extraction of finely ground coffee ($10.0 "g"$ in $100 "mL"$ freshly boiled deionized water, filtered through Whatman No. 4 filter paper). Potentiometric titration with standardized $0.1 "N NaOH"$ to an exact stoichiometric end-point of $"pH" = 8.20$ using a calibrated combination glass electrode. Expressed as $"mL" 0.1 "N NaOH"$ per $100 "g"$ dry solids.
2. *UV-Vis Maillard Browning and Staling Index:*
   - *Protocol:* Filtered aqueous coffee extracts are diluted and spectrophotometrically analyzed at $280 "nm"$ (unaltered protein and phenolic precursors) and $420 "nm"$ (brown melanoidin polymers). The absorbance ratio $A_420 / A_280$ serves as a quantitative index of thermal staling.
3. *Gravimetric Moisture Content:*
   - *Protocol:* Two-stage vacuum oven drying at $105 degree "C"$ to constant weight according to ISO 6673. Commercial threshold for export green coffee: $10.0 - 12.5%$.

=== 4.1.3 Honey Reference Assays
1. *5-Hydroxymethylfurfural (5-HMF) by Dual-Wavelength UV Spectrophotometry:*
   - *Protocol:* AOAC Official Method 980.23 / Codex Alimentarius Standard 12-1981 (Winkler / White method). Honey ($5.00 "g"$) is dissolved in deionized water, clarified with Carrez I and Carrez II reagents, and filtered. The solution is split into two equal aliquots: Aliquot 1 receives water (sample solution), while Aliquot 2 receives $0.20% "w/v"$ sodium bisulfite ($"NaHSO"_3$). Bisulfite selectively reduces the conjugated carbonyl chromophore of 5-HMF, creating an exact, matrix-matched optical blank.
   - *Measurement & Calculation:* Absorbance is recorded at $lambda_1 = 284 "nm"$ (5-HMF absorption maximum) and $lambda_2 = 336 "nm"$ (background turbidity correction):
     $ "HMF" ("mg/kg") = ((A_284 - A_336) times 149.7 times 5) / (m_"sample" ("g")) $
   - *Regulatory Limits:* Codex Alimentarius threshold: $<= 40 "mg/kg"$ ($<= 80 "mg/kg"$ for tropical origin honey).
2. *Diastase Activity (Phadebas Photometric Assay):*
   - *Protocol:* Insoluble blue-dyed crosslinked starch polymer tablets (Phadebas). Native honey diastase hydrolyzes the substrate, releasing water-soluble blue chromophores into the supernatant, measured spectrophotometrically at $lambda = 620 "nm"$ against a substrate blank. Results are expressed in Schade units (Diastase Number, DN). Codex minimum: $>= 8 "DN"$.
3. *Soluble Solids and Moisture by Refractometry ($degree "Brix"$):*
   - *Protocol:* AOAC Official Method 969.38 using an Abbe digital refractometer with automatic temperature compensation to $20.0 degree "C"$. Refractive index is converted to moisture content using the Chataway table. Codex standard: moisture $<= 20.0%$.

=== 4.1.4 Virgin Coconut Oil Reference Assays
1. *Peroxide Value (PV) by Iodometric Titration:*
   - *Protocol:* AOAC Official Method 965.33 / ISO 3960. Oil ($5.00 "g"$) is dissolved in $30 "mL"$ glacial acetic acid:chloroform ($3:2 "v/v"$) and reacted with saturated potassium iodide ($"KI"$). Hydroperoxides quantitatively oxidize iodide to elemental iodine:
     $ "ROOH" + 2 "I"^(-) + 2 "H"^(+) arrow.r "ROH" + "I"_2 + "H"_2"O" $
     Liberated iodine is titrated with standardized $0.01 "N sodium thiosulfate"$ ($"Na"_2"S"_2"O"_3$) in the presence of $1% "w/v"$ starch indicator solution. Expressed as milliequivalents of active oxygen per kilogram of oil ($"meq" "O"_2/"kg"$). Codex Stan 210 limit for VCO: $<= 15 "meq" "O"_2/"kg"$.
2. *Free Fatty Acids (FFA) / Acid Value:*
   - *Protocol:* ISO 660 / AOAC 940.28. Volumetric titration in neutralized 2-propanol with $0.1 "N KOH"$, calculated as percentage lauric acid ($"MW" = 200.32 "g/mol"$). Codex threshold for VCO: $<= 0.20%$ ($"Acid Value" <= 0.56 "mg KOH/g"$).
3. *Specific UV Extinction for Conjugated Dienes ($K_232$) and Trienes ($K_270$):*
   - *Protocol:* ISO 3656 / IUPAC Method 2.505. Spectrophotometric extinction of $1% "w/v"$ oil solution in optical-grade iso-octane measured in a quartz cuvette ($1 "cm"$ pathlength) at $232 "nm"$ (conjugated dienes) and $270 "nm"$ (conjugated trienes and secondary carbonylic cleavage products).

== 4.2 Strategic Analytical Bridge: Seed Grant Feasibility vs. High-Resolution Chromatography

A frequent pitfall in international research applications is over-promising resource-intensive analytical techniques during short seed grant periods. High-resolution chromatography—specifically High-Performance Liquid Chromatography coupled with Diode Array Detection (HPLC-DAD), Gas Chromatography-Mass Spectrometry (GC-MS), and Liquid Chromatography-High Resolution Orbitrap Mass Spectrometry (LC-HRMS)—requires specialized chromatography columns, expensive deuterated internal standards, ultrapure chromatographic solvents (acetonitrile, methanol, hexane), and helium carrier gases.

Across our 792 experimental units, running comprehensive HPLC and GC-MS profiling would incur analytical consumables exceeding $150,000 "USD"$, vastly eclipsing the entire BAYLAT seed grant budget ($10,000 "EUR"$, which is strictly dedicated to mobility and networking).

By establishing standard AOAC/ISO wet-chemical assays as the calibrated ground truth during the 12-month BAYLAT period, this project achieves three strategic advantages:
1. *Flawless Operational Viability:* All wet-chemical assays utilize reagents, glassware, and UV-Vis spectrophotometers already operational and fully validated within the Chemistry Department at the Universidad de Cartagena.
2. *Strict Regulatory Alignment:* AOAC, ISO, and Codex Alimentarius methods represent the exact legal criteria utilized by international food control authorities and import customs.
3. *The DFG-Minciencias Bridge:* High-resolution chromatographic metabolomics (untargeted LC-HRMS for polyphenol profiling and SPME-GC-MS for volatile headspace aroma mapping) is strategically and realistically structured as *Work Package 2 of the subsequent 36-month DFG-Minciencias research proposal*, creating a compelling, natural scaling trajectory.

= 5. Critical State of the Art, Related Work, and Methodological Research Gaps

Recent scientific literature reflects significant interest in applying vibrational spectroscopy and machine learning to food authentication and quality assessment. However, a rigorous critical analysis reveals decisive methodological gaps that this project directly addresses.

== 5.1 Vibrational Spectroscopy and Conventional Chemometrics in Food Authenticity
The vast majority of published studies deploying Fourier-Transform Infrared (FTIR) or Near-Infrared (NIR) spectroscopy in food analysis focus exclusively on *static classification tasks*, such as detecting adulteration or certifying geographical origin @feng2021applicationofvisibleinfrared, @grundy2025reviewofcurrent. For instance, Boadu @boadu2024developinganovel evaluated handheld NIR sensors for on-site coffee quality assessment, yet relied on conventional chemometric techniques (PCA, PLS-DA) that evaluate each sample as an isolated snapshot in time.

Similarly, Widiarto et al. @widiarto2026detectionofadulteration utilized FTIR spectroscopy combined with multivariate discriminant analysis to detect adulteration in commercial coffee products, demonstrating excellent group separation based on caffeine and carbohydrate absorption bands. In edible oils, Grundy et al. @grundy2025reviewofcurrent provided a comprehensive review of spectroscopic screening for oil authenticity, highlighting that while vibrational techniques offer unmatched speed and reagent-free operation, traditional chemometric calibrations suffer severe performance degradation when applied across different harvest years, processing batches, or storage environments due to baseline drift and unmodeled environmental variance.

== 5.2 Deep Learning Paradigms in Spectral Analysis: 1D-CNNs and Attention Transformers
To move beyond linear chemometric models, researchers have applied deep neural networks to spectral processing. Passos @passos2605convolutionalneuralnetworks conducted a foundational critical appraisal of Convolutional Neural Networks (CNNs) in Vis-NIR chemometrics. Passos demonstrated that directly transferring computer vision 2D-CNN topologies to 1D spectral data often leads to contradictory results and severe overfitting. Effective 1D-CNN architectures require *conditional design*: convolutional filter kernel widths must be strictly matched to the physical Full Width at Half Maximum (FWHM) of vibrational absorbance bands ($Delta nu approx 10 - 50 "cm"^(-1)$), combined with chemometric normalization layers (Standard Normal Variate, SNV) to preserve physical peak continuity.

More recently, Upadhyay & Chaudhary @upadhyay2026enhancingspectralanalysis developed an advanced multimodal deep learning framework incorporating a Spectral Attention Mechanism (SAM) for detecting adulteration in clarified butterfat (ghee) via FTIR spectroscopy. Their model achieved 99.6% classification accuracy and demonstrated edge deployment feasibility on a Raspberry Pi single-board computer. Crucially, however, Upadhyay & Chaudhary emphasized a key interpretability caveat: *while self-attention heatmaps highlight regions of high statistical covariance, algorithmic attention does not equal chemical causality*. Without validation against certified wet-chemical markers, attention mechanisms risk locking onto light scattering or optical interference artifacts rather than genuine functional group transitions.

== 5.3 Physics-Informed Machine Learning (PIML) and the Pronk-Anthony Trade-Off
To address the opacity and unreliability of black-box neural networks, Physics-Informed Machine Learning (PIML) embeds governing differential equations directly into the model loss function. Perré @perre2025towardmechanisticmodels demonstrated that augmenting mechanistic models with Physics-Informed Neural Networks (PINNs) in biomaterial drying simulations enables reliable extrapolation beyond the training domain, ensuring thermodynamic consistency. However, Perré's framework operated exclusively on simulated continuum heat and mass transfer grids, completely detached from experimental vibrational spectra.

The pivotal breakthrough and cautionary lesson regarding physical constraints in food processing was delivered by *Pronk & Anthony (2026)* @pronk2026neuralnetworkplacementin in *Scientific Reports*. In a comprehensive study of 221 industrial coffee roasting batches, the authors systematically compared empirical neural networks against mechanistic ODE models repaired via physics-informed machine learning. Their startling empirical finding revealed:
- A compact, empirical feedforward neural network achieved an exceptional prediction accuracy of $R^2 = 0.97$ while requiring 3 to 20 times fewer parameters.
- Conversely, rigidly constrained physical ODE models achieved vastly inferior accuracies ($R^2 = 0.70 - 0.94$), suffering from severe optimization stiffness, numerical instability, and systematic bias.
- *Core Methodological Takeaway:* When the underlying physical equations suffer from incomplete parameter identifiability or structural mismatch with the biological matrix, *rigid physical constraints degrade performance*. Physical laws must therefore be incorporated as *soft, tunable regularizers (PINN soft-penalties)* or residual drift corrections rather than hard mathematical bottlenecks.

== 5.4 Selective State-Space Models (Mamba / ASGMamba) for Long Sequence Dynamics
Modeling continuous longitudinal degradation requires processing temporal sequences of high-dimensional spectral vectors. While Recurrent Neural Networks (LSTM, GRU) have served as standard sequence models, their step-by-step sequential recurrence prevents parallel GPU training and incurs gradient vanishing over extended horizons. Standard Transformers with Multi-Head Self-Attention exhibit quadratic computational and memory complexity ($cal(O)(L^2)$ with sequence length $L$), making them computationally burdensome for long time series on edge hardware.

To solve this, Li et al. @li2026asgmambaadaptivespectral introduced *ASGMamba* (Adaptive Spectral Gating Mamba), establishing that Selective State Space Models (SSMs) achieve linear computational complexity ($cal(O)(L)$) in both compute and memory. By integrating an adaptive spectral gating block, ASGMamba effectively filters high-frequency instrumentation noise while modeling long-range temporal dependencies across multivariate time series, providing an ideal architectural backbone for continuous food degradation forecasting. In parallel, Felizzato et al. @felizzato2025datafusionfor demonstrated the power of multi-block data fusion across analytical sensors, underscoring the necessity of fusing spectral inputs with external environmental covariates ($T$, RH).

== 5.5 Synthesis of Unaddressed Scientific Gaps

A synthesis of the international state of the art reveals four critical, unaddressed scientific gaps:
1. *The Longitudinal Chemometric Void:* Existing food FTIR applications are overwhelmingly cross-interional (adulteration/origin classification). There is a near-total absence of harmonized, multi-condition longitudinal spectral time series tracking real-time storage decay in tropical matrices.
2. *The Spectral-Physical Disconnection:* Physics-informed models in food engineering (e.g., drying, roasting) operate on temperature/moisture grids without spectral inputs, while spectral deep learning models remain entirely black-box, ignoring Arrhenius thermodynamics.
3. *The Identifiability-Flexibility Dilemma:* Following Pronk & Anthony @pronk2026neuralnetworkplacementin, no published framework has systematically benchmarked soft Arrhenius penalty PINNs against hierarchical Neural ODEs and empirical baselines across vibrational spectra.
4. *Absence of Multi-Matrix Benchmarking on Edge Hardware:* No prior study has validated a multi-objective Pareto selection pipeline evaluating generalization accuracy, causal spectral interpretability, and edge AI execution ($< 2.0 "s"$ latency on Raspberry Pi) across multiple high-value commodities.

#callout(title: "Research Void Addressed by this Proposal")[
  This proposal establishes the first unified framework integrating longitudinal ATR-FTIR time series with an 18-model factorial AI architecture (Passos 1D-CNN / Upadhyay SAM Transformer / GNN $times$ LSTM / Mamba $times$ Arrhenius PINN / Neural ODEs), validated against AOAC ground-truth assays and benchmarked for edge deployment on low-cost hardware.
]

= 6. 3-Tier Factorial Architectural Exploration Space ($3 times 2 times 3 = 18$ Candidates)

Rather than arbitrarily selecting a single neural topology, the project formulates a rigorous, multi-tiered factorial design space comprising *18 candidate architectures* ($3 "Encoders" times 2 "Backbones" times 3 "Regularizers"$).

== 6.1 Dual Formulation: Self-Supervised Spectral Forecasting & Kinetic State Estimation

The computational framework models degradation as a dual-task learning problem:
1. *Self-Supervised Spectral Forecasting:* Given a historical sequence of preprocessed ATR-FTIR spectra $bold(X)_(0:t) = {bold(x)(t_0), bold(x)(t_1), ..., bold(x)(t)} in RR^(tau times W)$ recorded at timepoints $tau$ across $W = 1,738$ spectral channels ($4000 - 650 "cm"^(-1)$ at $2 "cm"^(-1)$ resolution), under environmental conditions $bold(u)(t) = [T(t), "RH"(t)]^top$, predict the future spectral state:
   $ hat(bold(x))(t + Delta t) = cal(M)_"spectral"(bold(X)_(0:t), bold(u)_(t:t+Delta t); bold(theta)) $
2. *Kinetic Chemical State Estimation:* Simultaneously, map the latent temporal representation $bold(h)(t)$ to the quantitative degradation parameters $hat(bold(c))(t) = [hat(C)_1(t), ..., hat(C)_M(t)]^top$ corresponding to calibrated AOAC/ISO wet-chemical values (Peroxide Value, FFA, 5-HMF, Total Polyphenols):
   $ hat(bold(c))(t) = cal(G)_"chem"(bold(h)(t); bold(phi)) $

== 6.2 Tier 1: Spectral Encoders (Dimension: Feature Extraction across Wavenumbers)

The spectral encoder transforms raw 1D spectral vectors $bold(x)(t) in RR^W$ into a dense latent representation $bold(z)(t) in RR^d$ ($d = 128$):
- *Option 1A — Multiscale 1D-CNN with Chemometric LayerNorm (Passos 2026 @passos2605convolutionalneuralnetworks):*
  Composed of parallel 1D convolutional branches with kernel widths $k in {7, 15, 31, 63}$ spectral points, corresponding to optical bandwidths $Delta nu approx 14, 30, 62, 126 "cm"^(-1)$. This directly matches the physical absorption band widths of sharp stretching modes ($20 - 40 "cm"^(-1)$) and broad hydrogen-bonded modes ($100 - 200 "cm"^(-1)$). Spatial pooling is replaced with Chemometric Layer Normalization and residual skip connections, ensuring strict baseline-shift invariance without loss of peak positions.
- *Option 1B — Spectral Transformer with Spectral Attention Mechanism (SAM, Upadhyay & Chaudhary 2026 @upadhyay2026enhancingspectralanalysis):*
  Employs 4 multi-head self-attention layers with 8 heads and learned 1D sinusoidal positional encodings. The Spectral Attention Mechanism computes all-to-all attention across spectral tokens:
  $ "Attention"(bold(Q), bold(K), bold(V)) = "softmax"((bold(Q) bold(K)^top) / sqrt(d_k)) bold(V) $
  This captures non-local couplings between fundamental vibrational modes and their overtone/combination bands (e.g., ester carbonyl $nu("C=O")$ at $1746 "cm"^(-1)$ and its hydroperoxide overtone at $3470 "cm"^(-1)$).
- *Option 1C — Spectro-Chemical Graph Neural Network (GNN):*
  Formulates the spectrum as a molecular graph $cal(G) = (cal(V), cal(E))$, where nodes $v_i in cal(V)$ ($i = 1, ..., 8$) represent aggregated functional vibrational bands (phenolic OH, aliphatic CH, ester C=O, amide/theobromine, aromatic C=C, 5-HMF furan, carbohydrate C-O, trans-alkene), and edges $e_(i j) in cal(E)$ encode established chemical reaction couplings and empirical spectral covariances ($rho > 0.70$). Node features are updated via Graph Attention Layers (GAT).

== 6.3 Tier 2: Temporal Sequence Backbones (Dimension: Time-Series Dynamics)

The temporal backbone processes the sequence of latent spatial vectors ${bold(z)(t_0), ..., bold(z)(t)}$ into a contextual hidden state $bold(h)(t)$:
- *Option 2A — Gated Recurrent Network (Bi-LSTM / GRU):*
  A 2-layer Bidirectional Long Short-Term Memory network ($d_h = 128$) with forget-gate bias initialization set to $1.0$ and recurrent dropout of $0.20$. Serves as the established empirical baseline for short-to-medium sequence modeling.
- *Option 2B — Selective State Space Model (Mamba / ASGMamba, Li et al. 2026 @li2026asgmambaadaptivespectral):*
  Parameterized by continuous-time state equations discretized via Zero-Order Hold (ZOH):
  $ bold(h)_t = bold(macron(A))_t bold(h)_(t-1) + bold(macron(B))_t bold(z)_t, quad bold(y)_t = bold(C)_t bold(h)_t $
  where state matrices $(bold(B), bold(C), bold(Delta))$ are input-dependent selective projections. Mamba achieves linear complexity $cal(O)(L)$ in sequence length $L$, enabling fast parallel associative prefix scans during GPU training and constant-time $cal(O)(1)$ recurrence during edge inference on Raspberry Pi hardware.

== 6.4 Tier 3: Physical Regularization (Dimension: Chemical Plausibility)

- *Option 3A — Unconstrained Empirical Baseline:*
  Trained solely on supervised mean squared error losses:
  $ cal(L)_"emp" = 1 / B sum_(i=1)^B norm(hat(bold(x))_i - bold(x)_i)^2 + alpha / B sum_(i=1)^B sum_(j=1)^M ((hat(C)_(i,j) - C_(i,j))^2) / sigma_j^2 $
  where $sigma_j^2$ is the variance of chemical assay $j$. Represents the upper bound of unconstrained curve fitting.
- *Option 3B — Physics-Informed Neural Network (PINN) with Arrhenius Soft-Penalties:*
  Augments the loss function with dynamically weighted physical penalty terms:
  $ cal(L)_"total" = cal(L)_"emp" + lambda_"kin" cal(L)_"kin" + lambda_"mono" cal(L)_"mono" $
  where the kinetic residual enforces Arrhenius temperature dependence:
  $ cal(L)_"kin" = 1 / N sum_(j=1)^M sum_(k=1)^N norm( (d hat(C)_(j,k)) / (d t) + A_j exp(- E_(a,j) / (R T_k)) dot [hat(C)_(j,k)]^(n_j) )^2 $
  and $cal(L)_"mono" = sum_j norm("ReLU"( - (d hat(C)_j) / (d t) ))^2$ enforces thermodynamic irreversibility for accumulation markers (5-HMF in honey, free fatty acids in oil).
  *Mitigation of Pronk & Anthony (2026) Failure:* Penalty weights $lambda_"kin"$ and $lambda_"mono"$ are dynamically adjusted using GradNorm balancing ($10^(-3) <= lambda <= 10^(-1)$), preventing gradient pathology and ensuring the model does not sacrifice empirical precision for rigid mathematical adherence.
- *Option 3C — Hierarchical Neural Ordinary Differential Equations (Neural ODEs):*
  Models continuous-time latent dynamics via a neural vector field:
  $ (d bold(z)(t)) / (d t) = bold(f)_"mech"(bold(z)(t), T(t); bold(kappa)_m) + bold(g)_theta (bold(z)(t), t, T(t), "RH"(t)) $
  where $bold(f)_"mech"$ represents an analytical stoichiometric kinetic drift vector parameterized by matrix parameters $bold(kappa)_m$, and $bold(g)_theta$ is a neural network learning residual microclimatic perturbations. Integration is performed using adaptive Dormand-Prince Runge-Kutta (RK45) solvers with adjoint sensitivity backpropagation.

== 6.5 Factorial Model Inventory (18 Model Configurations)

The following matrix documents the complete 18-model evaluation space:

#table(
  columns: (0.8fr, 1.3fr, 1.3fr, 1.8fr, 1.8fr),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black, top: 1pt + black) } else { (bottom: 0.5pt + luma(200)) },
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  inset: (x: 5pt, y: 5pt),
  [Model ID], [Tier 1: Encoder], [Tier 2: Backbone], [Tier 3: Regularizer], [Architectural Rationale & Core Hypothesis],
  [M01], [1D-CNN (Passos)], [Bi-LSTM], [Empirical Baseline], [Standard deep chemometrics benchmark with local convolutional feature extraction],
  [M02], [1D-CNN (Passos)], [Bi-LSTM], [PINN Soft-Penalty], [Tests if soft Arrhenius penalties improve 1D-CNN generalization across unseen batches],
  [M03], [1D-CNN (Passos)], [Bi-LSTM], [Neural ODE], [Continuous latent integration coupled with multiscale band convolutions],
  [M04], [1D-CNN (Passos)], [Mamba SSM], [Empirical Baseline], [Linear-time $cal(O)(L)$ sequence modeling with convolutional spectral feature filtering],
  [M05], [1D-CNN (Passos)], [Mamba SSM], [PINN Soft-Penalty], [*Leading Parsimonious Candidate*: high edge efficiency, robust physical regularization],
  [M06], [1D-CNN (Passos)], [Mamba SSM], [Neural ODE], [Continuous ODE drift parameterized over Mamba state representations],
  [M07], [Transformer (SAM)], [Bi-LSTM], [Empirical Baseline], [Captures non-local harmonic/overtone attention coupled with recurrent dynamics],
  [M08], [Transformer (SAM)], [Bi-LSTM], [PINN Soft-Penalty], [Aligns multi-head attention saliency with Arrhenius kinetic rate constraints],
  [M09], [Transformer (SAM)], [Bi-LSTM], [Neural ODE], [Evaluates latent ODE trajectories on self-attention token representations],
  [M10], [Transformer (SAM)], [Mamba SSM], [Empirical Baseline], [ASGMamba-style global spectral attention combined with linear-time temporal scan],
  [M11], [Transformer (SAM)], [Mamba SSM], [PINN Soft-Penalty], [Dual attention-state-space modeling with thermodynamic penalty regularizers],
  [M12], [Transformer (SAM)], [Mamba SSM], [Neural ODE], [High-capacity hybrid foundation architecture for multi-matrix time-series forecasting],
  [M13], [Spectro-GNN], [Bi-LSTM], [Empirical Baseline], [Explicit graph topology structured on functional molecular absorption bands],
  [M14], [Spectro-GNN], [Bi-LSTM], [PINN Soft-Penalty], [Molecular graph nodes regularized directly by stoichiometric Arrhenius laws],
  [M15], [Spectro-GNN], [Bi-LSTM], [Neural ODE], [Continuous graph neural differential equations over functional vibrational nodes],
  [M16], [Spectro-GNN], [Mamba SSM], [Empirical Baseline], [Graph message passing combined with selective state space temporal progression],
  [M17], [Spectro-GNN], [Mamba SSM], [PINN Soft-Penalty], [Mechanistic graph topology with linear temporal scaling and kinetic soft loss],
  [M18], [Spectro-GNN], [Mamba SSM], [Neural ODE], [Fully mechanistic graph continuous dynamical system (maximum theoretical complexity)],
)

= 7. Accelerated Aging Experimental Design and Data Acquisition Protocol

The empirical foundation of the project is executed at the laboratories of the Universidad de Cartagena, generating the first harmonized, multi-matrix longitudinal dataset in Latin America.

== 7.1 Sample Origin, Traceability, and Botanical Certification
To ensure rigorous traceability and eliminate confounding cultivar noise:
- *Cocoa:* Three independent primary batches of certified Criollo and Trinitario beans ($10 "kg"$ per batch) sourced from farmer associations in the Sierra Nevada de Santa Marta and Santander.
- *Coffee:* Three independent batches ($10 "kg"$ each) of single-origin specialty green coffee (*Coffea arabica*, Castillo and Caturra varieties, washed process, SCA score $> 84$) sourced from Huila and Montes de María.
- *Honey:* Three independent harvests ($5 "kg"$ each) of raw, unpasteurized polyfloral honey obtained from artisanal apiaries in the Caribbean dry forest (Bolívar and Sucre).
- *Virgin Coconut Oil:* Three independent production batches ($5 "L"$ each) of cold-pressed, unrefined virgin coconut oil obtained from coastal cooperatives in Guapi (Pacific Coast) and San Bernardo (Caribbean Coast).

Total certified primary lots: $4 "matrices" times 3 "independent batches" = 12 "lots"$.

== 7.2 Controlled Microclimatic Stress Incubation (6 Regimes)

To induce accelerated degradation across distinct kinetic regimes, hermetically packaged split samples ($50 "g"$ each) are placed inside precision climatic chambers (BINDER KBF series, temperature stability $plus.minus 0.3 degree "C"$, humidity stability $plus.minus 1.5%$ RH) configured under a $3 times 2$ full factorial environmental design:
- *Regime 1 (Ambient Control):* $25 degree "C" plus.minus 0.5 degree "C"$ | $60% "RH" plus.minus 2%$ (baseline tropical shelf conditions)
- *Regime 2 (High-Humidity Ambient):* $25 degree "C" plus.minus 0.5 degree "C"$ | $75% "RH" plus.minus 2%$ (ambient coastal tropical humidity)
- *Regime 3 (Accelerated Mild Stress):* $40 degree "C" plus.minus 0.5 degree "C"$ | $60% "RH" plus.minus 2%$ (in-land warehouse storage stress)
- *Regime 4 (Accelerated Humid Maritime Transit):* $40 degree "C" plus.minus 0.5 degree "C"$ | $75% "RH" plus.minus 2%$ (transatlantic cargo container hold conditions)
- *Regime 5 (Thermal Acceleration):* $60 degree "C" plus.minus 0.5 degree "C"$ | $60% "RH" plus.minus 2%$ (accelerated Arrhenius kinetic boundary)
- *Regime 6 (Extreme Thermal-Hydrothermal Stress):* $60 degree "C" plus.minus 0.5 degree "C"$ | $75% "RH" plus.minus 2%$ (maximum stress degradation frontier)

== 7.3 Longitudinal Sampling Schedule (11 Timepoints across 180 Days)

Destructive sampling occurs at 11 predetermined temporal intervals over a 6-month period:
$ t in {0, 3, 7, 14, 21, 30, 45, 60, 90, 120, 180} "days" $
This non-linear temporal distribution densely samples early-stage initiation reactions ($t <= 14 "days"$) while accurately tracking steady-state propagation up to 180 days.

== 7.4 Experimental Throughput and Instrumental ATR-FTIR Parameters

- *Total Experimental Sample Units:* $4 "matrices" times 3 "batches" times 6 "climatic regimes" times 11 "timepoints" = 792 "units"$.
- *Instrumental ATR-FTIR Scans:* Each unit is scanned in analytical triplicate: $792 times 3 = bold("2,376") " FTIR spectra"$.
- *Spectrometer Configuration:* Research-grade FTIR (Shimadzu IRAffinity-1S / Bruker Alpha II) equipped with a single-reflection monolithic diamond ATR crystal, DLATGS detector, optical range $4000 - 650 "cm"^(-1)$, spectral resolution $4.0 "cm"^(-1)$, 64 co-added interferograms per scan, Happ-Genzel apodization, and 2-point zero filling. Crystal temperature is thermostatted at $25.0 plus.minus 0.2 degree "C"$.
- *Standard Chemical Assays:* All 792 experimental units are analyzed via matrix-specific AOAC/ISO assays ($792 "wet reference determinations"$).

== 7.5 Spectral Preprocessing Pipeline

Prior to neural model ingestion at DIT, raw interferograms undergo a rigorous chemometric preprocessing pipeline implemented in Python:
1. *Atmospheric Vapor Removal:* Automated subtraction of ambient water vapor ($nu("O-H")$ rotational lines at $3800 - 3500 "cm"^(-1)$ and $1800 - 1500 "cm"^(-1)$) and carbon dioxide ($nu("C=O")$ doublet at $2350 "cm"^(-1)$).
2. *Standard Normal Variate (SNV):* Mean centering and unit variance scaling per spectrum to remove physical pathlength variations and optical scattering:
   $ bold(x)_"snv"(nu) = (bold(x)(nu) - macron(bold(x))) / (sqrt(1 / (W - 1) sum_(k=1)^W (bold(x)(nu_k) - macron(bold(x)))^2)) $
3. *Savitzky-Golay Filtering:* Second-order polynomial fitting with a 15-point window ($Delta nu = 30 "cm"^(-1)$), computing the first derivative ($1^"st" "Deriv"$) to resolve overlapping band shoulders and eliminate linear baseline offsets.

= 8. Multi-Objective Pareto Selection Framework and Edge AI Deployment

To eliminate subjective bias and adhere to the parsimony findings of Pronk & Anthony @pronk2026neuralnetworkplacementin, the winning architecture is determined strictly via Multi-Criteria Decision Analysis (MCDA) across four orthogonal Pareto objectives.

== 8.1 Multi-Criteria Decision Analysis (MCDA) Formulation

Let $cal(M)_(k)$ ($k = 1, ..., 18$) represent the candidate architectures. The multi-objective optimization problem is defined as:

$ max_(k in {1,...,18}) quad bold(cal(F))(cal(M)_k) = [f_"acc"(cal(M)_k), quad f_"edge"(cal(M)_k), quad f_"ident"(cal(M)_k), quad f_"causal"(cal(M)_k)]^top $

An architecture $cal(M)_A$ is said to *Pareto-dominate* $cal(M)_B$ ($cal(M)_A succ cal(M)_B$) if and only if $cal(M)_A$ is strictly superior in at least one objective without being inferior in any other:
$ forall i in {"acc", "edge", "ident", "causal"}, quad f_i (cal(M)_A) >= f_i (cal(M)_B) quad and quad exists j : f_j (cal(M)_A) > f_j (cal(M)_B) $

== 8.2 Pareto Evaluation Axes & Quantitative Acceptance Thresholds

=== 8.2.1 Criterion 1: Generalization Accuracy & Out-of-Distribution Robustness (Weight: 35%)
- *Evaluation Protocol:* Strict *Leave-One-Batch-Out (LOBO)* cross-validation: models are trained on 2 independent agricultural batches and evaluated exclusively on the 3rd unseen batch. In addition, Leave-One-Matrix-Out (LOMO) evaluates transfer learning capability.
- *Quantitative Acceptance Thresholds:*
  - Test coefficient of determination: $R^2 >= 0.90$ across all 4 matrices.
  - Mean Absolute Percentage Error: $"MAPE" <= 8.0%$.
  - Root Mean Square Error of Prediction ($"RMSEP"$) within the standard deviation of analytical assay measurement error ($sigma_"assay"$).

=== 8.2.2 Criterion 2: Parsimony & Edge AI Deployment Feasibility (Weight: 25%)
- *Benchmarking Hardware:* Physical single-board computers: *Raspberry Pi 4 Model B (4GB RAM, Broadcom BCM2711 quad-core Cortex-A72 at 1.5 GHz)* and *Raspberry Pi 5 (4GB RAM, Broadcom BCM2712 quad-core Cortex-A76 at 2.4 GHz)* running 64-bit Raspberry Pi OS. Models are exported to ONNX Runtime and PyTorch Mobile.
- *Quantitative Acceptance Thresholds:*
  - End-to-end single-spectrum inference latency: $tau_"infer" < 2.0 "seconds"$.
  - Peak resident memory footprint: $"RAM" < 500 "MB"$.
  - Serialized model disk storage: $"Size" < 50 "MB"$.
- *Pronk-Anthony Parsimony Rule:* If a complex architecture (e.g., Spectro-GNN + Neural ODE) achieves only marginal accuracy improvement ($Delta R^2 < 0.02$) over a simpler model (e.g., 1D-CNN + Mamba + PINN) while consuming $> 5times$ inference time and memory, the parsimonious model Pareto-dominates and is selected.

=== 8.2.3 Criterion 3: Kinetic Identifiability & Numerical Stability (Weight: 20%)
- *Evaluation Protocol:* Tracking optimization trajectory stability during backpropagation:
  - Divergence-free training: zero numerical solver failures or NaN losses across all 100 training epochs.
  - Recovery of literature activation energies: estimated activation energies $hat(E)_(a, j)$ must converge within $plus.minus 15%$ of established Arrhenius values ($45 - 140 "kJ/mol"$).

=== 8.2.4 Criterion 4: Chemical Causal Saliency Alignment ($S_"align" >= 0.75$) (Weight: 20%)
- *Evaluation Protocol:* Feature attributions generated via Spectral Attention Maps (SAM) or Integrated Gradients are benchmarked against the certified vibrational marker bands established in Section 3.3.
- *Metric:* The *Spectral Attribution Alignment Score* ($S_"align"$), calculated as the weighted Jaccard index between the top-decile model attribution peaks ($bold(Omega)_"attr"$) and the ground-truth chemical vibrational regions ($bold(Omega)_"chem"$):
  $ S_"align" = (|bold(Omega)_"attr" inter bold(Omega)_"chem"|) / (|bold(Omega)_"attr" union bold(Omega)_"chem"|) $
  Acceptance threshold: $S_"align" >= 0.75$.

#callout(title: "Selection Decision Rule")[
  The winning architecture will reside on the Pareto frontier, maximizing $S_"align"$ and $R^2$ while strictly satisfying the edge hardware constraint ($tau_"infer" < 2.0 "s"$, $"RAM" < 500 "MB"$).
]

= 9. Institutional Work Allocation, RACI Governance, and Mobility Plan

The bilateral research synergy unites the experimental excellence of the Universidad de Cartagena in natural product chemistry with the advanced artificial intelligence and high-performance computing infrastructure of the Deggendorf Institute of Technology.

== 9.1 Bilateral Institutional Profiles and Complementarity
- *Deggendorf Institute of Technology (DIT, Bavaria):* Leads the Applied AI and Machine Learning Campus. DIT provides high-performance GPU computing clusters (NVIDIA A100 / H100), extensive expertise in time-series forecasting, state-space models (Mamba), physics-informed loss formulation, model quantization, and edge deployment.
- *Universidad de Cartagena (UdC, Colombia):* Founded in 1827, UdC holds High-Quality Institutional Accreditation from the Colombian Ministry of Education. The Department of Chemistry possesses advanced instrumental spectroscopy facilities (ATR-FTIR, UV-Vis spectrophotometers), certified wet-chemistry analytical laboratories, and direct operational ties with Colombian agricultural producers and export cooperatives.

== 9.2 Institutional RACI Governance Matrix

Project governance is structured according to the RACI framework:
- *R* = Responsible (conducts the task)
- *A* = Accountable (final decision & sign-off)
- *C* = Consulted (provides technical input)
- *I* = Informed (receives status reports)

#table(
  columns: (0.9fr, 2.2fr, 1.1fr, 1.1fr, 2.7fr),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black, top: 1pt + black) } else { (bottom: 0.5pt + luma(200)) },
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  inset: (x: 5pt, y: 5pt),
  [Work Package], [Specific Technical Task], [UdC (Colombia)], [DIT (Bavaria)], [Key Deliverable / Verification Milestone],
  [WP 1], [Task 1.1: Agricultural sample procurement & botanical certification], [*R / A*], [I], [Registry of 12 certified batches (Cocoa, Coffee, Honey, VCO)],
  [WP 1], [Task 1.2: Climate chamber setup & sensor calibration], [*R / A*], [C], [Standardized accelerated degradation protocol signed],
  [WP 1], [Task 1.3: Bilateral Opening Workshop 1 (Cartagena, Month 2)], [*R*], [*R / A*], [Workshop 1 Proceedings; joint data harmonization SOP],
  [WP 2], [Task 2.1: Accelerated aging execution (180 days, 6 regimes)], [*R / A*], [I], [Chamber incubation logs and sample integrity records],
  [WP 2], [Task 2.2: Continuous ATR-FTIR acquisition (2,376 scans)], [*R / A*], [C], [Raw spectral database (.csv and .dpt formats)],
  [WP 2], [Task 2.3: Standardized AOAC/ISO reference chemical assays], [*R / A*], [C], [Wet-chemical reference validation matrix (792 records)],
  [WP 3], [Task 3.1: Spectral preprocessing, baseline SNV, Savitzky-Golay], [C], [*R / A*], [Open-science preprocessed spectral repository],
  [WP 3], [Task 3.2: PyTorch implementation of 18-model exploration space], [I], [*R / A*], [Modular Python/PyTorch codebase on private Git repository],
  [WP 3], [Task 3.3: GPU cluster training & LOBO cross-validation], [I], [*R / A*], [Distributed training logs and LOBO performance curves],
  [WP 3], [Task 3.4: MCDA Pareto architectural selection], [C], [*R / A*], [*Milestone M3: Consolidated Architecture Selection Dossier*],
  [WP 3], [Task 3.5: Chemical XAI and spectral saliency alignment], [*R*], [*R / A*], [Attribution heatmaps validated against functional bands],
  [WP 3], [Task 3.6: Edge AI deployment & Raspberry Pi benchmarking], [I], [*R / A*], [Working edge demonstrator running on Raspberry Pi 4/5],
  [WP 4], [Task 4.1: Bilateral Synthesis Workshop 2 (Deggendorf, Month 11)], [*R*], [*R / A*], [Workshop 2 Synthesis Report & industrial demonstration],
  [WP 4], [Task 4.2: Co-authored scientific publications (Q1/Q2 journals)], [*R*], [*R / A*], [Two peer-reviewed manuscripts submitted to top journals],
  [WP 4], [Task 4.3: Submission of 3-year DFG-Minciencias research proposal], [C], [*R / A*], [*Milestone M4: Completed joint DFG-Minciencias grant proposal*],
)

== 9.3 Mobility Plan and Bilateral Workshops

The BAYLAT seed grant specifically finances two strategic bilateral research stays:
1. *Travel 1 (Month 2) — DIT Delegation to Cartagena (Colombia):*
   - *Participants:* DIT Principal Investigator + 1 early-career researcher (Ph.D. student).
   - *Duration:* 8–10 days.
   - *Objectives:* Convene Bilateral Workshop 1 at UdC; inspect chemistry laboratories; calibrate spectrometer acquisition parameters; establish standardized data transmission protocols.
2. *Travel 2 (Month 11) — UdC Delegation to Deggendorf (Germany):*
   - *Participants:* UdC Principal Investigator + 1 early-career researcher (M.Sc./Ph.D. student).
   - *Duration:* 10–14 days.
   - *Objectives:* Convene Bilateral Workshop 2 at DIT; evaluate final Pareto-selected architecture on GPU cluster; demonstrate real-time Raspberry Pi edge inference; finalize the joint DFG-Minciencias grant application.

== 9.4 Early-Career Researcher Integration and Knowledge Transfer

The project actively fosters early-career scientific development:
- *At Universidad de Cartagena:* Integration of at least two advanced undergraduate or master's students in Chemistry (*Pregrado / Maestría en Química*), conducting kinetic sampling, ATR-FTIR acquisitions, and AOAC reference assays as core thesis research.
- *At Deggendorf Institute of Technology:* Integration of at least one master's student (*M.Sc. Applied AI / Data Science*) or doctoral candidate, focusing on state-space neural modeling, PINN loss formulation, and edge quantization.

= 10. Risk Assessment and Contingency Protocols

To ensure uncompromised project execution within the 12-month timeframe, the consortium establishes a comprehensive 5-point risk management matrix with verified contingency protocols.

#table(
  columns: (0.9fr, 1.8fr, 0.8fr, 0.8fr, 3.7fr),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black, top: 1pt + black) } else { (bottom: 0.5pt + luma(200)) },
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  inset: (x: 5pt, y: 5pt),
  [Risk ID], [Identified Risk Description], [Likelihood], [Impact], [Proactive Mitigation & Fallback Contingency Protocol],
  [R1], [Agricultural Batch Heterogeneity & Harvest Variability], [Moderate], [Moderate], [*Mitigation:* Direct procurement of certified single-origin lots with complete harvest records. \ *Contingency:* Apply Standard Normal Variate (SNV) normalization and incorporate batch-effect embeddings within the deep neural latent space.],
  [R2], [Instrumental ATR-FTIR Drift over 180-Day Window], [Moderate], [High], [*Mitigation:* Daily performance qualification using certified 0.05 mm polystyrene film (monitoring 3060.0, 1601.2, 1028.3 $"cm"^(-1)$ within $plus.minus 0.5 "cm"^(-1)$) and air background collection before every triplicate scan. \ *Contingency:* Re-standardization via Piecewise Direct Standardization (PDS) or normalizing against internal structural invariants (e.g., $nu("CH"_2)$ at $2922 "cm"^(-1)$).],
  [R3], [Numerical Stiffness and Divergence in Neural ODE Solvers], [High], [High], [*Mitigation:* Bound Lipschitz constants of latent neural vector fields and utilize adaptive step-size Runge-Kutta solvers (Dormand-Prince RK45). \ *Pronk-Anthony Fallback:* If latent integration experiences numerical stiffness, immediately transition to *Tier 3B (PINN Soft-Penalty with Mamba)*, which is mathematically guaranteed to converge stably.],
  [R4], [GNN or Transformer Exceeds Raspberry Pi Latency Limits], [Moderate], [Moderate], [*Mitigation:* Apply post-training INT8 quantization and structured weight pruning via ONNX Runtime. \ *Contingency:* Adopt *Tier 1A (Multiscale 1D-CNN)* with Mamba SSM, which achieves sub-second CPU inference ($< 0.5 "s"$) and minimal RAM footprint ($< 150 "MB"$).],
  [R5], [Regulatory Delays in International Physical Sample Shipment], [Low], [Moderate], [*Mitigation:* Complete zero-physical-shipment design: all agricultural samples remain in Colombia for chemical aging and spectroscopy; all data transfer to Germany is conducted digitally via secure encrypted cloud repositories.],
)

= 11. Strategic Bilateral Scaling Roadmap: The DFG-Minciencias Follow-Up Grant

The BAYLAT seed funding (*Anschubfinanzierung*) serves as an indispensable catalyst, maturing the technology and generating the required experimental evidence to secure a major 3-year bilateral research grant.

#callout(title: "The Bilateral Scaling Trajectory")[
  *Phase 1: BAYLAT Seed Grant (Months 1–12):* Proof of concept, first longitudinal Colombian ATR-FTIR dataset, AOAC reference calibration, 18-architecture benchmark, validated Raspberry Pi edge prototype. \
  $arrow.b$ \
  *Phase 2: DFG-Minciencias Research Grant (Years 2–4, 36 Months):* High-throughput chromatographic metabolomics (LC-HRMS Orbitrap, SPME-GC-MS), handheld MEMS-FTIR sensor deployment in rural farming cooperatives, and transnational industrial pilot trials.
]

== 11.1 Phase 1: BAYLAT Seed Grant (Months 1–12) Deliverables
- Fully curated, open-science longitudinal ATR-FTIR dataset (2,376 spectra across 4 matrices and 6 climatic regimes).
- Calibrated degradation curves anchored in AOAC/ISO reference assays.
- Systematic benchmark report of the 18 factorial architectures, selecting the Pareto-optimal model.
- Validated edge AI software demonstrator running on Raspberry Pi single-board hardware.
- Two joint Q1/Q2 peer-reviewed scientific publications.
- Formally completed and submitted *DFG-Minciencias Bilateral Research Proposal*.

== 11.2 Phase 2: DFG-Minciencias 36-Month Research Grant Scaling
In Months 11–12, DIT and UdC will submit a comprehensive bilateral research proposal to the joint call of the *Deutsche Forschungsgemeinschaft (DFG, Sachbeihilfe)* and the *Colombian Ministry of Science, Technology, and Innovation (Minciencias)* (projected budget: $350,000 - 450,000 "EUR"$ DIT + $800,000,000 "COP"$ UdC).

The DFG-Minciencias project will scale the scientific frontier across three dimensions:
1. *High-Throughput Chromatographic Metabolomics:*
   - *Untargeted LC-HRMS (Orbitrap Mass Spectrometry):* High-resolution separation and structural identification of individual secondary polyphenolic metabolites, monomeric flavan-3-ols, and chlorogenic acid isomers during storage.
   - *Volatile Headspace SPME-GC-MS:* Solid-Phase Microextraction coupled with Gas Chromatography-Mass Spectrometry to map volatile aroma compound kinetics (esters, pyrazines, aldehydes) in coffee and cocoa.
2. *On-Farm Deployment of Handheld MEMS-FTIR Spectrometers:*
   - Transition from laboratory benchtop instruments to ultra-portable, battery-powered MEMS-FTIR and micro-NIR sensors deployed directly within smallholder farmer cooperatives in Santander, Huila, and Bolívar.
   - Real-time shelf-life forecasting in commercial maritime cargo containers during transatlantic transit to European ports (Hamburg, Rotterdam).
3. *Foundation Chemical AI Models for Agriculture:*
   - Pre-training large self-supervised spectral foundation models across multi-country agri-food spectral repositories, democratizing automated quality assurance across Latin American bioeconomies.

#bibliography("references.bib", title: [References])
