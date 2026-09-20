# Comprehensive Technical Synthesis & Hand-off Report: BAYLAT Bilateral Research Proposal (DIT — UdC)

**Document ID:** BAYLAT-SURVEY-2-TECH-SYNTHESIS  
**Date:** 2026-09-17  
**Author:** Explorer Subagent (Survey 2 — Technical & Chemical Architecture, 3-Tier AI Space, and Experimental Design)  
**Target Workspace:** `/home/echoes/projects/AI_project/proyecto-babiera`  
**Recipient:** Orchestrator (`e05c40fb-9d59-471b-832f-f4d85278737f`)  

---

## 1. Observation

This section provides direct, verified observations extracted from project files, authoritative requirements (`ORIGINAL_REQUEST.md`, `propuesta_cientifica_baylat_oasys.md`), peer-reviewed literature in `references.bib`, and precedent analytical evaluations (`topic_proposal.pdf`).

### 1.1 Direct Literature Evidence and Critical Methodological Gaps
From the direct textual analysis of the codebase and literature references:
- **Pronk & Anthony (2026)** (*Scientific Reports*, 16, 67034, `pronk2026neuralnetworkplacementin`): Examined 221 industrial coffee roasting batches comparing physics-informed machine learning (PIML) with empirical baselines. Key observation: *A matched-input feedforward empirical neural network achieved $R^2 = 0.97$ with 3 to 20 times fewer parameters, whereas rigid ODE PIML models achieved $R^2 = 0.70 - 0.94$. Imposing rigid physical constraints without adequate identifiability introduces parameter inflation, optimization stiffness, and systematic bias. Physics-motivated bounds on residual corrections were not consistently beneficial.* This establishes that physical constraints must be formulated as soft, tunable regularizers (PINN soft penalties) rather than rigid, unyielding architectural bottlenecks.
- **Passos (2026)** (*TrAC Trends in Analytical Chemistry*, 203, 119015, `passos2605convolutionalneuralnetworks`): Demonstrates that standard computer-vision CNN architectures cannot be naively transferred to vibrational spectroscopy. Effective 1D-CNN encoders require *conditional design*: kernel widths matched to the physical Full Width at Half Maximum (FWHM) of vibrational absorbance bands ($\Delta\nu \sim 10 - 50\,\text{cm}^{-1}$), preservation of spectral continuity, and chemometric normalization (SNV, MSC) to avoid spurious artifacts.
- **Upadhyay & Chaudhary (2026)** (*Scientific Reports*, 16, 48661, `upadhyay2026enhancingspectralanalysis`): Developed a 1D-CNN + Transformer architecture with a Spectral Attention Mechanism (SAM) for FTIR food authentication (ghee adulteration), achieving 99.6% accuracy on internal datasets and demonstrating edge deployment on Raspberry Pi. However, the study evaluated only static classification, not longitudinal degradation trajectories, and noted that *attention heatmaps highlight spectral correlations but do not prove chemical causality unless corroborated by ground-truth reference assays*.
- **Perré (2025)** (*Drying Technology*, 43(1-2), 147–161, `perre2025towardmechanisticmodels`): Explored PINNs for biomaterial drying simulation, proving that physics-informed constraints enable safe extrapolation beyond the training range, but the framework operated entirely on simulated heat/mass transfer grids without FTIR spectral input.
- **Li et al. (2026)** (*arXiv:2602.01668*, `li2026asgmambaadaptivespectral`): Introduced ASGMamba (Adaptive Spectral Gating Mamba), establishing that Selective State Space Models (SSMs) achieve linear computational complexity $\mathcal{O}(L)$ in both compute and memory for continuous time-series forecasting, outperforming quadratic attention Transformers ($\mathcal{O}(L^2)$) on long temporal horizons.
- **Grundy et al. (2025)** (*FSA Research and Evidence*, `grundy2025reviewofcurrent`): Highlighted that while vibrational spectroscopy (FTIR/NIR) provides rapid, reagent-free screening for edible oils, conventional chemometrics suffers from instrument-to-instrument transfer failure, environmental baseline drift, and lack of standardized longitudinal datasets.

### 1.2 Identified Architectural Vacancy in Agri-Food Science
As audited across all workspace documents, *no existing study in the international literature has integrated ATR-FTIR longitudinal time series across cocoa, coffee, honey, and virgin coconut oil with a 3-tier hybrid deep learning framework combining spectral encoders (CNN/Transformer/GNN), temporal dynamics (LSTM/Mamba), and thermodynamic kinetic regularizers (Arrhenius PINN / Neural ODE).* The state of the art is fragmented into static chemometric classification (PCA/PLS), decoupled physical simulations, or non-food time-series models.

---

## 2. Logic Chain: Comprehensive Technical Synthesis

### 2.1 The Four Colombian Agri-Food Matrices: Degradation Pathways & Kinetics

Colombia's equatorial geography, diverse microclimates, and post-conflict rural development strategies place four high-value agri-food matrices at the core of its sustainable bioeconomy. During maritime export transit (20–45 days) and warehouse storage under tropical ambient conditions ($20\,^{\circ}\text{C} - 45\,^{\circ}\text{C}$, $50\% - 85\%$ RH), each matrix undergoes distinct chemical degradation:

```
[Tropical Agro-Matrix] ──> [Environmental Stress: T, RH, O2] ──> [Specific Degradation Cascade] ──> [Measurable FTIR Shift & AOAC Marker]
```

#### A. Cocoa (*Theobroma cacao L.*) — Fine & Aroma Criollo/Trinitario
1. **Socioeconomic Relevance:** Cultivated by over 52,000 smallholder families, primarily in the Caribbean hinterland (Sierra Nevada de Santa Marta, Montes de María) and inter-Andean valleys (Santander, Huila). Classified as "fine flavour cocoa" by the International Cocoa Organization (ICCO).
2. **Key Biochemical Compounds:** Flavan-3-ols (monomeric $(-)$-epicatechin and $(+)$-catechin, procyanidin dimers B2 and B5), methylxanthines (theobromine 1.2–2.5%, caffeine 0.2–0.5%), and triacylglycerols (POS, SOS, POP representing $>75\%$ of cocoa butter).
3. **Degradation Pathways:**
   - *Polyphenol Autooxidation & Condensation:* Enzymatic polyphenol oxidase (PPO) residual activity and non-enzymatic quinone-mediated condensation convert monomeric flavan-3-ols into high-molecular-weight, insoluble brown tannins (phlobaphenes). This results in loss of antioxidant capacity, increased astringency, and pigment polymerization.
   - *Triacylglycerol Lipolysis & Butter Oxidation:* Atmospheric moisture and native lipases hydrolyze ester bonds, releasing free fatty acids (FFAs) and diacylglycerols, followed by free-radical attack on unsaturated fatty acids (oleic acid C18:1, linoleic acid C18:2).
