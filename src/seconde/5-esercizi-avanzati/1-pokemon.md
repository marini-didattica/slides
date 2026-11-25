---
layout: cover
---

# Esercizi avanzati
Un programma completo: battaglia Pokémon

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---
layout: two-cols-header
---

# Pokémon battle
<div class="text-[var(--c-text-muted)]">
Primo esercizio — programma completo
</div>

Simula uno scontro tra Pokémon: generazione casuale, scelta del combattente, turni, danni, barre della vita e messaggio finale.

::left::

**Cosa deve fare il programma**

- Generare **3 Pokémon** casuali con statistiche e 4 mosse.
- Far scegliere **1** Pokémon e assegnare al bot uno dei **2 rimanenti**.
- Alternare i turni: il giocatore parte per primo.
- Chiedere una mossa, aggiornare barre HP e round in modo **fancy**, poi proclamare il vincitore.

::right::

**Vincoli**

- Niente `class`, `dict` o `tuple`.
- Solo **liste**, **stringhe** e **funzioni**.
- Il codice va organizzato in funzioni piccole e leggibili.
- Le formule del danno vanno applicate **nell'ordine indicato**.

> **Obiettivo** Dividere il problema in funzioni con una responsabilità chiara.

---
layout: two-cols-header
class: table-sm
---

# Le regole dello scontro

::left::

| Elemento      | Valore                     |
| ------------- | -------------------------- |
| Tipi          | `acqua`, `fuoco`, `erba`   |
| Attacco       | numero casuale 50–100      |
| Difesa        | numero casuale 50–100      |
| Punti vita    | numero casuale 500–1000    |
| Mosse         | esattamente 4 per Pokémon  |
| Danno mossa   | numero fisso 50–200        |

**Ciclo delle debolezze**

`acqua` batte `fuoco`, `fuoco` batte `erba`, `erba` batte `acqua`.

::right::

**Un turno**

1. Il giocatore sceglie una mossa.
2. Si applica il danno al bot.
3. Se il bot è vivo, risponde con una mossa casuale.
4. Si applica il danno al giocatore.
5. Si passa al round successivo.

**Fine**

Vince chi resta con almeno 1 HP. Il programma stampa un messaggio di congratulazioni per il vincitore.

---
layout: two-cols-header
---

# Rappresentare i dati senza classi

Ogni Pokémon e ogni mossa sono **liste**. Le liste possono contenere altre liste: è così che teniamo insieme le 4 mosse di un Pokémon.

::left::

```python
# mossa = [nome, tipo, danno]
mossa = ["Lanciafiamme", "fuoco", 140]

# pokemon = [nome, tipo, attacco, difesa,
#            vita, vita_max, mosse]
pokemon = [
    "Fiammetto",
    "fuoco",
    72,
    61,
    840,
    840,
    [
        ["Braciere", "fuoco", 50],
        ["Bolla", "acqua", 80],
        ["Frustata", "erba", 85],
        ["Eruzione", "fuoco", 200],
    ],
]
```

::right::

Per non ricordare a memoria i numeri, diamo un **nome** agli indici:

```python
NOME = 0
TIPO = 1
ATTACCO = 2
DIFESA = 3
VITA = 4
VITA_MAX = 5
MOSSE_POKEMON = 6

MOSSA_NOME = 0
MOSSA_TIPO = 1
MOSSA_DANNO = 2
```

Così scriviamo `pokemon[VITA]` invece di `pokemon[4]`: il codice si legge molto meglio.

> **Nota** `vita` e `vita_max` sono due indici distinti: la prima cambia durante lo scontro, la seconda serve per disegnare la barra in proporzione.

---
layout: two-cols-header
class: table-sm
---

# La pool di mosse

Le mosse sono **predefinite**: nome, tipo e danno non cambiano. A ogni Pokémon ne vengono estratte 4 a caso, senza ripetizioni.

::left::

| Mossa           | Tipo   | Danno |
| --------------- | ------ | ----: |
| Pistolacqua     | acqua  | 50    |
| Bolla           | acqua  | 80    |
| Idropulsar      | acqua  | 130   |
| Maremoto        | acqua  | 190   |
| Braciere        | fuoco  | 50    |
| Ruotafuoco      | fuoco  | 90    |

