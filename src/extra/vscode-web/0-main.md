---
theme: marini-slidev-theme
addons:
  - marini-slidev-addons
title: Vscode-web
author: Marini Mattia
info: |
  Marini Mattia - a.s. 2026/2027

drawings:
  persist: false
comark: true
presenter: dev
---
# Uso vscode-web
### Come installare e configurare vscode-web per poter far girare python direttamente dal vostro browser

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---
layout: center
---
# Aprire **google chrome** e andare sul sito

<div  class="text-center my-15">
  <span class="text-5xl px-2 py-1 rounded bg-primary text-[#141418]">vscode.dev</span>
</div>

> E' tassativo usare **google chrome**, altri browser potrebbero non funzionare!



---
layout: image-right
image: /vscode-web/01.png
---

# Installare le estensioni

Nella barra delle attività a sinistra clicca l'icona delle **estensioni** (il simbolo del pacco).

Si apre il *Marketplace*: da qui installeremo gli strumenti che ci servono per programmare in Python.


---
layout: image-right
image: /vscode-web/01.png
---

# Cercare "Pylance"

Nel campo di ricerca del Marketplace digita **pylance**.

È l'estensione ufficiale di Microsoft per il supporto a Python (completamento, errori, suggerimenti). Clicca **Installa**.

---

# Installare comunque

Pylance, nella versione web, ha funzionalità limitate: l'analisi è ristretta ai file aperti.

<img src="/vscode-web/02.png" class="shot" alt="Avviso: Pylance presenta funzionalità limitate, con il pulsante Installa comunque" />

Clicca **Installa comunque** per proseguire.

---
layout: image-right
image: /vscode-web/03.png
---

# Cercare "Pyodide Runner"

Ora cerca **pyodide runner** e clicca **Installa**.

Questa estensione permette di eseguire Python direttamente nel browser, senza installare nulla sul computer.

---

# Autore non verificato

Pyodide Runner è pubblicata da un autore non verificato: VS Code mostra un avviso di sicurezza.

<img src="/vscode-web/04.png" class="shot max-h-48" alt="Avviso: considerare attendibile il server di pubblicazione tym-inc" />

Clicca **Considera attendibile il server di pubblicazione e l'installazione** per autorizzare l'estensione.

---
layout: image-right
image: /vscode-web/05.png
---

# Aprire una cartella

Una cartella diventerà il vostro *workspace*, cioè lo spazio di lavoro in cui salverete i programmi.

Clicca l'icona dell'**Explorer** (le pagine) nella barra laterale a sinistra.

---
layout: image-right
image: /vscode-web/06.png
---

# Apri cartella

Nella vista dell'Explorer clicca **Apri cartella**.

Scegli una cartella sul tuo computer: il browser chiederà il permesso di accedervi.

---

# Consentire l'accesso ai file

Aprendo una cartella locale, il browser chiede il permesso di leggere i file.

<img src="/vscode-web/07.png" class="shot" alt="Richiesta del browser: Allow this site to view and copy files?" />

Clicca **Allow** per permettere a vscode.dev di visualizzare e copiare i file della cartella.

---

# Autori attendibili

Subito dopo, VS Code chiede se si considerano attendibili gli autori dei file nella cartella.

<img src="/vscode-web/08.png" class="shot" alt="Richiesta: si considerano attendibili gli autori dei file in questa cartella?" />

Clicca **Sì**: l'autore dei file siete voi!

---

# Creare un file

Con il **tasto destro** sulla cartella scegli **Nuovo file** e chiamalo, ad esempio, `primo.py`.

<img src="/vscode-web/09.png" class="shot" alt="Richiesta del browser: consentire l'accesso agli appunti" />

Se compare la richiesta di accesso agli appunti, clicca **Allow**.

---

# Salvare le modifiche

Per salvare davvero i file nella cartella locale, il browser deve essere autorizzato a scrivere.

<img src="/vscode-web/10.png" class="shot" alt="Richiesta del browser: Save changes to tmp?" />

Clicca **Save changes**: così vscode.dev potrà scrivere sulla vostra cartella.

---
layout: center
class: text-center
---

# Primo programma

Scrivi `print("Hello world")` nel file e premi il bottone **▶ Run** in alto a destra.

<img src="/vscode-web/11.png" class="shot max-h-72" alt="Editor con print(&quot;Hello world&quot;), bottone Run e output Hello world nella console" />

L'output `Hello world` comparirà nella console in basso.
