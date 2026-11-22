---
layout: cover
---

# Slicing e indici negativi
Guardare le sequenze da un altro verso

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Ripasso: gli indici

In una lista o in una stringa ogni elemento ha una **posizione**, detta indice:

```python
v = [10, 20, 30, 40, 50]
#  indice:  0   1   2   3   4
```

```python
print(v[0])    # 10
print(v[2])    # 30
```

Python permette anche indici **negativi**, che contano dalla fine:

```python
print(v[-1])   # 50   -> ultimo
print(v[-2])   # 40   -> penultimo
```

> **N.B.** `-1` è l'ultimo elemento, `-2` il penultimo, e così via. L'indice `-len(v)` è il primo elemento.

---
layout: two-cols-header
---

# Indici negativi vs `len() - k`

::left::

### Non idiomatico

```python
v = [10, 20, 30, 40, 50]

print(v[len(v) - 1])   # 50
print(v[len(v) - 2])   # 40
print(v[len(v) - 3])   # 30
```

::right::

### Idiomatico

```python
v = [10, 20, 30, 40, 50]

print(v[-1])   # 50
print(v[-2])   # 40
print(v[-3])   # 30
```

::bottom::
`len(v) - 1` è la traduzione manuale di "ultimo elemento". L'indice negativo dice la stessa cosa senza calcoli.

---

# La sintassi dello slicing

Uno **slice** seleziona una **sottosequenza**:

```python
sequenza[inizio:fine:passo]
```

- `inizio` è incluso;
- `fine` è **escluso**;
- `passo` è di quanto avanzare (default `1`).

Tutti e tre sono opzionali:

| Scrittura | Significato |
| --------- | ----------- |
| `v[a:b]` | da `a` incluso a `b` escluso |
| `v[:b]` | dall'inizio a `b` escluso |
| `v[a:]` | da `a` fino alla fine |
| `v[:]` | tutta la sequenza (copia) |
| `v[a:b:2]` | uno ogni due |
| `v[::-1]` | tutta la sequenza al contrario |

---

# Esempi di slicing

```python
v = [10, 20, 30, 40, 50]

print(v[1:3])     # [20, 30]        -> indici 1 e 2
print(v[:3])      # [10, 20, 30]    -> primi tre
print(v[3:])      # [40, 50]        -> dall'indice 3 in poi
print(v[-2:])     # [40, 50]        -> ultimi due
print(v[:-2])     # [10, 20, 30]    -> tutto tranne gli ultimi due
print(v[::2])     # [10, 30, 50]    -> uno ogni due
print(v[1::2])    # [20, 40]        -> uno ogni due, partendo da 1
print(v[::-1])    # [50, 40, 30, 20, 10]
```

> **N.B.** Lo slice restituisce sempre una **nuova** sequenza: modificare la copia non modifica l'originale.

---

# Esercizio 1 — Primi e ultimi elementi

Estrarre i primi tre e gli ultimi tre elementi di una lista.

| Input                 | Output                        |
| --------------------- | ----------------------------- |
| `[10, 20, 30, 40, 50, 60]` | `[10, 20, 30]` e `[40, 50, 60]` |

La versione non idiomatica usa un ciclo con `range()` e `.append()` per costruire le due liste.

---
layout: two-cols-header
---

# Primi e ultimi — non idiomatico vs idiomatico

::left::

### Non idiomatico

```python
v = [10, 20, 30, 40, 50, 60]

primi = []
for i in range(3):
    primi.append(v[i])

ultimi = []
for i in range(len(v) - 3, len(v)):
    ultimi.append(v[i])

print(primi)
print(ultimi)
```

::right::

### Idiomatico

```python
v = [10, 20, 30, 40, 50, 60]

primi = v[:3]
ultimi = v[-3:]

print(primi)    # [10, 20, 30]
print(ultimi)   # [40, 50, 60]
```

::bottom::
Lo slice descrive **quale parte** della lista vogliamo, non come copiarla passo passo.

---

# Esercizio 2 — Invertire una lista

Riprendiamo l'inversione. Abbiamo visto la versione **in place** con gli indici; ora vediamo la versione che crea una **nuova lista**.

| Input       | Output      |
| ----------- | ----------- |
| `[1, 2, 3]` | `[3, 2, 1]` |

---
layout: two-cols-header
---

# Inversione — due strumenti diversi

::left::

### Nuova lista: `v[::-1]`

```python
v = [1, 2, 3, 4, 5]

invertita = v[::-1]

print(invertita)   # [5, 4, 3, 2, 1]
print(v)           # [1, 2, 3, 4, 5]
```

::right::

### In place: `v.reverse()`

```python
v = [1, 2, 3, 4, 5]

v.reverse()

print(v)           # [5, 4, 3, 2, 1]
```

::bottom::
`v[::-1]` crea una **copia** invertita e lascia l'originale intatto. `v.reverse()` modifica la lista originale e restituisce `None`. Sono due operazioni diverse: scegliete quella che serve.

---

# Esercizio 3 — Palindroma

Una parola è **palindroma** se si legge uguale nei due versi.

| Input     | Output  |
| --------- | ------- |
| `"anna"`  | `True`  |
| `"casa"`  | `False` |
| `"radar"` | `True`  |