::right::

| Mossa           | Tipo   | Danno |
| --------------- | ------ | ----: |
| Lanciafiamme    | fuoco  | 140   |
| Eruzione        | fuoco  | 200   |
| Fogliolina      | erba   | 50    |
| Frustata        | erba   | 85    |
| Raggio Solare   | erba   | 135   |
| Tempesta Verde  | erba   | 195   |

```python
import random

mosse_scelte = random.sample(MOSSE, 4)
```

> **Perché 12 mosse?** Quattro mosse per tipo: così ogni Pokémon ha buone probabilità di pescarne una del proprio tipo.

---
layout: two-cols-header
---

# Generare i Pokémon

`random.sample(lista, n)` restituisce `n` elementi **diversi**. Lo usiamo per i nomi e per le mosse; `random.randint(a, b)` per le statistiche.

::left::

```python
def genera_pokemon(quanti):
    nomi_scelti = random.sample(NOMI, quanti)
    pokemon_generati = []
    for i in range(quanti):
        tipo = random.choice(TIPI)
        attacco = random.randint(50, 100)
        difesa = random.randint(50, 100)
        vita_max = random.randint(500, 1000)
        mosse_scelte = random.sample(MOSSE, 4)
        pokemon = [
            nomi_scelti[i], tipo, attacco, difesa,
            vita_max, vita_max, mosse_scelte,
        ]
        pokemon_generati.append(pokemon)
    return pokemon_generati
```

::right::

**Cosa succede**

- `NOMI` contiene abbastanza nomi per estrarne 3 diversi.
- Il tipo viene scelto tra `acqua`, `fuoco` ed `erba`.
- Attacco, difesa e vita rispettano i range richiesti.
- Le mosse sono 4, pescate dalla pool senza duplicati.
- La vita parte **piena**: `vita = vita_max`.

---
layout: two-cols-header
---

# Scegliere il proprio Pokémon

Il programma genera 3 candidati, li mostra e legge una scelta da 1 a 3. Poi sceglie il bot tra i due rimanenti.

::left::

```python
def scegli_pokemon(candidati):
    print("\nScegli il tuo Pokemon:")
    for i in range(len(candidati)):
        pokemon = candidati[i]
        print("  " + str(i + 1) + ". " + pokemon[NOME]
              + " [" + pokemon[TIPO] + "]")
        print("     ATK " + str(pokemon[ATTACCO])
              + "   DEF " + str(pokemon[DIFESA])
              + "   HP " + str(pokemon[VITA_MAX]))
        stampa_mosse(pokemon)
    scelta = leggi_intero("\nNumero del Pokemon (1-3): ", 1, 3)
    return scelta - 1
```

::right::

```python
candidati = genera_pokemon(3)
scelta = scegli_pokemon(candidati)
giocatore = candidati[scelta]

rimanenti = []
for i in range(len(candidati)):
    if i != scelta:
        rimanenti.append(candidati[i])

bot = random.choice(rimanenti)
```

> **Dettaglio importante** `scelta - 1` trasforma il numero mostrato all'utente (`1`, `2`, `3`) nell'indice della lista (`0`, `1`, `2`).

`leggi_intero` ripete la domanda finché il valore non è un numero valido nel range: evita di andare in errore con un indice fuori dalla lista.

---
layout: two-cols-header
---

# Le formule del danno

Il danno si costruisce in **quattro passaggi**, sempre nello stesso ordine. Il risultato finale viene troncato a intero con `int(...)`.

::left::

```text
1. danno base
   danno = danno_mossa * attacco / 50

2. bonus di tipo (+50 fisso)
   se tipo_pokemon == tipo_mossa:
       danno = danno + 50

3. difesa (riduce al massimo del 20%)
   riduzione = (difesa - 50) / 50 * 0.2
   danno = danno * (1 - riduzione)

4. debolezza (+50%)
   se il difensore è debole contro l'attaccante:
       danno = danno * 1.5
```

::right::

**Esempio numerico**

```text
mossa:   danno 140
attacco: 80
difesa:  90
tipi:    uguali
esito:   il difensore è debole
```

