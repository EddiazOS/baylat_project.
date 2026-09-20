#import "typst-scientific-report-template/template.typ": project, callout

#set text(lang: "en")

#show: project.with(
  title: [Physics-Informed Neural Differential Equations and Multimodal Spectral Sensing for Autonomous Quality and Freshness Forecasting in Colombian Specialty Coffee],
  subtitle: [Detailed Scientific Research Proposal – BAYLAT Seed Grant (OASys 2026/2027)],
  objective: [
    To formulate, benchmark, and validate a physics-regularized deep learning framework coupling Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR) spectroscopy with standardized physicochemical reference assays in Colombian Specialty Coffee (*Coffea arabica*). The investigation centers on systematically benchmarking classical chemometrics (PLSR, SVR) against black-box deep learning (1D-CNN) and physics-informed neural networks (PINNs regularized by Arrhenius degradation kinetics for chlorogenic acids and lipid peroxidation) under accelerated storage conditions, complemented by the exploratory evaluation of emerging sequence models (Mamba SSM, Spectral Transformers) and bilateral capacity building between the Deggendorf Institute of Technology (DIT) and the Universidad de Cartagena (UdC).
  ],
  authors: (
    "Prof. Dr. Isabel Suárez — Deggendorf Institute of Technology (DIT), AI Campus",
    "Prof. Dr. Ricardo Vivas — Universidad de Cartagena (UdC), Faculty of Exact and Natural Sciences",
  ),
  date: "September 17, 2026",
  doc_id: "BAYLAT-EXP-EN-2026",
  header_title: "Scientific Research Proposal (BAYLAT) — DIT & UdC",
)

= 1. Executive Summary and Project Framing

== 1.1 Bioeconomic Motivation and Quality Challenges in Specialty Coffee
The Republic of Colombia is renowned globally for its production of high-altitude Arabica coffee (*Coffea arabica*). The coffee agro-industry serves as the socio-economic foundation of rural Colombia, sustaining over $550,000$ smallholder farming families across Andean mountain ranges (Huila, Nariño, Cauca, Eje Cafetero, Santander, and Sierra Nevada de Santa Marta). Specialty coffees commanding cup scores above $85$ points according to Specialty Coffee Association (SCA) standards achieve substantial market price premiums in European and particularly Bavarian specialty markets.

However, preserving this sensory excellence through long-term storage, sea freight logistics ($20$ to $45$ days transit from Cartagena de Indias to European ports), and tropical warehouse conditions remains an acute challenge. Environmental fluctuations ($20 - 40 thin degree"C"$, $50 - 85\%$ RH) trigger complex degradation cascades:
1. *Oxidative Degradation of Coffee Lipids:* Coffee contains $12 - 17\%$ lipids (predominantly unsaturated linoleic fatty acids and diterpene cafestol/kahweol esters) that undergo free-radical peroxidation, forming hydroperoxides, conjugated dienes, and staling aldehydes (hexanal).
2. *Hydrolysis and Lactonization of Chlorogenic Acids (CGA):* Bioactive caffeoylquinic acids (5-CQA, 3-CQA, 4-CQA) undergo hydrolytic cleavage into quinic and caffeic acids, or lactonize into astringent quinides, impairing cup acidity and generating metallic off-notes.
3. *Moisture Adsorption and Water Activity ($a_w$):* Fluctuations in water activity accelerate non-enzymatic browning and enzymatic decay.

Standard quality monitoring relies either on subjective sensory cupping or expensive, destructive chromatography (HPLC, GC-MS costing $150 - 300 thin "USD"$ per sample), rendering routine longitudinal monitoring unfeasible for rural cooperatives.

#callout(title: "Central Scientific Research Question")[
  *Core Research Question:* To what extent can deep learning and physics/chemistry-informed neural models (PINNs incorporating Arrhenius degradation kinetics) reliably forecast coffee quality alterations from longitudinal ATR-FTIR spectra, and how do they benchmark against traditional chemometric methods (PLSR, SVR) in terms of predictive accuracy, out-of-distribution generalization, and causal spectral interpretability?
]

== 1.2 Seed Grant Scope and Strategic Scalability Roadmap
This 12-month seed project ($8,000 thin "EUR"$) focuses exclusively on *Colombian Specialty Coffee* (*Coffea arabica*) to maximize experimental depth and analytical rigor. 

The validated methodology—coupling ATR-FTIR, AOAC wet-chemical standards, and physics-informed models—provides the empirical and algorithmic foundation for a subsequent 3-year bilateral grant application under the *DFG-Minciencias Bilateral Research Grants* programme. In that scaled initiative, the framework will be expanded to three additional strategic Colombian agri-food matrices: Fine Cocoa (*Theobroma cacao L.*), Artisanal Honey (*Apis mellifera*), and Virgin Coconut Oil (*Cocos nucifera*), integrating high-throughput chromatography (LC-HRMS, GC-MS).