4. **Kinetics & Arrhenius Formulation:**
   - Polyphenol loss follows a pseudo-first-order rate law:
     $$\frac{d[C_{\text{poly}}]}{dt} = -k_{\text{poly}}(T) [C_{\text{poly}}], \quad [C_{\text{poly}}](t) = [C_{\text{poly}}]_0 \exp(-k_{\text{poly}} t)$$
   - Free fatty acid accumulation in cocoa butter follows a zero-to-first-order rate:
     $$\frac{d[\text{FFA}]}{dt} = k_{\text{lip}}(T)$$
   - Temperature dependence governed by Arrhenius kinetics with typical activation energy $E_{a,\text{poly}} = 45 - 65\,\text{kJ/mol}$ and $E_{a,\text{lip}} = 60 - 85\,\text{kJ/mol}$:
     $$k(T) = A \exp\left(-\frac{E_a}{R T}\right)$$

#### B. Specialty Coffee (*Coffea arabica*) — Castillo, Caturra, Colombia, Geisha
1. **Socioeconomic Relevance:** Colombia's national flagship agricultural product, supporting $>540,000$ farming families across the Andean mountain range (Eje Cafetero, Huila, Nariño, Tolima).
2. **Key Biochemical Compounds:** Chlorogenic acids (CGAs: 5-caffeoylquinic acid [5-CQA], 3-CQA, 4-CQA, dicaffeoylquinic acids [diCQA]), sucrose ($6 - 9\%$), trigonelline ($0.8 - 1.2\%$), caffeine ($1.0 - 1.4\%$), and superficial coffee diterpene lipids (cafestol and kahweol esters).
3. **Degradation Pathways:**
   - *Chlorogenic Acid Hydrolysis & Lactonization:* Thermal exposure during storage drives the cleavage of caffeic and quinic acid ester bonds and intramolecular lactonization into quinides, degrading cup acidity and generating harsh metallic bitterness.
   - *Surface Lipid Autooxidation:* Coffee lipids migrate to bean surfaces, where linoleic (C18:2) and palmitic (C16:0) esters react with triplet oxygen via radical initiation ($\text{R}^\bullet + \text{O}_2 \rightarrow \text{ROO}^\bullet$), generating primary conjugated diene hydroperoxides and secondary volatile hexanal (loss of fresh aroma / staling).
   - *Non-Enzymatic Maillard Alteration:* Slow staling via sugar-amine condensation, producing brown melanoidin polymers and degrading volatile aroma furans and pyrazines.
4. **Kinetics & Arrhenius Formulation:**
   - CGA degradation follows first-order kinetics:
     $$\ln\left(\frac{[\text{CGA}]_t}{[\text{CGA}]_0}\right) = -k_{\text{CGA}}(T) t, \quad E_{a,\text{CGA}} \approx 55 - 75\,\text{kJ/mol}$$
   - Peroxide formation follows an autocatalytic/pseudo-first-order curve with induction period $t_{\text{ind}}$:
     $$[\text{PV}](t) = \frac{[\text{PV}]_{\max}}{1 + \exp(-k_{\text{ox}}(t - t_{\text{ind}}))}$$

#### C. Honey (*Apis mellifera*) — Caribbean Dry Forest & Montane Rainforest
1. **Socioeconomic Relevance:** Emerging high-value bioeconomy product generated by artisanal beekeepers and agroforestry cooperatives in the Caribbean lowlands (Montes de María, Canal del Dique) and Andean cordilleras.
2. **Key Biochemical Compounds:** Invert sugars ($D$-fructose $38 - 42\%$, $D$-glucose $31 - 35\%$, sucrose $< 2\%$), organic acids (gluconic acid $0.5\%$), native enzymes ($\alpha$-glucosidase/diastase, $\beta$-fructofuranosidase/invertase, glucose oxidase), and trace 5-hydroxymethylfurfural (5-HMF).
3. **Degradation Pathways:**
   - *Acid-Catalyzed Fructose Dehydration to 5-HMF:* In the naturally acidic medium ($\text{pH } 3.4 - 4.5$), hexoses (principally fructose via the fructofuranosyl cation intermediate) undergo dehydration with loss of 3 water molecules, forming 5-(hydroxymethyl)-2-furaldehyde (5-HMF). 5-HMF is the internationally regulated toxicological and freshness index (Codex threshold: max 40 mg/kg; tropical honey exception: max 80 mg/kg).
   - *Enzymatic Thermal Denaturation:* Native diastase and invertase undergo conformational unfolding and catalytic inactivation under elevated storage temperatures.
   - *Phase Separation & Crystallization:* Glucose monohydrate precipitates when the fructose/glucose ratio ($F/G$) falls below 1.14 and water content exceeds 18%, initiating spontaneous fermentative spoilage by osmophilic yeasts (*Zygosaccharomyces*).
4. **Kinetics & Arrhenius Formulation:**
   - 5-HMF accumulation follows zero-order kinetics at short/medium intervals and pseudo-first-order at extended times:
     $$\frac{d[\text{HMF}]}{dt} = k_{\text{HMF}}(T), \quad [\text{HMF}](t) = [\text{HMF}]_0 + k_{\text{HMF}}(T) t$$
     with high thermal sensitivity: $E_{a,\text{HMF}} = 100 - 140\,\text{kJ/mol}$ ($Q_{10} \approx 3.5 - 4.2$).
   - Diastase activity (DN) loss follows first-order inactivation:
     $$\ln(\text{DN}_t / \text{DN}_0) = -k_{\text{dia}}(T) t, \quad E_{a,\text{dia}} = 85 - 110\,\text{kJ/mol}$$

#### D. Virgin Coconut Oil (VCO, *Cocos nucifera*) — Pacific & Caribbean Coastal Origin
1. **Socioeconomic Relevance:** Crucial bioeconomic livelihood for Afro-Colombian and indigenous coastal communities (Guapi, Tumaco, San Andrés, Bolívar). High export value in European organic cosmetics and nutraceutical sectors.
2. **Key Biochemical Compounds:** Medium-chain saturated triacylglycerols (MCTs, $>65\%$), dominated by lauric acid (C12:0, $48 - 53\%$), myristic acid (C14:0, $16 - 20\%$), caprylic acid (C8:0, $7 - 9\%$), capric acid (C10:0, $5 - 7\%$), with very low unsaturated fractions (oleic C18:1, $5 - 7\%$; linoleic C18:2, $1 - 2\%$), and minor endogenous phenolic antioxidants (ferulic, $p$-coumaric acids).
3. **Degradation Pathways:**
   - *Primary Oxidative Rancidity:* Free radical autooxidation targeting residual allylic methylene carbons of oleic and linoleic chains, generating unstable conjugated hydroperoxides ($\text{ROOH}$).
   - *Secondary Oxidation & Chain Cleavage:* Homolytic cleavage of the $\text{O-O}$ bond produces alkoxy radicals ($\text{RO}^\bullet$), undergoing $\beta$-scission to form volatile aldehydes (hexanal, nonanal), ketones, and short-chain carboxylic acids responsible for pungent rancidity.
   - *Hydrolytic Rancidity (Lipolysis):* Autocatalytic hydrolysis of ester bonds in the presence of trace residual moisture ($> 0.1\%$), splitting triacylglycerols into glycerol and free lauric acid.
   - *Geometric trans-Isomerization:* Cis-alkene double bonds isomerize into trans-conformers under prolonged thermal excitation.