```text
140 * 80 / 50 = 224
224 + 50      = 274       (bonus tipo)
riduzione     = 0.16
274 * 0.84    = 230.16    (difesa)
230.16 * 1.5  = 345.24    (debolezza)

danno finale = 345
```

> **Controllo** Con difesa `50` la riduzione è `0`; con difesa `100` vale `0.2`, cioè il 20%. Il range 50–100 garantisce che la difesa non aumenti mai il danno.

---
layout: two-cols-header
---

# Debolezze e calcolo del danno

::left::

```python
def e_debole(tipo_difensore, tipo_attaccante):
    if tipo_difensore == "acqua" and tipo_attaccante == "erba":
        return True
    if tipo_difensore == "fuoco" and tipo_attaccante == "acqua":
        return True
    if tipo_difensore == "erba" and tipo_attaccante == "fuoco":
        return True
    return False
```

**Il ciclo**

```text
acqua  batte  fuoco
fuoco  batte  erba
erba   batte  acqua
```

::right::

```python
def calcola_danno(attaccante, difensore, mossa):
    danno = mossa[MOSSA_DANNO]
    danno = danno * attaccante[ATTACCO] / 50

    if attaccante[TIPO] == mossa[MOSSA_TIPO]:
        danno = danno + 50

    riduzione = (difensore[DIFESA] - 50) / 50 * 0.2
    danno = danno * (1 - riduzione)

    if e_debole(difensore[TIPO], attaccante[TIPO]):
        danno = danno * 1.5

    return int(danno)
```

> **Leggibilità** Ogni passaggio è una riga o un piccolo blocco: si vede subito l'ordine delle correzioni.

---
layout: two-cols-header
---

# Una barra della vita “fancy”

La barra usa due caratteri: `█` per la parte piena e `░` per quella vuota. La lunghezza è proporzionale alla vita rimanente.

::left::

```python
LUNGHEZZA_BARRA = 24

def barra_vita(vita, vita_max):
    if vita < 0:
        vita = 0
    pieni = int(LUNGHEZZA_BARRA * vita / vita_max)
    if vita > 0 and pieni == 0:
        pieni = 1
    vuoti = LUNGHEZZA_BARRA - pieni
    percentuale = int(100 * vita / vita_max)
    barra = "█" * pieni + "░" * vuoti
    return ("[" + barra + "] " + str(vita) + "/"
            + str(vita_max) + " (" + str(percentuale) + "%)")
```

::right::

**Esempi**

```text
[████████████████████████] 1000/1000 (100%)
[████████████░░░░░░░░░░░░] 500/1000 (50%)
[███░░░░░░░░░░░░░░░░░░░░░] 120/1000 (12%)
[░░░░░░░░░░░░░░░░░░░░░░░░] 0/1000 (0%)
```

> **Dettaglio** Se la vita è positiva ma la percentuale è troppo bassa per riempire una cella, forziamo `pieni = 1`: almeno un blocchetto resta visibile.

La barra è solo una **stringa**: possiamo costruirla con `*` e restituirla, poi stamparla dentro il riquadro del Pokémon.

---
layout: two-cols-header
---

# Mostrare i Pokémon e le mosse

::left::

```python
def stampa_pokemon(pokemon, etichetta):
    print("+" + "-" * 56 + "+")
    print("| " + etichetta)
    print("| " + pokemon[NOME] + " [" + pokemon[TIPO] + "]")
    print("| ATK " + str(pokemon[ATTACCO])
          + "   DEF " + str(pokemon[DIFESA]))
    print("| HP  " + barra_vita(pokemon[VITA],
                                pokemon[VITA_MAX]))
    print("+" + "-" * 56 + "+")
```

::right::

```python
def stampa_mosse(pokemon):
    print("\nMosse disponibili:")
    for i in range(len(pokemon[MOSSE_POKEMON])):
        mossa = pokemon[MOSSE_POKEMON][i]
        bonus = " "
        if mossa[MOSSA_TIPO] == pokemon[TIPO]:
            bonus = "*"
        print("  " + str(i + 1) + ". "
              + mossa[MOSSA_NOME].ljust(16)
              + mossa[MOSSA_TIPO].ljust(7)
              + "dmg " + str(mossa[MOSSA_DANNO]).rjust(3)
              + "  " + bonus)
    print("  (* = bonus di tipo: +50)")
```