Nella lezione sul `for each` avevamo usato due indici per confrontare i caratteri speculari. Con lo slicing possiamo evitare del tutto il ciclo.

---
layout: two-cols-header
---

# Palindroma — non idiomatico vs idiomatico

::left::

### Non idiomatico

```python
s = "anna"

palindroma = True
for i in range(len(s) // 2):
    if s[i] != s[len(s) - 1 - i]:
        palindroma = False

print(palindroma)   # True
```

::right::

### Idiomatico

```python
s = "anna"

print(s == s[::-1])   # True
```

::bottom::
`s[::-1]` è la parola al contrario. Il confronto `s == s[::-1]` dice esattamente *"la parola è uguale alla sua inversa"*.

> **N.B.** La versione con gli indici usa memoria costante, quella con lo slicing crea una copia. Per una parola la differenza è irrilevante; per una lista enorme può contare.

---

# Palindroma "vera": ignorare maiuscole e spazi

Una frase come `"I topi non avevano nipoti"` è palindroma a meno di spazi e maiuscole.

```python
frase = "I topi non avevano nipoti"

pulita = frase.lower().replace(" ", "")
print(pulita == pulita[::-1])   # True
```

- `.lower()` porta tutto in minuscolo;
- `.replace(" ", "")` toglie gli spazi;
- `[::-1]` inverte la stringa.

> **N.B.** Combinando metodi, slicing e confronto otteniamo in tre righe un controllo che con i cicli richiederebbe molto più codice.

---

# Esercizio 4 — Copiare una lista

Creare una copia indipendente di una lista.

```python
v = [1, 2, 3]

copia = v[:]       # copia con lo slicing
copia[0] = 99

print(v)           # [1, 2, 3]
print(copia)       # [99, 2, 3]
```

La versione non idiomatica crea una lista vuota e vi aggiunge gli elementi uno per uno con un ciclo.

> **N.B.** `copia = v` **non** crea una copia: fa sì che due nomi puntino alla **stessa** lista. Per una copia vera serve `v[:]` (o `v.copy()`).

---

# Esercizio 5 — Rotazione

Ruotare una lista di una posizione a sinistra o a destra.

| Operazione | Input       | Output      |
| ---------- | ----------- | ----------- |
| Sinistra   | `[1, 2, 3]` | `[2, 3, 1]` |
| Destra     | `[1, 2, 3]` | `[3, 1, 2]` |

---
layout: two-cols-header
---

# Rotazione con lo slicing

::left::

### A sinistra

```python
v = [1, 2, 3, 4, 5]

ruotata = v[1:] + v[:1]

print(ruotata)   # [2, 3, 4, 5, 1]
```

::right::

### A destra

```python
v = [1, 2, 3, 4, 5]

ruotata = v[-1:] + v[:-1]

print(ruotata)   # [5, 1, 2, 3, 4]
```

::bottom::
L'idea è sempre la stessa: **taglia** la lista in due pezzi con lo slicing e **ricomponila** con `+`.

---

# Esercizio 6 — I tre voti più alti

Ordinare i voti dal più alto al più basso e tenere solo i primi tre.

| Input              | Output      |
| ------------------ | ----------- |
| `[8, 6, 9, 7, 10]` | `[10, 9, 8]` |

---

# Tre voti più alti — soluzione

```python
voti = [8, 6, 9, 7, 10]

ordinati = sorted(voti, reverse=True)
primi_tre = ordinati[:3]

print(primi_tre)   # [10, 9, 8]
```

In una sola riga:

```python
print(sorted(voti, reverse=True)[:3])
```

> **N.B.** `sorted(...)` produce una lista ordinata; `[:3]` ne prende i primi tre elementi. Due strumenti diversi che si compongono bene.

---

# Attenzione: indice fuori range vs slice

```python
v = [10, 20, 30]

print(v[10])     # IndexError: list index out of range
print(v[10:])    # []  -> nessun errore
```

- L'accesso con indice **pretende** che la posizione esista.
- Lo slice accetta anche estremi oltre la lunghezza e restituisce una sequenza vuota.

> **N.B.** Questo è un altro motivo per preferire lo slice quando si vuole "prendere al massimo i primi `k` elementi": funziona anche se la lista è più corta.

---

# Riepilogo — slicing e indici negativi

- `v[-1]` è l'ultimo elemento, `v[-2]` il penultimo.
- `v[a:b]` prende da `a` incluso a `b` **escluso**.
- `v[:b]`, `v[a:]`, `v[:]` sono le forme abbreviate.
- `v[::2]` prende un elemento ogni due; `v[::-1]` inverte.
- Lo slice restituisce una **nuova** sequenza.
- `v[::-1]` crea una copia invertita; `v.reverse()` modifica sul posto.
- Palindroma: `s == s[::-1]`.
- Rotazione: `v[1:] + v[:1]` a sinistra, `v[-1:] + v[:-1]` a destra.

> **N.B.** Lo slicing è la sintassi idiomatica per "prendi questa parte di sequenza". Se vi trovate a copiare elementi con un ciclo e un indice, chiedetevi se uno slice non faccia la stessa cosa in una riga.
