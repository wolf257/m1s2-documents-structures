(:Construire une requête pour compter le nombre de titres, le nombre de descriptions. :)

let $docSource := doc("../test-TALISMANE-3208.xml")

let $countTitre := count($docSource//titre)
let $countDescription := count($docSource//description)

return <comptage> 
<nbTitre> {$countTitre} </nbTitre> <nbDescription> {$countDescription} </nbDescription> 
</comptage>




