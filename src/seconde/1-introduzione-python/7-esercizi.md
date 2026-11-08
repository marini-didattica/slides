---
layout: cover
---

# Esercizi Python
per principianti

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Regole di sintassi

Negli esercizi valgono queste regole:

- Niente "zucchero sintattico": scrivi `i = i + 1`, non `i += 1`.
- Niente funzioni o metodi integrati avanzati: no `sum()`, `max()`, `min()`, `.count()`, `.index()`, né l'operatore `in`.
- I cicli solo con `for i in range(...)` oppure con `while`.
- Accesso agli elementi della lista **solo tramite indice**: `lista[i]`.

> **N.B.** Lo scopo è allenarsi a costruire la logica passo passo, non a trovare la scorciatoia.

---
layout: cover
---

# Categoria 1 — Facile
Scorrere e stampare

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Basi assolute</span>
</div>

---
layout: two-cols-header
class: table-sm
---

# Esercizio 1 — Stampa base con il `for`

Data una lista, stampa ogni numero su una riga diversa usando un ciclo `for` con `range`.

::left::

| Input              | Output                                    |
| ------------------ | ----------------------------------------- |
| `[2, 4, 6, 8, 10]` | `2`<br>`4`<br>`6`<br>`8`<br>`10`          |

::right::

> **Nota** Usa `range(len(lista))` e accedi con l'indice `lista[i]`.

---

# Esercizio 1 — Soluzione

```python
lista = [2, 4, 6, 8, 10]

for i in range(len(lista)):
    print(lista[i])
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 2 — Stampa base con il `while`

Fai la stessa cosa dell'esercizio 1, ma usa un ciclo `while`.

::left::

| Input              | Output                           |
| ------------------ | -------------------------------- |
| `[2, 4, 6, 8, 10]` | `2`<br>`4`<br>`6`<br>`8`<br>`10` |

::right::

> **Nota** Non dimenticare `i = i + 1`, altrimenti il ciclo non termina mai.

---

# Esercizio 2 — Soluzione

```python
lista = [2, 4, 6, 8, 10]

i = 0
while i < len(lista):
    print(lista[i])
    i = i + 1
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 3 — Solo i numeri positivi

Data una lista con numeri positivi e negativi, stampa solo i numeri maggiori di zero.

::left::

| Input               | Output             |
| ------------------- | ------------------ |
| `[5, -2, 8, -1, 3]` | `5`<br>`8`<br>`3`  |

::right::

> **Nota** Un numero è positivo quando `lista[i] > 0`.

---

# Esercizio 3 — Soluzione

```python
lista = [5, -2, 8, -1, 3]

for i in range(len(lista)):
    if lista[i] > 0:
        print(lista[i])
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 4 — Posizioni pari

Stampa solo gli elementi che si trovano in una posizione (indice) pari: 0, 2, 4, ...

::left::

| Input                 | Output              |
| --------------------- | ------------------- |
| `[10, 20, 30, 40, 50]`| `10`<br>`30`<br>`50`|

::right::

> **Nota** L'indice è pari quando `i % 2 == 0`.

---

# Esercizio 4 — Soluzione

```python
lista = [10, 20, 30, 40, 50]

for i in range(len(lista)):
    if i % 2 == 0:
        print(lista[i])
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 5 — Conto alla rovescia

Stampa gli elementi al contrario, dall'ultimo al primo, usando un `while`.

::left::

| Input           | Output                           |
| --------------- | -------------------------------- |
| `[1, 2, 3, 4, 5]` | `5`<br>`4`<br>`3`<br>`2`<br>`1` |

::right::

> **Nota** L'ultimo indice è `len(lista) - 1`.

---

# Esercizio 5 — Soluzione

```python
lista = [1, 2, 3, 4, 5]

i = len(lista) - 1
while i >= 0:
    print(lista[i])
    i = i - 1
```

---
layout: cover
---

# Categoria 2 — Media
Accumulatori e costruzione

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Matematica sulle liste</span>
</div>

---
layout: two-cols-header
class: table-sm
---

