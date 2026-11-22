---
layout: cover
---

# `sum`, `sorted`, `min`, `max`
Sommare, ordinare e cercare senza riscrivere algoritmi

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Funzioni integrate

Python mette a disposizione alcune funzioni già pronte per i problemi più comuni sulle sequenze:

| Funzione | Cosa restituisce |
| -------- | ---------------- |
| `min(sequenza)` | l'elemento più piccolo |
| `max(sequenza)` | l'elemento più grande |
| `sum(sequenza)` | la somma degli elementi |
| `sorted(sequenza)` | una **nuova lista** ordinata |

Non sono "scorciatoie da evitare": sono il modo normale di scrivere questi programmi in Python.

> **N.B.** Sono funzioni **pure** (tranne `sort()`): non modificano la sequenza originale, restituiscono un nuovo valore.

---

# La funzione `sum`

`sum(sequenza)` restituisce la **somma** di tutti gli elementi:

```python
voti = [7, 4, 9, 6]

print(sum(voti))   # 26
```

- Funziona su liste e su qualsiasi sequenza di numeri.
- Su una lista vuota restituisce `0`, non dà errore.
- Accetta un secondo argomento opzionale: il valore iniziale.

```python
print(sum([1, 2, 3], 10))   # 16
```

> **N.B.** `sum()` non è una scorciatoia "per furbi": è il modo normale di sommare una sequenza in Python.

---
layout: two-cols-header
---

# Somma — non idiomatico vs idiomatico

::left::

### Non idiomatico

```python
voti = [7, 4, 9, 6]

somma = 0
for voto in voti:
    somma = somma + voto

print(somma)   # 26
```

::right::

### Idiomatico

```python
voti = [7, 4, 9, 6]

print(sum(voti))   # 26
```

::bottom::
L'accumulatore sparisce: `sum` fa esattamente ciò che il nome promette.

---

# Somma e media

La media è la somma divisa per il numero di elementi:

```python
voti = [7, 4, 9, 6]

media = sum(voti) / len(voti)
print(media)   # 6.5
```

> **N.B.** Con una lista vuota `len(voti)` vale `0` e la divisione dà errore: se la lista può essere vuota, controllala prima.

---

# Esercizio 9 — Massimo e minimo

Riprendiamo l'esercizio del massimo e del minimo.

| Input             | Output          |
| ----------------- | --------------- |
| `[3, 7, 2, 9, 5]` | `massimo: 9`<br>`minimo: 2` |

Nella versione non idiomatica partivamo dal primo elemento e aggiornavamo due accumulatori durante il ciclo.

---
layout: two-cols-header
---

# Massimo e minimo — non idiomatico vs idiomatico

::left::

### Non idiomatico

```python
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
minimo = lista[0]

for valore in lista:
    if valore > massimo:
        massimo = valore
    if valore < minimo:
        minimo = valore

print("massimo:", massimo)
print("minimo:", minimo)
```

::right::

### Idiomatico

```python
lista = [3, 7, 2, 9, 5]

print("massimo:", max(lista))
print("minimo:", min(lista))
```

::bottom::
`max()` e `min()` accettano anche più argomenti separati: `max(3, 7, 2)` vale `7`.

---

# Attenzione alle liste vuote

```python
numeri = []

print(max(numeri))   # ValueError: max() arg is an empty sequence
```

Non esiste il massimo di una lista vuota. Se la lista può essere vuota, va controllato prima:

```python
if len(numeri) > 0:
    print(max(numeri))
else:
    print("La lista è vuota")
```

> **N.B.** Lo stesso vale per `min()` e per la media: `sum(numeri) / len(numeri)` dà una divisione per zero se la lista è vuota.

---
layout: two-cols-header
---

# Ordinare: `sorted()` e `.sort()`

Ci sono due modi per ordinare, ma **non sono uguali**:

::left::

### `sorted(lista)`

```python
voti = [8, 6, 9, 7]
ordinati = sorted(voti)

print(ordinati)   # [6, 7, 8, 9]
print(voti)       # [8, 6, 9, 7]
```

Restituisce una **nuova lista**; l'originale resta com'è.

::right::

### `lista.sort()`

```python
voti = [8, 6, 9, 7]
voti.sort()

print(voti)       # [6, 7, 8, 9]
```

Modifica la lista **sul posto** e restituisce `None`.

::bottom::
Regola pratica: se vi serve l'originale, usate `sorted()`; se volete trasformare la lista, usate `.sort()`.

---

# Ordinamento decrescente

Entrambe le versioni accettano `reverse=True`:

