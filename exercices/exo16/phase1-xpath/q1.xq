(: Compter le nom d’entrée du dictionnaire :)

let $docSource := doc("../dela-fr-public-u8.dic.xml")

let $countItem := count($docSource//entry)

return <comptage> 
<nbItem> {$countItem} </nbItem> 
</comptage>


