---
layout: cover
---

# Esercizi Python
I primi passi in python

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>


---
layout: two-cols-header
class: table-sm
---

# Esercizio 1 - voto sufficiente o insufficiente
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Inizializza una variabile intera `voto` e stampa:

- `Sufficiente` se il voto è maggiore o uguale a `6`;
- `Insufficiente` se il voto è minore di `6`;
- `Errore` se il voto **non** è nel range consentito `0`–`10`.

::left::

| Input | Output         |
| ----- | -------------- |
| `7`   | `Sufficiente`  |
| `4`   | `Insufficiente`|
| `12`  | `Errore`       |

::right::

> **Nota** Controlla prima il caso di errore usando `or`: `voto < 0 or voto > 10`.

---

# Esercizio 1

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Controlla prima che il voto sia nel range, poi stampa sufficiente o insufficiente.

```python
voto = 7

if voto < 0 or voto > 10:
    print("Errore")
elif voto >= 6:
    print("Sufficiente")
else:
    print("Insufficiente")
```

> **Nota** L'`elif` viene controllato solo se il primo `if` è falso: l'ordine dei controlli conta.

---
layout: two-cols-header
class: table-sm
---

# Esercizio 1

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `voto = 7`

::left::

```python {1|3|5|6} {at: 1}
voto = 7

if voto < 0 or voto > 10:
    print("Errore")
elif voto >= 6:
    print("Sufficiente")
else:
    print("Insufficiente")
```

::right::

<table>
  <thead>
    <tr>
      <th>voto</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-4>voto = 7</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>—</template>
          <template #3-4>Sufficiente</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 1

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `voto = 4`

::left::

```python {1|3|5|7|8} {at: 1}
voto = 4

if voto < 0 or voto > 10:
    print("Errore")
elif voto >= 6:
    print("Sufficiente")
else:
    print("Insufficiente")
```

::right::

<table>
  <thead>
    <tr>
      <th>voto</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-5>voto = 4</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-4>—</template>
          <template #4-5>Insufficiente</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 1

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `voto = 12`

::left::

```python {1|3|4} {at: 1}
voto = 12

if voto < 0 or voto > 10:
    print("Errore")
elif voto >= 6:
    print("Sufficiente")
else:
    print("Insufficiente")
```

::right::

<table>
  <thead>
    <tr>
      <th>voto</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>voto = 12</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>—</template>
          <template #2-3>Errore</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 2 - primo, ultimo e centrale
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista, crea una **nuova lista** che contenga il primo elemento, l'ultimo elemento e l'elemento centrale della lista di partenza. Stampa la nuova lista.

::left::

| Input                   | Output           |
| ----------------------- | ---------------- |
| `[10, 20, 30, 40, 50]`  | `[10, 50, 30]`   |

::right::

> **Nota** L'ultimo indice è `len(lista) - 1`, l'indice centrale è `len(lista) // 2`.

---

# Esercizio 2

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Calcola l'indice centrale e costruisce la nuova lista con primo, ultimo e centrale.

```python
lista = [10, 20, 30, 40, 50]

centrale = len(lista) // 2

nuova_lista = []
nuova_lista.append(lista[0])
nuova_lista.append(lista[len(lista) - 1])
nuova_lista.append(lista[centrale])

print(nuova_lista)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 2

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [10, 20, 30, 40, 50]`

::left::

```python {1|3|5|6|7|8|10} {at: 1}
lista = [10, 20, 30, 40, 50]

centrale = len(lista) // 2

nuova_lista = []
nuova_lista.append(lista[0])
nuova_lista.append(lista[len(lista) - 1])
nuova_lista.append(lista[centrale])

print(nuova_lista)
```

::right::