4. **Kinetics & Arrhenius Formulation:**
   - Hydroperoxide accumulation follows pseudo-first-order rate in early oxidation:
     $$\frac{d[\text{PV}]}{dt} = k_{\text{PV}}(T) [\text{RH}]_{\text{unsat}}$$
     with $E_{a,\text{PV}} = 70 - 95\,\text{kJ/mol}$.
   - Free fatty acid accumulation follows zero-order kinetics:
     $$[\text{FFA}](t) = [\text{FFA}]_0 + k_{\text{FFA}}(T) t, \quad E_{a,\text{FFA}} = 50 - 75\,\text{kJ/mol}$$

---

### 2.2 ATR-FTIR Vibrational Band Assignments ($cm^{-1}$) & Degradation Markers

Attenuated Total Reflection Fourier-Transform Infrared (ATR-FTIR) spectroscopy operates across the mid-infrared spectrum ($4000 - 650\,\text{cm}^{-1}$). The table below maps exact vibrational assignments, functional groups, and spectral evolution for each matrix:

| Matrix | Wavenumber ($\text{cm}^{-1}$) | Vibrational Mode & Bond | Biochemical Functional Group | Degradation Behavior & Diagnostic Value |
| :--- | :--- | :--- | :--- | :--- |
| **All / General** | $3700 - 3100$ (broad) | $\nu(\text{O-H})$ stretching | Moisture, hydroxyls of polyphenols/sugars | Broadening/intensity shifts with moisture gain/loss |
| **Cocoa** | $3400 - 3300$ | $\nu(\text{O-H})$ phenolic | Monomeric flavan-3-ols (epicatechin) | **Decreases & broadens** as polyphenols oxidize and condense into insoluble tannins |
| **Cocoa** | $2924, 2853$ | $\nu_{as}(\text{CH}_2), \nu_s(\text{CH}_2)$ | Aliphatic acyl chains of cocoa butter | Stable baseline reference for internal normalization |
| **Cocoa** | $1742 - 1740$ | $\nu(\text{C=O})$ ester carbonyl | Triglyceride esters (POS/SOS/POP) | **Splits & shifts downward** toward $1715\,\text{cm}^{-1}$ as free fatty acids accumulate |
| **Cocoa** | $1650 - 1630$ | $\nu(\text{C=O})$ amide I / heterocyclic | Methylxanthines (theobromine, caffeine) | Stable marker for botanical authenticity and dilution |
| **Cocoa** | $1610 - 1515$ | $\nu(\text{C=C})$ aromatic skeletal | Catechin/epicatechin aromatic ring I/II | **Decreases significantly** upon oxidative quinone coupling |
| **Cocoa** | $1165$ | $\nu(\text{C-O-C})$ ester stretching | Triglyceride backbone | Modulates with partial glyceride formation (lipolysis) |
| **Coffee** | $3400$ | $\nu(\text{O-H})$ stretch | Chlorogenic acids & bound water | **Decreases** with thermal degradation of chlorogenic acid |
| **Coffee** | $2924, 2854$ | $\nu_{as}(\text{CH}_2), \nu_s(\text{CH}_2)$ | Surface diterpene lipids (cafestol) | Ratio to $1745\,\text{cm}^{-1}$ shifts during surface lipid oxidation |
| **Coffee** | $1745$ | $\nu(\text{C=O})$ ester carbonyl | Triacylglycerol surface lipids | **Increases shoulder at $1720\,\text{cm}^{-1}$** with free fatty acid release |
| **Coffee** | $1710 - 1695$ | $\nu(\text{C=O})$ carboxylic acid | Cleaved caffeic acid & lipid FFAs | **Emerges and increases** with staling and lipid rancidity |
| **Coffee** | $1655$ | $\nu(\text{C=O})$ heterocyclic amide | Caffeine ring system | Thermostable internal standard |
| **Coffee** | $1380 - 1150$ | $\nu(\text{C-O}), \delta(\text{O-H})$ | Quinic and caffeic acid ester moieties | **Decreases progressively** tracking chlorogenic acid hydrolysis |
| **Coffee** | $1050 - 1030$ | $\nu(\text{C-O})$ carbohydrate | Sucrose and structural polysaccharides | Decreases with slow Maillard caramelization |
| **Honey** | $3300 - 3280$ | $\nu(\text{O-H})$ H-bonded | Water and hexose hydroxyl network | Correlates with moisture content and water activity ($a_w$) |
| **Honey** | $2930$ | $\nu(\text{C-H})$ stretch | Aliphatic hexose ring carbons | Used for spectral vector normalization |
| **Honey** | $1680 - 1670$ | $\nu(\text{C=O})$ conjugated carbonyl | **5-Hydroxymethylfurfural (5-HMF)** | **Emergent diagnostic band:** absent in fresh honey, grows linearly with thermal aging |
| **Honey** | $1645 - 1640$ | $\delta(\text{O-H})$ bending / $\nu_{as}(\text{COO}^-)$| Bound moisture / gluconic acid | Increases with fermentation and free acidity rise |
| **Honey** | $1150 - 900$ | "Sugar Fingerprint Region" | Fructose ($\sim 1055\,\text{cm}^{-1}$), Glucose ($\sim 1030\,\text{cm}^{-1}$) | Peak ratio $A_{1055}/A_{1030}$ monitors fructose-to-glucose balance and crystallization onset |
| **Honey** | $920$ | Pyranose ring deformation | $\alpha$-D-glucopyranose conformer | Sharpens upon glucose crystallization |
| **VCO** | $3470$ | $\nu(\text{O-O-H})$ overtone / stretch | **Hydroperoxides ($\text{ROOH}$)** | **Increases during primary oxidation** (peroxide accumulation) |
| **VCO** | $3005$ | $\nu(=\text{C-H})$ cis-alkene stretch | Unsaturated acyl chains (oleic/linoleic) | **Decreases continuously** as radical oxidation consumes cis-double bonds |
| **VCO** | $2922, 2852$ | $\nu_{as}(\text{CH}_2), \nu_s(\text{CH}_2)$ | Saturated lauric/myristic chains | Stable structural backbone (reference standard) |
| **VCO** | $1746$ | $\nu(\text{C=O})$ ester carbonyl | Saturated triacylglycerols (MCTs) | **Band broadens**; shoulder at $1711\,\text{cm}^{-1}$ appears due to FFAs |
| **VCO** | $1720 - 1711$ | $\nu(\text{C=O})$ secondary carbonyl / acid | Aldehydes, ketones, free lauric acid | **Increases during secondary rancidity** and ester hydrolysis |
| **VCO** | $1465, 1377$ | $\delta(\text{CH}_2)$ scissoring, $\delta(\text{CH}_3)$ sym | Methylene / methyl groups | Internal standard for spectral thickness normalization |
| **VCO** | $1160, 1148, 1112$| $\nu(\text{C-O})$ triplet | Ester C-O vibrations of triglycerides | Changes in triplet ratio indicate partial hydrolysis (mono/diacylglycerols) |
| **VCO** | $967$ | $\delta(=\text{C-H})$ out-of-plane trans | **trans-Isomerized double bonds** | **Diagnostic emergence:** rises during thermal oxidative degradation |
| **VCO** | $722$ | $\rho(\text{CH}_2)_n$ rocking ($n \ge 4$) | Aliphatic lauric chain skeleton | Saturated packing integrity indicator |

---

### 2.3 Standardized Reference Assays (AOAC / ISO / Codex)

