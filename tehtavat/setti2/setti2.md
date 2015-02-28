#2. viikko

Viikon aiheina tulevat olemaan:
  * Tyypit
  * Tyyppiluokat


**Huom** Tästä viikosta *eteenpäin* ```xWeek.hs```-tiedostossa tulee olemaan myös [HUnit](https://hackage.haskell.org/package/HUnit)-testejä, joten on suositeltavaa ladata uusin haskell-platform käytettäväksi. Jos materiaalissa esiintyy ohjelmointitehtäviä, joissa kerrotaan tekemään muutoksia ```xWeek.hs```-tiedostoon, on hyvä suorittaa aina komento
``` haskell
runTestTT tests
```
tekemiesi muutoksien jälkeen. Tämä testaa tekemiesi funktioiden oikeellisuutta ja testien mennessä läpi funktiosi toimii kuten pitääkin.

#Tyypit

Haskell on staattisesti tyypitetty, mutta mitä tämä tarkoittaa? Se tarkoittaa sitä, että jokaisen ilmaisun tyyppi evaluoidaan käännettäessä. Tämä estää virheet kuten boolean-arvon jakamisen kokonaisluvulla ajoissa, joka taas johtaa turvallisempaan koodiin, koska ohjelma kaatuu harvemmin. Tästä syystä myös jokaisella Haskell-kielen funktiolla ja tietorakenteella on tyyppi.

Yksi suuri ero Javan ja Haskell-kielen välillä on, että kirjoittaessamme esimerkiksi numeron Haskell tekee johtopäätöksen numeron tyypistä ja luo tämän perusteella jatkon toimenpiteet. Voimme esimerkiksi aloittaa kirjoittamalla ghci-tulkkiin komennon
```haskell
  > :t 'a'
```
Saammamme vastaus ```'a' :: Char ``` kertoo, että määrittely ```'a'```oli tyyppia kirjain.

---
Määrittele seuraavat ghci-tulkissa komennolla ```:t ```: True, "Hello World", (True, 5), 5 == 5. Mitä luulet tuloksiesi tarkoittavan ja miksi "Hello World" evaluoitui taulukoksi?

---

Funktioilla on myös tyyppi ja kun kirjoitamme omia funktioita, voimme määritellä ekspiliittisen tyypin sille, jolloin Haskell ei yritä arvata sen tyyppiä. Tästä eteenpäin anna kaikille omille funktioillesi tyyppi. Tyypityksen määritelmän opit seuraavaksi.

##### Tyypitys funktioille

```haskell
removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
```

Kuten huomamme funktiolla ```removeNonUppercase``` on tyyppinä ```[Char] -> [Char]```. Tämä tarkoittaa käytännössä, että funktio ottaa parametrina ```String``` -tyypin ja palauttaa samaa tyyppia olevan tuloksen.

Esimerkkinä voimme ottaa myös seuraavan

```haskell
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z
```

---
  Mieti mitä funktio tekee ja miksi tyypityksiä on 4, vaikka funktio ottaa vain 3 parametria.

---

Jos ihmettelet mitä funktio ```->``` tarkoittaa, se tarkoittaa, että A -> B =  A palauttaa tyypin B:lle.

### Yleisimmät tyypit

##### Int

* Kokonaisluku. 32-bittisissä järjestelmissä max = 2147483647 ja min = -2147483647.

##### Integer

* Tarkoittaa myös kokonaislukua, mutta käytännössä äärettömän kokonoinen.

```haskell
factorial :: Integer -> Integer  
factorial n = product [1..n]  
```
```haskell
ghci> factorial 50  
30414093201713378043612608166064768844377641568960512000000000000
```

##### Float

Desimaali.
```haskell
circumference :: Float -> Float  
circumference r = 2 * pi * r
```
```haskell
ghci> circumference 4.0  
25.132742  
```
##### Double

Tuplasti tarkempi, kuin ```Float```.

```haskell
circumference' :: Double -> Double  
circumference' r = 2 * pi * r  
```
```haskell
ghci> circumference' 4.0  
25.132741228718345
```
##### Bool

Sisältää arvot ```True``` ja ```False```.

##### Char

Yksittäinen kirjain, mutta taulukkona toimii, kuin String.

Funktioiden tyyppi on myös helppo selvittää. Se tapahtuu käytännössä samalla tavalla, kuin tyyppienkin selvittäminen. Kokeilemme seuraavaksi evaluoida ```head```-funktion

```haskell
ghci> :t head  
head :: [a] -> a
```

Saimme palautteena 'a':n, mutta mikä 'a' on? 'a' on tyyppimuttuja, koska se ei ole kirjoitettu isolla kirjaimella toisin kuin yleensä tyypit kirjoitetaan. Käytännössä tämä tarkoittaa, että 'a' voi olla mitä tahansa tietotyyppiä. Funktioilla, jotka hyödyntävät tätä tyypitystä ovat nimeltään polymorfisia funktioita, koska ne eivät välitä saamastaan tyypistä ja täten palauttavat aina samaa tyyppiä olevat alkion, kuin parametrina saatu parametri.

---
Evaluoi funktio ```fst``` :t -komennolla. Mikä sen tyyppi on ja mistä luulet palaututyypin johtuvat? Yritä käyttää funktiota jollakin syötteellä.

---

# Tyyppiluokat

Tyypiluokat voidaan kuvitella eräänlaisina rajapintoina, jotka määrittelevät tietynlaisen käyttäytymisen. Määritellään seuraavaksi yhtäsuuruus-funktion ```==``` tyyppi.

```haskell
ghci> :t (==)  
(==) :: (Eq a) => a -> a -> Bool
```

Näemme nyt hieman toisenlaista syntaksia, nimittäin ```=>```. Tätä kutsutaan luokan rajoitteeksi ja voimme lukeakkin edellisen seuraavalla tavalla: yhtäsuuruus on funktio, joka ottaa kaksi parametria, jotka ovat samaa tyyppiä ja palauttaa Bool-arvon. Näiden kahden parametrin on myös kuuluttava joukkoon Eq. Eq-luokka taas määrittelee rajapinnan, jonka avulla yhtäsuuruutta voidaan testata. Haskellin kaikki alkeistyypit kuuluvat joukkoon Eq, paitsi IO.

---
Evaluoi funktio ```elem``` :t-komennolla. Mieti mitä tulos tarkoittaa ja varsinkin miksi tuloksessa esiintyy tyyppiluokka (Eq a). Seuraavassa esimerkki funktion toiminnallisuudesta.

```haskell
*Main> elem 2 [1,2,3]
True
*Main> elem 0 [1,2,3]
False

```
---

### Tyyppiluokkia pähkinänkuoressa

##### Eq

Määrittelee yhtäsuuruutta funktioiden ```==``` ja ```/=``` avulla.

##### Ord

Sisältää kaikki tavalliset vertailuoperaattorit, jotka kuuluvat myös Eq-luokkaan. Tähän tyyppiluokkaan kuuluvat toimivat mm. ```compare```-funktiossa, jolloin seuraava on mahdollista:

```haskell
ghci> 5 >= 3  
True  
ghci> :t compare
compare :: Ord a => a -> a -> Ordering
ghci> 5 `compare` 3  
GT  
```

##### Show

Tähän tyyppiluokkaan kuuluvat voidaan esittää Stringeinä. Tähän kuuluvat mm. kaikki alkeistyypit.

```haskell
ghci> :t show
show :: Show a => a -> String
ghci> show 5
"5"
```

##### Read
Show-tyyppiluokan vastakohta. Ottaa siis Stringin ja palauttaa arvon, mutta vaatii, että palautetulle arvolle tehdään jotain palautuksen jälkeen. Esimerkiksi
seuraava toimii

```haskell
ghci> :t read
read :: Read a => String -> a
ghci> read "5" + 6
11
```

mutta seuraava epäonnistuu

```haskell
ghci> read "4"
<interactive>:22:1:
    No instance for (Read a0) arising from a use of `read'
    The type variable `a0' is ambiguous
    Possible fix: add a type signature that fixes these type variable(s)
    Note: there are several potential instances:
      instance Read Counts -- Defined in `Test.HUnit.Base'
      instance Read Node -- Defined in `Test.HUnit.Base'
      instance Read State -- Defined in `Test.HUnit.Base'
      ...plus 28 others
    In the expression: read "5"
    In an equation for `it': it = read "5"
```
Syy johtuu siitä, ettei Haskell tiedä, mitä palautusarvolle pitäisi tehdä. Voimme kuitenkin määritellä eksplisiittisen tyypin parametrille, jolloin haluamamme kutsu onnistuu.

```haskell
ghci> read "4" :: Int
4
```
##### Enum

Sisältää kaikki tyypit, jotka voidaan laittaa jotenkin järjestykseen. Tätä ei kuitenkaan pidä sekoittaa Ord-tyyppiluokkaan, vaan järjestyksellä tarkoitetaan pikemminkin, että tämän tyyppiluokan toteuttavat pystytään iteroimaan jollain tavalla. Ts. tämän tyyppiluokan jäsenilla on aina olemassa edellinen ja seuraava. Tähän tyyppiluokaan kuuluvat seuraavat tyypit: (), Bool, Char, Ordering, Int, Integer, Float ja Double.

```haskell
ghci> ['a'..'e']  
"abcde"  
ghci> [LT .. GT]  
[LT,EQ,GT]  
ghci> [3 .. 5]  
[3,4,5]  
ghci> succ 'B'  
'C'  
```

##### Bounded

Tämän tyyppiluokan jäsenillä on olemassa ala- ja yläarvo. Nämä rajat saattavat olla omalla koneellasi eri, koska 64-bittisessä järjestelmässä raja on luonnollisesti paljon suurempi.

```haskell
ghci> minBound :: Int  
-2147483648  
ghci> maxBound :: Char  
'\1114111'  
ghci> maxBound :: Bool  
True  
ghci> minBound :: Bool  
False  
```

##### Num

Kaikki numerot, jotka ovat myös luokissa Show ja Eq. On huomattavaa, että kokonaisluvut on Haskell-kielessä itseasiassa polymorfisia, joten ne voivat toimia minkä tahansa Num-luokan jäseninä.

```haskell
ghci> :t 20  
20 :: (Num t) => t  

ghci> 20 :: Int  
20  
ghci> 20 :: Integer  
20  
ghci> 20 :: Float  
20.0  
ghci> 20 :: Double  
20.0
```

---

Ota selvää miksi seuraava ei toimi:

```haskell
ghci> (5 :: Int) * (2 :: Integer)
```

---

##### Integral

Sisältää vain ja ainoastaan kaikki kokonaisluvut. Int ja Integer kuuluvat tähän tyyppiluokkaan.

##### Floating

Kaikki desimaaliluvut. Float ja Double kuuluvat tähän.

---

Seuraava tehtävä on tarkoitus tehdä tiedostoon ```secondWeek.hs``` Huom. älä muuta mitään muuta, kuin seuraavan metodin jälkeistä osaa.
```haskell
addLengthAndDecimal a b = -1
```

Tehtävä: Yllätykseksemme seuraava ei evaluoidukkaan oikein Haskelissa:

```haskell
ghci> (length[1,2,3]) + 1.0

<interactive>:3:19:
    No instance for (Fractional Int) arising from the literal `1.0'
    Possible fix: add an instance declaration for (Fractional Int)
    In the second argument of `(+)', namely `1.0'
    In the expression: (length [1, 2, 3]) + 1.0
    In an equation for `it': it = (length [1, 2, 3]) + 1.0
ghci>
```
Korjaa tämä niin, että funktio ```addLengthAndDecimal``` plussaa oikein, kun a-parametrina annetaan taulukko ja b-parametrina desimaaliluku. Aja testit konsolista lataamalla ```ghci secondWeek.hs``` ja suorittamalla komento
```runTestTT tests``` ghci:n sisällä. 

Vinkki: Tarvitset ainakin length-funktiota sekä fromIntegral-funktiota.


---

Tämä tehtäväpaketti on nyt lopuillaan. Seuraavalla kerralla aiheina ovat pattern matching, funktioiden syntaksi, guardit, where-lause, let-lause sekä case-rakenne. 


