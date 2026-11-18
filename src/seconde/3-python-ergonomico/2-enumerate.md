---
layout: cover
---

# `enumerate`
Indice e valore, insieme

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Il problema: servono entrambi

A volte non basta il valore: ci serve anche **dove** si trova.

```python
nomi = ["Ada", "Luca", "Sara"]
```

Vogliamo stampare:

```text
1 Ada
2 Luca
3 Sara
```

Con il solo `for nome in nomi` non sappiamo a che punto siamo. Con `range(len(nomi))` otteniamo l'indice, ma perdiamo la comodità di leggere direttamente il valore.

`enumerate` risolve esattamente questo problema.

---

# La sintassi

```python
nomi = ["Ada", "Luca", "Sara"]

for i, nome in enumerate(nomi):
    print(i, nome)
```

`enumerate(nomi)` produce, a ogni giro, una **coppia**:

```text
(0, "Ada")   (1, "Luca")   (2, "Sara")
```

La riga `for i, nome in ...` **spacchetta** la coppia in due variabili:

- `i` riceve l'indice;
- `nome` riceve il valore.

> **N.B.** I nomi delle variabili sono liberi: `for posizione, valore in enumerate(lista)` va benissimo.

---

# Confronto diretto

<div class="w-fit mx-auto">

```python
# Solo indice: poi serve lista[i]
for i in range(len(nomi)):
    print(i, nomi[i])

# Solo valore: manca l'indice
for nome in nomi:
    print(nome)

# Indice e valore: enumerate
for i, nome in enumerate(nomi):
    print(i, nome)
```

</div>

`enumerate` è la sintassi idiomatica quando il problema richiede **sia la posizione sia il contenuto**.

---

# Esercizio 1 — Stampa numerata da 1

Stampa i nomi con la loro posizione, partendo da `1` invece che da `0`.

| Input                  | Output                     |
| ---------------------- | -------------------------- |
| `["Ada", "Luca", "Sara"]` | `1 Ada`<br>`2 Luca`<br>`3 Sara` |

> **Nota** Nella versione non ergonomica si aggiunge `1` all'indice dentro il `print`.

---
layout: two-cols-header
---

# Stampa numerata — non ergonomico vs ergonomico

::left::

### Non ergonomico

```python
nomi = ["Ada", "Luca", "Sara"]

for i in range(len(nomi)):
    print(i + 1, nomi[i])
```

::right::

### Ergonomico

```python
nomi = ["Ada", "Luca", "Sara"]

for posizione, nome in enumerate(nomi, start=1):
    print(posizione, nome)
```

::bottom::
`enumerate` accetta il parametro opzionale `start`: dice da quale numero far partire il conteggio. Il valore predefinito è `0`.

---

# Esercizio 2 — La posizione del massimo

Trova l'indice del voto più alto.

| Input          | Output |
| -------------- | ------ |
| `[6, 9, 7, 8]` | `1`    |

> **Nota** Serve sia il valore (per capire se è il massimo) sia l'indice (per ricordare dove si trova).

---

# Posizione del massimo — soluzione idiomatica

```python
voti = [6, 9, 7, 8]

massimo = voti[0]
indice_massimo = 0

for i, voto in enumerate(voti):
    if voto > massimo:
        massimo = voto
        indice_massimo = i

print(indice_massimo)   # 1
```

Con `enumerate` la condizione usa direttamente `voto`, mentre l'aggiornamento usa `i`: non dobbiamo più scrivere `voti[i]` per leggere il valore.

> **N.B.** Se ci sono più massimi uguali, questo codice restituisce la **prima** posizione, perché aggiorna solo con `>`.

---

# Esercizio 3 — Tutte le posizioni di un valore

Trova tutte le posizioni in cui compare un certo numero.

| Input                        | Output  |
| ---------------------------- | ------- |
| `[5, 10, 15, 10, 20, 10]`, `10` | `[1, 3, 5]` |

> **Nota** Nel ciclo serve l'indice per aggiungerlo alla lista dei risultati.

---

# Tutte le posizioni — soluzione idiomatica

```python
lista = [5, 10, 15, 10, 20, 10]
cercato = 10

posizioni = []
for i, valore in enumerate(lista):
    if valore == cercato:
        posizioni.append(i)

print(posizioni)   # [1, 3, 5]
```

Il codice si legge quasi come l'enunciato: *per ogni posizione e valore, se il valore è quello cercato, salva la posizione*.

---

# Esercizio 4 — Modificare in place

Sostituisci con `0` tutti i numeri negativi della lista.

| Input               | Output            |
| ------------------- | ----------------- |
| `[5, -2, 8, -1, 3]` | `[5, 0, 8, 0, 3]` |

Qui il `for each` da solo **non basta**: `for valore in lista` dà una copia del valore, e assegnare `valore = 0` non cambia la lista.

---

# Modificare in place — soluzione idiomatica

```python
lista = [5, -2, 8, -1, 3]

for i, valore in enumerate(lista):
    if valore < 0:
        lista[i] = 0

print(lista)   # [5, 0, 8, 0, 3]
```

`enumerate` ci dà entrambe le cose che servono:

- `valore` per **decidere** se l'elemento va cambiato;
- `i` per **scrivere** nella posizione giusta.

> **N.B.** Questo è il caso tipico in cui `enumerate` batte sia il `for each` sia il `for` con indice: unisce il meglio dei due.

---

# Esercizio 5 — Ricerca con stop anticipato

Cerca un valore e fermati alla **prima** occorrenza, stampando la sua posizione.

| Input                     | Output          |
| ------------------------- | --------------- |
| `[4, 8, 15, 16, 23]`, `15` | `Trovato in 2`  |
| `[1, 2, 3]`, `15`          | `Non trovato`   |

---

# Stop anticipato — soluzione idiomatica

```python
lista = [4, 8, 15, 16, 23]
cercato = 15

trovato = False
for i, valore in enumerate(lista):
    if valore == cercato:
        print("Trovato in", i)
        trovato = True
        break

if trovato == False:
    print("Non trovato")
```

- `break` interrompe il ciclo appena troviamo il valore.
- `enumerate` fornisce l'indice senza doverlo gestire a mano.
- La variabile `trovato` distingue "trovato" da "finito il ciclo senza trovarlo".

> **N.B.** Anche le stringhe si possono enumerare: `for i, c in enumerate("ciao")` dà `(0, "c")`, `(1, "i")`, ...

---

# Riepilogo — `enumerate`

- `for i, valore in enumerate(sequenza):` dà **indice e valore** a ogni giro.
- `start=1` fa partire il conteggio da `1` (utile per numerazioni "umane").
- È la scelta giusta quando servono entrambi:
  - numerare gli elementi;
  - trovare posizioni;
  - modificare in place;
  - fermarsi alla prima occorrenza.
- Il `for each` resta meglio quando l'indice **non serve davvero**.

> **N.B.** Se vi accorgete di scrivere `for i in range(len(lista))` e poi usare **sia** `i` **sia** `lista[i]`, probabilmente `enumerate` è la scelta più leggibile.
