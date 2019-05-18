(: Compter les différents types de catégories disponibles dans le fichier :)

let $docSource := doc("../test-dela-fr-public-u8.dic.xml")

let $countItem := count( distinct-values( $docSource//entry/pos/@name ) )

(: for $i in distinct-values( $docSource//entry/pos/@name ) :)

return  <nbPosInFile> {$countItem} </nbPosInFile> 


