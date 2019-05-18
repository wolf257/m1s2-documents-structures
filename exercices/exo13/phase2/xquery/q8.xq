(: Construire une requête pour extraire les items en relation de dépendance syntaxique de type
SUB (on affichera les formes ou les lemmes connectés par cette relation) :)

let $docSource := doc("../test-TALISMANE-3208.xml")

for $element in $docSource//p/item
return 
  if ( $element/a[8]/text() = 'sub' )  
  then
    let $numGov := $element/a[7]/text()
    let $numDep := $element/a[1]/text()
    let $relation :=  $element/a[8]/text()
    let $diffDepGouv := abs($numDep - $numGov)
    let $dependant := $element/a[2]/text()
    let $gouverneur := $element/preceding-sibling::item[$diffDepGouv]/a[2]/text()
     (: <numGouverneur> { $numGov } </numGouverneur> :)
     (: <numDep> { $numDep } </numDep> :)
     (: <diff> { $diffDepGouv } </diff> :) 
  return
  <couple> 
    
     <gouverneur> { $gouverneur } </gouverneur>
     <dependant> { $dependant } </dependant>

  </couple>
