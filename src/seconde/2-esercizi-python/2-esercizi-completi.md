---
layout: cover
---

# Esercizi completi
Programmi interi: liste, stringhe e file

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---
layout: two-cols-header
class: table-sm
---

# Esercizio 1 — Raggruppamento anagrammi
<div class="text-[var(--c-text-muted)]">
Senza dizionari né insiemi
</div>

Data una lista di parole, scrivi una funzione `raggruppa_anagrammi(parole)` che raggruppa in sotto-liste le parole che sono anagrammi tra loro.

> **Vincolo** Non puoi usare `dict` né `set`: risolvi con liste parallele o sotto-liste.

::left::

| Input                                                        | Output                                        |
| ------------------------------------------------------------ | --------------------------------------------- |
| `["roma", "amor", "casa", "saca", "ramo", "pino"]`           | `[["roma", "amor", "ramo"], ["casa", "saca"], ["pino"]]` |

::right::

> **Nota** Due parole sono anagrammi se contengono le stesse lettere con le stesse quantità. Confronta ogni parola con il primo elemento di ogni gruppo già creato.

---

# Esercizio 1 — Codice completo

```python {*}{maxHeight:'56vh'}
def sono_anagrammi(parola_A, parola_B):
    if len(parola_A) != len(parola_B):
        return False
    for i in range(len(parola_A)):
        conta_A = 0
        conta_B = 0
        for j in range(len(parola_A)):
            if parola_A[j] == parola_A[i]:
                conta_A = conta_A + 1
        for j in range(len(parola_B)):
            if parola_B[j] == parola_A[i]:
                conta_B = conta_B + 1
        if conta_A != conta_B:
            return False
    return True


def raggruppa_anagrammi(parole):
    gruppi = []                       # lista di sotto-liste
    for i in range(len(parole)):
        trovato = False
        j = 0
        while j < len(gruppi) and trovato == False:
            if sono_anagrammi(parole[i], gruppi[j][0]):
                gruppi[j].append(parole[i])
                trovato = True
            j = j + 1
        if trovato == False:
            gruppi.append([parole[i]])
    return gruppi


lista_parole = ["roma", "amor", "casa", "saca", "ramo", "pino"]
print(raggruppa_anagrammi(lista_parole))
# [['roma', 'amor', 'ramo'], ['casa', 'saca'], ['pino']]
```

> **Suggerimento** Il blocco è scorrevole: usa la rotella del mouse.

---
layout: two-cols-header
---

# Esercizio 1 — La funzione `sono_anagrammi`

::left::
```python
def sono_anagrammi(parola_A, parola_B):
    if len(parola_A) != len(parola_B):
        return False
    for i in range(len(parola_A)):
        conta_A = 0
        conta_B = 0
        for j in range(len(parola_A)):
            if parola_A[j] == parola_A[i]:
                conta_A = conta_A + 1
        for j in range(len(parola_B)):
            if parola_B[j] == parola_A[i]:
                conta_B = conta_B + 1
        if conta_A != conta_B:
            return False
    return True
```
::right::

> Confrontiamo il numero di occorrenze di ogni lettera: se per ogni lettera i conteggi sono uguali, le due parole sono anagrammi.

Il primo controllo sulle lunghezze scarta subito le coppie che non possono esserlo. Poi, per ogni lettera di `parola_A`, contiamo quante volte compare in `parola_A` e in `parola_B`.

---
layout: two-cols-header
---

# Esercizio 1 — La funzione `raggruppa_anagrammi`

::left::
```python
def raggruppa_anagrammi(parole):
    gruppi = []                       # lista di sotto-liste
    for i in range(len(parole)):
        trovato = False
        j = 0
        while j < len(gruppi) and trovato == False:
            if sono_anagrammi(parole[i], gruppi[j][0]):
                gruppi[j].append(parole[i])
                trovato = True
            j = j + 1
        if trovato == False:
            gruppi.append([parole[i]])
    return gruppi
```
::right::

> Ogni parola viene confrontata con il **primo** elemento di ogni gruppo: se è un anagramma entra nel gruppo, altrimenti (se nessun gruppo va bene) ne crea uno nuovo.

`gruppi` è una lista di sotto-liste. Il flag `trovato` evita di creare un nuovo gruppo quando la parola è già stata sistemata.

---
layout: two-cols-header
class: table-sm
---

# Esercizio 2 — Battaglia navale
<div class="text-[var(--c-text-muted)]">
Programma interattivo
</div>

Crea un programma che simuli una semplice battaglia navale su una griglia 5×5:

- All'inizio chiede un numero `n`: quante navi piazzare.
- Le `n` navi vengono messe in celle **casuali** della griglia.
- In un ciclo (finché l'utente non digita `q`) stampa la griglia: `?` celle non provate, `x` colpi a vuoto, `o` navi colpite.
- Chiede poi una coordinata `(x, y)`.
- Se colpisce una nave la rivela con `o`; se non becca nulla mette una `x`; se la cella era già stata colpita lo avvisa senza contare il colpo.
- Quando tutte le navi sono abbattute stampa la griglia finale (spazi vuoti dove non ci sono navi, `o` dove ci sono), un messaggio di vittoria e il numero di spari effettuati.

---

# Esercizio 2 — Numeri casuali

Per piazzare le navi in celle sempre diverse ci servono numeri casuali.

```python
import random

r = random.randint(0, 4)   # riga casuale: 0, 1, 2, 3 o 4
c = random.randint(0, 4)   # colonna casuale
```

> **Consiglio** `random.randint(a, b)` restituisce un intero casuale tra `a` e `b`, **estremi inclusi**. Per una griglia 5×5 gli indici validi vanno da `0` a `4`.

---

# Esercizio 2 — Codice completo

```python {*}{maxHeight:'56vh'}
import random

DIMENSIONE = 5

n = int(input("Quante navi vuoi piazzare (1-25)? "))
while n < 1 or n > 25:
    n = int(input("Numero non valido, riprova (1-25): "))

# navi[i][j] = 1 se c'è una nave
# stato[i][j]: 0 = non provata, 1 = colpita a vuoto, 2 = nave colpita
navi = []
stato = []
for i in range(DIMENSIONE):
    riga_navi = []
    riga_stato = []
    for j in range(DIMENSIONE):
        riga_navi.append(0)
        riga_stato.append(0)
    navi.append(riga_navi)
    stato.append(riga_stato)

# piazzamento casuale delle navi, senza sovrapposizioni
posizioni = []
piazzate = 0
while piazzate < n:
    r = random.randint(0, DIMENSIONE - 1)
    c = random.randint(0, DIMENSIONE - 1)
    occupata = False
    k = 0
    while k < len(posizioni) and occupata == False:
        if posizioni[k][0] == r and posizioni[k][1] == c:
            occupata = True
        k = k + 1
    if occupata == False:
        navi[r][c] = 1
        posizioni.append([r, c])
        piazzate = piazzate + 1


def stampa_griglia():
    for i in range(DIMENSIONE):
        riga = ""
        for j in range(DIMENSIONE):
            if stato[i][j] == 0:
                riga = riga + "? "
            elif stato[i][j] == 1:
                riga = riga + "x "
            else:
                riga = riga + "o "
        print(riga)
    print()


def stampa_finale():
    for i in range(DIMENSIONE):
        riga = ""
        for j in range(DIMENSIONE):
            if navi[i][j] == 1:
                riga = riga + "o "
            else:
                riga = riga + "  "
        print(riga)


navi_rimaste = n
spari = 0
in_corso = True

print("Battaglia navale! Digita 'q' per uscire.")
while in_corso == True:
    stampa_griglia()
    riga_input = input("Riga (0-4) o 'q': ")
    if riga_input == "q":
        in_corso = False
    else:
        colonna_input = input("Colonna (0-4): ")
        r = int(riga_input)
        c = int(colonna_input)
        if r < 0 or r > 4 or c < 0 or c > 4:
            print("Coordinate fuori dalla griglia!")
        elif stato[r][c] != 0:
            print("Hai già colpito questa cella!")
        else:
            spari = spari + 1
            if navi[r][c] == 1:
                stato[r][c] = 2
                navi_rimaste = navi_rimaste - 1
                print("Colpito! Nave abbattuta.")
            else:
                stato[r][c] = 1
                print("Mancato!")
            if navi_rimaste == 0:
                print("VITTORIA! Spari effettuati:", spari)
                stampa_finale()
                in_corso = False
```

> **Suggerimento** Il blocco è scorrevole: usa la rotella del mouse.

---
layout: two-cols-header
---

# Esercizio 2 — La griglia

::left::
```python
navi = []
stato = []
for i in range(DIMENSIONE):
    riga_navi = []
    riga_stato = []
    for j in range(DIMENSIONE):
        riga_navi.append(0)
        riga_stato.append(0)
    navi.append(riga_navi)
    stato.append(riga_stato)
```
::right::

> Servono **due** matrici: `navi` dice dove sono le navi, `stato` ricorda cosa è già successo in ogni cella (`0` non provata, `1` colpita a vuoto, `2` nave colpita).

Ogni cella è una lista di liste: `navi[r][c]` è la cella alla riga `r`, colonna `c`.

---
layout: two-cols-header
---

# Esercizio 2 — Il piazzamento delle navi

::left::
```python
posizioni = []
piazzate = 0
while piazzate < n:
    r = random.randint(0, DIMENSIONE - 1)
    c = random.randint(0, DIMENSIONE - 1)
    occupata = False
    k = 0
    while k < len(posizioni) and occupata == False:
        if posizioni[k][0] == r and posizioni[k][1] == c:
            occupata = True
        k = k + 1
    if occupata == False:
        navi[r][c] = 1
        posizioni.append([r, c])
        piazzate = piazzate + 1
```
::right::

> Teniamo in `posizioni` le celle già occupate: se la cella estratta è già lì, la scartiamo e ne estraiamo un'altra.

Il ciclo continua finché non abbiamo piazzato esattamente `n` navi.

---
layout: two-cols-header
---

# Esercizio 2 — Le due funzioni di stampa

::left::
`1/2`
```python
def stampa_griglia():
    for i in range(DIMENSIONE):
        riga = ""
        for j in range(DIMENSIONE):
            if stato[i][j] == 0:
                riga = riga + "? "
            elif stato[i][j] == 1:
                riga = riga + "x "
            else:
                riga = riga + "o "
        print(riga)
    print()
```

::right::


`2/2`
```python
def stampa_finale():
    for i in range(DIMENSIONE):
        riga = ""
        for j in range(DIMENSIONE):
            if navi[i][j] == 1:
                riga = riga + "o "
            else:
                riga = riga + "  "
        print(riga)
```

---
layout: two-cols-header
---

# Esercizio 2 — Il ciclo di gioco

::left::
```python
navi_rimaste = n
spari = 0
in_corso = True

print("Battaglia navale! Digita 'q' per uscire.")
while in_corso == True:
    stampa_griglia()
    riga_input = input("Riga (0-4) o 'q': ")
    if riga_input == "q":
        in_corso = False
    else:
        colonna_input = input("Colonna (0-4): ")
        r = int(riga_input)
        c = int(colonna_input)
        if r < 0 or r > 4 or c < 0 or c > 4:
            print("Coordinate fuori dalla griglia!")
        elif stato[r][c] != 0:
            print("Hai già colpito questa cella!")
```
::right::

> Il ciclo `while in_corso == True` va avanti finché non si vince oppure l'utente digita `q`.

Prima di tutto si rifiutano le coordinate fuori dalla griglia e le celle già provate: in questi casi **non** si conta lo sparo.

---
layout: two-cols-header
---

# Esercizio 2 — Il colpo e la vittoria

::left::
```python
        else:
            spari = spari + 1
            if navi[r][c] == 1:
                stato[r][c] = 2
                navi_rimaste = navi_rimaste - 1
                print("Colpito! Nave abbattuta.")
            else:
                stato[r][c] = 1
                print("Mancato!")
            if navi_rimaste == 0:
                print("VITTORIA! Spari effettuati:", spari)
                stampa_finale()
                in_corso = False
```
::right::

> Il numero di spari aumenta solo quando la cella non era ancora stata provata, così i colpi ripetuti non falsano il conteggio finale.

Quando `navi_rimaste` arriva a `0` stampiamo la griglia finale con le sole navi e mettiamo `in_corso = False` per uscire dal ciclo.

---
layout: two-cols-header
class: table-sm
---

# Esercizio 3 — ASCII art
<div class="text-[var(--c-text-muted)]">
Da un'immagine PPM a un disegno di caratteri
</div>

Crea un'applicazione Python che, partendo da un file `image.ppm`, generi un'**ASCII art** e la salvi in un file `image.txt`:

- Il file `image.ppm` si trova nella **stessa cartella** del file `.py`: basta indicarne il nome, senza percorso.
- Ogni pixel dell'immagine diventa un carattere, scelto in base a quanto è chiaro.
- Il risultato si scrive su un file di testo, una riga per ogni riga dell'immagine.

> **Suggerimento** Nelle prossime slide: com'è fatto un file PPM, come leggere e scrivere un file e la formula della luminosità.

---

# Esercizio 3 — Com'è fatto un file PPM (P3)

Il formato **P3** è un'immagine scritta in **testo semplice**. Il file inizia con un'intestazione:

- `P3` — numero magico che identifica il formato
- `larghezza altezza` — dimensioni in pixel
- `max` — valore massimo di un canale (di solito `255`)
- poi **tutti i pixel** in fila, `R G B` per ciascuno, con valori da `0` a `max`

```text
P3
2 2
255
255 0 0   0 255 0
0 0 255   255 255 255
```

> **Nota** I numeri possono essere separati da spazi o da a capo: leggendo tutto il file e facendo `.split()` si ottiene direttamente la lista di tutti i valori.

---

# Esercizio 3 — Leggere e scrivere un file

Si apre un file con `open(nome, modo)`:

- `"r"` = lettura (*read*)
- `"w"` = scrittura (*write*), che **cancella** il contenuto precedente

```python
# leggere tutto il file come un'unica stringa
contenuto = ""
with open("image.ppm", "r") as f:
    contenuto = f.read()

# scrivere una stringa su un file
stringa_da_scrivere = "hello!"
with open("image.txt", "w") as f:
    f.write(stringa_da_scrivere)
```


---

# Esercizio 3 — La luminanza

La luminosità percepita di un colore non è la media di `R`, `G` e `B`: l'occhio è molto più sensibile al **verde** e poco al **blu**. La formula, da applicare ai canali **normalizzati** tra `0` e `1` (cioè `R / max`, ecc.), è:

```text
Y = 0.2126 * R + 0.7152 * G + 0.0722 * B
```

- `Y` è un numero tra `0` (nero) e `1` (bianco).

```python
# questo valore indica quanto è "scuro" un pixel
luminanza = 0.2126 * r + 0.7152 * g + 0.0722 * b
```

> **Hint** Non servono librerie: calcola i tre prodotti e sommali, poi usa `int(...)` per ottenere l'indice del carattere.

---

# Esercizio 3 — Codice completo

```python {*}{maxHeight:'56vh'}
file_str = ""
with open("image.ppm", "r") as f:
    file_str = f.read()

parts = file_str.split()

width = int(parts[1])
height = int(parts[2])
max_pval = int(parts[3])
pixels = parts[4:]

ascii_shade = [
    " ",
    ".",
    ":",
    "-",
    "=",
    "+",
    "*",
    "%",
    "@",
    "#",
]


def lum(r, g, b):
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


output_str = ""
for y in range(height):
    line = ""
    for x in range(width):
        r = int(pixels[(y * width + x) * 3])
        g = int(pixels[(y * width + x) * 3 + 1])
        b = int(pixels[(y * width + x) * 3 + 2])

        luminanza = lum(r / max_pval, g / max_pval, b / max_pval)
        line += ascii_shade[int(luminanza * (len(ascii_shade) - 1))]

    output_str += f"{line}\n"


with open("image.txt", "w") as f:
    f.write(output_str)
```

> **Suggerimento** Il blocco è scorrevole: usa la rotella del mouse.

---
layout: two-cols-header
---

# Esercizio 3 — Leggere e analizzare il PPM

::left::
```python
file_str = ""
with open("image.ppm", "r") as f:
    file_str = f.read()

parts = file_str.split()

width = int(parts[1])
height = int(parts[2])
max_pval = int(parts[3])
pixels = parts[4:]
```
::right::

> `parts[0]` è il numero magico `P3`, poi `width`, `height` e `max`. Da `parts[4:]` in poi ci sono tutti i valori dei canali, in ordine.

`split()` senza argomenti divide su spazi e a capo: otteniamo una lista con tutti i numeri del file.

---
layout: two-cols-header
---

# Esercizio 3 — La scala di caratteri e la luminanza

::left::

La **scala di caratteri**, dal più scuro al più chiaro:

```python
ascii_shade = [
    " ",
    ".",
    ":",
    "-",
    "=",
    "+",
    "*",
    "%",
    "@",
    "#",
]
```

::right::

La **luminanza** di un pixel:

```python
def lum(r, g, b):
    return 0.2126 * r + 0.7152 * g + 0.0722 * b
```

> La scala ha 10 caratteri: più il pixel è chiaro, più l'indice scelto sarà alto.

---
layout: two-cols-header
---

# Esercizio 3 — Costruire l'output

::left::
```python
output_str = ""
for y in range(height):
    line = ""
    for x in range(width):
        r = int(pixels[(y * width + x) * 3])
        g = int(pixels[(y * width + x) * 3 + 1])
        b = int(pixels[(y * width + x) * 3 + 2])

        luminanza = lum(r / max_pval, g / max_pval, b / max_pval)
        line += ascii_shade[int(luminanza * (len(ascii_shade) - 1))]

    output_str += f"{line}\n"


with open("image.txt", "w") as f:
    f.write(output_str)
```
::right::

> Per ogni pixel leggiamo `R`, `G` e `B` da `pixels`, calcoliamo la luminanza e scegliamo il carattere. Alla fine salviamo tutto in `image.txt`.

L'indice di partenza del pixel `(x, y)` nella lista `pixels` si calcola con `(y * width + x) * 3`, perché ogni pixel occupa **tre** valori consecutivi.
