#import "typst-scientific-report-template/template.typ": project, callout

#set text(lang: "en")

#show: project.with(
  title: [Artificial Intelligence and Spectroscopy for Food Quality Assessment],
  subtitle: [Detailed Scientific Research Proposal – BAYLAT Seed Grant (OASys 2026/2027)],
  objective: [
    To formulate, evaluate, and experimentally validate an analytical and computational framework integrating Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR) spectroscopy, standardized physicochemical reference assays, and Physics-Informed Deep Learning (PIML) for Colombian specialty coffee (*Coffea arabica*). The investigation centers on systematically benchmarking classical chemometrics (PLSR, SVR) against deep convolutional networks (1D-CNN) and physics-informed neural networks regularized by Arrhenius degradation kinetics (PINN) under real tropical storage regimes, complemented by the exploratory evaluation of modern sequence models (Mamba SSM, Spectral Transformers) and bilateral capacity building between the Deggendorf Institute of Technology (DIT) and the Universidad de Cartagena (UdC).
  ],
  authors: (
    "Prof. Dr. Isabel Suárez — Deggendorf Institute of Technology (DIT), AI Campus",
    "Prof. Dr. Ricardo Vivas — Universidad de Cartagena (UdC), Faculty of Exact and Natural Sciences",
  ),
  date: "September 17, 2026",
  doc_id: "BAYLAT-EXP-EN-2026",
  header_title: "Scientific Research Proposal (BAYLAT) — DIT & UdC",
)

= 1. Executive Summary

This bilateral collaborative research project between the Deggendorf Institute of Technology (DIT, Bavaria) and the Universidad de Cartagena (UdC, Colombia) establishes an analytical and computational framework for forecasting phytochemical degradation and freshness loss in Colombian specialty coffee (*Coffea arabica*). Supported by a 12-month seed grant from BAYLAT (7,350 €), the research addresses quality variations experienced by green coffee during postharvest storage in warm-humid tropical environments and transatlantic sea freight (20 to 45 days transit) destined for European markets, notably Bavaria. During these phases, radical lipid autoxidation and the hydrolytic cleavage of chlorogenic acids alter both sensory cupping scores and biochemical stability.

To overcome the latency and high costs of classical destructive chromatography as well as the inherent subjectivity of organoleptic cupping, the project implements a dual methodological strategy:
1. *Longitudinal monitoring under real tropical storage conditions* in the Colombian Caribbean using mid-infrared Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR) spectroscopy synchronized with standardized physicochemical assays (AOAC/ISO).
2. *Physics-Informed Deep Learning (PINN)* models that incorporate Arrhenius degradation kinetics directly into neural loss functions, establishing physical-chemical causality and model interpretability (XAI via Grad-CAM and SHAP) beyond classical linear chemometrics (PLSR) and empirical deep learning (1D-CNN).

Bilateral mobility comprises an intensive on-site AI spectroscopy workshop at UdC in Cartagena and a 2-week research stay of a Colombian junior scientist at the DIT AI Campus, establishing the experimental groundwork for a joint 3-year consortium proposal under the bilateral DFG-Minciencias program.

*Keywords:* Specialty coffee, Coffea arabica, ATR-FTIR, Physics-informed neural networks (PINN), Degradation kinetics, Chemometrics.

---

= 2. Introduction and Problem Statement

== 2.1 Socioeconomic Context and Bioeconomy of Colombian Specialty Coffee
The Republic of Colombia ranks among the world leaders in the production of high-altitude washed Arabica coffee (*Coffea arabica*). According to official data from the National Federation of Coffee Growers of Colombia @fnc2023informecafetero, coffee cultivation represents the socioeconomic backbone of the Colombian countryside, supporting more than 540,000 smallholder farming families across over 600 municipalities spanning the three Andean cordilleras and isolated massifs such as the Sierra Nevada de Santa Marta. With an annual harvest stabilized between 12 and 14 million 60-kg bags of green coffee, the sector generates 3,000 to 4,000 million USD in export revenue, consolidating its status as the principal non-mineral export and a strategic pillar of rural bioeconomy @fnc2023informecafetero.

Within this agricultural matrix, the specialty coffee segment (*Specialty Coffee*), formally defined by the Specialty Coffee Association @sca2020specialtycoffee, has acquired substantial economic prominence. The SCA defines specialty coffee as traceable lots achieving a cupping score of 85 points or higher on a 100-point scale across ten sensory descriptors. These coffees, distinguished by delicate floral, fruity, and complex acidity attributes, command significant price premiums in European specialty markets. The Free State of Bavaria and the Federal Republic of Germany constitute one of the most demanding destinations for premium origin coffees, where roasters and consumers place great value on cup quality consistency @sca2020specialtycoffee.

== 2.2 Tropical Storage Regimes and Transatlantic Maritime Transport
Preserving the sensory profile and chemical integrity of green coffee beans (*green coffee*) depends directly upon microclimatic conditions along the postharvest handling chain. In Colombia, storage across farms, regional cooperatives, and port warehouses along the Caribbean coast (e.g., Cartagena de Indias or Santa Marta) occurs predominantly under warm-humid tropical regimes, with ambient temperatures ranging between 25 °C and 38 °C and relative humidities between 60% and 85% RH.

During subsequent transatlantic maritime container transport to European ports (typically 20 to 45 days), cargo containers experience pronounced circadian temperature swings and internal condensation cycles. These environmental conditions accelerate chemical staling reactions, bean bleaching, and precursor degradation, resulting in irreversible loss of initial SCA cupping grades.

== 2.3 Phytochemical Degradation Pathways and Molecular Quality Biomarkers
At the molecular level, quality degradation of *Coffea arabica* during storage proceeds through three primary phytochemical mechanisms:

1. *Hydrolysis and Isomerization of Chlorogenic Acids (CGA):* Chlorogenic acids account for 6% to 9% of green coffee dry matter and consist of caffeoylquinic acid esters (5-CQA, 3-CQA, 4-CQA), dicaffeoylquinic acids, and feruloylquinic acids @farah2012coffeeconstituents. 5-CQA is the predominant congener, dictating acidity balance and antioxidant capacity. Under elevated temperatures and humidity, the ester bonds undergo progressive hydrolysis to free quinic and caffeic acids or form bitter quinides @farah2012coffeeconstituents. This shifts the acidic equilibrium, increasing titratable acidity according to official standard AOAC 920.92 @aoac92092 and imparting astringent, metallic defects.

2. *Radical Autoxidation of the Lipid Fraction:* Lipids constitute 12% to 17% of bean dry weight and consist mainly of triacylglycerols rich in linoleic acid ($"C18:2"$) and diterpene esters (cafestol and kahweol). Atmospheric oxygen and heat drive radical autoxidation cascades @buffo2004coffeevolatiles. The resulting lipid hydroperoxides, quantified via the peroxide value according to AOAC 965.33 @aoac96533, decompose into secondary volatile carbonyls (hexanal, trans-2-nonenal, octanal), responsible for stale, woody, and cardboard off-flavors (*baggy*) @buffo2004coffeevolatiles.

3. *Hygroscopic Sorption and Water Activity ($a_w$):* Postharvest green coffee is typically stabilized at 10% to 12% moisture wet basis (AOAC 968.11 @aoac96811, ISO 6673 @iso6673), corresponding to an equilibrium water activity ($a_w$) of 0.50 to 0.60. In environments exceeding 70% RH and 25 °C, the hygroscopic grain absorbs ambient moisture. When water activity surpasses critical thresholds ($a_w > 0.65$), increased mobility within the biopolymer matrix enhances chemical reactivity, promotes non-enzymatic browning, and elevates the risk of mold growth, drastically diminishing shelf-life stability.