<table>
  <thead>
    <tr>
      <th>centrale</th>
      <th>nuova_lista</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>centrale = —</template>
          <template #1-7>centrale = 2</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>nuova_lista = —</template>
          <template #2-3>nuova_lista = []</template>
          <template #3-4>nuova_lista = [10]</template>
          <template #4-5>nuova_lista = [10, 50]</template>
          <template #5-7>nuova_lista = [10, 50, 30]</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-6>—</template>
          <template #6-7>[10, 50, 30]</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 3 - conta da `0` a `n - 1`
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Dato un intero `n`, stampa i numeri da `0` a `n - 1`, uno per riga. Usa **solo** un ciclo `while`.

::left::

| Input | Output                                     |
| ----- | ------------------------------------------ |
| `5`   | `0`<br>`1`<br>`2`<br>`3`<br>`4`            |

::right::

> **Nota** Non dimenticare `i = i + 1`, altrimenti il ciclo non termina mai.

---

# Esercizio 3

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Un contatore parte da 0 e stampa finché non raggiunge `n`.

```python
n = 5

i = 0
while i < n:
    print(i)
    i = i + 1
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 3

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `n = 5`



::left::

```python {1|3|4|5|6|4|5|6|4|5|6|4|5|6|4|5|6|4} {at: 1}
n = 5

i = 0
while i < n:
    print(i)
    i = i + 1
```

::right::

<table>
  <thead>
    <tr>
      <th>valore di i</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>i = —</template>
          <template #1-4>i = 0</template>
          <template #4-7>i = 1</template>
          <template #7-10>i = 2</template>
          <template #10-13>i = 3</template>
          <template #13-16>i = 4</template>
          <template #16-18>i = 5</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>—</template>
          <template #3-6>0</template>
          <template #6-9>0<br>1</template>
          <template #9-12>0<br>1<br>2</template>
          <template #12-15>0<br>1<br>2<br>3</template>
          <template #15-18>0<br>1<br>2<br>3<br>4</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 4 - conta da `n - 1` a `0`
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Dato un intero `n`, stampa i numeri da `n - 1` a `0`, uno per riga. Usa **solo** un ciclo `while`.

::left::

| Input | Output                                      |
| ----- | ------------------------------------------- |
| `5`   | `4`<br>`3`<br>`2`<br>`1`<br>`0`             |

::right::

> **Nota** Parti da `n - 1` e continua finché `i >= 0`, decrementando `i`.

---

# Esercizio 4

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Un contatore parte da `n - 1` e decrementa finché non arriva a 0.

```python
n = 5

i = n - 1
while i >= 0:
    print(i)
    i = i - 1
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 4

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `n = 5`



::left::

```python {1|3|4|5|6|4|5|6|4|5|6|4|5|6|4|5|6|4} {at: 1}
n = 5

i = n - 1
while i >= 0:
    print(i)
    i = i - 1
```

::right::

<table>
  <thead>
    <tr>
      <th>valore di i</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>i = —</template>
          <template #1-4>i = 4</template>
          <template #4-7>i = 3</template>
          <template #7-10>i = 2</template>
          <template #10-13>i = 1</template>
          <template #13-16>i = 0</template>
          <template #16-18>i = -1</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>—</template>
          <template #3-6>4</template>
          <template #6-9>4<br>3</template>
          <template #9-12>4<br>3<br>2</template>
          <template #12-15>4<br>3<br>2<br>1</template>
          <template #15-18>4<br>3<br>2<br>1<br>0</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 5 - una lista, un elemento per riga
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista con un numero arbitrario di elementi, stampala mettendo ogni elemento su una riga diversa.

::left::

| Input              | Output                                     |
| ------------------ | ------------------------------------------ |
| `[2, 4, 6, 8, 10]` | `2`<br>`4`<br>`6`<br>`8`<br>`10`           |

::right::

> **Nota** Usa `len(lista)` e accedi con l'indice `lista[i]`.

---

# Esercizio 5

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Scorre la lista con l'indice `i` e stampa un elemento per riga.

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