```python
voti = [8, 6, 9, 7]

print(sorted(voti, reverse=True))   # [9, 8, 7, 6]

voti.sort(reverse=True)
print(voti)                         # [9, 8, 7, 6]
```

> **N.B.** `reverse=True` non è la stessa cosa di `.reverse()`: `.reverse()` inverte l'ordine attuale, `reverse=True` ordina dal più grande al più piccolo.

---

# Ordinare una lista

Riprendiamo l'esercizio dell'ordinamento: data una lista, mettila in ordine crescente.

| Input             | Output            |
| ----------------- | ----------------- |
| `[5, 3, 8, 1, 9]` | `[1, 3, 5, 8, 9]` |

Nella versione non idiomatica avevamo scritto un **selection sort** con due cicli annidati e lo scambio con variabile temporanea.

---
layout: two-cols-header
---

# Selection sort vs `sorted()`

::left::

### Non idiomatico

```python
lista = [5, 3, 8, 1, 9]

for i in range(len(lista)):
    indice_minimo = i
    for j in range(i + 1, len(lista)):
        if lista[j] < lista[indice_minimo]:
            indice_minimo = j
    temp = lista[i]
    lista[i] = lista[indice_minimo]
    lista[indice_minimo] = temp

print(lista)   # [1, 3, 5, 8, 9]
```

::right::

### Idiomatico

```python
lista = [5, 3, 8, 1, 9]

lista_ordinata = sorted(lista)

print(lista_ordinata)   # [1, 3, 5, 8, 9]
```

::bottom::
Scrivere l'algoritmo una volta serve per **capire** come funziona l'ordinamento. Da qui in avanti, per ordinare davvero, si usa `sorted()`.

---

# Esercizio — Anagrammi

Due parole sono **anagrammi** se contengono le stesse lettere, anche in ordine diverso.

| Parole              | Output  |
| ------------------- | ------- |
| `"roma"`, `"amor"`  | `True`  |
| `"casa"`, `"cassa"` | `False` |

> **Nota** Se ordiniamo le lettere di entrambe le parole, due anagrammi diventano **identici**.

---

# Anagrammi — soluzione con `sorted()`

```python
parola_a = "roma"
parola_b = "amor"

print(sorted(parola_a) == sorted(parola_b))   # True
```

`sorted("roma")` restituisce `['a', 'm', 'o', 'r']`; `sorted("amor")` restituisce la stessa lista.

Se vogliamo una stringa normale:

```python
print("".join(sorted(parola_a)))   # "amor"
```

> **N.B.** `sorted()` funziona su qualsiasi sequenza, anche sulle stringhe. Per confrontare due liste di caratteri basta `==`.

---

# Ordinare per un criterio: `key`

A volte non vogliamo l'ordine naturale, ma un ordine basato su qualcos'altro.

```python
parole = ["programma", "re", "casa", "sole"]

print(sorted(parole, key=len))   # ['re', 'casa', 'sole', 'programma']
```

`key=len` significa: *per confrontare due elementi, applica prima `len` a ciascuno*.

```python
print(max(parole, key=len))      # "programma"
```

- In `sorted` decide l'ordine.
- In `max` / `min` decide quale elemento è il massimo / minimo.

> **N.B.** `len` si passa **senza parentesi**: non stiamo chiamando la funzione, le stiamo dicendo quale funzione usare.

---

# Altri esempi con `key`

```python
numeri = [-8, 3, -1, 5]

print(sorted(numeri))              # [-8, -1, 3, 5]
print(sorted(numeri, key=abs))     # [-1, 3, 5, -8]

voti = [("Ada", 8), ("Luca", 6), ("Sara", 9)]

print(sorted(voti, key=lambda voto: voto[1]))
# [('Luca', 6), ('Ada', 8), ('Sara', 9)]
```

- `key=abs` ordina per **valore assoluto**.
- `key=lambda ...` ordina per il campo scelto.

> **N.B.** `lambda` è una funzione anonima compatta: la incontreremo meglio più avanti. Per ora basta sapere che `key` accetta una funzione.

---

# Riepilogo — `sorted`, `min`, `max`

| Funzione | Restituisce | Modifica l'originale? |
| -------- | ----------- | --------------------- |
| `min(v)` | il minimo | no |
| `max(v)` | il massimo | no |
| `sum(v)` | la somma | no |
| `sorted(v)` | una nuova lista ordinata | no |
| `v.sort()` | `None` | **sì** |

- `reverse=True` ordina al contrario.
- `key=...` ordina o seleziona secondo un criterio.
- `max()` / `min()` su una lista vuota danno errore.

