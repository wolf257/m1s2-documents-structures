<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/sommaire">
        <html>
            <head>
                <title> Accueil </title>
                <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"></link>
                <link rel="stylesheet" text="text/css" href="css/style.css"></link>
            </head>
            
            <!-- BODY -->
            <body>
                <h class="tete">Documents structurés</h>
                <h4 class="tete">Ousseynou Gueye &amp; Sandy Duchemin</h4>
                <h4 class="tete">M1 TAL - 2018/2019</h4>
                <!-- Menu -->
                <div class="corps">
                <ul id="menu">
                <xsl:for-each select="./bouton">           
                    <li> 
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="lien"/>
                            </xsl:attribute>
                            <xsl:value-of select="titre"/>
                        </xsl:element>
                    </li>  
                </xsl:for-each>
                </ul>
 
                <!-- Présentation du projet -->
                
                <h1> Le projet </h1>
                
                <p> Il s'agit pour nous de construire un site entièrement en xml/xsl dans le cadre du cours "Document Structuré" du second semestre du M1 TAL.</p>
                
                <p> On y trouvera des réponses à des exercices proposés par M. Fleury. L'objectif minimal était de rendre six exercices (le n°3, 13 et 16 sont imposés mais le choix du reste est libre). Nous en avons complétés dix. </p>
                
                <p> Ci-joint, le document contenant tous les énoncés : (<a href="other/TD-XML-M1-TAL.pdf"> lien </a>).</p>
                
                <!-- Outils -->
                <h1> Outils </h1>
                
                <p> Dû aux contraintes sécuritaires, en date (avril 19) le site ne fonctionne de manière optimale que sur <strong> Firefox </strong>. </p>
                
                <!-- Liste des exos avec description -->
                <h1> Résumé des exercices </h1>
                
                
                <xsl:for-each select="./bouton">
                    <xsl:if test="./description"> <!-- pour ne pas avoir l'accueil -->
                        <p> 
                            * 
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="lien"/>
                                </xsl:attribute>
                                Exercice <xsl:value-of select="titre"/>
                            </xsl:element> 
                             : <xsl:value-of select="description"/> 
                        </p>
                    </xsl:if>
                </xsl:for-each>

                <!-- Démarche -->
                <h1> Démarche adoptée </h1>
                
                <p> Si les exercices présentent leurs propres difficultés, une grande partie du travail fut ailleurs dans un premier temps. </p>
                
                <p> Nous avions à coeur d'avoir la solution la plus économe possible avec les outils imposés. Par exemple, il était hors de question d'avoir une feuille xsl pour chaque exercice.</p>
                                
                <p> Nous avons donc deux grandes parties : l'index, et les pages d'exercices. </p>
                
                <h4> L'index </h4>
                
                <p> L'index a sa propre feuille xsl (<a href="index.xsl" target="_blank"> lien </a>). C'est une page spéciale et elle nécessite donc un traitement spécial. </p>
                
                <h4> Les exercices </h4>
                
                <p> Pour les exercices, ils se référent tous à 3 fichiers communs : </p>
                
                <ul>
                    <li> /exercices/dtd-exos.dtd (<a href="exercices/dtd-exos.dtd"> lien </a>) : La dtd. Elle nous simplifie la vie en nous donnant un cadre strict dans lequel se mouvoir. </li>
                    <li> /exercices/transfo-exos.xsl (<a href="exercices/transfo-exos.xsl"> lien </a>) : Elle s'occupe de la transformation du xml pur en html/css. </li>
                    <li> /css/style.css (<a href="./css/style.css"> lien </a>) : La feuille de style, pour faire joli :-). </li>
                </ul>
                
                <!-- Liens -->
                <h1> Liens intéressants et utiles </h1>
                
                <ul>
                    <li>
                        <a href="https://www.w3schools.com/xml/"> https://www.w3schools.com/xml/ </a> : À ceux qui viendront après, n'hésiter surtout pas à consulter ce site pour avoir un aperçu des choses.
                    </li>
                </ul>

                <!-- Nous -->
                <h1> Nous </h1>
                
                <p> Ce site a été réalisé par les soins de : </p>
                    
                <table>
                    <tr>
                        <td> DUCHEMIN Sandy </td>
                        <td> GUEYE Ousseynou </td>
                    </tr>
                    <tr>
                        <td> M1 TAL - Paris 10 </td>
                        <td> M1 TAL - Inalco </td>
                    </tr>
                    <tr>
                        <td> <a href="mailto:sandyduchemin@gmail.com" > email </a> </td>
                        <td> <a href="mailto:gueyeousseynou@hotmail.fr"> email </a> </td>
                    </tr>
                </table>

                

                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