# Esercizio 5

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [2, 4, 6, 8, 10]`



::left::

```python {1|3|4|5|6|4|5|6|4|5|6|4|5|6|4|5|6|4} {at: 1}
lista = [2, 4, 6, 8, 10]

i = 0
while i < len(lista):
    print(lista[i])
    i = i + 1
```

<ListTracker
  :items="[2, 4, 6, 8, 10]"
  :trackers="{ i: { 1: 0, 4: 1, 7: 2, 10: 3, 13: 4, 16: 5 } }"
  highlight
/>

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>lista[i]</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>i = —</template>
          <template #1-4>i = 0</template>
          <template #4-7>i = 1</template>
          <template #7-10>i = 2</template>
          <template #10-13>i = 3</template>
          <template #13-16>i = 4</template>
          <template #16-18>i = 5</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>lista[i] = —</template>
          <template #1-4>lista[i] = 2</template>
          <template #4-7>lista[i] = 4</template>
          <template #7-10>lista[i] = 6</template>
          <template #10-13>lista[i] = 8</template>
          <template #13-16>lista[i] = 10</template>
          <template #16-18>lista[i] = —</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>—</template>
          <template #3-6>2</template>
          <template #6-9>2<br>4</template>
          <template #9-12>2<br>4<br>6</template>
          <template #12-15>2<br>4<br>6<br>8</template>
          <template #15-18>2<br>4<br>6<br>8<br>10</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 6 - lista al contrario
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista di interi, stampala in ordine invertito, dall'ultimo elemento al primo.

::left::

| Input            | Output                                     |
| ---------------- | ------------------------------------------ |
| `[1, 2, 3, 4, 5]`| `5`<br>`4`<br>`3`<br>`2`<br>`1`            |

::right::

> **Nota** Parti dall'ultimo indice `len(lista) - 1` e vai a ritroso fino a `0`.

---

# Esercizio 6

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Parte dall'ultimo indice e scorre la lista a ritroso fino al primo elemento.

```python
lista = [1, 2, 3, 4, 5]

i = len(lista) - 1
while i >= 0:
    print(lista[i])
    i = i - 1
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 6

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [1, 2, 3, 4, 5]`



::left::

```python {1|3|4|5|6|4|5|6|4|5|6|4|5|6|4|5|6|4} {at: 1}
lista = [1, 2, 3, 4, 5]

i = len(lista) - 1
while i >= 0:
    print(lista[i])
    i = i - 1
```

<ListTracker
  :items="[1, 2, 3, 4, 5]"
  :trackers="{ i: { 1: 4, 4: 3, 7: 2, 10: 1, 13: 0, 16: -1 } }"
  highlight
/>

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>lista[i]</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>i = —</template>
          <template #1-4>i = 4</template>
          <template #4-7>i = 3</template>
          <template #7-10>i = 2</template>
          <template #10-13>i = 1</template>
          <template #13-16>i = 0</template>
          <template #16-18>i = -1</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>lista[i] = —</template>
          <template #1-4>lista[i] = 5</template>
          <template #4-7>lista[i] = 4</template>
          <template #7-10>lista[i] = 3</template>
          <template #10-13>lista[i] = 2</template>
          <template #13-16>lista[i] = 1</template>
          <template #16-18>lista[i] = —</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>—</template>
          <template #3-6>5</template>
          <template #6-9>5<br>4</template>
          <template #9-12>5<br>4<br>3</template>
          <template #12-15>5<br>4<br>3<br>2</template>
          <template #15-18>5<br>4<br>3<br>2<br>1</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 7 - cerca un numero
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista di interi e un numero `x`, cerca `x` nella lista. Se è presente almeno una volta stampa `{x} è contenuto nella lista`, altrimenti stampa `{x} non è contenuto nella lista`.

::left::

| Input                      | Output                          |
| -------------------------- | ------------------------------- |
| `[4, 8, 15, 16]` e `x = 15`| `15 è contenuto nella lista`    |
| `[1, 2, 3]` e `x = 7`      | `7 non è contenuto nella lista` |

::right::

> **Nota** Senza usare l'operatore `in`. Usa una variabile booleana `trovato`.

---

# Esercizio 7

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Scorre la lista e imposta `trovato` a `True` se incontra `x`.

```python
lista = [4, 8, 15, 16]
x = 15