== 2.4 Limitations of Conventional Assays and Opportunities of ATR-FTIR Spectroscopy
Routine quality verification during commercial warehousing faces substantial methodological constraints:
- *SCA Sensory Cupping* @sca2020specialtycoffee is an organoleptic, qualitative evaluation conducted by trained panels. It detects degradation only retrospectively once sensory damage has occurred, without providing quantitative predictive shelf-life modeling.
- *Classical Instrumental Chromatography* (HPLC-DAD, GC-MS) provides high chemical resolution but is destructive, solvent-intensive, and costly ($150 - 300 thin "USD"$ per sample), precluding continuous monitoring across processing centers and shipping terminals.

Conversely, *mid-infrared Fourier-Transform Infrared spectroscopy with Attenuated Total Reflection (ATR-FTIR)* ($4000 - 600 thin "cm"^(-1)$) offers a rapid, non-destructive, and cost-effective alternative @manzocco2020shelf. The ATR-FTIR technique yields an intact vibrational fingerprint of ground coffee in minutes without organic solvent extraction. The spectrum captures key chemical bonds simultaneously: the ester carbonyl stretch $nu("C=O")$ at $1745 thin "cm"^(-1)$ and the free carboxyl shoulder at $1715 thin "cm"^(-1)$, the olefinic $nu(= "C-H")$ _cis_ bond at $3008 thin "cm"^(-1)$, phenolic and moisture OH stretching at $3400 - 3250 thin "cm"^(-1)$, and chlorogenic ester bands at $1380 - 1150 thin "cm"^(-1)$. However, spectral complexity, overlapping peaks, and physical scattering require calibrated computational models to extract causal kinetic relationships @manzocco2020shelf.

---

= 3. Scientific Research Question and Project Objectives

== 3.1 Central Scientific Research Question
#callout(title: "Central Research Question")[
  *Core Research Question:* To what extent do Physics-Informed Neural Networks (PINNs), by explicitly embedding first-order differential degradation kinetics coupled with Arrhenius temperature dependence for chlorogenic acid hydrolysis and lipid peroxidation, outperform classical linear chemometrics (PLSR, SVR) and empirical deep neural networks (1D-CNN) in predictive accuracy ($R^2$, RMSE, MAPE), out-of-distribution generalization across unseen coffee lots and origins, and causal physicochemical interpretability derived from longitudinal ATR-FTIR profiles under fluctuating tropical environmental storage?
]

== 3.2 Overall Project Objective
To develop and experimentally validate a non-destructive analytical and computational framework based on mid-infrared ATR-FTIR spectroscopy, standardized reference assays (AOAC/ISO), and Physics-Informed Deep Learning (PINN) for estimating molecular markers and predicting kinetic freshness trajectories in Colombian specialty coffee (*Coffea arabica*) stored under tropical ambient conditions.

== 3.3 Specific Project Objectives
1. *Aligned with WP1 (Experimental Setup, Sampling Protocols, and Workshop in Cartagena):* Standardize the longitudinal experimental design and rapid ATR-FTIR acquisition protocol across specialty coffee lots (*Coffea arabica* cultivars *Castillo*, *Caturra*, *Colombia*, and *Geisha*), performing instrument calibration and delivering an on-site bilateral training workshop on Applied AI in Food Spectroscopy at the Universidad de Cartagena led by the DIT Principal Investigator.
2. *Aligned with WP2 (Longitudinal Tropical Monitoring and Standardized AOAC/ISO Assays):* Execute systematic longitudinal kinetic monitoring over 180 days of ambient storage in the Colombian Caribbean, building a multimodal database pairing periodic ATR-FTIR scans with standardized reference metrics: titratable acidity (@aoac92092), residual moisture and water activity (@aoac96811, @iso6673), lipid peroxide value (@aoac96533), and total chlorogenic acids / 5-CQA.
3. *Aligned with WP3 (Data Science Modeling, GPU Training, and 3-Tier Benchmark):* Formulate, calibrate, and benchmark three computational tiers – classical chemometrics (PLSR, SVR), empirical deep learning (1D-CNN), and physics-informed models (PINN with Arrhenius kinetics) – during the 2-week research stay of the UdC junior scientist at the DIT AI Campus, validating spectral causality through XAI (Grad-CAM 1D and SHAP).

---

= 4. Theoretical Framework and State of the Art

== 4.1 Phytochemistry of Coffea arabica and Molecular Quality Markers
The endosperm of the Arabica coffee seed (*Coffea arabica*) represents a dense metabolic matrix whose biochemical composition dictates sensory excellence ($>= 85$ SCA points) (@farah2012coffeeconstituents):
- *Chlorogenic Acids (CGA):* Comprise 6% to 9% of green bean dry biomass, consisting of esters between trans-cinnamic acids (caffeic, ferulic) and quinic acid. 5-Caffeoylquinic acid (5-CQA) represents 70% to 80% of total polyphenols, coexisting with 3-CQA, 4-CQA, dicaffeoylquinic acids (di-CQA, 1.5–2.5%), and feruloylquinic acids (FQA, 0.8–1.4%). They act as intracellular antioxidants, shape cup acidity, and serve as aroma precursors during roasting.
- *Lipid Fraction and Diterpenes:* Accounts for 12% to 17% of dry weight, localized in cytoplasmic lipid droplets. It is dominated (75–80%) by triacylglycerols rich in linoleic acid ($"C18:2"$, 40–46%) and oleic acid ($"C18:1"$, 8–12%), alongside palmitic acid ($"C16:0"$, 30–35%). The unsaponifiable matter (15–20%) features pentacyclic diterpenes cafestol and kahweol, exclusive to the genus and serving as Arabica authenticity markers.
- *Alkaloids:* Caffeine (1.0–1.4% w/w) exhibits high thermal and oxidative stability; trigonelline (0.8–1.2% w/w) serves as an osmolite and thermolabile precursor to volatile pyridines and pyrazines.
- *Carbohydrates and Proteins:* Sucrose (6–9% w/w) is the dominant free soluble sugar. Structural polysaccharides (45–50%) consist of galactomannans and arabinogalactans. Proteins (10–13%) comprise 11S storage globulines and free amino acids.

During tropical storage, two main chemical degradation reactions occur (@buffo2004coffeevolatiles, @ribeiro2011chemicalchanges):
1. *Hydrolytic Cleavage of Chlorogenic Esters:* Moisture and ambient warmth cleave the ester bond, releasing free quinic and caffeic acids, depressing bean pH, and elevating titratable acidity with sharp astringency.
2. *Lipid Autoxidation:* Bis-allylic methylene carbons in linoleic acid ($-"CH"="CH"-"CH"_2-"CH"="CH"-$, lower C-H bond dissociation energy) react with oxygen to form lipid hydroperoxides (ROOH; measured via AOAC 965.33), which cleave into volatile aldehydes (hexanal, nonanal, trans-2-nonenal) causing rancid and stale attributes.

== 4.2 Degradation Kinetics and Arrhenius Thermodynamics under Dynamic Environmental Conditions
The concentration changes of quality-indicating biomarkers follow differential rate laws of apparent order $n$ (@manzocco2020shelf). For decaying substrates (e.g., residual 5-CQA, diterpene esters):