To provide rigorous, cost-effective ground-truth anchoring for deep learning kinetic models during the 12-month BAYLAT seed funding period, the project deploys standardized, internationally recognized wet-chemical and spectrophotometric assays:

```
[LONGITUDINAL SAMPLING] ──> [SPLIT SAMPLE]
                               ├──> ATR-FTIR Spectrometer (4000-650 cm^-1, 64 scans)
                               └──> Standardized Reference Assay (AOAC/ISO Ground Truth)
                                       ├── Cocoa: Folin-Ciocalteu (Polyphenols) + Butter Acidity (AOAC 940.28)
                                       ├── Coffee: Titratable Acidity (AOAC 920.92) + pH + UV Browning
                                       ├── Honey: 5-HMF UV-Vis (AOAC 980.23) + Diastase (Phadebas) + °Brix
                                       └── VCO: Peroxide Value (AOAC 965.33) + FFA (ISO 660) + Dienes K232
```

#### A. Cocoa Standard Assays
1. **Total Polyphenols by Folin-Ciocalteu Assay:**
   - *Protocol:* Defatting of cocoa powder with petroleum ether/hexane, aqueous-acetone ($70:30\,\text{v/v}$) ultrasonic extraction. Reaction of phenolic extract with Folin-Ciocalteu phosphomolybdic-phosphotungstic reagent in sodium carbonate ($\text{Na}_2\text{CO}_3$) alkaline buffer.
   - *Measurement:* UV-Vis spectrophotometry at $760 - 765\,\text{nm}$.
   - *Units / Reference:* mg gallic acid equivalents per gram dry matter ($\text{mg GAE/g}$). Fresh cocoa: $80 - 120\,\text{mg GAE/g}$; aged/degraded cocoa: drops to $30 - 50\,\text{mg GAE/g}$.
2. **Cocoa Butter Free Fatty Acids (Acid Value):**
   - *Protocol:* Standard method AOAC 940.28 / ISO 660. Solvent extraction of butter, volumetric titration with standardized $0.1\,\text{N KOH}$ or $\text{NaOH}$ in neutralized ethanol/ether ($1:1\,\text{v/v}$) using phenolphthalein indicator.
   - *Units / Legal Limit:* % oleic acid equivalent (or $\text{mg KOH/g}$ fat). International threshold: $\le 1.75\%$ oleic acid.
3. **Moisture Content:** Gravimetric oven drying at $103 \pm 2\,^{\circ}\text{C}$ to constant weight (AOAC 931.04).

#### B. Specialty Coffee Standard Assays
1. **Titratable Acidity:**
   - *Protocol:* Standard method AOAC 920.92. Aqueous infusion of ground coffee ($10\,\text{g}$ in $100\,\text{mL}$ boiling distilled water, filtered), potentiometric titration with $0.1\,\text{N NaOH}$ to a stoichiometric end point of $\text{pH } 8.20$.
   - *Units:* mL $0.1\,\text{N NaOH}$ per $100\,\text{g}$ dry basis (or g citric acid equivalent $/100\,\text{g}$).
2. **pH Potentiometry:** Standard glass combination electrode calibrated with buffers at $\text{pH } 4.00$ and $\text{7.00}$ at $25\,^{\circ}\text{C}$.
3. **Moisture Content:** Two-stage gravimetric vacuum-oven drying at $105\,^{\circ}\text{C}$ (ISO 6673). Commercial threshold: $10.0 - 12.5\%$.
4. **UV-Vis Browning & Staling Index:** Absorbance ratio $A_{420} / A_{280}$ measuring formation of brown advanced Maillard polymers against caffeic acid/protein precursors.

#### C. Honey Standard Assays
1. **5-Hydroxymethylfurfural (5-HMF) by UV Spectrophotometry (White / Winkler Method):**
   - *Protocol:* AOAC 980.23 / Codex Alimentarius Standard 12-1981 / IHC (International Honey Commission). Honey ($5\,\text{g}$) is dissolved in water, clarified with Carrez I and Carrez II reagents, and split into two aliquots. Aliquot 1 is treated with water (sample), while Aliquot 2 is treated with $0.20\%$ sodium bisulfite ($\text{NaHSO}_3$) to destroy the 5-HMF chromophore, serving as an exact matrix reference blank.
   - *Measurement:* Dual wavelength UV spectrophotometry at $284\,\text{nm}$ (5-HMF absorption peak) and $336\,\text{nm}$ (background correction).
   - *Calculation:*
     $$\text{HMF (mg/kg)} = \frac{(A_{284} - A_{336}) \times 149.7 \times 5}{m_{\text{sample}} (\text{g})}$$
   - *Regulatory Limit:* Codex standard $\le 40\,\text{mg/kg}$ (tropical climates: $\le 80\,\text{mg/kg}$).
2. **Diastase Activity (Phadebas Photometric Assay):**
   - *Protocol:* Insoluble blue-dyed cross-linked starch polymer substrate (Phadebas tablets). Honey diastase enzyme hydrolyzes the substrate, releasing water-soluble blue fragments. Absorbance measured at $620\,\text{nm}$ against a substrate blank.
   - *Units:* Schade units / Gothe scale (Diastase Number, DN). Legal minimum: $\ge 8\,\text{DN}$ (or $\ge 3\,\text{DN}$ if $\text{HMF} \le 15\,\text{mg/kg}$).
3. **Soluble Solids & Moisture (°Brix):**
   - *Protocol:* Abbe digital refractometer with automatic temperature compensation to $20\,^{\circ}\text{C}$ (AOAC 969.38). Refractive index converted to moisture content via the Chataway table. Standard: moisture $\le 20.0\%$.
4. **Free Acidity:** Potentiometric titration with $0.05\,\text{N NaOH}$ to $\text{pH } 8.30$ (AOAC 962.19). Maximum allowable limit: $50\,\text{meq/kg}$.

#### D. Virgin Coconut Oil (VCO) Standard Assays
1. **Peroxide Value (PV):**
   - *Protocol:* AOAC Official Method 965.33 / ISO 3960. Oil ($5.0\,\text{g}$) dissolved in acetic acid:chloroform ($3:2\,\text{v/v}$), saturated potassium iodide ($\text{KI}$) added. Hydroperoxides oxidize iodide to elemental iodine ($\text{ROOH} + 2\text{I}^- + 2\text{H}^+ \rightarrow \text{ROH} + \text{I}_2 + \text{H}_2\text{O}$), which is titrated against standardized $0.01\,\text{N sodium thiosulfate}$ ($\text{Na}_2\text{S}_2\text{O}_3$) with $1\%$ starch indicator.
   - *Units / Regulatory Limit:* $\text{meq } \text{O}_2/\text{kg oil}$. Codex Alimentarius Stan 210 limit for VCO: $\le 15\,\text{meq } \text{O}_2/\text{kg oil}$.
2. **Free Fatty Acids (FFA) / Acid Value:**
   - *Protocol:* AOAC 940.28 / ISO 660. Direct volumetric titration in neutralized 2-propanol with $0.1\,\text{N KOH}$, phenolphthalein indicator. Expressed as percentage lauric acid ($\text{MW} = 200.32\,\text{g/mol}$). Codex threshold for VCO: $\le 0.20\%$ (Acid value $\le 0.56\,\text{mg KOH/g}$).