trovato = False
i = 0
while i < len(lista):
    if lista[i] == x:
        trovato = True
    i = i + 1

if trovato == True:
    print(x, "è contenuto nella lista")
else:
    print(x, "non è contenuto nella lista")
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 7

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [4, 8, 15, 16]` - `x = 15`



::left::

```python {1|2|4|5|6|7|9|6|7|9|6|7|8|9|6|7|9|6|11|12} {at: 1}
lista = [4, 8, 15, 16]
x = 15

trovato = False
i = 0
while i < len(lista):
    if lista[i] == x:
        trovato = True
    i = i + 1

if trovato == True:
    print(x, "è contenuto nella lista")
else:
    print(x, "non è contenuto nella lista")
```

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>trovato</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>i = —</template>
          <template #3-6>i = 0</template>
          <template #6-9>i = 1</template>
          <template #9-13>i = 2</template>
          <template #13-16>i = 3</template>
          <template #16-20>i = 4</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>trovato = —</template>
          <template #2-12>trovato = False</template>
          <template #12-20>trovato = True</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-19>—</template>
          <template #19-20>15 è contenuto nella lista</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<ListTracker
  :items="[4, 8, 15, 16]"
  :trackers="{ i: { 3: 0, 6: 1, 9: 2, 13: 3, 16: 4 } }"
  highlight
/>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 7

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [1, 2, 3]` - `x = 7`

::left::

```python {1|2|4|5|6|7|9|6|7|9|6|7|9|6|11|13|14} {at: 1}
lista = [1, 2, 3]
x = 7

trovato = False
i = 0
while i < len(lista):
    if lista[i] == x:
        trovato = True
    i = i + 1

if trovato == True:
    print(x, "è contenuto nella lista")
else:
    print(x, "non è contenuto nella lista")
```

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>trovato</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>i = —</template>
          <template #3-6>i = 0</template>
          <template #6-9>i = 1</template>
          <template #9-12>i = 2</template>
          <template #12-17>i = 3</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>trovato = —</template>
          <template #2-17>trovato = False</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-16>—</template>
          <template #16-17>7 non è contenuto nella lista</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<ListTracker
  :items="[1, 2, 3]"
  :trackers="{ i: { 3: 0, 6: 1, 9: 2, 12: 3 } }"
  highlight
/>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 8 - conta le occorrenze
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista di interi e un numero `x`, conta quante volte `x` compare nella lista e stampa il risultato.

::left::

| Input                        | Output |
| ---------------------------- | ------ |
| `[5, 10, 15, 10, 20, 10]` e `x = 10` | `3` |

::right::

> **Nota** Senza usare `.count()`. Incrementa un contatore quando l'elemento è uguale a `x`.

---

# Esercizio 8

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Scorre la lista e incrementa `conta` ogni volta che trova `x`.

```python
lista = [5, 10, 15, 10, 20, 10]
x = 10

conta = 0
i = 0
while i < len(lista):
    if lista[i] == x:
        conta = conta + 1
    i = i + 1
print(conta)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 8

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [5, 10, 15, 10, 20, 10]` - `x = 10`



::left::

