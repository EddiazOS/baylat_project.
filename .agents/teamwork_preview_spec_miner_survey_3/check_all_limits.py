import re

with open('/home/echoes/projects/AI_project/proyecto-babiera/propuesta_cientifica_baylat_oasys.md', 'r', encoding='utf-8') as f:
    content = f.read()

# Check titles
for lang in ['DE', 'ES', 'EN']:
    m = re.search(rf'\*\*Projekttitel \({lang}\):\*\*\s*(.*)', content)
    if m:
        t = m.group(1).strip()
        print(f"Projekttitel ({lang}): len={len(t)} (limit 400)")

# Check keywords
for lang in ['DE', 'ES', 'EN']:
    m = re.search(rf'\*\*Stichwörter \({lang}\):\*\*\s*(.*)', content)
    if m:
        k = m.group(1).strip()
        print(f"Stichwörter ({lang}): len={len(k)} (limit 200)")

# Check Mehrwert / Warum diese Partner
m_mw_de = re.search(r'## 3\. Mehrwert des Projektpartners.*?### En Alemán.*?>(.*?)(?=### En Español|---)', content, re.DOTALL)
if m_mw_de:
    mw_de = m_mw_de.group(1).replace('>', '').strip()
    mw_de_clean = re.sub(r'\s+', ' ', mw_de)
    print(f"Mehrwert DE: raw={len(mw_de)}, clean={len(mw_de_clean)} (limit 1000)")

m_mw_es = re.search(r'## 3\. Mehrwert des Projektpartners.*?### En Español.*?>(.*?)(?=---)', content, re.DOTALL)
if m_mw_es:
    mw_es = m_mw_es.group(1).replace('>', '').strip()
    mw_es_clean = re.sub(r'\s+', ' ', mw_es)
    print(f"Mehrwert ES: raw={len(mw_es)}, clean={len(mw_es_clean)} (limit 1000)")

# Check Internationalisierung
m_int_de = re.search(r'## 4\. Bezug zur Internationalisierungsstrategie.*?### En Alemán.*?>(.*?)(?=### En Español|---)', content, re.DOTALL)
if m_int_de:
    int_de = m_int_de.group(1).replace('>', '').strip()
    int_de_clean = re.sub(r'\s+', ' ', int_de)
    print(f"Internationalisierung DE: raw={len(int_de)}, clean={len(int_de_clean)} (limit 2000)")

m_int_es = re.search(r'## 4\. Bezug zur Internationalisierungsstrategie.*?### En Español.*?>(.*?)(?=---)', content, re.DOTALL)
if m_int_es:
    int_es = m_int_es.group(1).replace('>', '').strip()
    int_es_clean = re.sub(r'\s+', ' ', int_es)
    print(f"Internationalisierung ES: raw={len(int_es)}, clean={len(int_es_clean)} (limit 2000)")

# Check Kurzprofil P1 & P2
m_kp1 = re.search(r'\*\*Kurzprofil des Antragstellers \(DIT\):\*\*\s*(.*?)(?=### Projektpartner 2)', content, re.DOTALL)
if m_kp1:
    kp1 = m_kp1.group(1).strip()
    print(f"Kurzprofil P1 (DIT): len={len(kp1)} (limit 1000)")

m_kp2 = re.search(r'\*\*Kurzprofil des Kooperationspartners \(UdC\):\*\*\s*(.*?)(?=---)', content, re.DOTALL)
if m_kp2:
    kp2 = m_kp2.group(1).strip()
    print(f"Kurzprofil P2 (UdC): len={len(kp2)} (limit 1000)")

# Check Warum keine andere Foerderung
m_wkaf = re.search(r'### Warum ist keine andere Förderung möglich\?.*?>(.*?)(?=### Bezug zu einer Ausschreibung)', content, re.DOTALL)
if m_wkaf:
    wkaf = m_wkaf.group(1).replace('>', '').strip()
    wkaf_clean = re.sub(r'\s+', ' ', wkaf)
    print(f"Warum keine andere Förderung: raw={len(wkaf)}, clean={len(wkaf_clean)} (limit 2000)")

# Check Bezug Ausschreibung
m_bza = re.search(r'### Bezug zu einer Ausschreibung / Zukünftiger Drittmittelantrag.*?-(.*?)(?=---)', content, re.DOTALL)
if m_bza:
    bza = m_bza.group(1).strip()
    print(f"Bezug Ausschreibung: len={len(bza)} (limit 1000)")