$ (d C_i(t)) / (d t) = - k_i(T(t), a_w(t)) dot [C_i(t)]^(n_i) $

For accumulating secondary degradation products (lipid hydroperoxides, free quinic acid):

$ (d P_j(t)) / (d t) = + k_j(T(t), a_w(t)) dot [C_i(t)]^(m_j) $

where $C_i(t)$ and $P_j(t)$ denote molar or mass concentrations, $n_i$ and $m_j$ are apparent reaction orders ($n=1$ for CGA hydrolysis; $n=0$ to $1$ for primary lipid autoxidation), and $k_i$ is the rate constant.

The fundamental temperature dependence of $k_i$ is modeled via the Arrhenius relationship:

$ k_i(T) = A_i dot exp(- E_(a,i) / (R dot T)) $

where $A_i$ is the pre-exponential frequency factor ($"s"^(-1)$), $E_(a,i)$ is the apparent activation energy ($60 - 110 thin "kJ/mol"$ for dry agro-food matrices), $R = 8.314 thin "J/(mol" dot "K)"$ is the universal gas constant, and $T$ is absolute temperature in Kelvin.

Water activity ($a_w = p / p_0$) acts as a critical kinetic modulator. According to Gordon-Taylor glass transition principles, condensed water plasticizes the biopolymer matrix. Below $a_w < 0.50$, the seed endosperm resides in a rigid glassy state where ultra-high viscosity ($eta > 10^(12) thin "Pa" dot "s"$) restricts the translational diffusion of oxygen and reactants. When tropical humidity raises water activity above $a_w >= 0.60 - 0.70$, the glass transition temperature drops below storage temperature ($T > T_g$), inducing a rubbery transition that accelerates diffusion and reaction rates:

$ k_i(t) = A_i(a_w(t)) dot exp(- E_(a,i) / (R dot T(t))) $

== 4.3 Physical Foundations of ATR-FTIR Vibrational Spectroscopy
Mid-infrared Fourier-Transform Infrared spectroscopy in the $4000 - 600 thin "cm"^(-1)$ region ($lambda = 2.5 - 16.7 thin mu"m"$) measures resonant absorption of infrared photons by molecular vibrational modes with non-zero dipole moment changes ($partial bold(mu) / partial q != 0$).

In Diamond ATR, the infrared beam strikes the internal surface of a high-refractive-index crystal ($n_1 approx 2.42$) at an incident angle $theta = 45 degree$ in optical contact with the solid coffee sample ($n_2 approx 1.40 - 1.50$). Since $theta > theta_c = arcsin(n_2 / n_1) approx 38.2 degree$, total internal reflection occurs, establishing an evanescent wave penetrating the sample:

$ E(z) = E_0 dot exp(- z / d_p) $

The penetration depth $d_p$ is governed by the Maxwell-Fresnel equations:

$ d_p(tilde(nu)) = 1 / (2 pi tilde(nu) n_1 sqrt(sin^2(theta) - (n_2 / n_1)^2)) $

ranging from $0.65 thin mu"m"$ ($4000 thin "cm"^(-1)$) to $4.2 thin mu"m"$ ($600 thin "cm"^(-1)$). Absorbance adheres to the modified Beer-Lambert law for ATR:

$ A(tilde(nu)) = - log_(10) (R(tilde(nu)) / R_0(tilde(nu))) = sum_i epsilon_i(tilde(nu)) dot b_("eff")(tilde(nu)) dot C_i $

#table(
  columns: (1.1fr, 1.4fr, 2.1fr, 3.0fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Wavenumber ($"cm"^(-1)$)],
    [Vibrational Mode],
    [Functional Group Assignment],
    [Kinetic Evolution during Tropical Storage]
  ),
  [$3400 - 3250$],
  [Stretching $nu("O-H")$],
  [Adsorbed water ($a_w$) and phenolic OH of CGA],
  [Band broadening and shift driven by hygroscopic moisture uptake.],
  [$3008$],
  [Stretching $nu(= "C-H")$ _cis_],
  [Olefinic double bonds in TAG (linoleic, oleic)],
  [Signal decrease caused by radical autoxidation into conjugated hydroperoxides.],
  [$2925, 2854$],
  [Stretching $nu_("as"), nu_("s")("C-H")$],
  [Aliphatic methylene ($-"CH"_2-$) and methyl ($-"CH"_3$)],
  [Thermostable lipid backbones; utilized as internal reference for SNV scaling.],
  [$1745$],
  [Stretching $nu("C=O")$ ester],
  [Triacylglycerols and diterpene esters (cafestol, kahweol)],
  [Peak attenuation and emergence of an asymmetric shoulder at $1715 thin "cm"^(-1)$ via hydrolysis.],
  [$1715 - 1695$],
  [Stretching $nu("C=O")$ carboxyl],
  [Free fatty acids and liberated quinic acid],
  [Continuous monotonic increase correlated with freshness loss; staling biomarker.],
  [$1650 - 1600$],
  [Stretching $nu("C=C")$ aromatic],
  [Benzene ring of hydroxycinnamic acids and amide I],
  [Signal decrease driven by oxidative polyphenol condensation.],
  [$1380 - 1150$],
  [$nu("C-O")$, $delta("O-H")$],
  [Ester linkages in chlorogenic acids (5-CQA)],
  [Reproducible decline correlated with reference HPLC/Folin assays.],
  [$1050 - 1030$],
  [Stretching $nu("C-O")$ pyranose],
  [Sucrose and structural polysaccharides (galactomannans)],
  [Slow decline associated with early non-enzymatic browning reactions.]
)

== 4.4 State of the Art: From Classical Chemometrics to Physics-Informed Artificial Intelligence
Agri-food spectroscopic analysis has traditionally relied upon multivariate chemometric tools (@boadu2024developinganovel, @feng2021applicationofvisibleinfrared, @widiarto2026detectionofadulteration). Principal Component Analysis (PCA), Partial Least Squares Regression (PLSR), and Support Vector Regression (SVR) are widely applied to classify origins and screen adulterants. However, for dynamic tracking they present three structural limitations:
1. *Atemporality:* Each spectral acquisition is treated as an isolated point, ignoring temporal degradation continuity.
2. *Linearity Constraints:* Models struggle to decouple overlapping optical non-linearities and matrix scattering.
3. *Physical Agnosticism:* Standard regressions fail to extrapolate across unseen temperature and relative humidity profiles.

One-dimensional convolutional neural networks (1D-CNN) capture vibrational peaks with high selective sensitivity (@passos2605convolutionalneuralnetworks). However, as Passos notes, unconstrained empirical networks are susceptible to overfitting small sample sizes and can generate unphysical predictions (e.g., negative degradation rates or spontaneous CGA synthesis).

Physics-Informed Neural Networks (PINNs) address these shortcomings by integrating differential equations directly into the training process (@perre2025towardmechanisticmodels). Perré demonstrated that mechanistic loss regularization prevents numerical drift and confers reliable extrapolation. Pronk & Anthony (@pronk2026neuralnetworkplacementin) demonstrated that structuring neural networks as residual corrections to physicochemical laws ensures thermodynamic validity during coffee thermal processing. Furthermore, Upadhyay & Chaudhary (@upadhyay2026enhancingspectralanalysis) proved that Spectral Attention Mechanisms (SAM) identify functional bands automatically, while Li et al. (@li2026asgmambaadaptivespectral) established with ASGMamba that selective State-Space Models (SSM) model long-range sequences with linear complexity $cal(O)(L)$. Felizzato et al. (@felizzato2025datafusionfor) and Grundy et al. (@grundy2025reviewofcurrent) further emphasize the need for robust multimodal data fusion.

