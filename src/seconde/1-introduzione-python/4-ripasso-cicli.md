---
layout: cover
---

# Ripasso - Cicli
Ripetere istruzioni

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Perché servono i cicli

Spesso la stessa istruzione va ripetuta molte volte. Invece di copiarla, usiamo un **ciclo** che la ripete per noi.

```python
print("Ciao")
print("Ciao")
print("Ciao")   # e se servissero 100 volte?
```

Un ciclo esegue un **blocco** di istruzioni più volte:

- **`for`** → ripete un numero **noto** di volte (con `range()`)
- **`while`** → ripete **finché** una condizione è vera

> **N.B.** Il blocco è **indentato**: l'indentazione dice quali istruzioni vengono ripetute.

---

# Il ciclo `for`

```python
for i in range(5):
    print(i)      # Output: 0 1 2 3 4
```

`range(5)` produce i numeri `0, 1, 2, 3, 4`: a ogni giro `i` assume uno di questi valori e il blocco viene eseguito.

> **N.B.** `range(5)` parte da `0` e si ferma **prima** di `5`: il limite finale è **escluso**.

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

# Il ciclo `while`

```python
i = 0
while i < 5:
    print(i)      # Output: 0 1 2 3 4
    i += 1
```

La condizione è controllata **prima** di ogni giro: quando diventa falsa il ciclo termina.

> **N.B.** Se la condizione non diventa mai falsa il ciclo non termina: è il **ciclo infinito**. Nel blocco serve sempre qualcosa che faccia cambiare la condizione (qui `i += 1`).

---

# `for` o `while`?

| Usa `for` quando…                   | Usa `while` quando…                      |
| ----------------------------------- | ---------------------------------------- |
| sai **quante volte** ripetere       | non sai quante volte, dipende da altro   |
| conti da `0` a `n` con `range()`    | ripeti **finché** vale una condizione    |
| es: stampare i primi 10 numeri      | es: ripetere finché l'utente non indovina |

Spesso lo stesso problema si può risolvere con entrambi: scegli quello che rende più chiaro il codice.

---

# `break` e `continue`

```python
for i in range(1, 10):
    if i == 5:
        break        # esce subito dal ciclo
    print(i)         # 1 2 3 4

for i in range(1, 6):
    if i % 2 == 0:
        continue     # salta al giro successivo
    print(i)         # 1 3 5
```

- **`break`** interrompe il ciclo e continua con le istruzioni successive.
- **`continue`** salta il resto del blocco e passa al giro successivo.

> **N.B.** Vanno usati con parsimonia: spesso la stessa cosa si scrive con una condizione più chiara.

---
layout: two-cols-header
---

# Esempi

::left::

### Somma dei primi `n` numeri

```python
n = 5
somma = 0
for i in range(1, n + 1):
    somma += i
print(somma)      # 15
```

### Tabellina del 3

```python
for i in range(1, 11):
    print(3 * i)
```

::right::

### Conto alla rovescia

```python
n = 3
while n > 0:
    print(n)
    n -= 1
print("Via!")
```

### Somma finché non supera 10

```python
somma = 0
while somma <= 10:
    somma += 3
print(somma)      # 12
```

---

# Riepilogo

- **`for i in range(...)`** → ripete un numero noto di volte.
- **`range(stop)`**, **`range(start, stop)`**, **`range(start, stop, step)`**: il limite finale è **escluso**.
- **`while condizione:`** → ripete finché la condizione resta vera.
- Nel `while` la condizione va **aggiornata** nel blocco, altrimenti ciclo infinito.
- **`break`** esce dal ciclo, **`continue`** salta al giro successivo.

> **N.B.** Sia `for` che `while` ripetono un blocco **indentato**: l'indentazione è sintassi, non stile.
