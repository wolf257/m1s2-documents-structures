(: Compter le nombre de verbes, de noms etc. :)

let $docSource := doc("../test-dela-fr-public-u8.dic.xml")

let $countItem := count( distinct-values( $docSource//entry/pos/@name ) )

for $i in distinct-values( $docSource//entry/pos/@name )
let $nbI := count( $docSource//entry/pos[@name eq $i] )

return 
<element> 
  <pos> {$i} </pos>
  <nb> {$nbI} </nb>
</element>