> **Nota** Il riquadro è fatto con `+`, `-` e `|`: non serve nessuna libreria grafica. `ljust` e `rjust` allineano le colonne.

---
layout: two-cols-header
---

# Eseguire un attacco

La funzione modifica direttamente la lista del difensore: essendo una lista, il cambiamento è visibile anche fuori dalla funzione.

::left::

```python
def esegui_attacco(attaccante, difensore, mossa):
    danno = calcola_danno(attaccante, difensore, mossa)

    difensore[VITA] = difensore[VITA] - danno
    if difensore[VITA] < 0:
        difensore[VITA] = 0

    print("\n>> " + attaccante[NOME] + " usa "
          + mossa[MOSSA_NOME] + "!")
    print("   danno inflitto: " + str(danno))
    if e_debole(difensore[TIPO], attaccante[TIPO]):
        print("   E' super efficace!")
    print("   HP di " + difensore[NOME] + ": "
          + barra_vita(difensore[VITA],
                       difensore[VITA_MAX]))
    return danno
```

::right::

```python
def turno_bot(bot, giocatore):
    mossa = random.choice(bot[MOSSE_POKEMON])
    esegui_attacco(bot, giocatore, mossa)
```

**Perché funziona**

- `difensore[VITA] = ...` cambia la lista originale.
- La vita non scende mai sotto `0`.
- Il messaggio “super efficace” viene stampato solo quando la debolezza si applica davvero.

> **Attenzione** Se copiassimo la lista del difensore, la modifica resterebbe locale. Qui passiamo la lista originale, quindi la vita cambia per tutti.

---
layout: two-cols-header
---

# Il ciclo principale

Il giocatore parte sempre per primo. Il bot risponde solo se è ancora vivo; il ciclo continua finché entrambi hanno vita positiva.

::left::

```python
round_corrente = 1

while giocatore[VITA] > 0 and bot[VITA] > 0:
    pulisci_schermo()
    stampa_schermo(giocatore, bot, round_corrente)

    stampa_mosse(giocatore)
    numero = leggi_intero("\nScegli una mossa (1-4): ", 1, 4)
    mossa = giocatore[MOSSE_POKEMON][numero - 1]

    esegui_attacco(giocatore, bot, mossa)

    if bot[VITA] > 0:
        input("\nPremi INVIO: il bot sta per rispondere...")
        turno_bot(bot, giocatore)

    if giocatore[VITA] > 0 and bot[VITA] > 0:
        input("\nPremi INVIO per il prossimo round...")

    round_corrente = round_corrente + 1
```

::right::

```python
pulisci_schermo()
print("=" * 58)
if giocatore[VITA] > 0:
    print("COMPLIMENTI " + giocatore[NOME]
          + "! Hai vinto lo scontro!")
else:
    print("COMPLIMENTI " + bot[NOME]
          + "! Il bot ha vinto lo scontro!")
print("=" * 58)
print(giocatore[NOME] + ": "
      + barra_vita(giocatore[VITA], giocatore[VITA_MAX]))
print(bot[NOME] + ": "
      + barra_vita(bot[VITA], bot[VITA_MAX]))
```

> **Ordine dei controlli** Dopo l'attacco del giocatore bisogna verificare se il bot è morto: altrimenti risponderebbe anche da KO. Lo stesso controllo si fa prima di annunciare il vincitore.

---
layout: two-cols-header
---

# Pulire il terminale (cross-platform)

Per non accumulare schermate su schermate, all'inizio di ogni round puliamo il terminale. Il comando cambia a seconda del sistema operativo.

::left::

```python
import os

def pulisci_schermo():
    if os.name == "nt":
        os.system("cls")      # Windows
    else:
        os.system("clear")    # macOS e Linux
```

::right::

`os.name` vale `"nt"` su Windows e `"posix"` sugli altri sistemi.

> **Alternativa** Nei terminali moderni funziona anche la sequenza ANSI:

```python
print("\033[2J\033[H", end="")
```

