---
layout: cover
---

# Ripasso - Liste
Collezioni ordinate di valori

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Cos'è una lista

Una **lista** (`list`) è una sequenza **ordinata** e **modificabile** di valori. In memoria gli elementi sono memorizzati in un blocco **contiguo**, uno dopo l'altro, e ognuno ha un **indice**.

```python
v = [10, 20, 30]
#  indice:   0   1   2
#  valore:  10  20  30
```

- `len(v)` → numero di elementi (`3`)
- Gli indici partono da `0`
- È **mutabile**: si possono cambiare, aggiungere e togliere elementi

> **N.B.** L'essere contigue in memoria è ciò che rende possibile accedere a un elemento "salto" tramite il suo indice.

---

# Indici e slice

```python
v = [10, 20, 30, 40]
print(v[0])      # 10       -> primo elemento
print(v[-1])     # 40       -> ultimo elemento
print(v[1:3])    # [20, 30] -> dal 2° al 3° (escluso)
print(v[:2])     # [10, 20] -> dall'inizio
print(v[2:])     # [30, 40] -> fino alla fine
v[0] = 99        # modifica il primo elemento
```

> **N.B.** Gli indici partono da `0`; nello slice l'estremo **finale è escluso**.

---
class: table-sm
---

# Metodi principali

| Metodo          | Cosa fa                             | Esempio          |
| --------------- | ----------------------------------- | ---------------- |
| `.append(x)`    | aggiunge `x` in fondo               | `v.append(4)`    |
| `.insert(i, x)` | inserisce `x` in posizione `i`      | `v.insert(0, 9)` |
| `.remove(x)`    | rimuove la prima occorrenza di `x`  | `v.remove(20)`   |
| `.pop(i)`       | rimuove e restituisce l'elemento `i`| `v.pop()`        |
| `.sort()`       | ordina la lista sul posto           | `v.sort()`       |
| `.reverse()`    | inverte l'ordine                    | `v.reverse()`    |
| `.index(x)`     | posizione di `x`                    | `v.index(30)`    |
| `.count(x)`     | quante volte compare `x`            | `v.count(10)`    |

> **N.B.** Questi metodi **modificano** la lista originale (la lista è mutabile).

---
class: table-sm
---

# Operazioni utili

| Operazione     | Esempio             | Risultato        |
| -------------- | ------------------- | ---------------- |
| Concatenazione | `[1, 2] + [3]`      | `[1, 2, 3]`      |
| Ripetizione    | `[0] * 3`           | `[0, 0, 0]`      |
| Lunghezza      | `len([1, 2, 3])`    | `3`              |
| Appartenenza   | `2 in [1, 2, 3]`    | `True`           |
| Indice         | `v[0]`              | primo elemento   |
| Slice          | `v[1:3]`            | dal 2° al 3°     |
| Modifica       | `v[0] = 9`          | cambia il primo  |

---
layout: two-cols-header
---

# Esempi

::left::

### Media dei voti

```python
voti = [7, 4, 9, 6]
somma = 0
for i in range(len(voti)):
    somma += voti[i]
print(somma / len(voti))   # 6.5
```

### Massimo e minimo

```python
numeri = [3, 8, 1, 6]
print(max(numeri))   # 8
print(min(numeri))   # 1
```

::right::

### Modificare una lista

```python
coda = ["Anna", "Luca"]
coda.append("Sara")
coda.pop(0)
print(coda)   # ['Luca', 'Sara']
```

### Ordinare e invertire

```python
numeri = [3, 8, 1, 6]
numeri.sort()
print(numeri)      # [1, 3, 6, 8]
numeri.reverse()
print(numeri)      # [8, 6, 3, 1]
```

---

# Riepilogo

- Una **lista** è una sequenza **ordinata** e **mutabile**, memorizzata in modo **contiguo**.
- Indici da `0`; nello slice `[inizio:fine]` la fine è **esclusa**.
- I metodi **modificano** la lista sul posto: `.append()`, `.insert()`, `.remove()`, `.pop()`, `.sort()`, `.reverse()`.
- Operatori: `+` concatena, `*` ripete, `in` verifica l'appartenenza, `len()` conta.

> **N.B.** Per scorrere una lista si usa l'indice: `for i in range(len(v))` e poi `v[i]`.