# Esercizio 6 — La somma

Data una lista di numeri, calcola e stampa la somma di tutti gli elementi.

::left::

| Input         | Output |
| ------------- | ------ |
| `[10, 20, 30]`| `60`   |

::right::

> **Nota** Senza usare `sum()`. Accumula in una variabile creata prima del ciclo.

---

# Esercizio 6 — Soluzione

```python
lista = [10, 20, 30]

somma = 0
for i in range(len(lista)):
    somma = somma + lista[i]
print(somma)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 7 — Il contatore

Conta quante volte compare il numero `10` nella lista e stampa il risultato.

::left::

| Input                        | Output |
| ---------------------------- | ------ |
| `[5, 10, 15, 10, 20, 10]`    | `3`    |

::right::

> **Nota** Senza usare `.count()`. Incrementa un contatore quando l'elemento è `10`.

---

# Esercizio 7 — Soluzione

```python
lista = [5, 10, 15, 10, 20, 10]

conta = 0
for i in range(len(lista)):
    if lista[i] == 10:
        conta = conta + 1
print(conta)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 8 — Il numero più grande

Trova e stampa il numero più grande presente nella lista.

::left::

| Input           | Output |
| --------------- | ------ |
| `[3, 7, 2, 9, 5]`| `9`   |

::right::

> **Nota** Senza usare `max()`. Parti dal primo elemento e aggiorna il massimo quando ne trovi uno più grande.

---

# Esercizio 8 — Soluzione

```python
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
for i in range(len(lista)):
    if lista[i] > massimo:
        massimo = lista[i]
print(massimo)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 9 — Il doppio (nuova lista)

Crea una nuova lista vuota e inserisci il doppio di ogni elemento della lista di partenza.

::left::

| Input        | Output         |
| ------------ | -------------- |
| `[1, 2, 3, 4]`| `[2, 4, 6, 8]`|

::right::

> **Nota** Usa `.append()` per aggiungere i valori alla nuova lista.

---

# Esercizio 9 — Soluzione

```python
lista = [1, 2, 3, 4]
nuova_lista = []

for i in range(len(lista)):
    nuova_lista.append(lista[i] * 2)
print(nuova_lista)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 10 — Somma tra due liste

Date due liste della stessa lunghezza, crea una terza lista con la somma, posizione per posizione.

::left::

| Input                     | Output         |
| ------------------------- | -------------- |
| `[1, 2, 3]` e `[10, 20, 30]` | `[11, 22, 33]` |

::right::

> **Nota** Usa lo stesso indice `i` per leggere entrambe le liste.

---

# Esercizio 10 — Soluzione

```python
lista_A = [1, 2, 3]
lista_B = [10, 20, 30]
lista_somma = []

for i in range(len(lista_A)):
    lista_somma.append(lista_A[i] + lista_B[i])
print(lista_somma)
```

---
layout: cover
---

# Categoria 3 — Difficile
Ricerca, modifica e flag

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Logica</span>
</div>

---
layout: two-cols-header
class: table-sm
---

# Esercizio 11 — Sostituzione

Se un elemento è negativo, trasformalo in `0`. Alla fine stampa la lista modificata.

::left::

| Input               | Output            |
| ------------------- | ----------------- |
| `[5, -2, 8, -1, 3]` | `[5, 0, 8, 0, 3]` |

::right::

> **Nota** Puoi modificare direttamente l'elemento: `lista[i] = 0`.

---

# Esercizio 11 — Soluzione

```python
lista = [5, -2, 8, -1, 3]

for i in range(len(lista)):
    if lista[i] < 0:
        lista[i] = 0
print(lista)
```

---
layout: two-cols-header
class: table-sm
---
# Esercizio 12 — Ricerca con stop anticipato

Controlla se il numero `15` è presente nella lista. Usa un `while` con una variabile booleana `trovato`: appena trovi il numero, il ciclo deve fermarsi.


| Input                     | Output           |
| ------------------------- | ---------------- |
| `[4, 8, 15, 16, 23, 42]`  | `Trovato: True`  |
| `[1, 2, 3]`               | `Trovato: False` |