Ma su Windows “vecchio” e dentro IDLE può non funzionare: `os.system` è la soluzione più semplice e portabile per un esercizio in classe.

**Attenzione** Se esegui il programma dall'IDE, la “console” potrebbe non essere un vero terminale: in quel caso la pulizia può sembrare non funzionare.

---
layout: default
---

# Esempio di scontro — schermo

```text {maxHeight:'62vh'}
==========================================================
                         ROUND 3
==========================================================
| BOT  Fiammetto [fuoco]   ATK 69   DEF 97
| HP   [██████████░░░░░░░░░░░░░░] 334/756 (44%)
|
| TU   Vulcanix [erba]     ATK 78   DEF 98
| HP   [█████████████░░░░░░░░░░░] 447/824 (54%)
==========================================================

Mosse disponibili:
  1. Raggio Solare   erba   dmg 135  *
  2. Braciere        fuoco  dmg  50
  3. Idropulsar      acqua  dmg 130
  4. Eruzione        fuoco  dmg 200
  (* = bonus di tipo: +50)

Scegli una mossa (1-4): 1
```

---
layout: default
---

# Esempio di scontro — i colpi

```text {maxHeight:'62vh'}
>> Vulcanix usa Raggio Solare!
   danno inflitto: 211
   HP di Fiammetto: [███░░░░░░░░░░░░░░░░░░░░░] 123/756 (16%)

Premi INVIO: il bot sta per rispondere...
>> Fiammetto usa Maremoto!
   danno inflitto: 317
   E' super efficace!
   HP di Vulcanix: [███░░░░░░░░░░░░░░░░░░░░░] 130/824 (15%)

Premi INVIO per il prossimo round...
>> Vulcanix usa Raggio Solare!
   danno inflitto: 211
   HP di Fiammetto: [░░░░░░░░░░░░░░░░░░░░░░░░] 0/756 (0%)

==========================================================
COMPLIMENTI Vulcanix! Hai vinto lo scontro!
==========================================================
```

---
layout: two-cols-header
---

# Codice completo — 1/4

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Dati e generazione</span>

```python {*}{maxHeight:'56vh'}
import os
import random

TIPI = ["acqua", "fuoco", "erba"]

NOMI = [
    "Fiammetto", "Acquaforte", "Fogliamara", "Vulcanix",
    "Idrorex", "Erbaforte", "Carbonio", "Ondina",
]

# Una mossa e' una lista: [nome, tipo, danno]
MOSSE = [
    ["Pistolacqua", "acqua", 50],
    ["Bolla", "acqua", 80],
    ["Idropulsar", "acqua", 130],
    ["Maremoto", "acqua", 190],
    ["Braciere", "fuoco", 50],
    ["Ruotafuoco", "fuoco", 90],
    ["Lanciafiamme", "fuoco", 140],
    ["Eruzione", "fuoco", 200],
    ["Fogliolina", "erba", 50],
    ["Frustata", "erba", 85],
    ["Raggio Solare", "erba", 135],
    ["Tempesta Verde", "erba", 195],
]

# Un pokemon e' una lista:
# [nome, tipo, attacco, difesa, vita, vita_max, mosse]
NOME = 0
TIPO = 1
ATTACCO = 2
DIFESA = 3
VITA = 4
VITA_MAX = 5
MOSSE_POKEMON = 6

# Una mossa e' una lista: [nome, tipo, danno]
MOSSA_NOME = 0
MOSSA_TIPO = 1
MOSSA_DANNO = 2

LUNGHEZZA_BARRA = 24


def pulisci_schermo():
    if os.name == "nt":
        os.system("cls")
    else:
        os.system("clear")


def genera_pokemon(quanti):
    nomi_scelti = random.sample(NOMI, quanti)
    pokemon_generati = []
    for i in range(quanti):
        tipo = random.choice(TIPI)
        attacco = random.randint(50, 100)
        difesa = random.randint(50, 100)
        vita_max = random.randint(500, 1000)
        mosse_scelte = random.sample(MOSSE, 4)
        pokemon = [nomi_scelti[i], tipo, attacco, difesa,
                   vita_max, vita_max, mosse_scelte]
        pokemon_generati.append(pokemon)
    return pokemon_generati
```

