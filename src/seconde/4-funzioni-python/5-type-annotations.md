# Le annotazioni di tipo

Python permette di **documentare** che tipo di dati una funzione si aspetta e che tipo restituisce:

```python
def somma(a: int, b: int) -> int:
    return a + b
```

- `a: int` → il parametro `a` dovrebbe essere un intero;
- `b: int` → il parametro `b` dovrebbe essere un intero;
- `-> int` → la funzione dovrebbe restituire un intero.

> **N.B.** Si chiamano **type annotations** e sono solo **suggerimenti**, non obblighi.

---

# Perché usarle

- **Documentano** l'interfaccia: chi legge sa subito cosa passare e cosa aspettarsi.
- **Aiutano l'editor**: completamento automatico e suggerimenti migliori.
- **Permettono controlli automatici** con strumenti come `mypy`.
- **Fanno emergere gli errori** prima di eseguire il programma.
- **Non cambiano il codice**: Python resta a tipizzazione dinamica.

```python
def saluta(nome: str) -> str:
    return "Ciao " + nome
```

Senza leggere il corpo, sappiamo già che input e output sono stringhe.

---
class: table-sm
---

# I tipi più comuni

| Tipo             | Significato                          | Esempio                     |
| ---------------- | ------------------------------------ | --------------------------- |
| `int`            | numero intero                        | `42`                        |
| `float`          | numero con la virgola                | `3.14`                      |
| `str`            | stringa                              | `"ciao"`                    |
| `bool`           | booleano                             | `True`, `False`             |
| `None`           | assenza di valore                    | `None`                      |
| `list[int]`      | lista di interi                      | `[1, 2, 3]`                 |
| `list[str]`      | lista di stringhe                    | `["a", "b"]`                |
| `dict[str, int]` | dizionario da stringhe a interi      | `{"a": 1}`                  |
| `tuple[int, int]`| tupla di due interi                  | `(2, 9)`                    |

> **N.B.** `list[int]` richiede Python 3.9 o successivo. Nei corsi usiamo versioni recenti.

---
class: table-sm
---

# Esempi annotati

```python
def calcola_media(voti: list[float]) -> float:
    return sum(voti) / len(voti)

def saluta(nome: str) -> None:
    print("Ciao", nome)

def e_pari(n: int) -> bool:
    return n % 2 == 0

def iniziali(nome: str, cognome: str) -> str:
    return nome[0] + cognome[0]
```

Ogni firma racconta una storia completa:

| Funzione         | Input                | Output  |
| ---------------- | -------------------- | ------- |
| `calcola_media`  | lista di numeri      | numero  |
| `saluta`         | stringa              | niente  |
| `e_pari`         | intero               | booleano|
| `iniziali`       | due stringhe         | stringa |

---

# Annotazioni e valori di default

L'annotazione va **dopo i due punti**, il default **dopo l'uguale**:

```python
def saluta(nome: str, saluto: str = "Ciao") -> str:
    return saluto + " " + nome

print(saluta("Ada"))                 # Ciao Ada
print(saluta("Ada", "Buongiorno"))   # Buongiorno Ada
```

L'ordine resta quello di sempre:

```python
def f(a: int, b: int = 0) -> int:    # corretto
    ...

def f(a: int = 0, b: int) -> int:    # SyntaxError
    ...
```

---

# Tipi che possono mancare

Una funzione può restituire un valore **oppure** `None`:

```python
def trova_indice(lista: list[int], cercato: int) -> int | None:
    for i in range(len(lista)):
        if lista[i] == cercato:
            return i
    return None
```

`int | None` si legge "intero **oppure** `None`" e richiede Python 3.10 o successivo.

Nelle versioni precedenti si scrive:

```python
from typing import Optional

def trova_indice(lista: list[int], cercato: int) -> Optional[int]:
    ...
```

> **N.B.** Annotare `None` costringe chi chiama a gestire il caso "non trovato": è una forma di documentazione onesta.

---

# Le annotazioni non cambiano il comportamento

Python **non controlla** i tipi a runtime:

```python
def doppio(n: int) -> int:
    return n * 2

print(doppio(5))      # 10
print(doppio("ab"))   # abab
```

L'ultima chiamata non dà errore: `"ab" * 2` è semplicemente `"abab"`.

- le annotazioni sono **promesse**, non vincoli;
- per controllarle davvero si usa uno strumento esterno, ad esempio `mypy programma.py`.

> **N.B.** Anche senza controlli automatici, le annotazioni rendono il codice più leggibile per noi e per i nostri compagni.