The project implements a structured three-tier benchmark with exploratory extensions:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Benchmark Tier], [Model Family], [Configuration and Study Role]),
  [Tier 1: Baseline],
  [Classical Chemometrics \ (Linear & Kernel ML)],
  [PLSR (5–12 latent variables) and SVR (RBF kernel) on SNV and Savitzky-Golay preprocessed spectra.],
  [Tier 2: Deep Learning],
  [Empirical Deep Learning \ (Data-Driven CNNs)],
  [1D-CNN with multiscale kernels ($3, 7, 15, 31$), BatchNorm, and GELU; trained on mean squared data error.],
  [Tier 3: PIML],
  [Physics-Informed DL \ (PINN with Kinetic Loss)],
  [Neural network regularized by Arrhenius kinetic differential residuals and thermodynamic monotonicity bounds.],
  [Exploratory Extension],
  [Sequence Models & SSM \ (LSTM / Mamba / Transformer / NODE)],
  [Screening of LSTM/GRU, ASGMamba state-space models (@li2026asgmambaadaptivespectral), Spectral Transformers (@upadhyay2026enhancingspectralanalysis), and continuous Neural ODEs.]
)

---

= 5. Research Methodology and Experimental Design

== 5.1 Experimental Phase and Sampling under Tropical Climate

=== 5.1.1 Arabica Coffee Cultivars and Origin Certification
Four representative Colombian varieties of *Coffea arabica* are evaluated: *Castillo*, *Caturra*, *Colombia*, and *Geisha*. Green coffee lots are sourced from certified high-altitude farms across Huila, Nariño, Tolima, and Cauca ($1,500 - 2,000 thin "m a.s.l."$).

Postharvest processing follows the standardized fully washed method (pulping, 18–24 h fermentation, spring water washing, sun drying to 10.5–11.5% moisture). Before entering storage trials, each lot is graded by three certified Q-Graders following SCA protocols (@sca2020specialtycoffee). Only premium lots scoring $>= 85.0 thin "SCA points"$ without physical or sensory defects are included.

=== 5.1.2 Storage Regime under Real Tropical Environmental Conditions
Experimental warehousing is located at the Universidad de Cartagena on the Colombian Caribbean coast (the primary export terminal for coffee shipped to Europe). Samples are housed in passively ventilated storage facilities under natural tropical coastal fluctuations without artificial climate control: daily temperature swings between $26 thin degree"C"$ and $36 thin degree"C"$ and relative humidities between $70\%$ and $90\%$, replicating commercial pre-shipment warehousing.

=== 5.1.3 Continuous Monitoring with Multiparametric Dataloggers
Environmental conditions are logged at 15-minute intervals using calibrated digital multiparametric sensors ($plus.minus 0.3 thin degree"C"$, $plus.minus 2.0\%$ RH):
1. *Ambient Temperature ($T$):* recorded in Celsius and Kelvin.
2. *Relative Humidity ($"RH"$):* recorded in percentage.
3. *Dew Point Temperature ($T_("dew")$):* tracking surface condensation risks during nocturnal cooling.

=== 5.1.4 Prospective Longitudinal Design and Periodic Subsampling Protocol
The longitudinal design extends across 6 months (180 days) with 8 discrete sampling milestones: $t_0 = 0$, $t_1 = 15$, $t_2 = 30$, $t_3 = 60$, $t_4 = 90$, $t_5 = 120$, $t_6 = 150$, and $t_7 = 180$ days.

At each milestone, $500 thin "g"$ per lot is sampled in triplicate ($4 thin "cultivars" times 8 thin "milestones" times 3 thin "replicates" = 96 thin "composite samples"$). To prevent frictional heating artifacts during grinding, samples are processed via refrigerated analytical milling at 4 °C (ASTM No. 35 sieve, $< 0.50 thin "mm"$).

#table(
  columns: (1.1fr, 1.2fr, 0.9fr, 1.3fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Cultivar (*Coffea arabica*)],
    [Geographic Origin & Altitude],
    [Initial SCA Score],
    [Storage Condition],
    [Longitudinal Sampling Design]
  ),
  [Castillo], [Huila ($1,650 thin "m a.s.l."$)], [86.5 points], [Cartagena (Real tropical: $26-36 thin degree"C"$, $70-90\%$ RH)], [8 intervals ($0 - 180$ days) $times$ 3 replicates],
  [Caturra], [Nariño ($1,900 thin "m a.s.l."$)], [87.0 points], [Cartagena (Real tropical: $26-36 thin degree"C"$, $70-90\%$ RH)], [8 intervals ($0 - 180$ days) $times$ 3 replicates],
  [Colombia], [Tolima ($1,550 thin "m a.s.l."$)], [85.5 points], [Cartagena (Real tropical: $26-36 thin degree"C"$, $70-90\%$ RH)], [8 intervals ($0 - 180$ days) $times$ 3 replicates],
  [Geisha], [Cauca ($1,850 thin "m a.s.l."$)], [89.0 points], [Cartagena (Real tropical: $26-36 thin degree"C"$, $70-90\%$ RH)], [8 intervals ($0 - 180$ days) $times$ 3 replicates]
)

---

== 5.2 Standardized Physicochemical Reference Assays and ATR-FTIR Acquisition

=== 5.2.1 Standardized Analytical Ground Truth Reference Assays
At the Universidad de Cartagena laboratories, four standardized assays are conducted in triplicate:
1. *Titratable Acidity (AOAC 920.92):* Hot aqueous extraction ($10.00 thin "g"$ in $100 thin "mL"$ degassed water at 90 °C for 15 min, @aoac92092). Potentiometric titration with standardized $0.100 thin "N NaOH"$ to an endpoint of $p"H" 8.20 plus.minus 0.02$. Expressed in $"meq NaOH"/100 thin "g"$ dry basis.
2. *Residual Moisture and Water Activity ($a_w$) (AOAC 968.11, ISO 6673):* Thermogravimetric oven drying at $105 plus.minus 1 thin degree"C"$ to constant weight (@aoac96811, @iso6673). Chilled-mirror dewpoint hygrometry for $a_w$ at $25.00 plus.minus 0.05 thin degree"C"$ (accuracy $plus.minus 0.003 thin a_w$).
3. *Lipid Peroxide Value (AOAC 965.33):* Cold lipid extraction using $n$-hexane/petroleum ether ($1:1 thin v/v$) in darkness at 4 °C (@aoac96533). Dissolution in acetic acid:chloroform ($3:2 thin v/v$), reaction with saturated $"KI"$, and iodometric titration with $0.010 thin "N Na"_2"S"_2"O"_3$ against starch indicator ($"meq" thin "O"_2 / "kg fat"$).
4. *Polyphenols, 5-CQA, and Thermal Markers (AOAC 980.23 / Folin-Ciocalteu):* Ultrasonic extraction with methanol:water ($70:30 thin v/v$). Colorimetric quantification at $765 thin "nm"$ (Folin-Ciocalteu) calibrated against pure 5-CQA standard ($>= 98.5\%$). Spectrophotometric UV scanning at $325 thin "nm"$ tracking chlorogenic esters and 5-HMF formation according to AOAC 980.23 principles.

