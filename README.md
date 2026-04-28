# MF Portfolio Tracker

A clean, zero-dependency frontend tool to track your Mutual Fund portfolio value using **live NAV data from AMFI India**.

## Features

- 📡 **Live NAV data** — fetches directly from AMFI's public NAV feed (updated daily)
- 🔍 **Smart search** — search by fund name, AMC, or scheme code across 15,000+ schemes
- 📊 **Portfolio calculator** — enter units held, get instant value per fund and total
- 📱 **Responsive** — works on desktop and mobile
- ⚡ **Zero dependencies** — pure HTML, CSS, and vanilla JS; no build step needed

## Usage

### Option 1 — Open locally
Just double-click `index.html` in your browser. Done.

### Option 2 — GitHub Pages
1. Fork or upload this repo to GitHub
2. Go to **Settings → Pages → Source: main branch / root**
3. Your tracker will be live at `https://<username>.github.io/<repo>/`

## How it works

1. On load, the app fetches `NAVAll.txt` from AMFI via a CORS proxy (`allorigins.win`)
2. Parses ~15,000+ scheme records (semicolon-delimited)
3. Search is done entirely client-side — fast, private, no backend
4. Multiply units × NAV to compute holding value

## Data Source

NAV data: [AMFI India — NAVAll.txt](https://portal.amfiindia.com/spages/NAVAll.txt)  
Updated every business day after market close.

## Limitations

- NAV is the **previous business day's closing NAV** (T-1), as published by AMFI
- Intraday values are not available for mutual funds by regulation
- This tool is for **personal tracking only** and does not constitute financial advice

## File Structure

```
index.html   ← everything (self-contained, single file)
README.md    ← this file
```

## License

MIT — free to use, modify, and distribute.