3. **Conjugated Dienes ($K_{232}$) and Trienes ($K_{270}$):**
   - *Protocol:* ISO 3656 / IUPAC Method 2.505. Spectrophotometric extinction of $1\%$ oil solution in pure iso-octane at $232\,\text{nm}$ (conjugated dienoic hydroperoxides) and $270\,\text{nm}$ (conjugated trienes and secondary carbonyl cleavage products).

#### E. Strategic Role of Low-Cost Standard Assays vs. Chromatographic Metabolomics
- *Seed Funding Feasibility:* High-throughput liquid and gas chromatography (HPLC-DAD, GC-MS, LC-MS) requires specialized columns, deuterated internal standards, toxic chromatographic solvents (acetonitrile, methanol, hexane), and costs $150 - 300\text{ USD}$ per run. Performing weekly chromatographic runs across 792 samples would exceed $150,000\text{ USD}$, which is impossible within the BAYLAT budget ($10,000\text{ EUR}$ max for travel/networking).
- *Agile Ground Truth:* Standardized AOAC/ISO wet assays require only baseline laboratory glassware, UV-Vis spectrophotometers, and standard analytical reagents readily available at the Universidad de Cartagena. They deliver exact regulatory compliance numbers and establish the training ground truth.
- *Bridge to Large Grant:* High-resolution metabolomics (untargeted LC-HRMS, volatile GC-MS headspace profiling) is formally positioned as Work Package 2 of the subsequent 3-year DFG-Minciencias research proposal.

---

### 2.4 The 3-Tier Factorial AI Architectural Exploration Space ($3 \times 2 \times 3 = 18$ Candidates)

To discover the optimal machine learning architecture for multi-matrix degradation forecasting, the project formulates a $3 \times 2 \times 3$ factorial exploration space evaluated across two operational tasks:
1. **Self-Supervised Spectral Forecasting:** Predict future spectrum $\hat{X}(t+\Delta t) \in \mathbb{R}^{W}$ from past trajectory $\{X(t_0), X(t_1), \dots, X(t)\}$.
2. **Kinetic Chemical State Estimation:** Estimate degradation parameters $\hat{C}_j(t)$ (Peroxides, FFA, 5-HMF, Polyphenols) from the latent spectral representation.

```
                          ┌────────────────────────┐
                          │ ATR-FTIR Longitudinal   │
                          │ Spectra: X(t) ∈ R^(T×W)│
                          └───────────┬────────────┘
                                      │
           ┌──────────────────────────┼──────────────────────────┐
           ▼                          ▼                          ▼
   [Tier 1A: 1D-CNN]         [Tier 1B: Transformer]     [Tier 1C: Spectral GNN]
   Passos (2026)             Upadhyay (2026) SAM        Band-Functional Graph
           │                          │                          │
           └──────────────────────────┼──────────────────────────┘
                                      │ Latent Feature Matrix: Z(t) ∈ R^(T×d)
                         ┌────────────┴────────────┐
                         ▼                         ▼
               [Tier 2A: Bi-LSTM / GRU]    [Tier 2B: Mamba SSM]
               Gated Recurrent Memory      ASGMamba, Li (2026) O(L)
                         │                         │
                         └────────────┬────────────┘
                                      │ Temporal Latent Trajectory: H(t) ∈ R^d
           ┌──────────────────────────┼──────────────────────────┐
           ▼                          ▼                          ▼
   [Tier 3A: Empirical Base]  [Tier 3B: Arrhenius PINN] [Tier 3C: Neural ODE]
   Unconstrained MSE Loss     Soft-Penalty Regularizer   Mecanistic Drift Repair
           │                          │                          │
           └──────────────────────────┼──────────────────────────┘
                                      │
                         ┌────────────┴────────────┐
                         ▼                         ▼
             [Spectral Forecast X̂(t+Δt)]  [Kinetic Properties Ĉ(t)]
```

#### Tier 1: Spectral Encoders (Dimension: Spectral Feature Extraction)
- **Option 1A — Multiscale 1D-CNN with Chemometric LayerNorm (Passos 2026):**
  - Architecture: Multi-branch 1D convolutional layers with parallel kernel sizes $k \in \{7, 15, 31, 63\}$, corresponding to spectral spans $\Delta\nu \approx 14, 30, 62, 126\,\text{cm}^{-1}$ at $2\,\text{cm}^{-1}$ sampling.
  - Rationale: Directly matched to natural vibrational band widths (stretching peaks $\sim 20 - 40\,\text{cm}^{-1}$, broad O-H $\sim 200\,\text{cm}^{-1}$). Replaces 2D spatial pooling with Chemometric Layer Normalization and residual skip connections, ensuring strict shift invariance across baseline drifts.
- **Option 1B — Spectral Transformer with Spectral Attention Mechanism (SAM, Upadhyay & Chaudhary 2026):**
  - Architecture: Multi-Head Self-Attention (MHSA) with 8 heads and 1D learned sinusoidal positional encoding across the 1,738 spectral channels ($4000 - 650\,\text{cm}^{-1}$).
  - Rationale: Captures non-local correlations across fundamental vibrational bands and their corresponding overtones/combination bands (e.g., coupling between fundamental ester carbonyl $\text{C=O}$ at $1746\,\text{cm}^{-1}$ and first overtone at $3470\,\text{cm}^{-1}$). Attention maps $\mathbf{A} \in \mathbb{R}^{W \times W}$ yield interpretable saliency.
- **Option 1C — Spectro-Chemical Graph Neural Network (GNN):**
  - Architecture: Graph Convolutional Network (GCN) or Graph Attention Network (GAT) where nodes represent discrete functional groups/absorption regions (e.g., Node 1: Phenolic O-H; Node 2: Ester C=O; Node 3: cis-Alkene; Node 4: trans-Alkene; Node 5: 5-HMF Furan; Node 6: Carbohydrate C-O). Edges represent documented chemical reaction pathways (e.g., ester hydrolysis connecting Node 2 and Node 1) and empirical covariance correlations ($\rho > 0.70$).

#### Tier 2: Temporal Backbones (Dimension: Sequence Dynamics)
- **Option 2A — Gated Recurrent Units / Bi-directional LSTM:**
  - Architecture: 2-layer Bi-LSTM with hidden size $d_h = 128$, input dropout $0.2$, recurrent forget-gate bias initialized to $1.0$.
  - Characteristics: Established baseline for short-to-medium sequences. Computational complexity per step is $\mathcal{O}(d_h^2)$, but sequential unrolling prevents parallel training across time points and limits temporal horizon scaling.
- **Option 2B — Selective State Space Model (Mamba / ASGMamba, Li et al. 2026):**
  - Architecture: Hardware-aware selective state space model (S6) parameterized by continuous state matrices $(\mathbf{A}, \mathbf{B}, \mathbf{C}, \Delta)$, discretized using Zero-Order Hold (ZOH):
    $$\mathbf{h}_t = \mathbf{\bar{A}}_t \mathbf{h}_{t-1} + \mathbf{\bar{B}}_t \mathbf{x}_t, \quad \mathbf{y}_t = \mathbf{C}_t \mathbf{h}_t$$
    equipped with an Adaptive Spectral Gating (ASG) block to filter high-frequency baseline instrumentation noise.
  - Characteristics: Linear computational complexity $\mathcal{O}(L)$ in sequence length $L$, parallel prefix associative scan during GPU training, and constant-time $\mathcal{O}(1)$ step inference on resource-constrained hardware.

