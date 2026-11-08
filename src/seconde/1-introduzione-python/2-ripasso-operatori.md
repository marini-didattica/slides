---
layout: cover
---

# Ripasso - Operatori
Combinare e confrontare valori

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Cosa sono gli operatori

Un **operatore** è un simbolo che combina uno o più valori (**operandi**) per produrre un nuovo valore.

```python
risultato = 7 + 3
#           ^   ^  operandi
#             ^    operatore
```

L'insieme `7 + 3` è una **espressione**: viene valutata e produce un valore (`10`).

- **Operatori aritmetici** → lavorano sui numeri
- **Operatori di confronto** → confrontano due valori e producono `True` o `False`
- **Operatori logici** → combinano più condizioni booleane

> **N.B.** Lo stesso simbolo può comportarsi in modo diverso a seconda del tipo degli operandi: `+` sui numeri somma, sulle stringhe concatena.

---
class: table-sm
---

# Operatori aritmetici

| Operatore | Nome             | Esempio  | Risultato             |
| --------- | ---------------- | -------- | --------------------- |
| `+`       | Addizione        | `7 + 3`  | `10`                  |
| `-`       | Sottrazione      | `7 - 3`  | `4`                   |
| `*`       | Moltiplicazione  | `7 * 3`  | `21`                  |
| `/`       | Divisione        | `7 / 3`  | `2.3333333333333335`  |
| `//`      | Divisione intera | `7 // 3` | `2`                   |
| `%`       | Modulo (resto)   | `7 % 3`  | `1`                   |
| `**`      | Potenza          | `2 ** 3` | `8`                   |


> **N.B.** `/` restituisce **sempre** un `float`, anche quando la divisione è esatta: `10 / 2` vale `5.0`, non `5`.

---

# Aritmetica: i casi meno intuitivi

```python
print(10 / 2)     # 5.0   -> la divisione dà sempre un float
print(7 // 2)     # 3     -> // tiene solo la parte intera
print(-7 // 2)    # -4    -> arrotonda verso il basso, NON verso lo zero!
print(7 % 3)      # 1
print(-7 % 2)     # 1     -> il segno del resto segue il divisore
print(7 % -2)     # -1
print(7.5 // 2)   # 3.0   -> funziona anche con i float
print(2 ** -1)    # 0.5   -> esponente negativo = frazione
```

- `//` è la **divisione intera** (floor): arrotonda verso `-∞`, per questo `-7 // 2` è `-4` e non `-3`.
- `%` si può calcolare come `a - (a // b) * b`: infatti `-7 - (-4) * 2 = 1`.
- Il modulo è utilissimo: `n % 2 == 0` dice se `n` è **pari**, e `n % 10` prende l'**ultima cifra**.

---

# Aritmetica: float e stringhe

```python
print(0.1 + 0.2)         # 0.30000000000000004  -> i float non sono esatti!
print(0.1 + 0.2 == 0.3)  # False

print("a" + "b")         # "ab"      -> + concatena le stringhe
print("ab" * 3)          # "ababab"  -> * ripete la stringa
print("3" + "4")         # "34"      -> NON è 7!
# print("3" + 4)         # TypeError: str e int non si mescolano
```

> **N.B.** I numeri con la virgola sono memorizzati in binario con un'approssimazione: per confrontarli con uguaglianza conviene usare una tolleranza, non `==`.

---
class: table-sm
---

# Operatori di confronto

| Operatore | Significato  | Esempio  | Risultato |
| --------- | ------------ | -------- | --------- |
| `==`      | uguale a     | `5 == 5` | `True`    |
| `!=`      | diverso da   | `5 != 5` | `False`   |
| `<`       | minore       | `5 < 3`  | `False`   |
| `>`       | maggiore     | `5 > 3`  | `True`    |
| `<=`      | minore o uguale | `5 <= 5` | `True`  |
| `>=`      | maggiore o uguale | `5 >= 6` | `False` |

Il risultato di un confronto è **sempre** un valore booleano (`True` o `False`).