> **Nota** Senza usare `in`. Nella condizione del `while` combina due controlli con `and`.

---

# Esercizio 12 — Soluzione

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

> **Nota** Appena `trovato` diventa `True`, la condizione `trovato == False` è falsa e il `while` si ferma: gli elementi successivi **non** vengono più controllati. È più efficiente di un `for`, che scorrerebbe tutta la lista anche dopo aver trovato il numero.

---
layout: two-cols-header
class: table-sm
---

# Esercizio 13 — Trova la posizione

Trova l'indice della prima occorrenza del numero `20`. Se non c'è, stampa `-1`.

::left::

| Input                  | Output |
| ---------------------- | ------ |
| `[10, 30, 20, 50, 20]` | `2`    |
| `[1, 2, 3]`            | `-1`   |

::right::

> **Nota** Senza usare `.index()`. Parti da `-1` e aggiornalo solo alla prima occorrenza.

---

# Esercizio 13 — Soluzione

```python
lista = [10, 30, 20, 50, 20]
cercato = 20

indice_trovato = -1
i = 0
while i < len(lista) and indice_trovato == -1:
    if lista[i] == cercato:
        indice_trovato = i
    i = i + 1

print(indice_trovato)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 14 — Verifica "tutti pari"

Verifica se **tutti** i numeri della lista sono pari. Se almeno uno è dispari, il risultato è falso.


| Input                | Output                               |
| -------------------- | ------------------------------------ |
| `[2, 4, 6, 8, 10]`   | `La lista contiene solo numeri pari` |
| `[2, 4, 5]`          | `C'è almeno un numero dispari`       |


> **Nota** Parti da `tutti_pari = True` e portalo a `False` quando trovi un dispari.

---

# Esercizio 14 — Soluzione

```python
lista = [2, 4, 6, 8, 10]

tutti_pari = True
for i in range(len(lista)):
    if lista[i] % 2 != 0:  # se trovo un dispari...
        tutti_pari = False

if tutti_pari == True:
    print("La lista contiene solo numeri pari")
else:
    print("C'è almeno un numero dispari")
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 15 — Merge di due liste ordinate

Date due liste ordinate in modo crescente, crea una terza lista che le unisca mantenendo l'ordine. Ogni elemento può essere letto **una sola volta**.

::left::

| Input                     | Output               |
| ------------------------- | -------------------- |
| `[1, 3, 5]` e `[2, 4, 6]` | `[1, 2, 3, 4, 5, 6]` |

::right::

> **Nota** Usa due indici, uno per lista: a ogni passo copia il minore e avanza solo quell'indice.

---

# Esercizio 15 — Soluzione

```python
lista_A = [1, 3, 5]
lista_B = [2, 4, 6]
unita = []

i = 0
j = 0
while i < len(lista_A) and j < len(lista_B):
    if lista_A[i] <= lista_B[j]:
        unita.append(lista_A[i])
        i = i + 1
    else:
        unita.append(lista_B[j])
        j = j + 1
while i < len(lista_A):
    unita.append(lista_A[i])
    i = i + 1
while j < len(lista_B):
    unita.append(lista_B[j])
    j = j + 1
print(unita)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 16 — Ordinamento crescente/decrescente

Data una lista, ordinala in modo crescente senza usare `.sort()`. Poi adatta il codice per l'ordine decrescente.

::left::

| Input             | Output            |
| ----------------- | ----------------- |
| `[5, 3, 8, 1, 9]` | `[1, 3, 5, 8, 9]` |

::right::

> **Nota** Confronta le coppie di elementi vicini e scambiali quando sono fuori ordine.

---

# Esercizio 16 — Soluzione

```python
lista = [5, 3, 8, 1, 9]

for i in range(len(lista)):
    for j in range(len(lista) - 1):
        if lista[j] > lista[j + 1]:
            temp = lista[j]
            lista[j] = lista[j + 1]
            lista[j + 1] = temp

print(lista)   # [1, 3, 5, 8, 9]
```