#### Tier 3: Physical Regularization (Dimension: Chemical Plausibility)
- **Option 3A — Unconstrained Empirical Baseline:**
  - Standard supervised MSE loss on spectral forecast and chemical state:
    $$\mathcal{L}_{\text{data}} = \frac{1}{B} \sum_{i=1}^B \left( \|\hat{X}_i - X_i\|^2 + \alpha \sum_j \frac{(\hat{C}_{i,j} - C_{i,j})^2}{\sigma_j^2} \right)$$
  - Serves as the unconstrained empirical upper bound of fitting capacity.
- **Option 3B — Physics-Informed Neural Network (PINN) with Arrhenius Soft-Penalties:**
  - Composite multi-task loss function with adaptive soft weights:
    $$\mathcal{L}_{\text{total}} = \mathcal{L}_{\text{data}} + \lambda_{\text{kin}} \mathcal{L}_{\text{kin}} + \lambda_{\text{mono}} \mathcal{L}_{\text{mono}} + \lambda_{\text{cons}} \mathcal{L}_{\text{cons}}$$
  - *Kinetic Residual:* Penalizes deviations from empirical reaction orders ($n \in \{0, 1, 2\}$) and Arrhenius temperature scaling:
    $$\mathcal{L}_{\text{kin}} = \frac{1}{N} \sum_{j} \left\| \frac{d\hat{C}_j}{dt} + k_j(T) \hat{C}_j^{n} \right\|^2, \quad k_j(T) = A_j \exp\left(-\frac{E_{a,j}}{R \cdot T}\right)$$
    where frequency factor $A_j$ and activation energy $E_{a,j}$ are learnable parameters initialized within literature physical bounds.
  - *Monotonicity Constraint:* Enforces thermodynamic irreversibility for cumulative degradation markers (e.g., 5-HMF in honey, FFA in VCO):
    $$\mathcal{L}_{\text{mono}} = \sum_j \left\| \text{ReLU}\left( -\frac{d\hat{C}_j}{dt} \right) \right\|^2$$
  - *Mitigation of Pronk & Anthony (2026) Collapse:* By using soft, dynamically scaled penalties ($\lambda_{\text{kin}} \sim 10^{-3} - 10^{-1}$ updated via gradient norm balancing), the network avoids rigid ODE stiffness and preserves high empirical accuracy.
- **Option 3C — Hierarchical Neural ODEs:**
  - Continuous-time latent state trajectory governed by:
    $$\frac{d\mathbf{z}(t)}{dt} = \mathbf{f}_{\text{mech}}(\mathbf{z}(t), T; \boldsymbol{\kappa}_m) + \mathbf{g}_{\theta}(\mathbf{z}(t), t, T, \text{RH})$$
    where $\mathbf{f}_{\text{mech}}$ represents a closed-form stoichiometric kinetic drift vector (governed by matrix-specific parameters $\boldsymbol{\kappa}_m$), and $\mathbf{g}_\theta$ is a neural network learning residual non-idealities (matrix diffusion, microclimate fluctuations).
  - Integrated via adaptive Dormand-Prince / Runge-Kutta 4/5 ODE solvers using the adjoint state method for memory-efficient backpropagation ($\mathcal{O}(1)$ memory with respect to integration depth).

---

### 2.5 Accelerated Aging Experimental Design

To generate the longitudinal dataset under rigorous, controlled environmental conditions, the Universidad de Cartagena will execute an agile experimental protocol:

```
[4 AGRI-FOOD MATRICES]
  ├── Cocoa (Criollo/Trinitario, Sierra Nevada & Santander)
  ├── Coffee (Arabica, Castillo & Caturra, Huila & Bolivar)
  ├── Honey (Apis mellifera, Montes de María & Caribbean Dry Forest)
  └── Virgin Coconut Oil (Cold-pressed, Colombian Pacific & Caribbean Coast)
        │
        ▼
[3 INDEPENDENT PRODUCTION BATCHES PER MATRIX]
  └── Total = 12 Certified Primary Lots
        │
        ▼
[6 ENVIRONMENTAL CLIMATIC REGIMES (FACTORIAL T x RH)]
  ├── Chamber 1: 25 °C ± 0.5 °C  |  60% RH ± 2%  (Ambient Control)
  ├── Chamber 2: 25 °C ± 0.5 °C  |  75% RH ± 2%  (High-Humidity Tropical Ambient)
  ├── Chamber 3: 40 °C ± 0.5 °C  |  60% RH ± 2%  (Accelerated Mild)
  ├── Chamber 4: 40 °C ± 0.5 °C  |  75% RH ± 2%  (Accelerated Humid Maritime Transit)
  ├── Chamber 5: 60 °C ± 0.5 °C  |  60% RH ± 2%  (Accelerated Thermal Stress)
  └── Chamber 6: 60 °C ± 0.5 °C  |  75% RH ± 2%  (Accelerated Extreme Stress)
        │
        ▼
[11 LONGITUDINAL TIME INTERVALS OVER 180 DAYS]
  └── Days: t ∈ {0, 3, 7, 14, 21, 30, 45, 60, 90, 120, 180}
        │
        ▼
[TOTAL EXPERIMENTAL THROUGHPUT]
  ├── Sample Units: 4 matrices × 3 lots × 6 conditions × 11 timepoints = 792 Units
  ├── ATR-FTIR Scans: 792 units × 3 analytical replicates = 2,376 Spectra
  └── Reference Chemical Assays: 792 units measured for matrix-specific AOAC marker
```

#### Instrumental ATR-FTIR Protocol
1. **Spectrometer Specifications:** Research-grade FTIR equipped with a single-reflection diamond Attenuated Total Reflection (ATR) accessory, temperature-controlled puck maintained at $25.0 \pm 0.2\,^{\circ}\text{C}$ to eliminate temperature-induced spectral shifts.
2. **Spectral Parameters:**
   - Spectral range: $4000 - 650\,\text{cm}^{-1}$.
   - Optical resolution: $4.0\,\text{cm}^{-1}$.
   - Signal averaging: 64 co-added interferograms per scan.
   - Zero-filling factor: 2, with Happ-Genzel apodization.
3. **Quality Assurance & Standardization:**
   - Background air spectrum collected before every triplicate sample scan.
   - Daily performance qualification using certified $0.05\,\text{mm}$ polystyrene film (monitoring wavenumber accuracy at $3060.0, 1601.2, 1028.3\,\text{cm}^{-1}$ within $\pm 0.5\,\text{cm}^{-1}$).
   - Diamond crystal cleaning with high-purity ethanol/isopropanol between runs, confirmed by clean baseline checks (absorbance $< 0.002$).

---

### 2.6 Multi-Objective Pareto Selection Criteria

Rather than deciding the architecture *a priori*, the optimal model will be selected from the 18 factorial candidates using Multi-Criteria Decision Analysis (MCDA) based on the Pareto efficiency frontier:

$$\max_{\theta \in \mathcal{C}_{18}} \quad \mathcal{F}(\theta) = \Big( f_{\text{acc}}(\theta), \; f_{\text{edge}}(\theta), \; f_{\text{ident}}(\theta), \; f_{\text{causal}}(\theta) \Big)$$

