#Haskell-kielestä vielä yleisesti

### Funktionaalisuus

Haskell on siis puhtaasti funktionaalinen kieli, kuten aiemmin mainittiin. Erona tavallisiin ohjelmointikieliin on siis esimerkiksi se, että Haskellissa kerrotaan, miten asia on. Muissa kielissä saatetaan kertoa, miten jokin asia tehdään erilaisissa sarjoissa. Esimerkiksi potenssi määritellään Haskellissa funktion ja rekursion avulla, kun taas tavallisissa ohjelmointikielissä saattaisi olla valmis funktio sille kuten Javassa `Math.pow(a,b)`. Jos Haskellissa sanotaan "a = 5", tämä on pysyvä arvo, eikä sitä voi muuttaa myöhemmin. Javassa taas voi esimerkiksi tehdä operaation `a++`, mikä on Haskellissa mahdotonta.

Funktion ainoa toiminnallisuus on Haskellissa laskea arvo jollekin ja palauttaa se tuloksena. Aluksi tällainen kielen käyttäytyminen saattaa tuntua erittäin rajoittavalta mutta siitä on paljon hyötyä. Se mahdollistaa esimerkiksi sen, etteivät arvot muutu kesken ajon, ja tämän avulla pienistä ja yksinkertaisista funktioista voidaan rakentaa isoja ja monimutkaisia funktioita. Tätä on funktionaalisuus.

### Laiskuus

Haskell on laiska, mutta mitä tämä tarkoittaa? Se tarkoittaa sitä, että Haskell ei suorita funktioita tai laske mitään ennen kuin se on pakotettu laskemaan/näyttämään tulos. Tämän avulla mahdollistetaan mm. äärettömät tietorakenteet, joita voit kokeilla helposti komennoilla:

```haskell
> let ones =  1 : ones
> ones
```
tai

```haskell
> let fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
> fibs
```

Jälkimmäinen laskee äärettömän pitkälle Fibonaccin lukujonoa. Voit vaikka tarkistaa tuloksen laittamalla terminaalin koko ruudun kokoiseksi ja katsomalla ensimmäiset 10 lukua. Tuloksen pitäisi olla ...1,1,2,3,5,8,13,21,34,55...
Funktion parametrejä ei tarvitse vielä ymmärtää, mutta huomionarvoista on se, kuinka paljon funktiota saadaan supistettua. Tässä esimerkissä funktio supistui yhden rivin mittaiseksi eli ns. *one liner*iksi.

### Staattisesti tyypitetty

Kun käännetään ohjelma, kääntäjä osaa tunnistaa tietotyypit, esimerkiksi stringit, kokonaisluvut jne., jolloin useat virheet jäävät kääntämisvaiheeseen. Esimerkiksi lisätessä yhteen merkkijonon ja luvun saa virheilmoituksen.

Haskell käyttää hyväkseen tyyppipäättelyä, jolloin voidaan antaa esimerkiksi parametri `a = 5 + 3`. Haskell osaa automaattisesti tunnistaa tämän lauseen tyypin, koska parametreinä on kaksi kokonaislukua. Voit funktiossasi siis kätevästi lisätä mitä tahansa parametrejä yhteen, kunhan ne täyttävät lukujen määrityksen. Tällöin eksplisiittistä tyyppimäärittelyä ei tarvitse käyttää.

Esimerkki funktiosta, jossa tyyppimäärittelyt unohdetaan:

```haskell
> let potenssiinKaksi a = a * a
> potenssiinKaksi 5
25
```

Huom. Voit kätevästi käyttää `TAB`-näppäintä täydentämään GHCI:ssä tekemääsi funktiota.

Huom2. Komento `let` määrittelee vain ajon ajaksi funktion/parametrin.



# Alkuun GHC:n käytössä

Jos halutaan muuttaa `Prelude>` joksikin muuksi, kirjoitetaan
```haskell
  :set prompt "haluamasiLiite>"
```

### Komennot

Aritmetiikka toimii Haskellissa samalla tavalla kuin Javassakin. Poikkeuksena on vain se, ettei tyyppejä tarvitse kirjoittaa.

```haskell
  > 2 + 15
17
> 49 * 100
4900
```
Voit myös kokeilla erittäin isoja lukuja kuten