=== 5.2.2 Protocol for Mid-Infrared ATR-FTIR Acquisition
Vibrational spectra are acquired on a research-grade FTIR spectrometer fitted with a single-reflection diamond ATR accessory:
- *Spectral Range:* $4000 - 600 thin "cm"^(-1)$.
- *Optical Resolution:* $4 thin "cm"^(-1)$ ($3528$ wavenumber channels with Happ-Genzel apodization and Mertz phase correction).
- *Scan Accumulation:* $64$ scans per spectrum ($"SNR" > 50,000:1$).
- *Replication:* Technical triplicates per composite sample with controlled anvil clamping force ($80 plus.minus 2 thin "N"$).
- *Background Correction:* Fresh air background subtraction before every sample; crystal sanitization with spectroscopic ethanol/isopropanol (transmission verification $> 99.5\%$).

#table(
  columns: (1.2fr, 1.4fr, 1.5fr, 1.9fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Analytical Metric], [Standard / Protocol], [Instrumental Principle], [Kinetic Relevance & Dynamic Range]),
  [Titratable Acidity], [AOAC 920.92 (@aoac92092)], [Potentiometric titration with $0.1 thin "N NaOH"$ to $p"H" 8.20$], [CGA cleavage yielding free quinic acid ($1.5 - 4.0 thin "meq/100 g"$)],
  [Residual Moisture], [AOAC 968.11 (@aoac96811), ISO 6673 (@iso6673)], [Thermogravimetric oven loss at $105 thin degree"C"$], [Hygroscopic gain in tropical environment ($9.5 - 13.0\%$)],
  [Water Activity ($a_w$)], [Chilled-mirror dewpoint sensor], [Dewpoint hygrometry at $25 thin degree"C"$], [Water mobility; mold and Maillard risk factor ($0.50 - 0.72 thin a_w$)],
  [Peroxide Value], [AOAC 965.33 (@aoac96533)], [Cold solvent extraction and iodometric titration], [Primary autoxidation of unsaturated lipids ($0.8 - 15.0 thin "meq" thin "O"_2/"kg"$)],
  [Polyphenols & 5-CQA], [AOAC 980.23 / Folin], [UV-Vis spectrophotometry ($765 thin "nm"$ and $325 thin "nm"$)], [Degradation kinetics of chlorogenic antioxidants ($35 - 75 thin "mg/g"$)],
  [Vibrational Spectrum], [Diamond ATR-FTIR], [Mid-infrared absorption ($4000 - 600 thin "cm"^(-1)$)], [Non-destructive molecular fingerprint of functional bonds]
)

---

== 5.3 Data Science Pipeline, Modeling, and Rigorous Cross-Validation

=== 5.3.1 Preprocessing of Infrared Spectral Signatures
Raw spectral signatures undergo systematic mathematical preprocessing in Python (`scikit-learn`, `SciPy`):
1. *Standard Normal Variate (SNV):* Individual spectra $bold(x)$ are centered and scaled by their standard deviation to remove particle scattering:
   $ x_(i,"SNV") = (x_i - macron(x)) / s_x $
2. *Asymmetric Least Squares Smoothing (ALS):* Baseline correction penalizing negative drift ($p = 0.001$, $lambda = 10^5$).
3. *Savitzky-Golay Differentiation (SG):* Second-order polynomial across a 15-point window ($Delta nu approx 14 thin "cm"^(-1)$). First derivatives eliminate baseline offsets; second derivatives resolve overlapping peaks across carbonyl ($1745 thin "cm"^(-1)$), carboxyl ($1715 thin "cm"^(-1)$), and olefinic regions ($3008 thin "cm"^(-1)$).

=== 5.3.2 Three-Tier Factorial Benchmark and Computational Architectures
- *Tier 1: Classical Chemometrics Baseline (Linear and Kernel Models)*
  - *PLSR:* Decomposes spectral matrix $bold(X)$ and reference matrix $bold(Y)$ into 1 to 15 latent variables via SIMPLS; optimal rank chosen via minimum RMSECV.
  - *SVR:* Radial basis function kernel ($K(bold(x), bold(x)') = exp(- gamma ||bold(x) - bold(x)'||^2)$); Bayesian optimization of penalty $C$, bandwidth $gamma$, and margin $epsilon$.
- *Tier 2: Empirical Deep Learning (Multiscale 1D-CNN)*
  - Four parallel convolutional branches with receptive field widths $k in {3, 7, 15, 31}$ following Inception principles (@passos2605convolutionalneuralnetworks), followed by BatchNorm, GELU activation, 1D-MaxPooling, and Dropout ($p = 0.25$).
  - MLP regression head (128 and 64 units with $L_2$ regularization), trained using AdamW on mean squared error ($cal(L)_("data") = "MSE"$).
- *Tier 3: Physics-Informed Deep Learning (PINN with Arrhenius Constraints)*
  - Embeds mechanistic kinetics directly into neural optimization (@perre2025towardmechanisticmodels, @pronk2026neuralnetworkplacementin) using a compound loss:
    $ cal(L)_("total") = cal(L)_("data") + lambda_1 cal(L)_("kinetic") + lambda_2 cal(L)_("monotonicity") $
    where:
    $ cal(L)_("data") = 1/N sum_(i=1)^N (y_i - hat(y)_i)^2 $
    $ cal(L)_("kinetic") = 1/M sum_(j=1)^M ((d hat(C)_j)/(d t) + k(T_j) dot [hat(C)_j]^(n))^2, quad k(T_j) = A_0 dot exp(- E_a / (R dot T_j(t))) $
    $ cal(L)_("monotonicity") = 1/M sum_(j=1)^(M-1) "max"(0, hat(C)_(j+1) - hat(C)_j) $
    Here, PyTorch *Autograd* computes $d hat(C)_j / d t$ analytically; GradNorm adaptively balances weights $lambda_1$ and $lambda_2$.
- *Exploratory Extension:*
  - Screening recurrent networks (LSTM/GRU), selective state-space models (*ASGMamba* @li2026asgmambaadaptivespectral), Spectral Transformers (*SAM* @upadhyay2026enhancingspectralanalysis), and continuous Neural ODEs (NODE).

=== 5.3.3 Rigorous Data-Leakage-Free Cross-Validation (*Leave-One-Batch-Out*)
Standard random splitting (*Random K-Fold*) is strictly avoided as it yields over-optimistic scores due to sample correlation. Validation is conducted strictly via *GroupKFold* / *Leave-One-Batch-Out* (LOBO): all technical and biological replicates of an entire farm origin lot are withheld as the independent test fold, guaranteeing assessment of true generalization to unseen harvests.

=== 5.3.4 Quantitative Statistical Performance Metrics
1. *Coefficient of Determination ($R^2$):* Evaluated for calibration ($R_("cal")^2$), cross-validation ($R_("cv")^2$), and external test prediction ($R_("pred")^2$):
   $ R^2 = 1 - (sum_(i=1)^N (y_i - hat(y)_i)^2) / (sum_(i=1)^N (y_i - macron(y))^2) $
2. *Root Mean Square Error of Prediction ($"RMSEP"$):*
   $ "RMSEP" = sqrt(1/N_("test") sum_(i=1)^(N_("test")) (y_i - hat(y)_i)^2) $
3. *Residual Predictive Deviation ($"RPD"$):*
   $ "RPD" = "SD"_("reference") / "RMSEP" $
   Thresholds: $< 1.5$ (unusable); $1.5 - 2.0$ (preliminary screening); $2.0 - 2.5$ (good monitoring); $>= 2.5$ (excellent quantitative control).