```python {1|2|4|5|6|7|9|6|7|8|9|6|7|9|6|7|8|9|6|7|9|6|7|8|9|6|10} {at: 1}
lista = [5, 10, 15, 10, 20, 10]
x = 10

conta = 0
i = 0
while i < len(lista):
    if lista[i] == x:
        conta = conta + 1
    i = i + 1
print(conta)
```

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>conta</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-3>i = —</template>
          <template #3-6>i = 0</template>
          <template #6-10>i = 1</template>
          <template #10-13>i = 2</template>
          <template #13-17>i = 3</template>
          <template #17-20>i = 4</template>
          <template #20-24>i = 5</template>
          <template #24-27>i = 6</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>conta = —</template>
          <template #2-9>conta = 0</template>
          <template #9-16>conta = 1</template>
          <template #16-23>conta = 2</template>
          <template #23-27>conta = 3</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-26>—</template>
          <template #26-27>3</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<ListTracker
  :items="[5, 10, 15, 10, 20, 10]"
  :trackers="{ i: { 3: 0, 6: 1, 10: 2, 13: 3, 17: 4, 20: 5, 24: 6 } }"
  highlight
/>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 9 - il valore massimo
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista di interi, calcola e stampa il valore massimo presente nella lista.

::left::

| Input            | Output |
| ---------------- | ------ |
| `[3, 7, 2, 9, 5]`| `9`    |

::right::

> **Nota** Senza usare `max()`. Parti dal primo elemento e aggiorna il massimo quando ne trovi uno più grande.

---

# Esercizio 9

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Parte dal primo elemento e aggiorna `massimo` quando ne trova uno più grande.

```python
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
i = 0
while i < len(lista):
    if lista[i] > massimo:
        massimo = lista[i]
    i = i + 1
print(massimo)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 9

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [3, 7, 2, 9, 5]`



::left::

```python {1|3|4|5|6|8|5|6|7|8|5|6|8|5|6|7|8|5|6|8|5|9} {at: 1}
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
i = 0
while i < len(lista):
    if lista[i] > massimo:
        massimo = lista[i]
    i = i + 1
print(massimo)
```

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>massimo</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>i = —</template>
          <template #2-5>i = 0</template>
          <template #5-9>i = 1</template>
          <template #9-12>i = 2</template>
          <template #12-16>i = 3</template>
          <template #16-19>i = 4</template>
          <template #19-22>i = 5</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>massimo = —</template>
          <template #1-8>massimo = 3</template>
          <template #8-15>massimo = 7</template>
          <template #15-22>massimo = 9</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-21>—</template>
          <template #21-22>9</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<ListTracker
  :items="[3, 7, 2, 9, 5]"
  :trackers="{ i: { 2: 0, 5: 1, 9: 2, 12: 3, 16: 4, 19: 5 } }"
  highlight
/>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 10 - la lista è crescente?
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista di interi, stampa `la lista è crescente` se ogni elemento è **maggiore o uguale** al precedente, altrimenti stampa `la lista non è crescente`.

::left::

| Input          | Output                    |
| -------------- | ------------------------- |
| `[1, 3, 5, 7]` | `la lista è crescente`    |
| `[1, 3, 2, 7]` | `la lista non è crescente` |

::right::

> **Nota** Confronta ogni elemento `lista[i]` con il precedente `lista[i - 1]`: parti da `i = 1`.

---

# Esercizio 10

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Confronta ogni elemento col precedente: `crescente` diventa `False` al primo calo.

```python
lista = [1, 3, 5, 7]

crescente = True
i = 1
while i < len(lista):
    if lista[i] < lista[i - 1]:
        crescente = False
    i = i + 1

if crescente == True:
    print("la lista è crescente")
else:
    print("la lista non è crescente")
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 10

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [1, 3, 5, 7]`



::left::

```python {1|3|4|5|6|8|5|6|8|5|6|8|5|10|11} {at: 1}
lista = [1, 3, 5, 7]

crescente = True
i = 1
while i < len(lista):
    if lista[i] < lista[i - 1]:
        crescente = False
    i = i + 1

if crescente == True:
    print("la lista è crescente")
else:
    print("la lista non è crescente")
```

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>crescente</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>i = —</template>
          <template #2-5>i = 1</template>
          <template #5-8>i = 2</template>
          <template #8-11>i = 3</template>
          <template #11-15>i = 4</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>crescente = —</template>
          <template #1-15>crescente = True</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-14>—</template>
          <template #14-15>la lista è crescente</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<ListTracker
  :items="[1, 3, 5, 7]"
  :trackers="{ i: { 2: 1, 5: 2, 8: 3, 11: 4 } }"
  highlight
