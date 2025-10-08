# Islamic Wisdom App - Final v1 (Scaffold)
**Islamic Wisdom** — Guided by Light of Quran
Presented by: Hafiz Mufti Muhammad Shuaib Khan Alai

## How to use
1. Unzip the project.
2. Create a GitHub repository (e.g. `Islamic_Wisdom_App_Final`) and push this project.
3. On push, GitHub Actions will run and produce `app-release.apk` as an artifact.
4. Download artifact from Actions → Latest run → Artifacts.

## Quran data
- This scaffold includes **sample** Quran JSON files (Surah Al-Fatiha and sample ayahs of Al-Baqarah).
- To include full Quran + translations (Urdu: Fath Muhammad Jalandhri, English: Saheeh International), add JSON files to `assets/quran_data/` named `sura_001.json`, `sura_002.json`, ... `sura_114.json` (see sample files).

## Sample JSON schema (sura_001.json)
```json
{
  "sura":1,
  "name_ar":"الفاتحة",
  "name_ur":"الفاتحہ",
  "ayahs":[{"index":1,"arabic":"بِسْمِ اللہ...","translation_ur":"...","translation_en":"..."}]
}
```

## Replace with full Quran
- If you have the translation files, copy them into `assets/quran_data/` and push to GitHub. The build workflow will include them in the APK.