---
layout: two-cols-header
---

# Codice completo — 2/4

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Danno e interfaccia</span>

```python {*}{maxHeight:'56vh'}
def e_debole(tipo_difensore, tipo_attaccante):
    if tipo_difensore == "acqua" and tipo_attaccante == "erba":
        return True
    if tipo_difensore == "fuoco" and tipo_attaccante == "acqua":
        return True
    if tipo_difensore == "erba" and tipo_attaccante == "fuoco":
        return True
    return False


def calcola_danno(attaccante, difensore, mossa):
    danno = mossa[MOSSA_DANNO]
    danno = danno * attaccante[ATTACCO] / 50

    if attaccante[TIPO] == mossa[MOSSA_TIPO]:
        danno = danno + 50

    riduzione = (difensore[DIFESA] - 50) / 50 * 0.2
    danno = danno * (1 - riduzione)

    if e_debole(difensore[TIPO], attaccante[TIPO]):
        danno = danno * 1.5

    return int(danno)


def barra_vita(vita, vita_max):
    if vita < 0:
        vita = 0
    pieni = int(LUNGHEZZA_BARRA * vita / vita_max)
    if vita > 0 and pieni == 0:
        pieni = 1
    vuoti = LUNGHEZZA_BARRA - pieni
    percentuale = int(100 * vita / vita_max)
    barra = "█" * pieni + "░" * vuoti
    return ("[" + barra + "] " + str(vita) + "/"
            + str(vita_max) + " (" + str(percentuale) + "%)")


def stampa_pokemon(pokemon, etichetta):
    print("+" + "-" * 56 + "+")
    print("| " + etichetta)
    print("| " + pokemon[NOME] + " [" + pokemon[TIPO] + "]")
    print("| ATK " + str(pokemon[ATTACCO])
          + "   DEF " + str(pokemon[DIFESA]))
    print("| HP  " + barra_vita(pokemon[VITA], pokemon[VITA_MAX]))
    print("+" + "-" * 56 + "+")


def stampa_mosse(pokemon):
    print("\nMosse disponibili:")
    for i in range(len(pokemon[MOSSE_POKEMON])):
        mossa = pokemon[MOSSE_POKEMON][i]
        bonus = " "
        if mossa[MOSSA_TIPO] == pokemon[TIPO]:
            bonus = "*"
        print("  " + str(i + 1) + ". "
              + mossa[MOSSA_NOME].ljust(16)
              + mossa[MOSSA_TIPO].ljust(7)
              + "dmg " + str(mossa[MOSSA_DANNO]).rjust(3)
              + "  " + bonus)
    print("  (* = bonus di tipo: +50)")
```

---
layout: two-cols-header
---

# Codice completo — 3/4

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Input, scelta e schermo</span>

```python {*}{maxHeight:'56vh'}
def leggi_intero(messaggio, minimo, massimo):
    while True:
        testo = input(messaggio)
        try:
            valore = int(testo)
        except ValueError:
            print("Inserisci un numero.")
            continue
        if valore < minimo or valore > massimo:
            print("Inserisci un numero tra "
                  + str(minimo) + " e " + str(massimo) + ".")
            continue
        return valore


def scegli_pokemon(candidati):
    print("\nScegli il tuo Pokemon:")
    for i in range(len(candidati)):
        pokemon = candidati[i]
        print()
        print("  " + str(i + 1) + ". " + pokemon[NOME]
              + " [" + pokemon[TIPO] + "]")
        print("     ATK " + str(pokemon[ATTACCO])
              + "   DEF " + str(pokemon[DIFESA])
              + "   HP " + str(pokemon[VITA_MAX]))
        stampa_mosse(pokemon)
    scelta = leggi_intero("\nNumero del Pokemon (1-3): ", 1, 3)
    return scelta - 1


def stampa_schermo(giocatore, bot, round_corrente):
    print("\n" + "=" * 58)
    print(("ROUND " + str(round_corrente)).center(58))
    print("=" * 58)
    stampa_pokemon(bot, "BOT")
    print()
    stampa_pokemon(giocatore, "TU")
    print()
```

---
layout: two-cols-header
---