/>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---

# Esercizio 10

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [1, 3, 2, 7]`

::left::

```python {1|3|4|5|6|8|5|6|7|8|5|6|8|5|10|12|13} {at: 1}
lista = [1, 3, 2, 7]

crescente = True
i = 1
while i < len(lista):
    if lista[i] < lista[i - 1]:
        crescente = False
    i = i + 1

if crescente == True:
    print("la lista è crescente")
else:
    print("la lista non è crescente")
```

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>crescente</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>i = —</template>
          <template #2-5>i = 1</template>
          <template #5-9>i = 2</template>
          <template #9-12>i = 3</template>
          <template #12-17>i = 4</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>crescente = —</template>
          <template #1-8>crescente = True</template>
          <template #8-17>crescente = False</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-16>—</template>
          <template #16-17>la lista non è crescente</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<ListTracker
  :items="[1, 3, 2, 7]"
  :trackers="{ i: { 2: 1, 5: 2, 9: 3, 12: 4 } }"
  highlight
/>

::bottom::

<ClicksSlider class="mt-2" />

---
layout: two-cols-header
class: table-sm
---
# Esercizio 11 - conta i numeri pari
<span class="px-2 py-1 rounded bg-primary text-[#141418]">Testo</span> Data una lista di interi, conta quanti valori pari contiene e stampa il risultato.

::left::

| Input                | Output |
| -------------------- | ------ |
| `[1, 2, 3, 4, 5, 6]` | `3`    |

::right::

> **Nota** Un numero è pari quando `lista[i] % 2 == 0`.

---

# Esercizio 11

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Soluzione</span> Scorre la lista e incrementa `conta` per ogni elemento pari.

```python
lista = [1, 2, 3, 4, 5, 6]

conta = 0
i = 0
while i < len(lista):
    if lista[i] % 2 == 0:
        conta = conta + 1
    i = i + 1
print(conta)
```

---
layout: two-cols-header
class: table-sm
---

# Esercizio 11 

<span class="px-2 py-1 rounded bg-primary text-[#141418]">Traccia</span> `lista = [1, 2, 3, 4, 5, 6]`



::left::

```python {1|3|4|5|6|8|5|6|7|8|5|6|8|5|6|7|8|5|6|8|5|6|7|8|5|9} {at: 1}
lista = [1, 2, 3, 4, 5, 6]

conta = 0
i = 0
while i < len(lista):
    if lista[i] % 2 == 0:
        conta = conta + 1
    i = i + 1
print(conta)
```

::right::

<table>
  <thead>
    <tr>
      <th>indice i</th>
      <th>conta</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-2>i = —</template>
          <template #2-5>i = 0</template>
          <template #5-9>i = 1</template>
          <template #9-12>i = 2</template>
          <template #12-16>i = 3</template>
          <template #16-19>i = 4</template>
          <template #19-23>i = 5</template>
          <template #23-26>i = 6</template>
        </v-switch>
      </td>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-1>conta = —</template>
          <template #1-8>conta = 0</template>
          <template #8-15>conta = 1</template>
          <template #15-22>conta = 2</template>
          <template #22-26>conta = 3</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="1" class="font-mono">
          <template #0-25>—</template>
          <template #25-26>3</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

<ListTracker
  :items="[1, 2, 3, 4, 5, 6]"
  :trackers="{ i: { 2: 0, 5: 1, 9: 2, 12: 3, 16: 4, 19: 5, 23: 6 } }"
  highlight
/>

::bottom::

<ClicksSlider class="mt-2" />