---

= 2. Botanical, Phytochemical, and Degradation Fundamentals of *Coffea arabica*

The experimental study evaluates certified Colombian cultivars: *Castillo*, *Caturra*, *Colombia*, and *Geisha*. Their phytochemical matrix comprises:
- *Chlorogenic Acids (CGA):* $6 - 9\%$ dry weight, dominated by 5-caffeoylquinic acid (5-CQA).
- *Lipid Fraction:* $12 - 17\%$, rich in linoleic acid ($"C18:2"$) and cafestol/kahweol diterpenes.
- *Alkaloids and Methylxanthines:* Caffeine ($1.0 - 1.4\%$), trigonelline ($0.8 - 1.2\%$).
- *Carbohydrates:* Sucrose ($6 - 9\%$) and structural polysaccharides.

== 2.1 Kinetic Formulation and Arrhenius Temperature Dependence
The degradation kinetics are governed by $n$-th order rate equations linked to the Arrhenius relationship:

$ (d C_i(t)) / (d t) = - k_i(T) dot [C_i(t)]^(n_i), quad k_i(T) = A_i dot exp(- E_(a,i) / (R dot T)) $

where $C_i(t)$ represents the concentration of bioactive constituent $i$ (e.g., 5-CQA or unoxidized lipids), $n_i$ is the apparent reaction order, $A_i$ is the pre-exponential frequency factor ($"s"^(-1)$), $E_(a,i)$ is the apparent activation energy ($"kJ/mol"$), $R = 8.314 thin "J" / ("mol" dot "K")$, and $T$ is temperature in Kelvin.

== 2.2 ATR-FTIR Vibrational Spectroscopy of Coffee
Diamond Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR) spectroscopy captures the $4000 - 600 thin "cm"^(-1)$ mid-infrared spectral region non-destructively:

#table(
  columns: (1.2fr, 1.5fr, 2.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Wavenumber ($"cm"^(-1)$)],
    [Vibrational Mode],
    [Functional Group],
    [Kinetic Trajectory During Storage Aging]
  ),
  [$3400 - 3250$],
  [$nu("O-H")$ stretching],
  [Water ($a_w$) and phenolic OH (5-CQA)],
  [Intensity decreases upon desiccation; broadens during moisture sorption],
  [$3008$],
  [$nu(= "C-H")$ _cis_-alkene],
  [Unsaturated fatty acid acyl chains],
  [Progressive signal loss driven by radical lipid peroxidation],
  [$2925, 2854$],
  [$nu_("as"), nu_("s")("C-H") thin "CH"_2/"CH"_3$],
  [Aliphatic hydrocarbon chains in lipids],
  [Thermostable reference bands utilized for internal standard normalization],
  [$1745$],
  [$nu("C=O")$ ester carbonyl],
  [Triacylglycerols and diterpene esters],
  [Band broadening and emergence of free acid shoulder at $1715 thin "cm"^(-1)$],
  [$1715 - 1695$],
  [$nu("C=O")$ carboxylic acid],
  [Liberated quinic acid and free fatty acids],
  [Emergence and intensity rise tracking coffee bean staling],
  [$1650 - 1600$],
  [$nu("C=C")$ aromatic / $nu("C=O")$],
  [Aromatic ring in caffeic acid moieties],
  [Signal decline due to polyphenol oxidation and quinone polymerization],
  [$1380 - 1150$],
  [$nu("C-O"), delta("O-H")$],
  [Caffeoylquinic ester linkages],
  [Significant decrease correlated with HPLC chlorogenic acid depletion],
  [$1050 - 1030$],
  [$nu("C-O")$ carbohydrate],
  [Sucrose and structural polysaccharides],
  [Gradual signal decay associated with non-enzymatic browning]
)

---

= 3. Standardized Physicochemical Reference Assays (AOAC / ISO)

The Universidad de Cartagena conducts established standard analytical assays to calibrate spectral predictions:
1. *Titratable Acidity (AOAC 920.92):* Aqueous extraction ($10 thin "g"$ coffee in $100 thin "mL"$ degassed water) followed by potentiometric titration with $0.1 thin "N NaOH"$ to $p"H" 8.20$.
2. *Moisture Content & Water Activity (AOAC 968.11 / ISO 6673):* Thermogravimetric loss-on-drying at $105 thin degree"C"$; water activity ($a_w$) measured via chilled-mirror dewpoint sensor.
3. *Peroxide Value of Coffee Lipids (AOAC 965.33):* Cold-solvent lipid extraction and iodometric titration with sodium thiosulfate ($"Na"_2"S"_2"O"_3$) against starch indicator ($"meq" thin "O"_2/"kg lipid"$).
4. *Total Chlorogenic Acids (Folin-Ciocalteu / UV Spectrophotometry after AOAC 980.23):* Spectrophotometric quantification at $765 thin "nm"$ and $325 thin "nm"$ calibrated against pure 5-CQA standards.