```haskell
 > 50000000000000000^100
78886090522101180541172856528278622967320643510902300477027893066406250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
```

Haskell laskee siis jopa isotkin arvot erittäin nopeasti, eikä esimerkiksi kokonaisluku voi pyörähtää ympäri, kuten Javassa voi käydä.

Boolean-arvot toimivat Haskellissa aivan kuten Javassakin

```haskell
 > True && False
True
> True && True
True
> not False
True
> not (False || True)
False

> -- Tämä on kommentti. '/=' tarkoittaa samaa, kuin Javassa '!='

> 5 == 5
True
> 5 /= 4
False
```

Hyödyllisiä komentoja, joiden määritelmän voit nähdä GHCI:ssa komentamalla
:t komennonnimi:

```haskell
 > :t succ
succ :: Enum a => a -> a
```

`succ a` palauttaa yhden suuremman kuin a.

`min a b` palauttaa minimin a:sta ja b:sta.

Mitä tapahtuu, kun kirjoitamme komennon `succ 9 * 10`?
Funktio evaluoituu arvoon 100, koska Haskell etenee vasemmalta oikealle, jos sulut eivät ole määräämässä järjestystä. Funktio siis evaluoi ensin `succ 9`, joka on `10`, ja tämän jälkeen kertoo `10 * 10`, joka on `100`.

Etsi, miksi `6 'div' 3` evaluoituu arvoksi 2. Huom. ' ' tarkoittaa tässä yhteydessä ``.

Vinkki: Käytä Hooglea tai Googlea määrittelemään mitä `div`-funktio tekee.

***
Tästä lähtien kirjoita kaikki käyttämäsi komennot `firstWeek.hs`-tiedostoon. Muista käyttää GHCI:ta kokeilemaan, että funktiosi toimii. Voit ladata tiedoston helposti komennolla `ghci firstWeek.hs` ja käyttää luomiasi funktioita.
***
### Ensimmäinen funktio
***
Tee funktio, joka kertoo luvun a luvulla 2. Funktiosi pitäisi toimia seuraavalla tavalla:

```haskell
 > sinunFunktiosiNimi 2
4
> sinunFunktiosiNimi 1000000000
2000000000
```
***
***
Tee funktio, joka käyttää edellistä funktiota niin, että se kertoo luvun a b. Ts.
seuraava kutsu evaluoituu:

```haskell
 > yhdistettyFunktio 2 5
40
```
***
***
Tee funktio, joka kertoo luvun a kahdella jos ja vain jos, luku on suurempi kuin 100.

Tip: syntaksi on muotoa:
```haskell
if a onPienempiKuin b
  then a
  else teeJotain
```
Huom. sisennys!
***
***
Kirjoita "Hello kayttaja" -ohjelma, jossa käyttäjä korvautuu käyttäjän syöttämällä arvolla.
Käytä apuna putStrLn -komentoa, joka tulostaa merkkijonon ruudulle. Huom. muista Haskellin laiska evaluointi eli esim. a = "merkkijono" on validia Haskellia.


```haskell
 > sinunFunktiosi "Samu"
"Hello Samu"
```
***

### Listat

Listojen toiminto on samanalaista kuin Javassa. Ainoa eroavaisuus on operaatioissa ja alustamisessa. Haskellissa listan alustaminen on nimittäin erittäin helppoa ja se toimii esimerkiksi 

```haskell
 > let array = [1,3,3,7]
```

Huom. listassa ei voi olla sekaisin stringejä ja numeroita!

***
Tee funktio käyttäen hyödyksi ++-katenointia. Funktiosi on siis katenoitava kaksi listaa a ja b yhdeksi.

```haskell
 > sinunFunktiosi [1,2] [3,4]
[1,2,3,4]
> sinunFunktiosi "cha" "ng"
"chang"
```
***

Listojen eteen yhdistäminen on helppoa Haskellissa. Tarvitaan vain komento : ja yhdistettävä taulukko. Esimerkiksi 

```haskell
 > 1:[1,2]
[1,1,2]
```

Tämä toimii myös merkkijonoissa, koska ne voidaan laskea merkkitaulukoksi. 
***
Tee funktio, joka luo yhdet uloimmat sulut taulukolle. Eli taulukko [1,2] on muututtava [[1,2]]. Käytä edellä mainittua :-operaattoria. Huom. jälkimmäisen on oltava aina taulukko.