> **N.B.** Non confondere `=` (assegnamento) con `==` (confronto): `x = 5` mette 5 dentro `x`, `x == 5` chiede se `x` vale 5.

---

# Confronti: i casi meno intuitivi

```python
print(1 == 1.0)          # True   -> int e float si confrontano per valore
print("1" == 1)          # False  -> tipi diversi, nessuna conversione automatica
print(0.1 + 0.2 == 0.3)  # False  -> attenzione ai float!

x = 5
print(1 < x < 10)        # True   -> confronto concatenato: equivale a 1 < x and x < 10
print(10 > x > 1)        # True

print("Z" < "a")         # True   -> le stringhe si confrontano per codice ASCII
print("casa" < "casale") # True   -> una stringa più corta viene "prima"
```

- I **confronti concatenati** (`a < b < c`) si leggono come in matematica e mettono in `and` i confronti adiacenti.
- Le stringhe non si confrontano "alfabeticamente" come ci si aspetta: le maiuscole vengono prima delle minuscole.

---
class: table-sm
---

# Operatori logici

| Operatore | Significato                   | Esempio             | Risultato |
| --------- | ----------------------------- | ------------------- | --------- |
| `and`     | vero se **entrambi** veri     | `True and False`    | `False`   |
| `or`      | vero se **almeno uno** vero   | `True or False`     | `True`    |
| `not`     | nega il valore                | `not True`          | `False`   |

### Tavola di verità

| `a`     | `b`     | `a and b` | `a or b` |
| ------- | ------- | --------- | -------- |
| `True`  | `True`  | `True`    | `True`   |
| `True`  | `False` | `False`   | `True`   |
| `False` | `True`  | `False`   | `True`   |
| `False` | `False` | `False`   | `False`  |

---

# Logici: i casi meno intuitivi

```python
print(5 or 0)               # 5       -> or restituisce un operando, non True/False
print(0 or 5)               # 5
print("ciao" and "mondo")   # "mondo" -> and restituisce l'ultimo se il primo è vero
print(not 5)                # False   -> not restituisce sempre un bool

# short-circuit: il secondo operando non viene valutato se non serve
print(False and (1 / 0))    # False   -> nessun errore di divisione
print(True or (1 / 0))      # True    -> nessun errore di divisione

# precedenza: not > and > or
print(True or False and False)   # True -> prima (False and False) = False
```

> **N.B.** `and` e `or` non restituiscono per forza `True`/`False`: restituiscono **uno degli operandi**. È un errore comune scrivere `if x == 1 or 2:` (sempre vero); va scritto `if x == 1 or x == 2:`.

---
class: table-sm
---

# Precedenza degli operatori

| Priorità (dalla più alta) | Operatori                    |
| ------------------------- | ---------------------------- |
| 1                         | `**`                         |
| 2                         | `+x`, `-x` (segno)           |
| 3                         | `*`, `/`, `//`, `%`          |
| 4                         | `+`, `-`                     |
| 5                         | `==`, `!=`, `<`, `>`, `<=`, `>=` |
| 6                         | `not`                        |
| 7                         | `and`                        |
| 8                         | `or`                         |

Usa le **parentesi** quando hai dubbi: `(a or b) and c` è più chiaro di `a or b and c`.

```python
print(2 + 3 * 4)       # 14, non 20
print((2 + 3) * 4)     # 20
```

---
layout: two-cols-header
---

# Esempi

::left::

### Pari o dispari

```python
numero = 7
if numero % 2 == 0:
    print("Pari")
else:
    print("Dispari")
```

### Conversione minuti

```python
minuti = 137
ore = minuti // 60      # 2
resto = minuti % 60     # 17
print(f"{ore}h {resto}m")
```

::right::

### Media con controllo

```python
voto1 = 7
voto2 = 4
media = (voto1 + voto2) / 2
print(f"Media: {media}")

promosso = media >= 6 and voto2 >= 4
print(f"Promosso: {promosso}")
```

### Fascia di età

```python
eta = 25
if 18 <= eta <= 65:
    print("Fascia lavorativa")
else:
    print("Fuori fascia")
```