---

= 4. Critical Literature Review, Research Gaps, and Central Hypothesis

The synergy between vibrational spectroscopy and artificial intelligence represents a high-growth frontier in food analytics:
- *Classical Chemometrics:* Conventional studies rely almost exclusively on Principal Component Analysis (PCA) and Partial Least Squares Regression (PLSR) for static classification and adulteration testing (@boadu2024developinganovel, @feng2021applicationofvisibleinfrared, @widiarto2026detectionofadulteration). These models operate on static snapshots, failing to capture dynamic degradation kinetics.
- *Convolutional Architectures:* Passos (@passos2605convolutionalneuralnetworks) demonstrated that 1D-CNNs with multiscale kernels effectively capture overlapping vibrational modes, but cautioned against severe overfitting when trained on limited spectral samples without inductive bias.
- *Attention Mechanisms:* Upadhyay & Chaudhary (@upadhyay2026enhancingspectralanalysis) pioneered Spectral Attention Mechanisms (SAM), proving that self-attention layers successfully align neural weights with specific vibrational frequencies.
- *State-Space Sequence Models:* Li et al. (@li2026asgmambaadaptivespectral) introduced ASGMamba, showcasing linear $cal(O)(L)$ computational complexity for multivariate time-series, which is ideally suited for long continuous aging trajectories.
- *Physics-Informed Machine Learning (PIML):* Perré (@perre2025towardmechanisticmodels) established PINN regularizers for moisture diffusion. Pronk & Anthony (@pronk2026neuralnetworkplacementin) demonstrated that placing neural networks as residual corrections in coffee roasting models prevents thermodynamic violations. Felizzato et al. (@felizzato2025datafusionfor) and Grundy et al. (@grundy2025reviewofcurrent) further highlighted multi-sensor data fusion imperatives.

*Critical Research Gap:* Prior literature lacks a rigorous benchmark comparing classical chemometrics against physics-regularized deep learning on real longitudinal FTIR coffee aging spectra under tropical conditions.

---

= 5. Exploratory Metamodel and 3-Tier Architecture Benchmark

The project implements a structured 3-tier comparative benchmark:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Benchmark Tier], [Model Family], [Configuration and Analytical Role]),
  [Tier 1: Baseline],
  [Classical Chemometrics \ (Linear & Kernel ML)],
  [PLSR (5–12 latent variables), Support Vector Regression (SVR, RBF kernel), and Random Forest on SNV + Savitzky-Golay preprocessed spectra.],
  [Tier 2: Deep Learning],
  [Empirical Deep Learning \ (Data-Driven Networks)],
  [1D-CNN with multiscale receptive fields ($3, 7, 15, 31 thin "spectral channels"$) and MLP regression heads without physical constraints.],
  [Tier 3: PIML],
  [Physics-Informed DL \ (PINN with Kinetic Loss)],
  [Hybrid PINN minimizing $cal(L)_("total") = cal(L)_("data") + lambda cal(L)_("kinetic")$, embedding pseudo-first order Arrhenius rate equations as soft-penalties.],
  [Exploratory Screening],
  [Advanced Sequence Models & NODEs \ (LSTM / Mamba / Transformers / Neural ODEs)],
  [Modular evaluation of recurrent networks (LSTM/GRU), Mamba State-Space Models (@li2026asgmambaadaptivespectral), Spectral Transformers with SAM attention maps (@upadhyay2026enhancingspectralanalysis), and continuous Neural ODEs (NODE).]
)

== 5.1 PINN Loss Function Formulation
The PINN framework optimizes:

$ cal(L)_("total") = 1/N sum_(i=1)^N (y_i - hat(y)_i)^2 + lambda_1 1/M sum_(j=1)^M ((d hat(C)_j)/(d t) + k(T) hat(C)_j)^2 + lambda_2 cal(R)_("monotonic") $

where $cal(L)_("kinetic")$ penalizes deviations from theoretical Arrhenius degradation, and $cal(L)_("monotonic")$ enforces non-increasing trajectories for chlorogenic acids in closed storage.

== 5.2 Multi-Objective Pareto Selection and Edge AI Deployment
Model selection optimizes three Pareto axes:
1. *Generalization Accuracy:* Cross-validation RMSE and $R^2 >= 0.90$ on *Leave-One-Batch-Out* splits.
2. *Causal Interpretability:* Grad-CAM and SHAP attribution maps verifying focus on diagnostic bands ($1745, 1715, 1600 - 1650 thin "cm"^(-1)$).
3. *Edge Deployment:* FP16/INT8 quantized execution on a Raspberry Pi 4B/5 single-board computer achieving latency $< 2.0 thin "seconds"$ and RAM usage $< 500 thin "MB"$.