> **Nota** Per l'ordine **decrescente** basta invertire il confronto: `if lista[j] < lista[j + 1]:`.

---
layout: two-cols-header
class: table-sm
---

# Esercizio 17 — La lista è crescente?

Data una lista, stampa se è interamente crescente oppure no. Consideriamo crescente una lista in cui ogni elemento è **maggiore o uguale** al precedente.

::left::

| Input          | Output          |
| -------------- | --------------- |
| `[1, 3, 5, 7]` | `Crescente`     |
| `[1, 3, 2, 7]` | `Non crescente` |

::right::

> **Nota** Confronta ogni elemento con il precedente: se ne trovi uno più piccolo, la lista non è crescente.

---

# Esercizio 17 — Soluzione

```python
lista = [1, 3, 5, 7]

crescente = True
for i in range(1, len(lista)):
    if lista[i] < lista[i - 1]:
        crescente = False

if crescente == True:
    print("Crescente")
else:
    print("Non crescente")
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 18 — Elementi in comune v1
<div class="text-[var(--c-text-muted)]">
Versione 2: liste NON ordinate
</div>

Date due liste, crea una terza lista con solo gli elementi presenti in **entrambe**.

::left::

| Input                        | Output   |
| ---------------------------- | -------- |
| `[1, 2, 3, 4]` e `[3, 4, 5]` | `[3, 4]` |

::right::

> **Nota** Scorri la prima lista e, per ogni elemento, cerca se compare nella seconda con un secondo ciclo.

---

# Esercizio 18 — Soluzione

```python
lista_A = [1, 2, 3, 4]
lista_B = [3, 4, 5]
comuni = []

for i in range(len(lista_A)):
    for j in range(len(lista_B)):
        if lista_A[i] == lista_B[j]:
            comuni.append(lista_A[i])

print(comuni)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 19 — Elementi in comune v2
<div class="text-[var(--c-text-muted)]">
Versione 2: liste ordinate
</div>

Come l'esercizio 18, ma le due liste sono **ordinate**: ogni elemento può essere letto **una sola volta**. Come mai questo algoritmo è molto meglio del precedente?


| Input                           | Output   |
| ------------------------------- | -------- |
| `[1, 2, 3, 4]` e `[3, 4, 5, 6]` | `[3, 4]` |


> **Nota** Usa due indici: se gli elementi sono uguali li salvi e avanzi entrambi; se uno è più piccolo avanzi solo quello.

---

# Esercizio 19 — Soluzione

```python
lista_A = [1, 2, 3, 4]
lista_B = [3, 4, 5, 6]
comuni = []

i = 0
j = 0
while i < len(lista_A) and j < len(lista_B):
    if lista_A[i] == lista_B[j]:
        comuni.append(lista_A[i])
        i = i + 1
        j = j + 1
    elif lista_A[i] < lista_B[j]:
        i = i + 1
    else:
        j = j + 1

print(comuni)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 20 — Selection sort in una funzione

Scrivi un algoritmo che ordini una **lista di interi** in ordine crescente con il noto algoritmo [selection sort](https://it.wikipedia.org/wiki/Selection_sort); a ogni passo cerca il minimo della parte non ordinata e lo scambia con il primo elemento di quella parte.


| Input             | Output            |
| ----------------- | ----------------- |
| `[5, 3, 8, 1, 9]` | `[1, 3, 5, 8, 9]` |



> **Consiglio** Usa due cicli annidati: quello esterno fissa la posizione `i`, quello interno cerca l'indice del minimo tra `i` e la fine della lista.

---

# Esercizio 20 — Soluzione

```python
def ordina(lista):
    for i in range(len(lista)):
        indice_minimo = i
        for j in range(i + 1, len(lista)):
            if lista[j] < lista[indice_minimo]:
                indice_minimo = j
        temp = lista[i]
        lista[i] = lista[indice_minimo]
        lista[indice_minimo] = temp

numeri = [5, 3, 8, 1, 9]
ordina(numeri)
print(numeri)
```