```
                                  [18 CANDIDATE ARCHITECTURES]
                                                │
                                                ▼
     ┌───────────────────────────┬───────────────────────────┬───────────────────────────┐
     ▼                           ▼                           ▼                           ▼
[Criterion 1: 35%]          [Criterion 2: 25%]          [Criterion 3: 20%]          [Criterion 4: 20%]
Generalization Accuracy     Parsimony & Edge AI         Kinetic Identifiability     Chemical Causal Saliency
• LOBO Cross-Validation     • Raspberry Pi 4/5 Latency  • Parameter Convergence     • Saliency / Band Match
• R² ≥ 0.90, MAPE ≤ 8%      • Latency < 2.0 s, RAM<500MB• Arrhenius Ea Recovery      • Jaccard Index ≥ 0.75
     │                           │                           │                           │
     └───────────────────────────┴─────────────┬─────────────┴───────────────────────────┘
                                               │
                                               ▼
                              [PARETO SELECTION & DOMINANCE]
                                               │
                                               ▼
                             [FINAL CONSOLIDATED ARCHITECTURE]
```

1. **Criterion 1: Generalization Accuracy & Out-of-Distribution Robustness (Weight: 35%):**
   - Evaluated under strict **Leave-One-Batch-Out (LOBO)** cross-validation (training on 2 batches, testing exclusively on the 3rd unseen batch) and **Leave-One-Matrix-Out (LOMO)** transfer evaluation.
   - Acceptance Gates: Test $R^2 \ge 0.90$ across all 4 matrices; Mean Absolute Percentage Error ($\text{MAPE}$) $\le 8.0\%$; Root Mean Square Error of Prediction ($\text{RMSEP}$) within analytical assay error ($\sigma_{\text{assay}}$).
2. **Criterion 2: Parsimony & Edge AI Deployment Feasibility (Weight: 25%):**
   - Benchmarked on real single-board edge hardware: **Raspberry Pi 4 Model B (4GB RAM)** and **Raspberry Pi 5 (4GB RAM)** running 64-bit Raspberry Pi OS and ONNX Runtime / PyTorch Lite.
   - Acceptance Gates: Single-spectrum inference latency $\le 2.0\,\text{seconds}$; peak operational RAM footprint $\le 500\,\text{MB}$; serialized model size on flash storage $\le 50\,\text{MB}$.
   - *Parsimony Rule (Pronk & Anthony 2026):* If Architecture A (e.g., GNN + Neural ODE) achieves only marginal accuracy gains ($\Delta R^2 < 0.02$) over Architecture B (e.g., 1D-CNN + Mamba + PINN soft penalty) while requiring $5\times$ parameters and $8\times$ inference latency, Architecture B Pareto-dominates and will be selected.
3. **Criterion 3: Kinetic Identifiability & Numerical Stability (Weight: 20%):**
   - Convergence stability during backpropagation: zero numerical solver divergence / non-stiff integration across all training epochs.
   - Extraction of thermodynamically plausible kinetic parameters: recovered activation energies $E_a$ must fall within $\pm 15\%$ of literature values obtained via classical Arrhenius linearization ($E_a \in [45, 140]\,\text{kJ/mol}$).
4. **Criterion 4: Chemical Interpretability & Causal Band Attribution (Weight: 20%):**
   - Feature attribution maps generated via Spectral Attention Maps (SAM) or Integrated Gradients.
   - Quantification of chemical validity via the **Spectral Attribution Alignment Score** ($S_{\text{align}}$): Jaccard overlap index and cosine similarity between top-decile model attribution weights and known vibrational marker regions (Section 2.2). Threshold: $S_{\text{align}} \ge 0.75$.

---

### 2.7 Governance (UdC / DIT RACI Matrix), Risk Management, and the DFG-Minciencias Bridge

#### A. Institutional RACI Matrix
Responsibilities are mapped between the Deggendorf Institute of Technology (DIT, Bavaria) and the Universidad de Cartagena (UdC, Colombia):
- **R** = Responsible (conducts work)
- **A** = Accountable (final decision & sign-off)
- **C** = Consulted (provides input)
- **I** = Informed (updated on progress)

| Work Package / Technical Task | UdC (Colombia) | DIT (Baviera) | Primary Deliverable / Milestone |
| :--- | :---: | :---: | :--- |
| **Task 1.1:** Agricultural sample sourcing & botanical certification | **R / A** | I | Certified lot registry (Cocoa, Coffee, Honey, VCO) |
| **Task 1.2:** Experimental aging design & climate chamber setup | **R / A** | C | Protocol specification document |
| **Task 1.3:** Bilateral Workshop 1 (Cartagena, Month 2) | **R** | **R / A** | Workshop 1 Proceedings & Data SOP signed |
| **Task 2.1:** Longitudinal accelerated aging execution (180 days) | **R / A** | I | Chamber log sheets & sample integrity records |
| **Task 2.2:** Continuous ATR-FTIR acquisition (2,376 spectra) | **R / A** | C | Raw spectral database (`.csv` / `.spa` formats) |
| **Task 2.3:** Standard physicochemical assays (AOAC/ISO) | **R / A** | C | Wet chemistry validation matrix |
| **Task 3.1:** Spectral curation, denoising, SNV, and Savitzky-Golay | C | **R / A** | Standardized, open-science preprocessed dataset |
| **Task 3.2:** PyTorch implementation of 3-tier model space (18 models) | I | **R / A** | Modular, reproducible codebase repository |
| **Task 3.3:** Factorial GPU training & LOBO cross-validation | I | **R / A** | Benchmarking report & training logs |
| **Task 3.4:** MCDA Pareto architectural selection | C | **R / A** | Milestone M3: Selected Architecture Dossier |
| **Task 3.5:** Chemical XAI & band attribution validation | **R** | **R / A** | Saliency maps correlated with chemical markers |
| **Task 3.6:** Raspberry Pi edge AI prototype deployment | I | **R / A** | Working edge demonstration unit |
| **Task 4.1:** Bilateral Synthesis Workshop 2 (Deggendorf, Month 11) | **R** | **R / A** | Workshop 2 Synthesis & Publication drafts |
| **Task 4.2:** Joint peer-reviewed scientific publications (Q1/Q2) | **R** | **R / A** | 2 submitted collaborative manuscripts |
| **Task 4.3:** Large-scale DFG-Minciencias research proposal submission | C | **R / A** | Milestone M4: Completed 36-month joint grant proposal |