```haskell
 > funktiosi 1
[1]
```
***
##### Tärkeitä listaan kuuluvia operaattoreita

`[a] !! 2` - palauttaa taulukosta a indeksistä 2 olevan arvon.

`[a] > [b]` - palauttaa True, jos taulukon a arvot ovat isommat kuin b. Muut vertailuoperaattorit toimivat samalla tavalla.

`head [a]` - palauttaa ensimmäisen elementin taulukosta a.

`tail [a]` - palauttaa kaikki paitsi ensimmäisen elementin taulukosta a.

`last [a]` - palauttaa viimeisen elementin taulukosta a.

`init [a]` - palauttaa kaikki paitsi viimeisen elementin taulukosta a.

`length [a]` - palauttaa taulukon a pituuden. 

`null [a]` - palauttaa True, jos taulukko on tyhjä eli [].

`reverse [a]` - palauttaa taulukon a käänteisessä järjestyksessä.

`take x [a]` - palauttaa x määrän verran taulukosta a alkioita vasemmalta alkaen.

`drop x [a]` - palauttaa kaikki paitsi x määrän verran taulukosta a alkioita vasemmalta alkaen.

`maximum [a]` - palauttaa isoimman arvon taulukosta a.

`minimum [a]` - palauttaa pienimmän arvon taulukosta a.

`sum [a]` - palauttaa taulukon a yhteenlasketun summan.

`product [a]` - palauttaa taulukon a yhteenlasketun tulon.

a `elem` [a] - palauttaa, onko a taulukon a alkio. `elem` toimii tässä tapauksessa ns. infix funktiona.


### Välit

Välin arvot saa palautettua helposti operaattorilla "..". Tee funktio, joka palauttaa kokonaisluvut väliltä a b. Eli esimerkiksi 

```haskell
 > vali 1 5 
[1,2,4,5]
```

Lisää hyödyllisiä funktioita listoihin:

`cycle [a]` - muodostaa äärettömän listan listasta [a].
`repeat a` - toistaa a äärettömästi muodostaen listan, joka on täynnä a:ta.



### Joukon (ei se nimi) määritelmä

Joukko voidaan määritellä Haskellissa melkein samalla tavalla kuin matemaattisestikin. Esimerkiksi kaikkien alle 10:tä olevien luonnollisten lukujen kahden kertoman joukko on  ![](http://s3.amazonaws.com/lyah/setnotation.png). 

Haskellissa tämä sama määriteltäisiin 

```haskell
 > [x*2 | x <- [1..10]] 
```

***
Tee funktio, joka tulostaa kaikki parilliset luonnolliset luvut väliltä a..b. Käytä hyväksesi `mod` jakojäännös-funktiota, joka toimii myös ns. *inline funktio*na eli kahden parametrin välissä. Esimerkiksi 2 'mod' 4.

```haskell
 > parillisetValilta 1 10 
[2,4,6,8,10]
```
***
### Monikot

Monikot (Tuple) ovat Haskellissa sukua listoille. Niihin voidaan tallettaa yhden tyypin sijasta useaa eri tyyppiä ja täten esimerkiksi seuraava toimii

```haskell
> (1,2,3,'a')
(1,2,3,'a')
```

Monikoita on mahdollista tallettaa myös taulukoihin `[(1,2)]`, mutta tällöin astuu voimaan taas taulukon vaatima yksikäsitteinen tyypitys. Käytännössä tämä tarkoittaa, että seuraava ei esimerkiksi toimi: `[(1,2),(3,4,5)]`. Yksi käytetyimmistä monikkotyypeistä on kuitenkin pari `(a,b)`. Tämä on niin yleinen tyyppi, että Haskell tarjoaa siihen muutaman erittäin hyödyllisen komennon. 

`fst (a,b)` - Palauttaa ensimmäisen eli a-alkion.
`snd (a,b)` - Palauttaa toisen eli b-alkion.

Yksi hyödyllinen komento pareja sisältävän listan luomiseen on

`zip [a] [b]` - Palauttaa [(a,b)]

Se toimii myös äärettömille listoille:

```haskell
> zip [1..] [1..]
[(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19)...
```









