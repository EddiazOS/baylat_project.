import re

with open('/home/echoes/projects/AI_project/proyecto-babiera/propuesta_cientifica_baylat_oasys.md', 'r', encoding='utf-8') as f:
    text = f.read()

# Extract sections
kf_de = re.search(r'## 5\. Kurzfassung.*?### Versión en Alemán.*?```text\n(.*?)```', text, re.DOTALL)
kf_es = re.search(r'## 5\. Kurzfassung.*?### Versión en Español.*?```text\n(.*?)```', text, re.DOTALL)

ap_de = re.search(r'## 6\. Ausführliche Projektbeschreibung.*?### Versión en Alemán.*?```text\n(.*?)```', text, re.DOTALL)
ap_es = re.search(r'## 6\. Ausführliche Projektbeschreibung.*?### Versión en Español.*?```text\n(.*?)```', text, re.DOTALL)

def analyze_chars(name, match):
    if not match:
        print(f'{name}: NOT FOUND')
        return
    s = match.group(1)
    s_strip = s.strip()
    c_raw = len(s_strip)
    c_no_newlines = len(s_strip.replace('\r\n', ' ').replace('\n', ' '))
    c_norm_spaces = len(re.sub(r'\s+', ' ', s_strip))
    c_no_spaces = len(re.sub(r'\s', '', s_strip))
    b_utf8 = len(s_strip.encode('utf-8'))
    print(f'{name}:')
    print(f'  raw characters (including newlines): {c_raw}')
    print(f'  characters (newlines as spaces): {c_no_newlines}')
    print(f'  characters (normalized spaces): {c_norm_spaces}')
    print(f'  characters (excluding all spaces): {c_no_spaces}')
    print(f'  UTF-8 bytes: {b_utf8}')

analyze_chars('Kurzfassung DE', kf_de)
analyze_chars('Kurzfassung ES', kf_es)
analyze_chars('Ausführliche Projektbeschreibung DE', ap_de)
analyze_chars('Ausführliche Projektbeschreibung ES', ap_es)
