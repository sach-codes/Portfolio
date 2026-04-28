# NAV Ledger

A clean, single-page mutual-fund portfolio tracker that reads **live NAV data from AMFI India** and shows you your total portfolio value as you enter units held.

> No backend. No accounts. No tracking. Holdings live only in your browser.

![NAV Ledger screenshot — placeholder; replace with your own.](https://via.placeholder.com/1200x700.png?text=NAV+Ledger)

---

## Features

- 🔍 **Search 12,000+ schemes** from the official AMFI registry — by name, AMC, or scheme code
- 📒 **Add funds, enter units, see value** — instant calculation, sorted by value
- 💾 **Persistent across sessions** — holdings saved in browser localStorage
- 📊 **Direct vs Regular plan tags**, **stale-NAV warning** (>7 days old)
- 📱 **Responsive** — desktop table view collapses to mobile cards
- 📤 **CSV export** of your folio for record-keeping
- 🖨️ **Print-friendly** layout for a clean PDF
- ⚡ **Zero build step** — single `index.html` file, drop on any static host

---

## How it works

1. On load, the app fetches `NAVAll.txt` from `portal.amfiindia.com` via a public CORS proxy chain (corsproxy.io → allorigins → codetabs).
2. The semicolon-delimited file is parsed in-browser into a flat list of schemes (code, ISIN, name, NAV, date).
3. You search and select funds — your selections + units are saved in `localStorage` under the key `navledger.holdings.v1`.
4. Total = Σ (NAV × units). Updates live as you type.

If all proxies fail (rare), the app falls back to letting you upload `NAVAll.txt` manually after downloading it from AMFI directly.

---

## Quick start

### 1. Use it now

Just open `index.html` in any modern browser. That's it.

### 2. Host on GitHub Pages

```bash
git clone https://github.com/<your-username>/nav-ledger.git
cd nav-ledger
git add .
git commit -m "Add NAV Ledger"
git push
```

Then in your repo: **Settings → Pages → Deploy from branch → main → / (root)**.

Your tracker will be live at `https://<your-username>.github.io/nav-ledger/`.

### 3. Host elsewhere

Works as-is on Netlify, Vercel, Cloudflare Pages, S3, or any static host. No build, no env vars.

---

## File structure

```
nav-ledger/
├── index.html      ← the entire app (HTML + CSS + JS in one file)
├── README.md       ← this file
└── .nojekyll       ← prevents GitHub Pages from running Jekyll
```

---

## Customisation

The whole thing is one file. A few easy tweaks:

| Want to change… | Where |
| --- | --- |
| Color palette | CSS `:root` variables at the top of `<style>` |
| Default sort order | `renderHoldings()` — currently sorts by value desc |
| Stale-NAV threshold | `daysAgo(f.dateObj) > 7` — change `7` |
| CSV columns | `$('export-csv').addEventListener` block |
| Storage key (e.g. multi-folio) | `STORAGE_KEY` constant |

---

## Privacy & data

- **Holdings data** is stored only in your browser via `localStorage`. It never leaves your device.
- **NAV data** is fetched from AMFI India's public bulletin (via a third-party CORS proxy). The proxy sees only the AMFI URL — your holdings data is never sent to it.
- This tool runs entirely client-side. There's no server, no analytics, no cookies.

---

## Caveats

- NAV is **T-1**: the previous business day's closing NAV, as published by AMFI. Intraday MF prices don't exist by SEBI design.
- The CORS proxies used (corsproxy.io, allorigins, codetabs) are free public services. If reliability matters, host your own proxy (a 5-line Cloudflare Worker is enough) and replace the `PROXIES` array.
- Some old/discontinued schemes carry NAVs from years ago; the app shows a ⚠ stale tag for these.

---

## License

MIT. Use it, fork it, ship it.

---

## Credits

- NAV data: [AMFI India](https://www.amfiindia.com/)
- Type: [Newsreader](https://fonts.google.com/specimen/Newsreader) and [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- Icons: Unicode glyphs only, no asset dependencies

Built as a personal tool. **Not investment advice.**