4. *Mean Absolute Percentage Error ($"MAPE"$):*
   $ "MAPE" = 100\% / N_("test") sum_(i=1)^(N_("test")) |(y_i - hat(y)_i) / y_i| $

=== 5.3.5 Explainable Spectral Interpretability (XAI) and Physicochemical Causality Validation
To verify that inferences stem from true molecular bonds rather than noise, two XAI techniques are incorporated:
1. *SHAP (SHapley Additive exPlanations):* Computing Shapley values $phi_j$ to assess the marginal contribution of each wavenumber $nu_j$.
2. *Grad-CAM 1D:* Projecting gradients onto the final convolutional activation maps:
   $ alpha_k = 1/L sum_(l=1)^L (partial hat(y)) / (partial A_l^k), quad L_("Grad-CAM")^("1D")(nu) = "ReLU"(sum_k alpha_k A^k(nu)) $

*Causal Validation Criteria:*
Saliency peaks must coincide with known vibrational bands:
- *Peroxide Value:* Activation must peak at $3008 thin "cm"^(-1)$ (_cis_ unsaturation loss), $1745 thin "cm"^(-1)$ ($nu("C=O")$ ester), and $1715 thin "cm"^(-1)$ (hydroperoxides).
- *Titratable Acidity:* Weights must concentrate at $1715 - 1695 thin "cm"^(-1)$ (free carboxyls) and $1250 - 1150 thin "cm"^(-1)$ ($nu("C-O")$).
- *Polyphenols / 5-CQA:* Attribution must peak at $1650 - 1600 thin "cm"^(-1)$ (caffeoyl aromatics) and $1380 - 1150 thin "cm"^(-1)$ (quinic esters).
- *Moisture / $a_w$:* Attribution must align with the OH stretch at $3400 - 3250 thin "cm"^(-1)$.

Models with high $R^2$ but attribution on inactive or atmospheric bands are rejected for physical inconsistency.

---

= 6. Project Work Plan, Milestones, and Work Packages across 12 Months

== 6.1 Detailed Activity Breakdown by Work Package

=== WP1: Experimental Setup, Sampling Protocols, Calibration, and Workshop in Cartagena (Months 1–4)
- *Lead Institution:* Universidad de Cartagena (UdC) with active participation from Deggendorf Institute of Technology (DIT).
- *Lead Investigators:* Prof. Dr. Ricardo Vivas (UdC) and Prof. Dr. Isabel Suárez (DIT).
- *Activity 1.1 (Month 1):* Procurement of certified specialty coffee lots (*Castillo*, *Caturra*, *Colombia*, *Geisha*) scoring $>= 85$ SCA points.
- *Activity 1.2 (Months 1–2):* Warehouse setup in Cartagena under real tropical ambient conditions ($26 - 36 thin degree"C"$, $70 - 90\%$ RH); installation and calibration of multiparametric dataloggers.
- *Activity 1.3 (Months 1–2):* Optical calibration of diamond ATR-FTIR equipment and standardization of acquisition parameters (64 scans, $4 thin "cm"^(-1)$ resolution, triplicates).
- *Activity 1.4 (Month 2): Mission 1 — DIT Senior Visit and Bilateral Workshop in Cartagena:* 10-day stay of Prof. Dr. Isabel Suárez at UdC. Delivery of the 1-week intensive workshop *"Applied AI and Physicochemical Modeling in Agri-Food Spectroscopy"* for UdC researchers and graduate students. Alignment of data exchange pipelines.
- *Activity 1.5 (Months 3–4):* Consolidation of the pilot dataset and signal stability verification.
#callout(title: "Milestone M1 (Month 4)")[
  *Standardized experimental protocols finalized, dataloggers and ATR-FTIR systems calibrated in Cartagena, Mission 1 delivered, and pilot spectral database validated.*
]

=== WP2: Longitudinal Tropical Monitoring and Standardized AOAC/ISO Assays (Months 3–8)
- *Lead Institution:* Universidad de Cartagena (UdC) with remote support from DIT.
- *Lead Investigator:* Prof. Dr. Ricardo Vivas (UdC).
- *Activity 2.1 (Months 3–8):* Execution of the 180-day longitudinal storage experiment with 8 sampling intervals ($t_0$ to $t_7$).
- *Activity 2.2 (Months 3–8):* Systematic ATR-FTIR scanning in triplicate tracking lipid oxidation ($1745 thin "cm"^(-1)$), acidity ($1715 thin "cm"^(-1)$), and polyphenol decline ($1600 - 1650 thin "cm"^(-1)$).
- *Activity 2.3 (Months 3–8):* Execution of standardized chemical reference assays (AOAC 920.92, AOAC 968.11 / ISO 6673, AOAC 965.33, AOAC 980.23 / Folin).
- *Activity 2.4 (Months 6–8):* Spectral preprocessing (SNV, ALS, Savitzky-Golay), quality audit, and compilation of the relational dataset $X in RR^(N times P)$ and $Y in RR^(N times K)$.
#callout(title: "Milestone M2 (Month 8)")[
  *Complete, audited, and curated longitudinal spectral and reference database established and released for model training.*
]

=== WP3: Data Science Modeling, GPU Clusters, and Bilateral Research Stay in Deggendorf (Months 6–11)
- *Lead Institution:* Deggendorf Institute of Technology (DIT) in collaboration with UdC.
- *Lead Investigator:* Prof. Dr. Isabel Suárez (DIT) with active engagement of the UdC junior researcher.
- *Activity 3.1 (Months 6–8):* Implementation of the three-tier benchmark (PLSR/SVR, 1D-CNN, PINN with Arrhenius loss in PyTorch) and exploratory evaluation of Mamba SSM and Neural ODEs.
- *Activity 3.2 (Months 7–9):* Distributed training on GPU supercomputing clusters at the DIT AI Campus with Bayesian hyperparameter tuning.
- *Activity 3.3 (Months 8–9): Mission 2 — Research Stay of UdC Junior Scientist in Deggendorf:* 2-week research stay (strictly 14 days / 14 nights) in Deggendorf. Hands-on training in PINN optimization, XAI methods (Grad-CAM, SHAP), and collaborative drafting of the DFG-Minciencias application.
- *Activity 3.4 (Months 9–11):* GroupKFold validation (*Leave-One-Batch-Out*) and XAI spectral attribution analysis.
#callout(title: "Milestone M3 (Month 9)")[
  *Optimal hybrid model architecture identified and validated (high accuracy, physicochemical consistency via XAI), and Mission 2 completed successfully.*
]

=== WP4: Bilateral Synthesis, Q1 Publications, Final Report, and DFG Proposal (Months 10–12)
- *Lead Institution:* Joint Consortium DIT – UdC (co-chaired by Prof. Suárez and Prof. Vivas).
- *Activity 4.1 (Months 10–11):* Bilateral synthesis workshop integrating analytical chemistry and machine learning outcomes.
- *Activity 4.2 (Months 10–12):* Preparation and submission of two joint Q1 open-access peer-reviewed journal articles (*Food Chemistry* and *Computers and Electronics in Agriculture*).
- *Activity 4.3 (Months 11–12):* Finalization and submission of the technical and financial concluding report to BAYLAT.
- *Activity 4.4 (Months 11–12):* Formulation and submission of the 3-year bilateral DFG-Minciencias full proposal scaling to additional matrices.
#callout(title: "Milestone M4 (Month 12)")[
  *Final BAYLAT grant report approved, two Q1 manuscripts submitted, and joint DFG-Minciencias full proposal formally filed.*
]

