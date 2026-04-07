# BMI (Bitiruv Malakaviy Ishi) Generator — Claude Code Skill

**O'zbek tilidagi akademik hujjat generatori** — Farg'ona Davlat Universiteti standartiga mos BMI `.docx` faylini avtomatik yaratadi.

[O'zbekcha](#ozbekcha) | [English](#english)

---

## O'zbekcha

### Nima qiladi?

Bu skill Claude Code'ga BMI (Bitiruv Malakaviy Ishi) hujjatini to'liq generatsiya qilish imkoniyatini beradi:

- **Titul varag'i** — FarDU standarti bo'yicha
- **Mundarija** — sahifa raqamlari bilan
- **Kirish** — dolzarblik, maqsad, vazifalar, ilmiy yangilik (5-7 sahifa)
- **I Bob** — Nazariy asoslar, 4 bo'lim (15-20 sahifa)
- **II Bob** — Loyihalash va amalga oshirish, 5 bo'lim (25-30 sahifa)
- **Xulosa** — asosiy xulosalar va kelajak yo'nalishlari
- **Adabiyotlar** — 20-26 ta manba, hanging indent
- **Ilovalar** — 4 ta ilova (texnik spec, DB model, fayl tuzilmasi, parametrlar)
- **10-15 ta professional diagramma** — matplotlib bilan generatsiya qilinadi
- **Skrinshot'lar** — loyiha kodi bo'lsa, Playwright bilan olinadi

### O'rnatish

```bash
# 1. Faylni nusxalash
cp commands/bmi.md ~/.claude/commands/bmi.md

# Yoki bir qatorli o'rnatish:
mkdir -p ~/.claude/commands && curl -o ~/.claude/commands/bmi.md https://raw.githubusercontent.com/Ulugbek-Kudratullayev/bmi-skill-claude-code/main/commands/bmi.md
```

### Kerakli Python paketlar

```bash
pip install python-docx matplotlib numpy
# Skrinshot uchun (ixtiyoriy):
pip install playwright && playwright install chromium
```

### Foydalanish

Claude Code ichida:

```
/bmi Sun'iy intellekt asosida talabalar bilimini baholash tizimi
```

yoki:

```
BMI yozib ber, mavzu: "Flutter asosida mobil ilova yaratish"
```

### Natija

`{LOYIHA_NOMI}_BMI.docx` fayli generatsiya qilinadi:
- A4 format, Times New Roman 14pt, 1.5 qator oralig'i
- 40-60 sahifa, 8000-10000 so'z
- Professional diagrammalar bilan

---

## English

### What does it do?

This Claude Code skill generates a complete **BMI (Graduation Qualification Thesis)** document in Uzbek language, following Fergana State University academic standards.

Features:
- Full academic document structure (title page, TOC, introduction, 2 chapters, conclusion, references, appendices)
- 10-15 professional diagrams generated with matplotlib
- Proper formatting: A4, Times New Roman 14pt, 1.5 line spacing
- 40-60 pages, 8000-10000 words
- Screenshots via Playwright (optional, when project code exists)

### Installation

```bash
# Copy the skill file
cp commands/bmi.md ~/.claude/commands/bmi.md

# Or one-liner:
mkdir -p ~/.claude/commands && curl -o ~/.claude/commands/bmi.md https://raw.githubusercontent.com/Ulugbek-Kudratullayev/bmi-skill-claude-code/main/commands/bmi.md
```

### Prerequisites

```bash
pip install python-docx matplotlib numpy
# Optional (for screenshots):
pip install playwright && playwright install chromium
```

### Usage

Inside Claude Code:

```
/bmi AI-based student assessment system
```

### Output

Generates a `{PROJECT_NAME}_BMI.docx` file with full academic formatting.

---

## Fayl tuzilmasi

```
bmi-skill-claude-code/
├── README.md              # Hujjat (shu fayl)
├── LICENSE                # MIT litsenziya
├── commands/
│   └── bmi.md             # Asosiy skill fayli
└── examples/
    └── usage.md           # Foydalanish misollari
```

## Litsenziya

MIT License — erkin foydalanishingiz mumkin.

## Muallif

**Ulugbek Kudratullayev** — Farg'ona Davlat Universiteti

---

> Bu skill [Claude Code](https://claude.ai/claude-code) uchun yaratilgan. Claude Code — Anthropic'ning rasmiy CLI vositasi.