---

= 6. Bilateral Cooperation, Workplan, and Budget Allocation

== 6.1 Institutional Synergies and Research Leadership
- *Technische Hochschule Deggendorf (DIT) — Prof. Dr. Isabel Suárez:* Mathematical formulation, GPU cluster training, PINN and Mamba architecture implementation, XAI spectral attribution, and delivery of the on-site workshop in Cartagena.
- *Universidad de Cartagena (UdC) — Prof. Dr. Ricardo Vivas:* Sourcing and botanical verification of specialty coffee cultivars, accelerated aging chambers ($25, 40, 60 thin degree"C"$), longitudinal ATR-FTIR scanning, and AOAC analytical assays.

== 6.2 Transatlantic Mobility and Researcher Training
1. *Mission 1 (DIT -> UdC, Month 2, 10 days):* Research visit by Prof. Dr. Isabel Suárez to Cartagena. Delivery of a 1-week intensive workshop on "Applied AI and Physics-Informed Deep Learning for Spectroscopic Agro-Food Analytics" for UdC researchers and graduate students; standardization of laboratory measurement protocols.
2. *Mission 2 (UdC -> DIT, Months 8–9, 21 days):* 3-week research stay of an early-career researcher from Prof. Vivas's team at DIT's AI Campus. Hands-on GPU neural network training, XAI attribution validation, and co-drafting the DFG-Minciencias grant application.

== 6.3 12-Month Workplan and Key Milestones
- *WP1 (Months 1–4, UdC/DIT):* Protocol harmonization, coffee sampling, Workshop 1 in Cartagena with Prof. Suárez (M2). *Milestone M1 (M4):* Standardized protocol and pilot dataset established.
- *WP2 (Months 3–8, UdC):* Accelerated storage trials (180 days), periodic FTIR scans, and AOAC wet chemistry. *Milestone M2 (M8):* Longitudinal coffee spectral database completed.
- *WP3 (Months 6–11, DIT/UdC):* 3-tier benchmark execution, research stay of UdC junior researcher at DIT (M8–9). *Milestone M3 (M9):* Optimal Pareto architecture identified.
- *WP4 (Months 10–12, DIT/UdC):* Bilateral synthesis, two open-access manuscripts submitted, DFG-Minciencias grant drafted. *Milestone M4 (M12):* Submission of follow-up grant and final BAYLAT report.

== 6.4 Detailed Budget Plan (Total Requested: 8,000 €)
The budget strictly follows BAYLAT regulations and matches *06_Reiseverwaltung_Kostenkalkulation_Anschubfinanzierung.xlsx*:

#table(
  columns: (1.4fr, 0.9fr, 0.9fr, 0.8fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  align: (left, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header([Budget Category], [Mission 1 (DIT->UdC)], [Mission 2 (UdC->DIT)], [Total], [Basis of Calculation]),
  [Airfare (Round-trip)], [1,450 €], [1,500 €], [2,950 €], [Transatlantic economy airfare (Munich-Cartagena / Cartagena-Munich)],
  [Accommodation Costs], [1,100 €], [1,155 €], [2,255 €], [10 nights @ 110 € in Cartagena / 21 nights @ 55 € in DIT Guest House],
  [Per Diem (Subsistence)], [500 €], [945 €], [1,445 €], [10 days @ 50 € (Colombia) / 21 days @ 45 € (Germany) per BayRKG],
  [Hospitality / Workshop], [400 €], [-], [400 €], [Catering and organization for on-site AI workshop at UdC],
  [Travel Insurance], [100 €], [100 €], [200 €], [International health insurance (maximum 200 € per BAYLAT rules)],
  [Laboratory Materials], [-], [-], [600 €], [Reference standards and reagents for coffee aging (maximum 600 €)],
  [Digital Conference Costs], [-], [-], [150 €], [Streaming accessories for hybrid workshop delivery and collaboration],
  [*Total BAYLAT Funding*], [*3,550 €*], [*3,700 €*], [*8,000 €*], [*Total funding requested from BAYLAT (Deckblatt & Belegliste, maximum ceiling)*]
)

== 6.5 Pathway to DFG-Minciencias Follow-Up Funding
The models and experimental databases matured in this seed project will serve as the indispensable preliminary empirical evidence for a 3-year bilateral grant application under the *DFG-Minciencias Bilateral Research Grants* programme. The follow-up project will transfer the validated PIML methodology to *Fine Cocoa*, *Artisanal Honey*, and *Virgin Coconut Oil*, coupling low-cost spectroscopy with high-resolution chromatographic metabolomics (LC-HRMS, GC-MS).

#bibliography("references.bib", title: [References])
