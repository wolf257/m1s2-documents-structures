(: Construire une requête pour extraire les patrons morpho-syntaxiques NOM PRP NOM :)

let $docSource := doc("../test-TALISMANE-3208.xml")

for $element in $docSource//p/item
return 
if ( $element/a[4]/text() = 'NC' and
     $element/following-sibling::*[1]/a[4]/text() = 'P' and
     $element/following-sibling::*[2]/a[4]/text() = 'NC'
      )  
then
  <element> 
  <nom> { $element//a[2]/text() } </nom> 
   <prp> { $element/following-sibling::*[1]//a[2]/text() } </prp> 
   <nom> { $element/following-sibling::*[2]//a[2]/text() } </nom> 

  </element>