== 6.2 Monthly Execution Schedule and Operational Milestones

#table(
  columns: (0.9fr, 2.5fr, 0.7fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else if row in (1, 6, 11, 16) { rgb("#fbfcfd") } else { none },
  align: (left, left, center, center, center, center, center, center, center, center, center, center, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Package], [Activity], [Lead],
    [M1], [M2], [M3], [M4], [M5], [M6], [M7], [M8], [M9], [M10], [M11], [M12],
    [Milestone]
  ),
  table.cell(rowspan: 5)[*WP1:* Setup & Mission 1],
  [1.1 Sourcing & SCA specialty cupping], [UdC], [x], [], [], [], [], [], [], [], [], [], [], [], [],
  [1.2 Storage setup & tropical dataloggers], [UdC], [x], [x], [], [], [], [], [], [], [], [], [], [], [],
  [1.3 ATR-FTIR instrumental calibration], [UdC], [x], [x], [], [], [], [], [], [], [], [], [], [], [],
  [1.4 *Mission 1: AI Workshop Cartagena*], [DIT], [], [x], [], [], [], [], [], [], [], [], [], [], [*M1 in Month 2*],
  [1.5 Pilot trials & dataset validation], [UdC/DIT], [], [], [x], [x], [], [], [], [], [], [], [], [], [*H1 (Month 4)*],
  table.cell(rowspan: 4)[*WP2:* Monitoring & Assays],
  [2.1 Tropical storage trial (180 days)], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.2 Continuous ATR-FTIR scanning], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.3 Standardized AOAC reference assays], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.4 Spectral preprocessing & curation], [UdC/DIT], [], [], [], [], [], [x], [x], [x], [], [], [], [], [*H2 (Month 8)*],
  table.cell(rowspan: 4)[*WP3:* Modeling & Mission 2],
  [3.1 3-tier benchmark (PLSR/CNN/PINN)], [DIT], [], [], [], [], [], [x], [x], [x], [], [], [], [], [],
  [3.2 Distributed GPU cluster training], [DIT], [], [], [], [], [], [], [x], [x], [x], [], [], [], [],
  [3.3 *Mission 2: Research stay DIT*], [UdC], [], [], [], [], [], [], [], [x], [x], [], [], [], [*M2 in Month 8–9*],
  [3.4 Leave-One-Batch & XAI validation], [DIT/UdC], [], [], [], [], [], [], [], [], [x], [x], [x], [], [*H3 (Month 9)*],
  table.cell(rowspan: 4)[*WP4:* Synthesis & DFG],
  [4.1 Bilateral synthesis workshop], [DIT/UdC], [], [], [], [], [], [], [], [], [], [x], [x], [], [],
  [4.2 Submission of 2 Q1 manuscripts], [DIT/UdC], [], [], [], [], [], [], [], [], [], [x], [x], [x], [],
  [4.3 Finalization of BAYLAT report], [DIT/UdC], [], [], [], [], [], [], [], [], [], [], [x], [x], [],
  [4.4 Submission of DFG-Minciencias grant], [DIT/UdC], [], [], [], [], [], [], [], [], [], [], [x], [x], [*H4 (Month 12)*]
)

---

= 7. Bilateral Cooperation, Mobility Plan, and BAYLAT Budget

== 7.1 Scientific and Institutional Synergy (UdC – DIT)
The bilateral cooperation leverages high-level institutional and disciplinary complementarity between Bavaria and Colombia:
- *Universidad de Cartagena (UdC, Colombia) — Chemical and Experimental Leadership:* The research group led by Prof. Dr. Ricardo Vivas (Faculty of Exact and Natural Sciences) brings over two decades of recognized leadership in natural product phytochemistry, lipid oxidation, and standardized food chemistry (AOAC/ISO). UdC provides research-grade FTIR spectrometers, wet-chemical laboratories, direct access to specialty coffee farming cooperatives, and the logistics to execute real tropical shelf-life experiments.
- *Deggendorf Institute of Technology (DIT, Germany) — Applied AI and Supercomputing:* The DIT AI Campus under Prof. Dr. Isabel Suárez provides specialized competence in machine learning, Physics-Informed Neural Networks (PINN), state-space models (Mamba SSM), and Explainable AI (XAI), powered by modern GPU supercomputing clusters.

This synergy bridges the gap between primary data acquisition in producer countries and high-performance algorithmic modeling in Bavaria.

== 7.2 Transatlantic Mobility Plan and Capacity Building
The mobility plan encompasses two strategic on-site missions:

=== Mission 1: Senior Researcher DIT to Cartagena (10 Days, Month 2)
- *Participant:* Prof. Dr. Isabel Suárez (DIT Lead Investigator).
- *Route & Schedule:* Munich (MUC) – Cartagena (CTG) – Munich (MUC); 10 days / 10 nights in Month 2.
- *Work Program:*
  1. Delivery of the 1-week intensive workshop *"Applied AI and Physicochemical Modeling in Agri-Food Spectroscopy"* for UdC faculty and graduate researchers.
  2. Laboratory inspection and calibration of spectrometer and datalogger networks.
  3. Standardization of metadata and cloud data transmission to Deggendorf.