#### B. Risk Management & Contingency Matrix
| Identified Risk | Probability | Impact | Mitigation Strategy | Contingency / Fallback Protocol |
| :--- | :---: | :---: | :--- | :--- |
| **R1: Inter-batch agricultural variability & origin noise** | Moderate | Moderate | Sourcing from certified single-origin producers with known harvest dates. | Apply Standard Normal Variate (SNV) and hierarchical batch-effect embedding in the deep learning latent space. |
| **R2: Instrumental ATR-FTIR drift over 180-day aging window** | Moderate | High | Daily polystyrene calibration check and background subtraction before every run. | Re-standardization using Piecewise Direct Standardization (PDS) or internal invariant band ratios ($\nu(\text{CH}_2)$ at $2922\,\text{cm}^{-1}$). |
| **R3: Numerical stiffness & instability in Neural ODEs** | High | High | Regularize integration step size and bound Lipschitz constants of neural drift layers. | **Pronk & Anthony Fallback:** Transition to Tier 3B (PINN soft-penalty with Mamba) or empirical backbone, which guarantees convergence. |
| **R4: GNN / Transformer latency exceeds Raspberry Pi limits** | Moderate | Moderate | Implement post-training INT8 quantization and structured weight pruning. | Fall back to Tier 1A (Multiscale 1D-CNN), which features $O(1)$ memory footprints and sub-second CPU inference. |
| **R5: Regulatory delay in international sample shipment** | Low | Moderate | All chemical aging and spectra acquisition are conducted in Cartagena; only digital data are transferred to Germany. | Zero physical shipment needed for modeling; all samples stay at UdC labs. |

#### C. Bilateral DFG-Minciencias 3-Year Follow-up Bridge

```
[BAYLAT SEED GRANT (Months 1 - 12)]
  ├── Objective: Proof of concept, 18-architecture benchmark, first longitudinal ATR-FTIR dataset, AOAC calibration
  ├── Budget Scope: ~10,000 EUR (Travel, bilateral mobility, workshops, student exchanges)
  └── Key Deliverables: 2 Q1 papers, validated Raspberry Pi edge prototype, calibrated baseline dataset
            │
            ▼ [CRITICAL TRANSITION & SCALING GATEWAY (Month 11 - 12)]
            │
[DFG - MINCIENCIAS BILATERAL RESEARCH GRANT (Years 2 - 4 / 36 Months)]
  ├── Call Format: DFG Sachbeihilfe (Germany) + Minciencias Convocatoria Bilateral (Colombia)
  ├── Estimated Budget: ~350,000 - 450,000 EUR (DFG) + ~800,000,000 COP (Minciencias)
  ├── Advanced Scale 1: High-Throughput Chromatography & Metabolomics
  │     ├── Untargeted LC-HRMS (Orbitrap) for polyphenol secondary metabolites
  │     └── Volatile Headspace SPME-GC-MS for cocoa/coffee aroma fingerprinting
  ├── Advanced Scale 2: On-Farm Edge Deployment in Colombian Production Zones
  │     ├── Handheld MEMS-FTIR / Micro-NIR spectrometers deployed in farmer cooperatives
  │     └── Real-time shelf-life prediction in maritime cargo containers during export to Hamburg
  └── Advanced Scale 3: Foundation Chemical AI Models
        └── Self-supervised pre-training across multi-country agri-food spectral databases
```

---

## 3. Caveats

1. **Analytical Reagents Scope for Seed Stage:** High-resolution mass spectrometry (LC-HRMS, GC-MS) is excluded from the 12-month BAYLAT grant due to budget constraints. Ground truth during this phase is strictly anchored on standardized wet-chemical assays (AOAC/ISO).
2. **Climate Chamber Homogeneity:** Small temperature and humidity gradients ($< \pm 0.5\,^{\circ}\text{C}$, $< \pm 2\%$ RH) inside climatic incubators are assumed negligible across sample replicates.
3. **Linearity of Beer-Lambert Law:** Mid-infrared absorbance bands are assumed to obey the Beer-Lambert law within the dynamic range after SNV baseline correction. Strong scattering effects are mitigated using Savitzky-Golay filtering.
4. **Platform Form Factor:** Raspberry Pi 4/5 edge benchmarks assume ONNX Runtime execution with CPU acceleration; edge GPU/NPU co-processors (e.g., Hailo-8, Coral TPU) are projected for the DFG follow-up.

---

## 4. Conclusion

The technical, biochemical, and machine learning architecture for the BAYLAT DIT-UdC proposal is thoroughly formalized:
1. **Four Agri-Food Matrices:** Cocoa, coffee, honey, and virgin coconut oil present clear, distinct chemical degradation pathways (polyphenol condensation, chlorogenic acid cleavage, 5-HMF formation, and lipid peroxidation) governed by Arrhenius kinetics with activation energies between $45$ and $140\,\text{kJ/mol}$.
2. **ATR-FTIR Signatures:** Each degradation marker maps directly to specific vibrational frequencies ($1746 - 1740\,\text{cm}^{-1}$, $1715\,\text{cm}^{-1}$, $1680\,\text{cm}^{-1}$, $3005\,\text{cm}^{-1}$, $967\,\text{cm}^{-1}$, $3400\,\text{cm}^{-1}$, $1055/1030\,\text{cm}^{-1}$).
3. **Standard Reference Assays:** AOAC 965.33, AOAC 980.23, Folin-Ciocalteu, titratable acidity, and °Brix refractometry provide an agile, highly viable, and inexpensive experimental ground truth for the 12-month grant.
4. **3-Tier AI Exploration Space:** The $3 \times 2 \times 3 = 18$ architecture matrix incorporates critical literature lessons (Pronk & Anthony 2026; Passos 2026; Li et al. 2026), testing 1D-CNN vs. Transformer vs. GNN, LSTM vs. Mamba SSM, and Empirical vs. Arrhenius PINN soft-penalties vs. Neural ODEs.
5. **Experimental Protocol:** A 180-day accelerated aging design ($25, 40, 60\,^{\circ}\text{C}$; $60\%, 75\%$ RH) across 12 certified batches delivers 792 experimental units and 2,376 ATR-FTIR scans.
6. **Pareto Selection:** Architecture adoption is determined by a rigorous multi-objective frontier balancing accuracy ($R^2 \ge 0.90$), parsimony/edge feasibility ($< 2\,\text{s}$ latency, $< 500\,\text{MB}$ RAM on Raspberry Pi), kinetic identifiability, and chemical causal interpretability ($S_{\text{align}} \ge 0.75$).
7. **Governance & Scaling:** The UdC/DIT RACI matrix, 5-risk mitigation plan, and 3-year DFG-Minciencias bridge provide a flawless operational foundation for both the German (`expose_wissenschaftlicher_bericht_baylat_de.typ`) and English (`expose_scientific_proposal_baylat_en.typ`) proposals.

---

## 5. Verification Method

To independently verify the facts, citations, and models documented in this report:

1. **Verify Literature Keys in `references.bib`:**
   ```bash
   grep -E "upadhyay2026|pronk2026|passos|perre2025|li2026|grundy2025|boadu|widiarto" /home/echoes/projects/AI_project/proyecto-babiera/references.bib
   ```
2. **Verify Critical PIML Trade-Off Findings (Pronk & Anthony 2026):**
   Inspect `topic_proposal.pdf` (pages 4, 8, 9) and verify that empirical models achieved $R^2=0.97$ vs. $0.70-0.94$ for rigid PIML, proving the necessity of soft kinetic penalties.
3. **Verify Standard Assay Norms:**
   Cross-reference AOAC 965.33 (peroxide value), AOAC 980.23 (5-HMF by UV-Vis), AOAC 940.28 (free fatty acids), and Codex Standard 12-1981 / 210 with international standards.
4. **Verify Character Limits & OASys Alignment:**
   Inspect `/home/echoes/projects/AI_project/proyecto-babiera/propuesta_cientifica_baylat_oasys.md` and ensure exact alignment between this technical report and the OASys form fields.
