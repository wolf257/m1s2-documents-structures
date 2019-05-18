(: Construire une requête pour extraire les items portant une relation de dépendance
syntaxique de type OBJ :)

let $docSource := doc("../test-TALISMANE-3208.xml")

for $element in $docSource//p/item
return 
if ( $element/a[8]/text() = 'obj' )  
then
  <item> 
 { $element//a[2]/text() }
  </item>