# Codice completo — 4/4

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Turni e ciclo principale</span>

```python {*}{maxHeight:'56vh'}
def esegui_attacco(attaccante, difensore, mossa):
    danno = calcola_danno(attaccante, difensore, mossa)
    difensore[VITA] = difensore[VITA] - danno
    if difensore[VITA] < 0:
        difensore[VITA] = 0

    print("\n>> " + attaccante[NOME] + " usa "
          + mossa[MOSSA_NOME] + "!")
    print("   danno inflitto: " + str(danno))
    if e_debole(difensore[TIPO], attaccante[TIPO]):
        print("   E' super efficace!")
    print("   HP di " + difensore[NOME] + ": "
          + barra_vita(difensore[VITA], difensore[VITA_MAX]))
    return danno


def turno_bot(bot, giocatore):
    mossa = random.choice(bot[MOSSE_POKEMON])
    esegui_attacco(bot, giocatore, mossa)


def main():
    candidati = genera_pokemon(3)

    pulisci_schermo()
    scelta = scegli_pokemon(candidati)
    giocatore = candidati[scelta]

    rimanenti = []
    for i in range(len(candidati)):
        if i != scelta:
            rimanenti.append(candidati[i])
    bot = random.choice(rimanenti)

    pulisci_schermo()
    print("Il tuo avversario e' " + bot[NOME]
          + " [" + bot[TIPO] + "]!")
    input("Premi INVIO per iniziare lo scontro...")

    round_corrente = 1
    while giocatore[VITA] > 0 and bot[VITA] > 0:
        pulisci_schermo()
        stampa_schermo(giocatore, bot, round_corrente)

        stampa_mosse(giocatore)
        numero = leggi_intero("\nScegli una mossa (1-4): ", 1, 4)
        mossa = giocatore[MOSSE_POKEMON][numero - 1]

        esegui_attacco(giocatore, bot, mossa)

        if bot[VITA] > 0:
            input("\nPremi INVIO: il bot sta per rispondere...")
            turno_bot(bot, giocatore)

        if giocatore[VITA] > 0 and bot[VITA] > 0:
            input("\nPremi INVIO per il prossimo round...")

        round_corrente = round_corrente + 1

    pulisci_schermo()
    print("=" * 58)
    if giocatore[VITA] > 0:
        print("COMPLIMENTI " + giocatore[NOME]
              + "! Hai vinto lo scontro!")
    else:
        print("COMPLIMENTI " + bot[NOME]
              + "! Il bot ha vinto lo scontro!")
    print("=" * 58)
    print(giocatore[NOME] + ": "
          + barra_vita(giocatore[VITA], giocatore[VITA_MAX]))
    print(bot[NOME] + ": "
          + barra_vita(bot[VITA], bot[VITA_MAX]))


if __name__ == "__main__":
    main()
```

---
layout: two-cols-header
---

# Checklist prima di consegnare

::left::

**Dati e scontro**

- [ ] I 3 Pokémon hanno statistiche nei range richiesti.
- [ ] Ogni Pokémon ha esattamente 4 mosse diverse.
- [ ] La scelta 1–3 non manda il programma in errore.
- [ ] Il bot usa uno dei due Pokémon rimanenti.
- [ ] Il giocatore attacca per primo.

::right::

**Danno e output**

- [ ] Bonus tipo, difesa e debolezza sono nell'ordine giusto.
- [ ] La vita non scende sotto zero.
- [ ] Le barre HP sono proporzionali alla vita.
- [ ] Il messaggio finale nomina il vincitore.
- [ ] Il codice è diviso in funzioni con un compito chiaro.

---
layout: two-cols-header
---

# Possibili estensioni

::left::

- Aggiungere pozioni che curano una volta per partita.
- Aggiungere mosse di stato (cura, difesa aumentata).
- Salvare i risultati su un file di testo.
- Fare un torneo tra 3 Pokémon.

::right::

- Mostrare la mossa del bot prima del messaggio di danno.
- Colorare la barra in base alla percentuale.
- Usare `time.sleep` per rallentare le stampe.

> **Consiglio** Prima di aggiungere una funzione, chiediti: che input riceve? che output produce? che cosa modifica?