=== Mission 2: Junior Researcher UdC to DIT Deggendorf (Strictly 2 Weeks / 14 Days / 14 Nights, Months 8–9)
- *Participant:* Qualified junior researcher (doctoral or master's candidate) from the research group of Prof. Dr. Ricardo Vivas (UdC).
- *Route & Schedule:* Cartagena (CTG) – Munich (MUC) – Deggendorf; strictly 14 days and 14 nights across Months 8–9.
- *Work Program:*
  1. Immersion in GPU cluster training under Prof. Suárez (PyTorch, JAX, Arrhenius loss optimization).
  2. Execution of the 3-tier benchmark scripts on the full dataset and generation of Grad-CAM and SHAP attribution maps.
  3. Collaboration in drafting the work packages for the DFG-Minciencias full proposal.

== 7.3 Consolidated BAYLAT Budget
The budget strictly follows BAYLAT seed grant guidelines (*Anschubfinanzierung*) and responsibly utilizes the 8,000 € maximum ceiling with a total request of 7,350 €:

- *Transatlantic Flights (Early-Booking Economy Class):*
  - Mission 1 (Prof. Dr. Isabel Suárez: MUC – CTG – MUC): 1,450 €.
  - Mission 2 (UdC Junior Researcher: CTG – MUC – CTG): 1,500 €.
  - Subtotal Flights: 2,950 €.
- *Accommodation Expenses:*
  - Mission 1: 10 nights in Cartagena @ 110 €/night = 1,100 €.
  - Mission 2: 14 nights in Deggendorf (DIT Guesthouse) @ 55 €/night = 770 €.
  - Subtotal Accommodation: 1,870 €.
- *Per Diem Allowances (BayRKG / DAAD Guidelines):*
  - Mission 1: 10 days in Colombia @ 50 €/day = 500 €.
  - Mission 2: 14 days in Germany @ 45 €/day = 630 €.
  - Subtotal Per Diem: 1,130 €.
- *International Travel Health Insurance (BAYLAT 100 € ceiling per person):*
  - Mission 1: 100 €.
  - Mission 2: 100 €.
  - Subtotal Insurance: 200 €.
- *Workshop Organization Costs in Cartagena:*
  - Course materials, audiovisual support, and coffee break catering: 450 €.
- *Subtotal Mobility and On-Site Workshop:*
  - Mission 1 (DIT -> UdC): 1,450 € + 1,100 € + 500 € + 100 € + 450 € = *3,600 €*.
  - Mission 2 (UdC -> DIT, 14 days): 1,500 € + 770 € + 630 € + 100 € = *3,000 €*.
  - Subtotal Mobility: *6,600 €*.
- *Consumable Laboratory Supplies (Coffee Degradation Assays):*
  - Reference standards (pure 5-CQA) and analytical reagents: *600 €* (maximum allowable limit under BAYLAT regulations).
- *Digital Media and Hybrid Streaming:*
  - Streaming hardware peripherals for workshop broadcasting and data tools: *150 €*.
- *Total Requested Grant Volume:*
  $3.600 thin "€" + 3.000 thin "€" + 600 thin "€" + 150 thin "€" = bold(7.350 thin "€")$ (strictly below the 8.000 € maximum ceiling).

#table(
  columns: (1.5fr, 0.9fr, 0.9fr, 0.8fr, 0.8fr, 2.1fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else if row == 8 { rgb("#eef5fb") } else { none },
  align: (left, center, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Budget Category],
    [Mission 1 \ (DIT -> UdC)],
    [Mission 2 \ (UdC -> DIT)],
    [Other \ Expenses],
    [Total (€)],
    [Calculation Basis & Justification]
  ),
  [Transatlantic Flights], [1,450 €], [1,500 €], [-], [2,950 €], [International economy flights MUC-CTG and CTG-MUC],
  [Accommodation], [1,100 €], [770 €], [-], [1,870 €], [10 nights @ 110 € (Cartagena) / 14 nights @ 55 € (DIT Guesthouse)],
  [Per Diem (Subsistence)], [500 €], [630 €], [-], [1,130 €], [10 days @ 50 € (Colombia) / 14 days @ 45 € (Germany) per BayRKG],
  [International Insurance], [100 €], [100 €], [-], [200 €], [International travel health insurance (max. 100 € per person)],
  [Workshop Organization], [450 €], [-], [-], [450 €], [Didactic materials, audiovisual gear, and catering at UdC],
  [Laboratory Consumables], [-], [-], [600 €], [600 €], [Chemical reagents, 5-CQA standards (BAYLAT max. 600 €)],
  [Digital Media & Licenses], [-], [-], [150 €], [150 €], [Hardware for hybrid streaming of workshop and data sharing],
  [*Total Requested Budget*], [*3,600 €*], [*3,000 €*], [*750 €*], [*7,350 €*], [*Total funding requested from BAYLAT (strictly below 8,000 € ceiling)*]
)

---

= 8. Strategic Outlook: Scalability to the Bilateral DFG - Minciencias Call

== 8.1 Roadmap for the Joint 3-Year DFG - Minciencias Proposal (36 Months)
The BAYLAT seed grant acts as a catalyst for systematic technical and methodological de-risking. Major international funding organizations, notably the German Research Foundation (*Deutsche Forschungsgemeinschaft* - DFG) and the Colombian Ministry of Science, Technology and Innovation (*Minciencias*), mandate demonstrated inter-institutional collaboration, harmonized protocols, and reproducible pilot data.

During Months 11 and 12, the team will draft and file a 3-year collaborative grant proposal (*DFG-Minciencias Bilateral Research Grants*). Core pillars include:
1. *Expanded Scientific Consortium:* Establishing a binational research group with formal dual-degree doctoral co-supervision (*Cotutelle de Thèse*) between DIT and Colombian doctoral programs.
2. *Three-Year Funding Volume:* Budget request of approximately 350,000 € from DFG (personnel in Bavaria, supercomputing time, LC-HRMS metabolomics) alongside matching funding from Minciencias (fieldwork, laboratory equipment at UdC).
3. *Submission Alignment:* Submission during the regular DFG-Minciencias call window in Month 12 to guarantee immediate research continuity.

== 8.2 Scaling to Strategic Colombian Agrifood Biodiversity Matrices
The PIML framework validated on specialty coffee (*Coffea arabica*) during the BAYLAT phase will be adapted in the DFG-Minciencias proposal across three additional high-value Colombian agricultural commodities:

1. *Fine Aroma Cocoa (*Theobroma cacao L.*):*
   Colombia is recognized by the ICCO as a producer of fine aroma cocoa, a strategic peace-building crop. The expanded project will model lipid autoxidation of cocoa butter and thermal degradation of antioxidant flavanols (epicatechin, procyanidins) during bean and liquor storage.
2. *Artisanal Honey (*Apis mellifera*):*
   Unfermented sweet matrix from tropical dry forests and Andean slopes. The model will incorporate kinetics for 5-hydroxymethylfurfural accumulation (5-HMF via AOAC 980.23), thermal enzyme inactivation (diastase, invertase), and hygroscopic fermentation risks.
3. *Virgin Coconut Oil (*Cocos nucifera*):*
   Bioeconomic staple of Pacific and Caribbean coastal communities. Modeling will target hydrolytic lipolysis and peroxide formation to safeguard medium-chain triacylglycerols (lauric acid C12:0).

#table(
  columns: (1.3fr, 1.3fr, 1.8fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  align: (left, left, left, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Agrifood Matrix],
    [Botanical Species],
    [Critical Molecular Biomarkers],
    [Standardized Reference Assays]
  ),
  [Washed Specialty Coffee],
  [*Coffea arabica*],
  [5-CQA loss, diterpene lipid peroxidation, free acidity],
  [AOAC 965.33, AOAC 920.92, AOAC 968.11, ISO 6673],
  [Fine Aroma Cocoa],
  [*Theobroma cacao*],
  [Epicatechin oxidation, butter lipolysis, methylxanthines],
  [Folin-Ciocalteu UV-Vis, titratable fat acidity, AOAC 965.33],
  [Artisanal Honey],
  [*Apis mellifera*],
  [5-HMF formation, diastase activity, reducing sugars],
  [AOAC 980.23 UV-Vis spectrophotometry, electrical conductivity],
  [Virgin Coconut Oil],
  [*Cocos nucifera*],
  [Hydrolysis of medium-chain TAGs (lauric acid), peroxides],
  [AOAC 965.33 peroxide value, free fatty acids, conjugated dienes]
)

== 8.3 Integration of Advanced Chromatographic Metabolomics (LC-HRMS and GC-MS)
While the BAYLAT seed grant relies upon rapid, cost-effective ATR-FTIR spectroscopy, the full DFG-Minciencias project will integrate high-resolution chromatography for molecular elucidation:
- *Untargeted Metabolomics via LC-HRMS (Q-TOF / Orbitrap):* Enabling structural identification and quantification of trace degradation intermediates, conjugated polyphenols, and advanced oxidation products across all four matrices.
- *Volatile Profiling via HS-SPME-GC-MS:* Tracking volatile aroma bouquets (pyrazines, esters, terpenes) and early staling volatiles (hexanal, nonanal, octen-3-ol).
- *Multilevel Data Fusion and Mechanistic Anchoring:* High-resolution chromatographic profiles will anchor and parameterize the PINN kinetic differential equations, linking infrared vibrational bands with chemical structures through low-, mid-, and high-level data fusion (@felizzato2025datafusionfor).

---

#bibliography("references.bib", title: [References])
