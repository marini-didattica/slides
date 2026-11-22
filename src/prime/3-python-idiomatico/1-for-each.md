---
layout: cover
---

# Python idiomatico
Il ciclo `for` e il `for each`

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Il punto di partenza

Negli esercizi precedenti abbiamo usato **solo il ciclo `while`** e delle regole volutamente povere:

- niente `in`, `sum()`, `max()`, `min()`;
- niente metodi come `.sort()`, `.count()`, `.index()`;
- cicli solo con `while`;
- accesso agli elementi **solo tramite indice**: `lista[i]`.

Quelle regole servivano per allenare la logica. Ora che la logica c'è, aggiungiamo due strumenti nuovi: il ciclo `for` con `range()` e il `for each`.

> **Idea della lezione** A ogni problema affianchiamo la soluzione "non idiomatica" che conosciamo già e una soluzione "idiomatica" con la sintassi nuova.

---

# Il ciclo `for` con `range`

`for` ripete un blocco un numero **noto** di volte. I valori che la variabile assume sono prodotti da `range()`:

```python
for i in range(5):
    print(i)      # Output: 0 1 2 3 4
```

`range(5)` produce i numeri `0, 1, 2, 3, 4`: a ogni giro `i` assume uno di questi valori e il blocco viene eseguito.

> **N.B.** `range(5)` parte da `0` e si ferma **prima** di `5`: il limite finale è **escluso**.

---
layout: two-cols-header
---

# Dal `while` al `for`

::left::

### Con `while`

```python
i = 0
while i < 5:
    print(i)
    i = i + 1
```

::right::

### Con `for`

```python
for i in range(5):
    print(i)
```

::bottom::
Le due versioni stampano `0 1 2 3 4`. Con il `for` inizializzazione, condizione e aggiornamento sono racchiusi in una sola riga: usalo quando sai **quante volte** ripetere.

---
class: table-sm
---

# `range()`: le varianti

| Scrittura         | Valori prodotti |
| ----------------- | --------------- |
| `range(5)`        | `0 1 2 3 4`     |
| `range(2, 6)`     | `2 3 4 5`       |
| `range(0, 10, 2)` | `0 2 4 6 8`     |
| `range(5, 0, -1)` | `5 4 3 2 1`     |

```python
for i in range(1, 4):
    print("giro", i)   # giro 1, giro 2, giro 3
```

`range` può ricevere **inizio**, **fine** (esclusa) e **passo**: se il passo è negativo si conta all'indietro.

---

# Il `for` per scorrere una lista

Per scorrere una lista con il `for` possiamo usare `range(len(lista))`:

```python
lista = [10, 20, 30]

for i in range(len(lista)):
    print(lista[i])
```

`len(lista)` vale `3`, quindi `range(3)` produce `0, 1, 2`; dentro il blocco `lista[i]` restituisce il valore in quella posizione.

Funziona, ma stiamo usando un giro di informazione in più: a noi interessano i **valori**, non le posizioni.

---

# Il `for each`

Python permette di scorrere direttamente gli **elementi** di una sequenza:

```python
lista = [10, 20, 30]

for valore in lista:
    print(valore)
```

`for valore in lista` si legge "per ogni valore in lista": a ogni giro `valore` assume il contenuto di un elemento, prima `10`, poi `20`, poi `30`.

- Non serve `range()`.
- Non serve `len()`.
- Non serve `lista[i]`.
- Il nome della variabile è libero: possiamo usare `x`, `voto`, `nome`.

---

# Confronto diretto

<div class="w-fit mx-auto">

```python
# Con l'indice
for i in range(len(lista)):
    print(lista[i])

# Con il for each
for valore in lista:
    print(valore)
```

</div>

Le due versioni stampano **la stessa cosa**. La seconda dice esattamente quello che vogliamo: *per ogni valore della lista, stampalo*.

> **N.B.** Il `for each` funziona su qualsiasi sequenza: liste, stringhe, e più avanti anche su altri tipi di collezioni.

---

# Esercizio 7 — Il numero è nella lista?

Riprendiamo l'esercizio della ricerca: controlla se il numero `15` è presente nella lista.

| Input                    | Output           |
| ------------------------ | ---------------- |
| `[4, 8, 15, 16, 23, 42]` | `Trovato: True`  |
| `[1, 2, 3]`              | `Trovato: False` |

> **Nota** Nella versione non idiomatica dobbiamo scorrere la lista e mantenere una variabile `trovato`.

---

# Soluzione non idiomatica

```python
lista = [4, 8, 15, 16, 23, 42]
cercato = 15

trovato = False
i = 0
while i < len(lista) and trovato == False:
    if lista[i] == cercato:
        trovato = True
    i = i + 1

print("Trovato:", trovato)
```

Stiamo gestendo **a mano** tre cose: l'indice, la condizione di stop e la variabile booleana. Sono tutti dettagli che non riguardano il problema.

---

# Soluzione idiomatica: l'operatore `in`

```python
lista = [4, 8, 15, 16, 23, 42]
cercato = 15

print("Trovato:", cercato in lista)
```

`x in sequenza` restituisce:

- `True` se `x` compare almeno una volta nella sequenza;
- `False` altrimenti;
- funziona anche sulle stringhe: `"a" in "casa"` vale `True`.

Esiste anche la forma negata:

```python
if cercato not in lista:
    print("Non c'è")
```

---

# Calcolare la media

Data una lista di voti, calcola la media.

| Input            | Output |
| ---------------- | ------ |
| `[7, 4, 9, 6]`   | `6.5`  |

Nella versione non idiomatica sommiamo gli elementi con l'indice e poi dividiamo per `len(voti)`.

---
layout: two-cols-header
---

# Media — non idiomatico vs idiomatico

::left::

### Non idiomatico

```python
voti = [7, 4, 9, 6]

somma = 0
for i in range(len(voti)):
    somma = somma + voti[i]

media = somma / len(voti)
print(media)
```

::right::

### Idiomatico

```python
voti = [7, 4, 9, 6]

somma = 0
for voto in voti:
    somma = somma + voto

media = somma / len(voti)
print(media)
```

::bottom::
L'accumulatore `somma` resta, ma sparisce tutta la gestione dell'indice: il ciclo ora dice *"per ogni voto, aggiungilo alla somma"*. Più avanti vedremo `sum()`, che elimina anche l'accumulatore.

---

# Esercizio 9 — Massimo e minimo

Trovare il valore più grande e il più piccolo di una lista.

| Input             | Output          |
| ----------------- | --------------- |
| `[3, 7, 2, 9, 5]` | `massimo: 9`<br>`minimo: 2` |

Nella versione non idiomatica partiamo dal primo elemento e aggiorniamo il massimo (e il minimo) durante il ciclo.

---
layout: two-cols-header
---

# Massimo e minimo con il `for each`

::left::

### Non idiomatico

```python
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
for i in range(len(lista)):
    if lista[i] > massimo:
        massimo = lista[i]

print(massimo)
```

::right::

### Idiomatico

```python
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
for valore in lista:
    if valore > massimo:
        massimo = valore

print(massimo)
```

::bottom::
La stessa struttura funziona per il minimo: basta partire da `lista[0]` e usare `<`. Le funzioni `max()` e `min()` arriveranno tra poco e elimineranno anche l'accumulatore.

---

# Quando il `for each` non basta

Il `for each` è comodo quando ci serve **solo il valore** di ogni elemento.

Ma in alcuni problemi l'indice è parte della soluzione:

- dobbiamo **modificare** la lista nella posizione corrente;
- dobbiamo confrontare elementi **vicini**;
- dobbiamo guardare l'elemento "speculare" rispetto alla fine.

In questi casi il `for i in range(...)` **resta superiore**: non è sintassi primitiva, è lo strumento giusto.

---
layout: two-cols-header
---

# Controesempio 1 — inversione in place

Vogliamo invertire la lista **senza crearne una nuova**.

::left::

```python
v = [1, 2, 3, 4, 5]

for i in range(len(v) // 2):
    j = len(v) - 1 - i
    temp = v[i]
    v[i] = v[j]
    v[j] = temp

print(v)   # [5, 4, 3, 2, 1]
```

::right::

Perché serve l'indice:

- dobbiamo scambiare `v[i]` con `v[j]`;
- per scrivere nella lista serve una **posizione**, non solo il valore;
- `for valore in v` ci dà una copia del valore, non la casella da modificare.

> **N.B.** In Python esistono `v.reverse()` e `v[::-1]`, ma l'algoritmo di inversione in place è un ottimo esercizio di logica.

---
layout: two-cols-header
---

# Controesempio 2 — parola palindroma

Una parola è **palindroma** se si legge uguale da sinistra a destra e da destra a sinistra.

::left::

```python
s = "anna"

palindroma = True
for i in range(len(s) // 2):
    if s[i] != s[len(s) - 1 - i]:
        palindroma = False

print(palindroma)   # True
```

::right::

Perché serve l'indice:

- confrontiamo il primo carattere con l'ultimo;
- poi il secondo con il penultimo;
- e così via.

Con `for c in s` avremmo solo un carattere alla volta, senza il suo "specchio" dall'altra parte; più avanti lo slicing renderà questo controllo una riga.

---
layout: two-cols-header
---

# Controesempio 3 — lista crescente

Una lista è **crescente** se ogni elemento è maggiore o uguale al precedente.

::left::

```python
lista = [1, 3, 5, 7]

crescente = True
for i in range(1, len(lista)):
    if lista[i] < lista[i - 1]:
        crescente = False

print(crescente)   # True
```

::right::

Perché serve l'indice:

- ogni elemento va confrontato con il **precedente**;
- il ciclo parte da `1`, così `lista[i - 1]` esiste sempre.

Con il `for each` si può fare tenendo da parte il valore precedente in una variabile, ma il codice diventa meno diretto: qui l'indice descrive meglio il problema.

---

# Riepilogo — `for each`

- `for valore in sequenza:` scorre direttamente i **valori**.
- È la scelta migliore quando l'indice **non serve**.
- Evita `range(len(...))` e `lista[i]`, quindi riduce gli errori.
- `x in sequenza` e `x not in sequenza` controllano l'appartenenza.
- Il `for i in range(...)` resta la scelta giusta per:
  - modificare gli elementi in place;
  - confrontare elementi vicini;
  - accedere a posizioni speculari (palindroma, inversione).

> **N.B.** "Idiomatico" non significa "sempre più corto": significa usare la sintassi che descrive meglio l'operazione.
